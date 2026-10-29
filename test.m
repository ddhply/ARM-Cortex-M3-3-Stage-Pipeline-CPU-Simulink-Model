%% =========================================================
%  Three_Stages CPU Simulink Testbench
% =========================================================
clear; clc;
clear functions;         

modelName  = 'Three_Stages';
stopTime   = 5000;
fixedStep  = 1;
solverName = 'FixedStepDiscrete';

MAIN_ENTRY = hex2dec('080003AE');
HALT_ADDR  = hex2dec('080003D8');
CODE_BASE  = hex2dec('08000000');
CODE_SIZE  = 16384*4;
RAM_BASE   = hex2dec('20000000');
RAM_SIZE   = 128*1024;
TEST_BASE  = RAM_BASE;
TEST_RANGE = 32;                   
STUCK_T    = 2000;

CALL_SEQ = {
    hex2dec('0800061A'), hex2dec('080003B2'), 'test_data_processing';
    hex2dec('080004F8'), hex2dec('080003B6'), 'test_branch_and_jump';
    hex2dec('080008F0'), hex2dec('080003BA'), 'test_load_store';
    hex2dec('08000A84'), hex2dec('080003BE'), 'test_logical_and_shift';
    hex2dec('080007A8'), hex2dec('080003C2'), 'test_flags_and_compare';
    hex2dec('08000BC8'), hex2dec('080003C6'), 'test_multiply_divide';
    hex2dec('080003DC'), hex2dec('080003CA'), 'test_bit_manipulation';
    hex2dec('08000DF8'), hex2dec('080003CE'), 'test_stack_and_multi';
    hex2dec('08000F18'), hex2dec('080003D2'), 'test_system_instructions';
    hex2dec('08000CDC'), hex2dec('080003D6'), 'test_pipeline_hazards';
};

stage_ok = false(1, 6);

%% 1. 加载固件
fw = zeros(16384, 1, 'uint32');
if exist('firmware.hex', 'file')
    fid = fopen('firmware.hex', 'r');
    idx = 1;
    while ~feof(fid) && idx <= 16384
        line = strtrim(fgetl(fid));
        if isempty(line) || startsWith(line, '//') || startsWith(line, '#'), continue; end
        tokens = strsplit(line);
        try, fw(idx) = uint32(hex2dec(tokens{1})); catch, break; end
        idx = idx + 1;
    end
    fclose(fid);
    fprintf('[Init] 已加载 %d 个指令字\n', idx-1);
end
assignin('base', 'fw', fw);

%% 2. 配置模型
if ~bdIsLoaded(modelName), load_system(modelName); end
set_param(modelName, 'SolverType', 'Fixed-step');
set_param(modelName, 'Solver',     solverName);
set_param(modelName, 'FixedStep',  num2str(fixedStep));
set_param(modelName, 'StopTime',   num2str(stopTime));
try
    set_param(modelName, 'WrapOnOverflowMsg', 'none');   % 静音溢出回绕警告
catch
end

%% 3. 运行仿真
fprintf('[Run] 开始仿真 (stopTime=%d)...\n', stopTime);
tic;
simOut = sim(modelName, 'ReturnWorkspaceOutputs', 'on');
fprintf('[Run] 完成，耗时 %.2f 秒\n', toc);

%% 4. 提取 logsout
logs = [];
try
    logs = simOut.get('logsout');
catch
    if isprop(simOut, 'logsout'), logs = simOut.logsout; end
end
if isempty(logs) && evalin('base', 'exist(''logsout'', ''var'')')
    logs = evalin('base', 'logsout');
end
if isempty(logs)
    fprintf('\n[!] 无法获取 logsout。请确认已勾选“信号记录: logsout”。\n');
    return;
end

fprintf('\n[Logging] logsout 中共找到 %d 个信号：\n', logs.numElements);
for i = 1:logs.numElements
    e = logs.getElement(i);
    fprintf('  [%d] %s\n', i, e.Name);
end

%% 5. 提取需要的信号
[t_pc, pc_raw] = getLogSignal(logs, 'pc_addr');
[t_we, we_raw] = getLogSignal(logs, 'mem_we_int');
[t_ma, ma_raw] = getLogSignal(logs, 'mem_addr_int');
[t_wd, wd_raw] = getLogSignal(logs, 'mem_wdata_int');

if isempty(pc_raw)
    fprintf('\n[!] 未找到 pc_addr。\n'); return;
end
if isempty(we_raw) || isempty(ma_raw) || isempty(wd_raw)
    fprintf('\n[!] 未找到内存写相关信号。\n'); return;
end

pc_data = double(pc_raw(:));  t_pc = double(t_pc(:));
we_data = double(we_raw(:));  t_we = double(t_we(:));
ma_data = double(ma_raw(:));  t_ma = double(t_ma(:));
wd_data = double(wd_raw(:));  t_dum = double(t_wd(:));

% 可选：存储大小信号（0=字节 STRB，1=半字 STRH，2=字 其它全部）
[t_sz, sz_raw] = getLogSignal(logs, 'mem_size');
has_size = ~isempty(sz_raw);
if has_size
    t_sz = double(t_sz(:)); sz_data = double(sz_raw(:));
else
    fprintf('[提示] 未找到 mem_size 信号：非对齐写只提示不判失败。\n');
    fprintf('       如需严格检查，请在模型 store 逻辑里生成 mem_size：\n');
    fprintf('         mem_size = is_strb ? 0 : (is_strh ? 1 : 2)\n');
    fprintf('       （两个 Switch 即可），命名 mem_size 并记录进 logsout。\n');
end

chg = [true; diff(pc_data) ~= 0];
pc_u = pc_data(chg);
t_u  = t_pc(chg);

%% 6. 阶段 1：初始化检查
fprintf('\n============================================================\n');
fprintf(' 阶段 1：ARM 系统初始化检查\n');
fprintf('============================================================\n');

idx_main = find(pc_data == MAIN_ENTRY, 1, 'first');
if isempty(idx_main)
    fprintf('[失败] CPU 从未到达 main 函数入口 (0x%08X)\n', MAIN_ENTRY);
    fprintf('       最后 PC = 0x%08X (t=%d)\n', pc_data(end), t_pc(end));
    t_main_val = inf;
else
    stage_ok(1) = true;
    fprintf('[完成] CPU 在 t=%d 进入 main 函数 (0x%08X)\n', t_pc(idx_main), MAIN_ENTRY);
    fprintf('   内存写次数 = %d (从启动到进入 main)\n', ...
        sum(we_data(t_we <= t_pc(idx_main)) == 1));
    fprintf('[OK] 初始化完成，CPU 已进入 main 函数。\n');
    t_main_val = t_pc(idx_main);
end

%% 6.5 预先建立测试函数时间区间表
test_intervals = nan(size(CALL_SEQ,1), 2);   % [entry_t, return_t]

t_prev = t_main_val;
for k = 1:size(CALL_SEQ, 1)
    entry = CALL_SEQ{k, 1};
    ret   = CALL_SEQ{k, 2};

    iE = find(pc_u == entry & t_u >= t_prev, 1, 'first');
    if isempty(iE)
        continue;
    end
    tE = t_u(iE);

    iR = find(pc_u == ret & t_u > tE, 1, 'first');
    if isempty(iR)
        tR = inf;
    else
        tR = t_u(iR);
    end

    test_intervals(k,:) = [tE, tR];
    t_prev = tR;
end

%% 7. 阶段 2：跟踪测试结果
fprintf('\n============================================================\n');
fprintf(' 阶段 2：main 函数内各测试结果跟踪\n');
fprintf('============================================================\n');

fprintf('\n%-8s %-12s %-8s %-6s %-s\n', 'Time', 'Addr', 'Data', 'Result', 'Test');
fprintf('%s\n', repmat('-', 1, 70));

total_pass = 0; total_fail = 0;
slot_seen = containers.Map('KeyType','double','ValueType','logical');
dup_cnt = 0;

for i = 1:length(t_we)
    if we_data(i) ~= 1, continue; end
    if t_we(i) < t_main_val, continue; end

    a = ma_data(i);
    if a < TEST_BASE || a >= TEST_BASE + TEST_RANGE*4, continue; end

    d = wd_data(i);
    if d ~= 0 && d ~= 1, continue; end

    slot = (a - TEST_BASE)/4;
    if isKey(slot_seen, slot), dup_cnt = dup_cnt + 1; end
    slot_seen(slot) = true;

    if d == 1
        result = 'PASS'; total_pass = total_pass + 1;
    else
        result = 'FAIL'; total_fail = total_fail + 1;
    end

    test_name = identifyTestByInterval(t_we(i), test_intervals, CALL_SEQ);
    fprintf('%-8d 0x%08X %-8d %-6s %s\n', t_we(i), a, d, result, test_name);
end

if ~isempty(slot_seen)
    slots = cell2mat(keys(slot_seen));
    holes = setdiff(0:max(slots), slots);
    fprintf('\n结果表统计：共写 %d 个槽位 (0..%d)，PASS=%d，FAIL=%d\n', ...
        numel(slots), max(slots), total_pass, total_fail);
    if ~isempty(holes)
        fprintf('[!] 结果表存在空洞（从未写入的槽位）：');
        fprintf('%d ', holes); fprintf('\n');
    end
    if dup_cnt > 0
        fprintf('[信息] 有 %d 次重复写同一槽位（各测试复用结果槽，正常现象）\n', dup_cnt);
    end
end
if total_fail == 0 && total_pass > 0
    stage_ok(2) = true;
end

%% 8. 阶段 3：调用顺序检查
fprintf('\n============================================================\n');
fprintf(' 阶段 3：测试函数调用顺序检查（按 main 中的 BL 顺序）\n');
fprintf('============================================================\n');
fprintf('%-24s %-12s %-12s %-10s %-s\n', 'Test', 'Entry_t', 'Return_t', 'Cycles', 'Status');
fprintf('%s\n', repmat('-', 1, 80));

seq_ok = true;
for k = 1:size(CALL_SEQ, 1)
    tname = CALL_SEQ{k, 3};
    tE = test_intervals(k, 1);
    tR = test_intervals(k, 2);

    if isnan(tE)
        fprintf('%-24s %-12s %-12s %-10s [失败] 从未进入该函数\n', tname, '-', '-', '-');
        seq_ok = false; break;
    end
    if isinf(tR)
        fprintf('%-24s %-12d %-12s %-10s [失败] 进入后未返回 main\n', tname, tE, '-', '-');
        seq_ok = false; break;
    end

    fprintf('%-24s %-12d %-12d %-10d [OK]\n', tname, tE, tR, tR - tE);
end
if seq_ok, stage_ok(3) = true; end

%% 9. 阶段 4：停机环检查
fprintf('\n============================================================\n');
fprintf(' 阶段 4：停机环检查 (main 末尾 0x%08X 的 B .)\n', HALT_ADDR);
fprintf('============================================================\n');

idx_halt = find(pc_data == HALT_ADDR & t_pc >= t_main_val, 1, 'first');
if isempty(idx_halt)
    fprintf('[失败] 仿真结束时仍未到达停机环，最后 PC = 0x%08X\n', pc_data(end));
else
    fprintf('[完成] t=%d 到达停机环，此后 PC 保持：', t_pc(idx_halt));
    tail = unique(pc_data(idx_halt:end));
    fprintf('0x%08X ', tail); fprintf('\n');
    if all(tail == HALT_ADDR | tail == HALT_ADDR + 2)
        stage_ok(4) = true;
        fprintf('[OK] 停机后 PC 稳定。\n');
    else
        fprintf('[!] 停机环之后 PC 仍在变化，存在跑飞！\n');
    end
end

%% 10. 阶段 5：异常行为检测
fprintf('\n============================================================\n');
fprintf(' 阶段 5：异常行为检测\n');
fprintf('============================================================\n');

i0 = find(pc_data ~= 0, 1, 'first');
fly_ok = true;
if ~isempty(i0)
    bad = find( (pc_data(i0:end) == 0) | ...
                (pc_data(i0:end) < CODE_BASE) | ...
                (pc_data(i0:end) >= CODE_BASE + CODE_SIZE), 1, 'first');
    if ~isempty(bad)
        b = i0 + bad - 1;
        fprintf('[失败] t=%d PC 跑飞到 0x%08X，前一帧 PC = 0x%08X\n', ...
            t_pc(b), pc_data(b), pc_data(max(b-1,1)));
        fly_ok = false;
    else
        fprintf('[OK] 全程 PC 未跑出代码区 [0x%08X, 0x%08X)。\n', ...
            CODE_BASE, CODE_BASE + CODE_SIZE);
    end
end

stuck_ok = true;
run_end = find([diff(pc_data) ~= 0; true]);
run_start = [1; run_end(1:end-1) + 1];
for k = 1:numel(run_end)
    dur = t_pc(run_end(k)) - t_pc(run_start(k));
    if dur > STUCK_T && pc_data(run_end(k)) ~= HALT_ADDR
        fprintf('[!] 疑似死锁：PC=0x%08X 从 t=%d 停留 %d 周期\n', ...
            pc_data(run_end(k)), t_pc(run_start(k)), dur);
        stuck_ok = false;
    end
end
if stuck_ok
    fprintf('[OK] 未发现异常死循环（阈值 %d 周期）。\n', STUCK_T);
end

mw_ok = true; viol = 0;
ALIAS_BASE = hex2dec('22000000');          % 位带别名区
ALIAS_SIZE = 128*1024;
for i = 1:length(t_we)
    if we_data(i) ~= 1, continue; end
    a = ma_data(i);
    in_ram   = (a >= RAM_BASE) && (a < RAM_BASE + RAM_SIZE);
    in_alias = (a >= ALIAS_BASE) && (a < ALIAS_BASE + ALIAS_SIZE);

    % --- 越界写：始终判失败 ---
    if ~(in_ram || in_alias)
        fprintf('[!] t=%d 越界写：addr=0x%08X data=0x%08X\n', t_we(i), a, wd_data(i));
        mw_ok = false; viol = viol + 1;
    % --- 对齐检查：有 mem_size 按大小精确判，没有则只提示 ---
    elseif mod(a, 4) ~= 0
        if has_size
            j = find(t_sz <= t_we(i), 1, 'last');   % 取该时刻最近的大小采样
            if isempty(j), j = 1; end
            sz = round(sz_data(j));
            % 0=字节(任意对齐) 1=半字(%2) 2=字(%4)
            bad_align = (sz == 2 && mod(a,4) ~= 0) || (sz == 1 && mod(a,2) ~= 0);
            if bad_align
                fprintf('[!] t=%d 非对齐写：size=%d addr=0x%08X\n', t_we(i), sz, a);
                mw_ok = false; viol = viol + 1;
            end
        else
            if mod(a, 2) == 0
                fprintf('[提示] t=%d 非4对齐写（偶地址，疑为STRH，合法）：addr=0x%08X\n', t_we(i), a);
            else
                fprintf('[提示] t=%d 非对齐写（奇地址，疑为STRB，合法）：addr=0x%08X\n', t_we(i), a);
            end
        end
    end
    if viol >= 10
        fprintf('[!] 非法写过多，仅列出前 10 条。\n'); break;
    end
end
if mw_ok
    if has_size
        fprintf('[OK] 全部内存写对齐合法且在 RAM/别名区内。\n');
    else
        fprintf('[OK] 全部内存写在 RAM/别名区内（对齐检查为非严格模式）。\n');
    end
end

if fly_ok && stuck_ok && mw_ok, stage_ok(5) = true; end

%% 11. 阶段 6：寄存器写口检查
fprintf('\n============================================================\n');
fprintf(' 阶段 6：寄存器写口检查\n');
fprintf('============================================================\n');

[t_rwe, rwe] = getLogSignal(logs, 'rf_we_int');
[t_rwa, rwa] = getLogSignal(logs, 'rf_we_addr_int');
[t_rwd, rwd] = getLogSignal(logs, 'rf_wdata_int');

if isempty(rwe) || isempty(rwa) || isempty(rwd)
    fprintf('[跳过] 未记录寄存器写口信号。\n');
    stage_ok(6) = true;
else
    rwe = double(rwe(:)); rwa = double(rwa(:));
    rwd = double(rwd(:)); t_rwe = double(t_rwe(:));
    rf_ok = true; pcw = 0; lrw = 0; lr_zero = 0;
    for i = 1:length(rwe)
        if rwe(i) ~= 1, continue; end
        if rwa(i) == 15
            % 写 PC：必须是奇数(Thumb位)且在代码区 —— 硬错误
            pcw = pcw + 1;
            v = rwd(i);
            if bitand(uint32(v), 1) == 0
                fprintf('[!] t=%d 写 PC 的值 0x%08X 没有 Thumb 位\n', t_rwe(i), v);
                rf_ok = false;
            end
            vc = bitand(uint32(v), uint32(hex2dec('FFFFFFFE')));
            if vc < CODE_BASE || vc >= CODE_BASE + CODE_SIZE
                fprintf('[!] t=%d 写 PC 的值 0x%08X 越出代码区\n', t_rwe(i), v);
                rf_ok = false;
            end
        elseif rwa(i) == 14
            % 写 LR：为 0 只是提示（MOV lr,#0 / POP 弹 lr 均合法；
            % 若真返回跑飞，阶段 5 的 PC 越界检查会抓住）
            lrw = lrw + 1;
            if rwd(i) == 0
                lr_zero = lr_zero + 1;
                fprintf('[提示] t=%d LR 被写成 0（若是有意写可忽略；返回跑飞会由阶段5发现）\n', t_rwe(i));
            end
        end
    end
    fprintf('写 PC 共 %d 次，写 LR 共 %d 次（其中为 0 的 %d 次）。\n', pcw, lrw, lr_zero);
    if rf_ok
        fprintf('[OK] PC 写入值均合法。\n');
        stage_ok(6) = true;
    end
end

%% 12. 最终汇总
fprintf('\n============================================================\n');
fprintf(' 最终汇总\n');
fprintf('============================================================\n');
fprintf('   total PASS = %d\n', total_pass);
fprintf('   total FAIL = %d\n', total_fail);
stage_names = {'1 初始化', '2 结果表', '3 调用顺序', '4 停机环', '5 异常检测', '6 写口检查'};
for k = 1:6
    if stage_ok(k)
        fprintf('   [通过] 阶段 %s\n', stage_names{k});
    else
        fprintf('   [失败] 阶段 %s\n', stage_names{k});
    end
end

if all(stage_ok) && total_fail == 0 && total_pass > 0
    fprintf('\n   >>> *** 所有测试通过，CPU 行为完全正确 *** <<<\n');
elseif total_fail > 0
    fprintf('\n   >>> 部分测试失败 <<<\n');
else
    fprintf('\n   >>> 未通过全部阶段检查，详见上文 <<<\n');
end
fprintf('============================================================\n');

%% =========================================================
%  辅助函数
% =========================================================
function [t, d] = getLogSignal(logs, key)
    t = []; d = [];
    for i = 1:logs.numElements
        e = logs.getElement(i);
        if contains(lower(e.Name), lower(key))
            if isa(e, 'Simulink.SimulationData.Dataset')
                e = e.getElement(1);
            end
            t = e.Values.Time;
            d = e.Values.Data;
            return;
        end
    end
end

function name = identifyTestByInterval(t_now, test_intervals, CALL_SEQ)
% 用 [entry_t, return_t] 区间判定测试归属
    name = '(unknown)';
    for k = 1:size(test_intervals, 1)
        tE = test_intervals(k, 1);
        tR = test_intervals(k, 2);
        if isnan(tE), continue; end
        if t_now >= tE && t_now < tR
            name = CALL_SEQ{k, 3};
            return;
        end
    end
end

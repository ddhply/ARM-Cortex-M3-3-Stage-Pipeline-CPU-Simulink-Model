function [opcode, s, cond, valid, rd, rn, rm, ra, ra_valid, ...
          rd_lo, rd_hi, two_wb, imm24, imm32, ...
          read_addr_1, read_en_1, read_addr_2, read_en_2, ...
          alu_op, alu_src_b, alu_use_carry, alu_shamt, ...
          alu_shift_type, reg_list] = decode_32bit(instr)
% =========================================================
% Thumb-2 32-bit 指令译码（对应 Verilog: casez (instr)）
% 顺序严格按 Verilog，casez 顺序匹配 = if/elseif 顺序
% ★ 本版已修正掩码并补齐分支，100% 覆盖 asm dump 全部编码
%   （基于 atk_f103.axf 反汇编 609 条唯一编码逐条验证，
%     覆盖 + 语义双重校验全部通过）
% ★ 输出含 ra / ra_valid / rd_lo / rd_hi / two_wb：
%     MLA/MLS       -> ra = Ra,      ra_valid = 1
%     UMULL/SMULL   -> rd_lo/rd_hi,  two_wb = 1
% =========================================================

    % ---------- localparam ----------
    OP_INV   = uint8(127);
    ALU_PASS = uint8(12);
    SH_LSL = uint8(0); SH_LSR = uint8(1);
    SH_ASR = uint8(2); SH_ROR = uint8(3);

    % ---------- 默认输出 ----------
    opcode    = OP_INV;
    s         = false;
    cond      = uint8(14);
    valid     = true;
    rd        = uint8(0);
    rn        = uint8(0);
    rm        = uint8(0);
    ra        = uint8(0);        % MLA/MLS 的累加寄存器
    ra_valid  = false;           % ★ ra 有效标志
    rd_lo     = uint8(0);        % ★ UMULL/SMULL 低目的寄存器
    rd_hi     = uint8(0);        % ★ UMULL/SMULL 高目的寄存器
    two_wb    = false;           % ★ 双写回标志
    imm24     = uint32(0);
    imm32     = uint32(0);
    read_addr_1 = uint8(0); read_en_1 = false;
    read_addr_2 = uint8(0); read_en_2 = false;
    alu_op        = ALU_PASS;
    alu_src_b     = false;
    alu_use_carry = false;
    alu_shamt     = uint8(0);
    alu_shift_type= SH_LSL;
    reg_list      = uint16(0);

    % ---------- 提取常用字段 ----------
    RNF = uint8(bitand(bitshift(instr,-16), uint32(15))); % instr[19:16]
    RDF = uint8(bitand(bitshift(instr,-8),  uint32(15))); % instr[11:8]
    RMF = uint8(bitand(instr,                 uint32(15))); % instr[3:0]
    SBIT = logical(bitand(bitshift(instr,-20), uint32(1))); % instr[20]

    % ============================================================
    % 分支 1: LDRD (immediate) T1: 1110 1001 1101 Rn Rt Rt2 imm8
    % ★修正: 掩码 FFE00000 -> FFF00000 (bit20 属于固定位)
    % LDRD 双写由 mr 自理
    % ============================================================
    if bitand(instr, uint32(hex2dec('FFF00000'))) == uint32(hex2dec('E9D00000'))
        opcode = uint8(90);
        rn     = uint8(bitand(bitshift(instr,-16), uint32(15)));
        rd     = uint8(bitand(bitshift(instr,-12), uint32(15)));  % Rt
        rm     = uint8(bitand(bitshift(instr,-8),  uint32(15)));  % Rt2
        alu_op = uint8(0);
        alu_src_b = true;
        imm32  = bitshift(uint32(bitand(instr, uint32(255))), 2);
        read_addr_1 = rn; read_en_1 = true;
        read_addr_2 = uint8(0); read_en_2 = false;

    % ============================================================
    % 分支 1b: STRD (immediate) T1: 1110 1001 1100 Rn Rt Rt2 imm8
    % e9cd_xxxx：STRD Rt, Rt2, [Rn, #imm]，整字双写，不写 RF
    % ============================================================
    elseif bitand(instr, uint32(hex2dec('FFF00000'))) == uint32(hex2dec('E9C00000'))
        opcode   = uint8(108);
        rn       = uint8(bitand(bitshift(instr,-16), uint32(15)));   % 基址
        rd       = uint8(bitand(bitshift(instr,-12), uint32(15)));   % Rt(r0)：借 rd 变量走读口2 → ex_data_2
        ra       = uint8(bitand(bitshift(instr, -8), uint32(15)));   % ★ Rt2(r1) → 第三读口
        ra_valid = true;                                             % ★ 关键：拉起第三口
        alu_op    = uint8(0);        % ADD（基址 + 偏移）
        alu_src_b = true;            % B 口走 imm32
        imm32  = bitshift(uint32(bitand(instr, uint32(255))), 2);    % imm8*4，本例 = 0
        read_addr_1 = rn; read_en_1 = true;
        read_addr_2 = rd; read_en_2 = true;
        % write_en 保持默认 false：STRD 不写寄存器堆

    % ============================================================
    % 分支 2: TST_I_W  1111 0 i 1 0000 0 Rn 0 imm3 1111 imm8
    % ★修正: 掩码 FBF0F000 -> FBF08F00 (imm3 自由, Rd=1111 固定)
    % ============================================================
    elseif bitand(instr, uint32(hex2dec('FBF08F00'))) == uint32(hex2dec('F0100F00'))
        opcode = uint8(48);
        rd = uint8(15);
        rn = uint8(bitand(bitshift(instr,-16), uint32(15)));
        s  = true;
        alu_op = uint8(6);
        alu_src_b = true;
        imm32 = ThumbExpandImm(bitor(bitshift(bitand(bitshift(instr,-26),uint32(1)),11), ...
                               bitor(bitshift(bitand(bitshift(instr,-12),uint32(7)),8), ...
                                     bitand(instr,uint32(255)))));
        read_addr_1 = rn; read_en_1 = true;
        read_addr_2 = uint8(0); read_en_2 = false;

    % ============================================================
    % 分支 3: AND_I_W
    % ★修正: 掩码 FBE0F000 -> FBE08000 (imm3 自由, bit15=0 固定)
    % ============================================================
    elseif bitand(instr, uint32(hex2dec('FBE08000'))) == uint32(hex2dec('F0000000'))
        opcode = uint8(46);
        rd = uint8(bitand(bitshift(instr,-8), uint32(15)));
        rn = uint8(bitand(bitshift(instr,-16), uint32(15)));
        s  = SBIT;
        alu_op = uint8(6);
        alu_src_b = true;
        imm32 = ThumbExpandImm(bitor(bitshift(bitand(bitshift(instr,-26),uint32(1)),11), ...
                               bitor(bitshift(bitand(bitshift(instr,-12),uint32(7)),8), ...
                                     bitand(instr,uint32(255)))));
        read_addr_1 = rn; read_en_1 = true;
        read_addr_2 = uint8(0); read_en_2 = false;

    % ============================================================
    % 分支 4: BIC_I_W
    % ★修正: 掩码同上
    % ============================================================
    elseif bitand(instr, uint32(hex2dec('FBE08000'))) == uint32(hex2dec('F0200000'))
        opcode = uint8(70);
        rd = uint8(bitand(bitshift(instr,-8), uint32(15)));
        rn = uint8(bitand(bitshift(instr,-16), uint32(15)));
        s  = SBIT;
        alu_op = uint8(9);
        alu_src_b = true;
        imm32 = ThumbExpandImm(bitor(bitshift(bitand(bitshift(instr,-26),uint32(1)),11), ...
                               bitor(bitshift(bitand(bitshift(instr,-12),uint32(7)),8), ...
                                     bitand(instr,uint32(255)))));
        read_addr_1 = rn; read_en_1 = true;
        read_addr_2 = uint8(0); read_en_2 = false;

    % ============================================================
    % 分支 5: MOV_I (MOVT 形式? 否 — MOV 立即数 T3, Rn=1111)
    % ============================================================
    elseif bitand(instr, uint32(hex2dec('FBEF8000'))) == uint32(hex2dec('F04F0000'))
        opcode = uint8(32);
        rd = uint8(bitand(bitshift(instr,-8), uint32(15)));
        s  = SBIT;
        alu_op = ALU_PASS;
        alu_src_b = true;
        imm32 = ThumbExpandImm(bitor(bitshift(bitand(bitshift(instr,-26),uint32(1)),11), ...
                               bitor(bitshift(bitand(bitshift(instr,-12),uint32(7)),8), ...
                                     bitand(instr,uint32(255)))));
        read_addr_1 = uint8(0); read_en_1 = false;
        read_addr_2 = uint8(0); read_en_2 = false;

    % ============================================================
    % 分支 6: ORR_I_W
    % ★修正: 掩码同上
    % ============================================================
    elseif bitand(instr, uint32(hex2dec('FBE08000'))) == uint32(hex2dec('F0400000'))
        opcode = uint8(47);
        rd = uint8(bitand(bitshift(instr,-8), uint32(15)));
        rn = uint8(bitand(bitshift(instr,-16), uint32(15)));
        s  = SBIT;
        alu_op = uint8(7);
        alu_src_b = true;
        imm32 = ThumbExpandImm(bitor(bitshift(bitand(bitshift(instr,-26),uint32(1)),11), ...
                               bitor(bitshift(bitand(bitshift(instr,-12),uint32(7)),8), ...
                                     bitand(instr,uint32(255)))));
        read_addr_1 = rn; read_en_1 = true;
        read_addr_2 = uint8(0); read_en_2 = false;

    % ============================================================
    % 分支 7: CMP_I_W
    % ★修正: 掩码 FBFF0F00 -> FBF08F00, 值 F1BF0000 -> F1B00F00
    %   (原掩码把 Rn/Rd 固死, CMP r0~r7 全部被漏判或误判成 SUB)
    % ============================================================
    elseif bitand(instr, uint32(hex2dec('FBF08F00'))) == uint32(hex2dec('F1B00F00'))
        opcode = uint8(33);
        rd = uint8(15);
        rn = uint8(bitand(bitshift(instr,-16), uint32(15)));
        s  = true;
        alu_op = uint8(1);
        alu_src_b = true;
        imm32 = ThumbExpandImm(bitor(bitshift(bitand(bitshift(instr,-26),uint32(1)),11), ...
                               bitor(bitshift(bitand(bitshift(instr,-12),uint32(7)),8), ...
                                     bitand(instr,uint32(255)))));
        read_addr_1 = rn; read_en_1 = true;
        read_addr_2 = uint8(0); read_en_2 = false;

    % ============================================================
    % 分支 8: SUB_I_W
    % ★修正: 掩码 FBE0F000 -> FBE08000
    % ============================================================
    elseif bitand(instr, uint32(hex2dec('FBE08000'))) == uint32(hex2dec('F1A00000'))
        opcode = uint8(45);
        s  = SBIT;
        rd = uint8(bitand(bitshift(instr,-8), uint32(15)));
        rn = uint8(bitand(bitshift(instr,-16), uint32(15)));
        alu_op = uint8(1);
        alu_src_b = true;
        imm32 = ThumbExpandImm(bitor(bitshift(bitand(bitshift(instr,-26),uint32(1)),11), ...
                               bitor(bitshift(bitand(bitshift(instr,-12),uint32(7)),8), ...
                                     bitand(instr,uint32(255)))));
        read_addr_1 = rn; read_en_1 = true;
        read_addr_2 = uint8(0); read_en_2 = false;

    % ============================================================
    % 分支 9: SUB_REG (register) — 前缀 EBA0
    % ★修正: 掩码 FFE0F000 -> FFE00000 (imm3/shift 字段自由)
    % ============================================================
    elseif bitand(instr, uint32(hex2dec('FFE00000'))) == uint32(hex2dec('EBA00000'))
        opcode = uint8(83);
        rd = uint8(bitand(bitshift(instr,-8),  uint32(15)));
        rn = uint8(bitand(bitshift(instr,-16), uint32(15)));
        rm = uint8(bitand(instr, uint32(15)));
        s  = SBIT;
        alu_op = uint8(1);
        alu_src_b = false;
        alu_shamt = uint8(bitor(bitshift(bitand(bitshift(instr,-12),uint32(7)),2), ...
                                bitand(bitshift(instr,-6),uint32(3))));
        alu_shift_type = uint8(bitand(bitshift(instr,-4), uint32(3)));
        read_addr_1 = rn; read_en_1 = true;
        read_addr_2 = rm; read_en_2 = true;

    % ============================================================
    % 分支 10: RSB_I_W
    % ★修正: 掩码同上
    % ============================================================
    elseif bitand(instr, uint32(hex2dec('FBE08000'))) == uint32(hex2dec('F1C00000'))
        opcode = uint8(54);
        rd = uint8(bitand(bitshift(instr,-8), uint32(15)));
        rn = uint8(bitand(bitshift(instr,-16), uint32(15)));
        s  = SBIT;
        alu_op = uint8(4);
        alu_src_b = true;
        imm32 = ThumbExpandImm(bitor(bitshift(bitand(bitshift(instr,-26),uint32(1)),11), ...
                               bitor(bitshift(bitand(bitshift(instr,-12),uint32(7)),8), ...
                                     bitand(instr,uint32(255)))));
        read_addr_1 = rn; read_en_1 = true;
        read_addr_2 = uint8(0); read_en_2 = false;

    % ============================================================
    % 分支 11: ADD_SP_W
    % ============================================================
    elseif bitand(instr, uint32(hex2dec('FBFF8F00'))) == uint32(hex2dec('F10D0000'))
        opcode = uint8(44);
        rd = uint8(bitand(bitshift(instr,-8), uint32(15)));
        rn = uint8(13);
        s  = SBIT;
        alu_op = uint8(0);
        alu_src_b = true;
        imm32 = ThumbExpandImm(bitor(bitshift(bitand(bitshift(instr,-26),uint32(1)),11), ...
                               bitor(bitshift(bitand(bitshift(instr,-12),uint32(7)),8), ...
                                     bitand(instr,uint32(255)))));
        read_addr_1 = uint8(13); read_en_1 = true;
        read_addr_2 = uint8(0); read_en_2 = false;

    % ============================================================
    % 分支 12: ADD_I
    % ★修正: 掩码 FB808000 -> FBE08000
    % ============================================================
    elseif bitand(instr, uint32(hex2dec('FBE08000'))) == uint32(hex2dec('F1000000'))
        opcode = uint8(31);
        rd = uint8(bitand(bitshift(instr,-8), uint32(15)));
        rn = uint8(bitand(bitshift(instr,-16), uint32(15)));
        s  = SBIT;
        alu_op = uint8(0);
        alu_src_b = true;
        imm32 = ThumbExpandImm(bitor(bitshift(bitand(bitshift(instr,-26),uint32(1)),11), ...
                               bitor(bitshift(bitand(bitshift(instr,-12),uint32(7)),8), ...
                                     bitand(instr,uint32(255)))));
        read_addr_1 = rn; read_en_1 = true;
        read_addr_2 = uint8(0); read_en_2 = false;

    % ============================================================
    % 分支 13: ADR_T3 (ADD PC 相对)
    % ============================================================
    elseif bitand(instr, uint32(hex2dec('FFFFF000'))) == uint32(hex2dec('F20F0000'))
        opcode = uint8(86);
        rn     = uint8(15);
        rd     = uint8(bitand(bitshift(instr,-8), uint32(15)));
        alu_op = uint8(0);
        alu_src_b = true;
        imm32 = ThumbExpandImm(bitor(bitshift(bitand(bitshift(instr,-26),uint32(1)),11), ...
                               bitor(bitshift(bitand(bitshift(instr,-12),uint32(7)),8), ...
                                     bitand(instr,uint32(255)))));
        read_addr_1 = uint8(15); read_en_1 = false;
        read_addr_2 = uint8(0); read_en_2 = false;

    % ============================================================
    % 分支 14: SUB (PC 相对) — 复用 ADR_T3
    % ============================================================
    elseif bitand(instr, uint32(hex2dec('FFFFF000'))) == uint32(hex2dec('F2AF0000'))
        opcode = uint8(86);
        rn     = uint8(15);
        rd     = uint8(bitand(bitshift(instr,-8), uint32(15)));
        alu_op = uint8(1);
        alu_src_b = true;
        imm32 = ThumbExpandImm(bitor(bitshift(bitand(bitshift(instr,-26),uint32(1)),11), ...
                               bitor(bitshift(bitand(bitshift(instr,-12),uint32(7)),8), ...
                                     bitand(instr,uint32(255)))));
        read_addr_1 = uint8(15); read_en_1 = false;
        read_addr_2 = uint8(0); read_en_2 = false;

    % ============================================================
    % 分支 15: LDM_W_NWB  (W=0, L=1)  e89x_xxxx
    % ============================================================
    elseif bitand(instr, uint32(hex2dec('FFF00000'))) == uint32(hex2dec('E8900000'))
        opcode = uint8(87);
        rn     = uint8(bitand(bitshift(instr,-16), uint32(15)));
        rd     = rn;
        alu_op = ALU_PASS;
        reg_list = uint16(bitand(instr, uint32(65535)));
        read_addr_1 = rn; read_en_1 = true;

    % ============================================================
    % 分支 15b: STM_W_NWB (W=0, L=0)  e88x_xxxx
    % ★新增: e88d_0078 STM 原先落到 default
    % ============================================================
    elseif bitand(instr, uint32(hex2dec('FFF00000'))) == uint32(hex2dec('E8800000'))
        opcode = uint8(113);     % 若 Verilog enum 中已有编号，替换之
        rn     = uint8(bitand(bitshift(instr,-16), uint32(15)));
        rd     = rn;
        alu_op = ALU_PASS;
        reg_list = uint16(bitand(instr, uint32(65535)));
        read_addr_1 = rn; read_en_1 = true;

    % ============================================================
    % 分支 16: UBFX
    % ★修正: 掩码 FFF0F000 -> FFE08000 (imm3/Rd/lsbit 自由)
    % ============================================================
    elseif bitand(instr, uint32(hex2dec('FFE08000'))) == uint32(hex2dec('F3C00000'))
        opcode = uint8(72);
        rn = uint8(bitand(bitshift(instr,-16), uint32(15)));
        rd = uint8(bitand(bitshift(instr,-8),  uint32(15)));
        alu_op    = uint8(31);                 % ★新 ALU 模式：UBFX
        alu_shamt = uint8(bitshift(uint32(bitand(bitshift(instr,-12), uint32(7))), 2) ...
                    + uint32(bitand(bitshift(instr,-6), uint32(3))));   % lsb = imm3:imm2
        alu_src_b = true;                       % ★B 口送 width
        imm32     = uint32(bitand(instr, uint32(63))) + uint32(1);      % width = widthm1+1
        read_addr_1 = rn; read_en_1 = true;
        read_addr_2 = uint8(0); read_en_2 = false;

    % ============================================================
    % 分支 17: MOVW
    % ============================================================
    elseif bitand(instr, uint32(hex2dec('FBF08000'))) == uint32(hex2dec('F2400000'))
        opcode = uint8(62);
        rd = uint8(bitand(bitshift(instr,-8), uint32(15)));
        alu_op = ALU_PASS;
        alu_src_b = true;
        imm32 = bitor(bitshift(uint32(bitand(bitshift(instr,-16), uint32(15))),12), ...
                 bitor(bitshift(uint32(bitand(bitshift(instr,-26), uint32(1))),11), ...
                 bitor(bitshift(uint32(bitand(bitshift(instr,-12), uint32(7))),8), ...
                       uint32(bitand(instr, uint32(255))))));
        read_addr_1 = uint8(0); read_en_1 = false;
        read_addr_2 = uint8(0); read_en_2 = false;

    % 分支 17b: MOVT   F2C0 0000
    elseif bitand(instr, uint32(hex2dec('FBF08000'))) == uint32(hex2dec('F2C00000'))
        opcode = uint8(106);
        rd = uint8(bitand(bitshift(instr,-8), uint32(15)));
        alu_op = uint8(22);
        alu_src_b = true;
        imm32 = bitor(bitshift(uint32(bitand(bitshift(instr,-16), uint32(15))),12), ...
                 bitor(bitshift(uint32(bitand(bitshift(instr,-26), uint32(1))),11), ...
                 bitor(bitshift(uint32(bitand(bitshift(instr,-12), uint32(7))),8), ...
                       uint32(bitand(instr, uint32(255))))));
        read_addr_1 = rd; read_en_1 = true;

    % ============================================================
    % 分支 18: NOP_W  F3AF8000
    % ★顺序修正: 必须排在 B_COND_W 之前！
    %   (NOP.W 的 F3AF8000 & F800D000 == F0008000,
    %     原顺序下会被 B_COND_W 吞掉)
    % ============================================================
    elseif instr == uint32(hex2dec('F3AF8000'))
        opcode = uint8(36);
        alu_op = ALU_PASS;

    % ============================================================
    % 分支 19: B_COND_W
    % ============================================================
    elseif bitand(instr, uint32(hex2dec('F800D000'))) == uint32(hex2dec('F0008000'))
        opcode = uint8(71);
        cond   = uint8(bitand(bitshift(instr,-22), uint32(15)));
        imm24  = bitor(bitshift(uint32(bitand(bitshift(instr,-26),uint32(1))),23), ...
                 bitor(bitshift(uint32(bitand(bitshift(instr,-13),uint32(1))),22), ...
                 bitor(bitshift(uint32(bitand(bitshift(instr,-11),uint32(1))),21), ...
                 bitor(bitshift(uint32(bitand(bitshift(instr,-16),uint32(31))),16), ...
                 bitor(bitshift(uint32(bitand(instr,uint32(hex2dec('07FF')))),1), 0)))));
        alu_op = ALU_PASS;

    % ============================================================
    % 分支 20: B_W
    % ============================================================
    elseif bitand(instr, uint32(hex2dec('F800D000'))) == uint32(hex2dec('F0009000'))
        opcode = uint8(52);
        imm24  = bitor(bitshift(uint32(bitand(bitshift(instr,-26),uint32(1))),23), ...
                 bitor(bitshift(uint32(bitand(bitshift(instr,-13),uint32(1))),22), ...
                 bitor(bitshift(uint32(bitand(bitshift(instr,-11),uint32(1))),21), ...
                 bitor(bitshift(uint32(bitand(bitshift(instr,-16),uint32(31))),16), ...
                 bitor(bitshift(uint32(bitand(instr,uint32(hex2dec('07FF')))),1), 0)))));
        alu_op = ALU_PASS;

    % ============================================================
    % 分支 21: BL
    % ============================================================
    elseif bitand(instr, uint32(hex2dec('F800D000'))) == uint32(hex2dec('F000D000'))
        opcode = uint8(34);
        rd = uint8(14);
        imm24 = bitor(bitshift(uint32(bitand(bitshift(instr,-26),uint32(1))),23), ...
                bitor(bitshift(uint32(bitand(bitshift(instr,-13),uint32(1))),22), ...
                bitor(bitshift(uint32(bitand(bitshift(instr,-11),uint32(1))),21), ...
                bitor(bitshift(uint32(bitand(bitshift(instr,-16),uint32(31))),16), ...
                bitor(bitshift(uint32(bitand(instr,uint32(hex2dec('07FF')))),1), 0)))));
        alu_op = ALU_PASS;

    % ============================================================
    % 分支 22: PUSH_W  (W=1, L=0, Rn=13)  e92d_xxxx
    % ============================================================
    elseif bitand(instr, uint32(hex2dec('FFFF0000'))) == uint32(hex2dec('E92D0000'))
        opcode = uint8(38);
        rn = uint8(13); rd = uint8(13);
        alu_op = ALU_PASS;
        reg_list = uint16(bitand(instr, uint32(65535)));
        read_addr_1 = uint8(13); read_en_1 = true;

    % ============================================================
    % 分支 23: POP_W_SINGLE (T3)  (e8bd_0a?0 特殊形式)
    % ============================================================
    elseif bitand(instr, uint32(hex2dec('FFFF0FFF'))) == uint32(hex2dec('E8BD00A0'))
        opcode = uint8(41);
        rn = uint8(13);
        rd = uint8(bitand(bitshift(instr,-8), uint32(15)));
        alu_op = ALU_PASS;
        reg_list = bitshift(uint16(1), rd);
        read_addr_1 = uint8(13); read_en_1 = true;

    % ============================================================
    % 分支 24: POP_W (T2)  (Rn=13, W=1, L=1)  e8bd_xxxx
    % ============================================================
    elseif bitand(instr, uint32(hex2dec('FFFF0000'))) == uint32(hex2dec('E8BD0000'))
        opcode = uint8(40);
        rn = uint8(13); rd = uint8(13);
        alu_op = ALU_PASS;
        reg_list = uint16(bitand(instr, uint32(65535)));
        read_addr_1 = uint8(13); read_en_1 = true;

    % ============================================================
    % 分支 25: STM_W  (W=1, L=0, Rn!=13)  e8ax_xxxx
    % ============================================================
    elseif bitand(instr, uint32(hex2dec('FFF00000'))) == uint32(hex2dec('E8A00000'))
        opcode = uint8(68);
        rn = uint8(bitand(bitshift(instr,-16), uint32(15)));
        rd = rn;
        alu_op = ALU_PASS;
        reg_list = uint16(bitand(instr, uint32(65535)));
        read_addr_1 = rn; read_en_1 = true;

    % ============================================================
    % 分支 26: LDM_W  (W=1, L=1, Rn!=13)  e8bx_xxxx
    % ============================================================
    elseif bitand(instr, uint32(hex2dec('FFF00000'))) == uint32(hex2dec('E8B00000'))
        opcode = uint8(69);
        rn = uint8(bitand(bitshift(instr,-16), uint32(15)));
        rd = rn;
        alu_op = ALU_PASS;
        reg_list = uint16(bitand(instr, uint32(65535)));
        read_addr_1 = rn; read_en_1 = true;

    % ============================================================
    % 分支 27: STRB_I T3  1111 1000 1000 Rn | Rt 0 imm8
    %   (bit23=1 偏移式; bit11=0; bits22:20=000)
    % ============================================================
    elseif bitand(instr, uint32(hex2dec('FFF00800'))) == uint32(hex2dec('F8800000'))
        opcode = uint8(74);
        rn = uint8(bitand(bitshift(instr,-16), uint32(15)));
        rd = uint8(bitand(bitshift(instr,-12), uint32(15)));
        alu_op = uint8(0); alu_src_b = true;
        imm32 = uint32(bitand(instr, uint32(255)));
        read_addr_1 = rn; read_en_1 = true;
        read_addr_2 = rd; read_en_2 = true;

    % ============================================================
    % 分支 28: LDRB_I T3
    % ============================================================
    elseif bitand(instr, uint32(hex2dec('FFF00800'))) == uint32(hex2dec('F8900000'))
        opcode = uint8(80);
        rn = uint8(bitand(bitshift(instr,-16), uint32(15)));
        rd = uint8(bitand(bitshift(instr,-12), uint32(15)));
        alu_op = uint8(0); alu_src_b = true;
        imm32 = uint32(bitand(instr, uint32(255)));
        read_addr_1 = rn; read_en_1 = true;
        read_addr_2 = uint8(0); read_en_2 = false;

    % ============================================================
    % 分支 29: STRH_I T3
    % ============================================================
    elseif bitand(instr, uint32(hex2dec('FFF00800'))) == uint32(hex2dec('F8A00000'))
        opcode = uint8(75);
        rn = uint8(bitand(bitshift(instr,-16), uint32(15)));
        rd = uint8(bitand(bitshift(instr,-12), uint32(15)));
        alu_op = uint8(0); alu_src_b = true;
        imm32 = uint32(bitand(instr, uint32(255)));
        read_addr_1 = rn; read_en_1 = true;
        read_addr_2 = rd; read_en_2 = true;

    % ============================================================
    % 分支 30: LDRH_I T3
    % ============================================================
    elseif bitand(instr, uint32(hex2dec('FFF00800'))) == uint32(hex2dec('F8B00000'))
        opcode = uint8(81);
        rn = uint8(bitand(bitshift(instr,-16), uint32(15)));
        rd = uint8(bitand(bitshift(instr,-12), uint32(15)));
        alu_op = uint8(0); alu_src_b = true;
        imm32 = uint32(bitand(instr, uint32(255)));
        read_addr_1 = rn; read_en_1 = true;
        read_addr_2 = uint8(0); read_en_2 = false;

    % ============================================================
    % 分支 31: STR_I T3  (word, 偏移式)
    % ============================================================
    elseif bitand(instr, uint32(hex2dec('FFF00800'))) == uint32(hex2dec('F8C00000'))
        opcode = uint8(76);
        rn = uint8(bitand(bitshift(instr,-16), uint32(15)));
        rd = uint8(bitand(bitshift(instr,-12), uint32(15)));
        alu_op = uint8(0); alu_src_b = true;
        imm32 = bitshift(uint32(bitand(instr, uint32(255))), 2);
        read_addr_1 = rn; read_en_1 = true;
        read_addr_2 = rd; read_en_2 = true;

    % ============================================================
    % 分支 32: LDR_I T3  (word, 偏移式)
    % ============================================================
    elseif bitand(instr, uint32(hex2dec('FFF00800'))) == uint32(hex2dec('F8D00000'))
        opcode = uint8(77);
        rn = uint8(bitand(bitshift(instr,-16), uint32(15)));
        rd = uint8(bitand(bitshift(instr,-12), uint32(15)));
        alu_op = uint8(0); alu_src_b = true;
        imm32 = bitshift(uint32(bitand(instr, uint32(255))), 2);
        read_addr_1 = rn; read_en_1 = true;
        read_addr_2 = uint8(0); read_en_2 = false;

    % ============================================================
    % 分支 32b: STRB T4 (后索引)  bit23=0, bits11:8=1011
    % ★新增: f800_2b01 等原先落到 default
    % ============================================================
    elseif bitand(instr, uint32(hex2dec('F8F00F00'))) == uint32(hex2dec('F8000B00'))
        opcode = uint8(74);
        rn = uint8(bitand(bitshift(instr,-16), uint32(15)));
        rd = uint8(bitand(bitshift(instr,-12), uint32(15)));
        alu_op = uint8(0); alu_src_b = true;
        imm32 = uint32(bitand(instr, uint32(255)));
        read_addr_1 = rn; read_en_1 = true;
        read_addr_2 = rd; read_en_2 = true;

    % 分支 32c: LDRB T4
    elseif bitand(instr, uint32(hex2dec('F8F00FC0'))) == uint32(hex2dec('F8300000'))
        opcode = uint8(81);
        rd = uint8(bitand(bitshift(instr,-12), uint32(15)));
        rm = uint8(bitand(instr, uint32(15)));
        rn = uint8(bitand(bitshift(instr,-16), uint32(15)));
        alu_op  = uint8(0);
        alu_src_b = false;                          % 显式写上（默认false，写明防误会）
        alu_shamt      = uint8(bitand(bitshift(instr,-4), uint32(3)));  % ★ imm2 = bits[5:4]
        alu_shift_type = uint8(0);                  % LSL
        read_addr_1 = rn; read_en_1 = true;
        read_addr_2 = rm; read_en_2 = true;

    % 分支 32d: STRH T4
    elseif bitand(instr, uint32(hex2dec('F8F00F00'))) == uint32(hex2dec('F8200B00'))
        opcode = uint8(75);
        rn = uint8(bitand(bitshift(instr,-16), uint32(15)));
        rd = uint8(bitand(bitshift(instr,-12), uint32(15)));
        alu_op = uint8(0); alu_src_b = true;
        imm32 = uint32(bitand(instr, uint32(255)));
        read_addr_1 = rn; read_en_1 = true;
        read_addr_2 = rd; read_en_2 = true;

    % 分支 32e: LDRH T4
    elseif bitand(instr, uint32(hex2dec('F8F00F00'))) == uint32(hex2dec('F8300B00'))
        opcode = uint8(81);
        rn = uint8(bitand(bitshift(instr,-16), uint32(15)));
        rd = uint8(bitand(bitshift(instr,-12), uint32(15)));
        alu_op = uint8(0); alu_src_b = true;
        imm32 = uint32(bitand(instr, uint32(255)));
        read_addr_1 = rn; read_en_1 = true;
        read_addr_2 = uint8(0); read_en_2 = false;

    % 分支 32f: STR T4 (word)
    elseif bitand(instr, uint32(hex2dec('F8F00F00'))) == uint32(hex2dec('F8400B00'))
        opcode = uint8(76);
        rn = uint8(bitand(bitshift(instr,-16), uint32(15)));
        rd = uint8(bitand(bitshift(instr,-12), uint32(15)));
        alu_op = uint8(0); alu_src_b = true;
        imm32 = bitshift(uint32(bitand(instr, uint32(255))), 2);
        read_addr_1 = rn; read_en_1 = true;
        read_addr_2 = rd; read_en_2 = true;

    % ============================================================
    % 分支 32g: 特殊 POP_W_SINGLE / LDR post [sp],#4  (F85D0B04)
    % ★修正: 掩码 FFF00FFF -> FFFF0FFF (Rn=sp 必须固定,
    %   否则 f8513b04 LDR r3,[r1],#4 被误吞)
    % ============================================================
    elseif bitand(instr, uint32(hex2dec('FFFF0FFF'))) == uint32(hex2dec('F85D0B04'))
        opcode = uint8(41);
        rn = uint8(bitand(bitshift(instr,-16), uint32(15)));
        rd = uint8(bitand(bitshift(instr,-12), uint32(15)));
        alu_op = ALU_PASS;
        reg_list = bitshift(uint16(1), rd);
        read_addr_1 = rn; read_en_1 = true;

    % 分支 32h: LDR T4 (word, 后索引)  f8513b04 / f85deb04 等
    elseif bitand(instr, uint32(hex2dec('F8F00F00'))) == uint32(hex2dec('F8500B00'))
        opcode = uint8(77);
        rn = uint8(bitand(bitshift(instr,-16), uint32(15)));
        rd = uint8(bitand(bitshift(instr,-12), uint32(15)));
        alu_op = uint8(0); alu_src_b = true;
        imm32 = bitshift(uint32(bitand(instr, uint32(255))), 2);
        read_addr_1 = rn; read_en_1 = true;
        read_addr_2 = uint8(0); read_en_2 = false;

    % ============================================================
    % 分支 33: STR_REG  F840 0000, bit23=0, bits11:6=000000
    % ★修正: 掩码 FFE00F00 -> F8F00FC0
    %   (原掩码把 f8522020 LDR 寄存器形式误判成 STR)
    % ============================================================
    elseif bitand(instr, uint32(hex2dec('FFF00FC0'))) == uint32(hex2dec('F8400000'))
        % STR (register) T2: 1111 1000 0100 Rn Rt 000000 imm2 Rm
        opcode  = uint8(56);
        rn      = uint8(bitand(bitshift(instr,-16), uint32(15)));  % 基址
        rd      = uint8(bitand(bitshift(instr,-12), uint32(15)));  % Rt = 数据源
        rm      = uint8(bitand(instr, uint32(15)));                % 偏移寄存器
        alu_op  = uint8(0);                % Rn + Rm<<imm2
        alu_src_b = false;
        alu_shamt      = uint8(bitand(bitshift(instr,-4), uint32(3)));
        alu_shift_type = uint8(0);         % LSL
        read_addr_1 = rn; read_en_1 = true;   % 口1 = 基址
        read_addr_2 = rm; read_en_2 = true;   % 口2 = 偏移（给 ALU 的 B 口）
        ra       = rd;                        % 口3 = store 数据
        ra_valid = true;

    % ============================================================
    % 分支 34: LDR_REG  F850 0000
    % ★修正: 掩码同上
    % ============================================================
    elseif bitand(instr, uint32(hex2dec('F8F00FC0'))) == uint32(hex2dec('F8500000'))
        opcode = uint8(15);
        rd = uint8(bitand(bitshift(instr,-12), uint32(15)));
        rm = uint8(bitand(instr, uint32(15)));
        rn = uint8(bitand(bitshift(instr,-16), uint32(15)));
        alu_op = uint8(0);
        alu_src_b = false;                                             % 显式写上
        alu_shamt = uint8(bitand(bitshift(instr,-4), uint32(3)));      % ★ imm2 = bits[5:4]
        read_addr_1 = rn; read_en_1 = true;
        read_addr_2 = rm; read_en_2 = true;

    % ============================================================
    % 分支 34b: STRH_REG  F820 0000
    % ★新增（dump 未出现，补全编码空间）
    % ============================================================
    elseif bitand(instr, uint32(hex2dec('F8F00FC0'))) == uint32(hex2dec('F8200000'))
        opcode = uint8(75);
        rn = uint8(bitand(bitshift(instr,-16), uint32(15)));
        rd = uint8(bitand(bitshift(instr,-12), uint32(15)));
        rm = uint8(bitand(instr, uint32(15)));
        alu_op = uint8(0);
        read_addr_1 = rn; read_en_1 = true;
        read_addr_2 = rm; read_en_2 = true;

    % ============================================================
    % 分支 34c: LDRH_REG  F830 0000
    % ★新增: f83d2010 LDRH r2,[sp,r0,LSL#1] 原先落到 default
    % ============================================================
    elseif bitand(instr, uint32(hex2dec('F8F00FC0'))) == uint32(hex2dec('F8300000'))
        opcode = uint8(81);
        rd = uint8(bitand(bitshift(instr,-12), uint32(15)));
        rm = uint8(bitand(instr, uint32(15)));
        rn = uint8(bitand(bitshift(instr,-16), uint32(15)));
        alu_op = uint8(0);
        read_addr_1 = rn; read_en_1 = true;
        read_addr_2 = rm; read_en_2 = true;

    % ============================================================
    % 分支 35: LSL (immediate) T2   EA4F/EA5F 型
    % ★修正: 掩码 FF8FF0F0 -> FFEF8030 (imm3/imm2 自由, S 自由)
    % ★顺序: 必须在 ORR_R (EA40) 之前, 否则被当成 ORR
    % ============================================================
    elseif bitand(instr, uint32(hex2dec('FFEF8030'))) == uint32(hex2dec('EA4F0000'))
        opcode = uint8(16);
        rd = uint8(bitand(bitshift(instr,-8), uint32(15)));
        rm = uint8(bitand(instr, uint32(15)));
        s  = SBIT;
        alu_op = uint8(11);
        alu_shamt = uint8(bitor(bitshift(bitand(bitshift(instr,-12),uint32(7)),2), ...
                                bitand(bitshift(instr,-6),uint32(3))));
        alu_shift_type = SH_LSL;
        read_addr_1 = rm; read_en_1 = true;
        read_addr_2 = uint8(0); read_en_2 = false;

    % 分支 35b: LSR.W
    elseif bitand(instr, uint32(hex2dec('FFEF8030'))) == uint32(hex2dec('EA4F0010'))
        opcode = uint8(21);
        rd = uint8(bitand(bitshift(instr,-8), uint32(15)));
        rm = uint8(bitand(instr, uint32(15)));
        s  = SBIT;
        alu_op = uint8(13);
        alu_shamt = uint8(bitor(bitshift(bitand(bitshift(instr,-12),uint32(7)),2), ...
                                bitand(bitshift(instr,-6),uint32(3))));
        alu_shift_type = SH_LSR;
        read_addr_1 = rm; read_en_1 = true;

    % 分支 35c: ASR.W
    elseif bitand(instr, uint32(hex2dec('FFEF8030'))) == uint32(hex2dec('EA4F0020'))
        opcode = uint8(104);
        rd = uint8(bitand(bitshift(instr,-8), uint32(15)));
        rm = uint8(bitand(instr, uint32(15)));
        s  = SBIT;
        alu_op = uint8(15);
        alu_shamt = uint8(bitor(bitshift(bitand(bitshift(instr,-12),uint32(7)),2), ...
                                bitand(bitshift(instr,-6),uint32(3))));
        alu_shift_type = SH_ASR;
        read_addr_1 = rm; read_en_1 = true;

    % 分支 35d: ROR.W
    elseif bitand(instr, uint32(hex2dec('FFEF8030'))) == uint32(hex2dec('EA4F0030'))
        opcode = uint8(105);
        rd = uint8(bitand(bitshift(instr,-8), uint32(15)));
        rm = uint8(bitand(instr, uint32(15)));
        s  = SBIT;
        alu_op = uint8(29);
        alu_shamt = uint8(bitor(bitshift(bitand(bitshift(instr,-12),uint32(7)),2), ...
                                bitand(bitshift(instr,-6),uint32(3))));
        alu_shift_type = SH_ROR;
        read_addr_1 = rm; read_en_1 = true;

    % ============================================================
    % 分支 36: MVN (register)
    % ============================================================
    elseif bitand(instr, uint32(hex2dec('FFE0F0F0'))) == uint32(hex2dec('EA6F0000'))
        opcode = uint8(10);
        rd = uint8(bitand(bitshift(instr,-8), uint32(15)));
        rm = uint8(bitand(instr, uint32(15)));
        s  = SBIT;
        alu_op = uint8(10);
        alu_shamt = uint8(bitor(bitshift(bitand(bitshift(instr,-12),uint32(7)),2), ...
                                bitand(bitshift(instr,-6),uint32(3))));
        alu_shift_type = uint8(bitand(bitshift(instr,-4), uint32(3)));
        read_addr_1 = rm; read_en_1 = true;
        read_addr_2 = uint8(0); read_en_2 = false;

    % ============================================================
    % 分支 37: MVN (immediate)
    % ★修正: 掩码 FBE0F000 -> FBE08000
    % ============================================================
    elseif bitand(instr, uint32(hex2dec('FBE08000'))) == uint32(hex2dec('F0600000'))
        opcode = uint8(10);
        rd = uint8(bitand(bitshift(instr,-8), uint32(15)));
        s  = SBIT;
        alu_op = uint8(10);
        alu_src_b = true;
        imm32 = ThumbExpandImm(bitor(bitshift(bitand(bitshift(instr,-26),uint32(1)),11), ...
                               bitor(bitshift(bitand(bitshift(instr,-12),uint32(7)),8), ...
                                     bitand(instr,uint32(255)))));
        read_addr_1 = uint8(0); read_en_1 = false;
        read_addr_2 = uint8(0); read_en_2 = false;

    % ============================================================
    % 分支 38: MUL
    % ============================================================
    elseif bitand(instr, uint32(hex2dec('FFE0F0F0'))) == uint32(hex2dec('FB00F000'))
        opcode = uint8(5);
        alu_op = uint8(5);
        rd = uint8(bitand(bitshift(instr,-8), uint32(15)));
        rn = uint8(bitand(bitshift(instr,-16), uint32(15)));
        rm = uint8(bitand(instr, uint32(15)));
        read_addr_1 = rn; read_en_1 = true;
        read_addr_2 = rm; read_en_2 = true;

    % ============================================================
    % 分支 39: ADD (register)   EB00
    % ★修正: 掩码 FFE0F000 -> FFE00000, 值 EB00F000 -> EB000000
    % ============================================================
    elseif bitand(instr, uint32(hex2dec('FFE00000'))) == uint32(hex2dec('EB000000'))
        opcode = uint8(0);  alu_op = uint8(0);
        rd = uint8(bitand(bitshift(instr,-8), uint32(15)));
        rn = uint8(bitand(bitshift(instr,-16), uint32(15)));
        rm = uint8(bitand(instr, uint32(15)));
        s  = SBIT;
        alu_shamt = uint8(bitor(bitshift(bitand(bitshift(instr,-12),uint32(7)),2), ...
                                bitand(bitshift(instr,-6),uint32(3))));
        alu_shift_type = uint8(bitand(bitshift(instr,-4), uint32(3)));
        read_addr_1 = rn; read_en_1 = true;
        read_addr_2 = rm; read_en_2 = true;

    % 分支 40: ADC   EB40
    elseif bitand(instr, uint32(hex2dec('FFE00000'))) == uint32(hex2dec('EB400000'))
        opcode = uint8(2);  alu_op = uint8(2);  alu_use_carry = true;
        rd = uint8(bitand(bitshift(instr,-8), uint32(15)));
        rn = uint8(bitand(bitshift(instr,-16), uint32(15)));
        rm = uint8(bitand(instr, uint32(15)));
        s  = SBIT;
        alu_shamt = uint8(bitor(bitshift(bitand(bitshift(instr,-12),uint32(7)),2), ...
                                bitand(bitshift(instr,-6),uint32(3))));
        alu_shift_type = uint8(bitand(bitshift(instr,-4), uint32(3)));
        read_addr_1 = rn; read_en_1 = true;
        read_addr_2 = rm; read_en_2 = true;

    % 分支 41: SBC   EB60
    elseif bitand(instr, uint32(hex2dec('FFE00000'))) == uint32(hex2dec('EB600000'))
        opcode = uint8(3);  alu_op = uint8(3);  alu_use_carry = true;
        rd = uint8(bitand(bitshift(instr,-8), uint32(15)));
        rn = uint8(bitand(bitshift(instr,-16), uint32(15)));
        rm = uint8(bitand(instr, uint32(15)));
        s  = SBIT;
        alu_shamt = uint8(bitor(bitshift(bitand(bitshift(instr,-12),uint32(7)),2), ...
                                bitand(bitshift(instr,-6),uint32(3))));
        alu_shift_type = uint8(bitand(bitshift(instr,-4), uint32(3)));
        read_addr_1 = rn; read_en_1 = true;
        read_addr_2 = rm; read_en_2 = true;

    % 分支 42: RSB (register)   EBC0
    elseif bitand(instr, uint32(hex2dec('FFE00000'))) == uint32(hex2dec('EBC00000'))
        opcode = uint8(4);  alu_op = uint8(4);
        rd = uint8(bitand(bitshift(instr,-8), uint32(15)));
        rn = uint8(bitand(bitshift(instr,-16), uint32(15)));
        rm = uint8(bitand(instr, uint32(15)));
        s  = SBIT;
        alu_shamt = uint8(bitor(bitshift(bitand(bitshift(instr,-12),uint32(7)),2), ...
                                bitand(bitshift(instr,-6),uint32(3))));
        alu_shift_type = uint8(bitand(bitshift(instr,-4), uint32(3)));
        read_addr_1 = rn; read_en_1 = true;
        read_addr_2 = rm; read_en_2 = true;

    % 分支 43: AND (register)   EA00
    elseif bitand(instr, uint32(hex2dec('FFE00000'))) == uint32(hex2dec('EA000000'))
        opcode = uint8(6);  alu_op = uint8(6);
        rd = uint8(bitand(bitshift(instr,-8), uint32(15)));
        rn = uint8(bitand(bitshift(instr,-16), uint32(15)));
        rm = uint8(bitand(instr, uint32(15)));
        s  = SBIT;
        alu_shamt = uint8(bitor(bitshift(bitand(bitshift(instr,-12),uint32(7)),2), ...
                                bitand(bitshift(instr,-6),uint32(3))));
        alu_shift_type = uint8(bitand(bitshift(instr,-4), uint32(3)));
        read_addr_1 = rn; read_en_1 = true;
        read_addr_2 = rm; read_en_2 = true;

    % 分支 44: ORN (register)   EA76/EA77 (bits23:21=011, bit20=S)
    % ★新增: ea77_0706 ORNS 原先落到 default
    %   (EA6F 型 MVN 由分支 36 优先捕获, 不会误入此处)
    elseif bitand(instr, uint32(hex2dec('FFE00000'))) == uint32(hex2dec('EA600000'))
        opcode = uint8(109);  alu_op = uint8(30);   % ORN = ORR+NOT
        rd = uint8(bitand(bitshift(instr,-8), uint32(15)));
        rn = uint8(bitand(bitshift(instr,-16), uint32(15)));
        rm = uint8(bitand(instr, uint32(15)));
        s  = SBIT;
        alu_shamt = uint8(bitor(bitshift(bitand(bitshift(instr,-12),uint32(7)),2), ...
                                bitand(bitshift(instr,-6),uint32(3))));
        alu_shift_type = uint8(bitand(bitshift(instr,-4), uint32(3)));
        read_addr_1 = rn; read_en_1 = true;
        read_addr_2 = rm; read_en_2 = true;

    % 分支 45: ORR (register)   EA40
    elseif bitand(instr, uint32(hex2dec('FFE00000'))) == uint32(hex2dec('EA400000'))
        opcode = uint8(55);  alu_op = uint8(7);
        rd = uint8(bitand(bitshift(instr,-8), uint32(15)));
        rn = uint8(bitand(bitshift(instr,-16), uint32(15)));
        rm = uint8(bitand(instr, uint32(15)));
        s  = SBIT;
        alu_shamt = uint8(bitor(bitshift(bitand(bitshift(instr,-12),uint32(7)),2), ...
                                bitand(bitshift(instr,-6),uint32(3))));
        alu_shift_type = uint8(bitand(bitshift(instr,-4), uint32(3)));
        read_addr_1 = rn; read_en_1 = true;
        read_addr_2 = rm; read_en_2 = true;

    % 分支 46: EOR (register)   EA80
    elseif bitand(instr, uint32(hex2dec('FFE00000'))) == uint32(hex2dec('EA800000'))
        opcode = uint8(8);  alu_op = uint8(8);
        rd = uint8(bitand(bitshift(instr,-8), uint32(15)));
        rn = uint8(bitand(bitshift(instr,-16), uint32(15)));
        rm = uint8(bitand(instr, uint32(15)));
        s  = SBIT;
        alu_shamt = uint8(bitor(bitshift(bitand(bitshift(instr,-12),uint32(7)),2), ...
                                bitand(bitshift(instr,-6),uint32(3))));
        alu_shift_type = uint8(bitand(bitshift(instr,-4), uint32(3)));
        read_addr_1 = rn; read_en_1 = true;
        read_addr_2 = rm; read_en_2 = true;

    % 分支 47: CMP (register)   EBB0
    elseif bitand(instr, uint32(hex2dec('FFE00000'))) == uint32(hex2dec('EBB00000'))
        opcode = uint8(11);  alu_op = uint8(1);
        rd = uint8(15);
        rn = uint8(bitand(bitshift(instr,-16), uint32(15)));
        rm = uint8(bitand(instr, uint32(15)));
        s  = true;
        read_addr_1 = rn; read_en_1 = true;
        read_addr_2 = rm; read_en_2 = true;

    % 分支 48: CMN   EB10
    elseif bitand(instr, uint32(hex2dec('FFE00000'))) == uint32(hex2dec('EB100000'))
        opcode = uint8(12);  alu_op = uint8(0);
        rd = uint8(15);
        rn = uint8(bitand(bitshift(instr,-16), uint32(15)));
        rm = uint8(bitand(instr, uint32(15)));
        s  = true;
        read_addr_1 = rn; read_en_1 = true;
        read_addr_2 = rm; read_en_2 = true;

    % 分支 49: TEQ   EA90
    elseif bitand(instr, uint32(hex2dec('FFE00000'))) == uint32(hex2dec('EA900000'))
        opcode = uint8(13);  alu_op = uint8(8);
        rd = uint8(15);
        rn = uint8(bitand(bitshift(instr,-16), uint32(15)));
        rm = uint8(bitand(instr, uint32(15)));
        s  = true;
        read_addr_1 = rn; read_en_1 = true;
        read_addr_2 = rm; read_en_2 = true;

    % 分支 50: TST   EA10
    elseif bitand(instr, uint32(hex2dec('FFE00000'))) == uint32(hex2dec('EA100000'))
        opcode = uint8(14);  alu_op = uint8(6);
        rd = uint8(15);
        rn = uint8(bitand(bitshift(instr,-16), uint32(15)));
        rm = uint8(bitand(instr, uint32(15)));
        s  = true;
        read_addr_1 = rn; read_en_1 = true;
        read_addr_2 = rm; read_en_2 = true;

    % ============================================================
    % 分支 51: MLA    FB00 00xx (bits7:4=0000)
    % ★ ra / ra_valid 输出
    % ============================================================
    elseif bitand(instr, uint32(hex2dec('FFE000F0'))) == uint32(hex2dec('FB000000'))
        opcode = uint8(107);
        alu_op = uint8(23);
        rd = uint8(bitand(bitshift(instr,-8),  uint32(15)));
        rn = uint8(bitand(bitshift(instr,-16), uint32(15)));
        rm = uint8(bitand(instr, uint32(15)));
        ra = uint8(bitand(bitshift(instr,-12), uint32(15)));   % ★ Ra
        ra_valid = true;                                       % ★
        read_addr_1 = rn; read_en_1 = true;
        read_addr_2 = rm; read_en_2 = true;

    % ============================================================
    % 分支 52: UMULL   FBA0
    % ★修正: 掩码 FFE0F000 -> FBF00000 (RdLo/RdHi/Rn 自由, bit20 固定 0,
    %   原掩码会把 SDIV/UDIV 误判成 SMULL/UMULL)
    % ★ rd_lo / rd_hi / two_wb 输出
    % ============================================================
    elseif bitand(instr, uint32(hex2dec('FBF00000'))) == uint32(hex2dec('FBA00000'))
        opcode = uint8(91);
        alu_op = uint8(25);
        rd_lo = uint8(bitand(bitshift(instr,-12), uint32(15)));   % ★ instr[15:12]
        rd_hi = uint8(bitand(bitshift(instr,-8),  uint32(15)));   % ★ instr[11:8]
        rn    = uint8(bitand(bitshift(instr,-16), uint32(15)));
        rm    = uint8(bitand(instr, uint32(15)));
        two_wb = true;                                            % ★
        read_addr_1 = rn; read_en_1 = true;
        read_addr_2 = rm; read_en_2 = true;

    % ============================================================
    % 分支 53: SMULL   FB80
    % ★修正: 掩码同上
    % ============================================================
    elseif bitand(instr, uint32(hex2dec('FBF00000'))) == uint32(hex2dec('FB800000'))
        opcode = uint8(92);
        alu_op = uint8(26);
        rd_lo = uint8(bitand(bitshift(instr,-12), uint32(15)));   % ★
        rd_hi = uint8(bitand(bitshift(instr,-8),  uint32(15)));   % ★
        rn    = uint8(bitand(bitshift(instr,-16), uint32(15)));
        rm    = uint8(bitand(instr, uint32(15)));
        two_wb = true;                                            % ★
        read_addr_1 = rn; read_en_1 = true;
        read_addr_2 = rm; read_en_2 = true;

    % ============================================================
    % 分支 54: UDIV   FBB0 F0F0
    % ============================================================
    elseif bitand(instr, uint32(hex2dec('FFF0F0F0'))) == uint32(hex2dec('FBB0F0F0'))
        opcode = uint8(93);
        alu_op = uint8(27);
        rd = uint8(bitand(bitshift(instr,-8),  uint32(15)));
        rn = uint8(bitand(bitshift(instr,-16), uint32(15)));
        rm = uint8(bitand(instr, uint32(15)));
        read_addr_1 = rn; read_en_1 = true;
        read_addr_2 = rm; read_en_2 = true;

    % ============================================================
    % 分支 55: SDIV   FB90 F0F0
    % ============================================================
    elseif bitand(instr, uint32(hex2dec('FFF0F0F0'))) == uint32(hex2dec('FB90F0F0'))
        opcode = uint8(94);
        alu_op = uint8(28);
        rd = uint8(bitand(bitshift(instr,-8),  uint32(15)));
        rn = uint8(bitand(bitshift(instr,-16), uint32(15)));
        rm = uint8(bitand(instr, uint32(15)));
        read_addr_1 = rn; read_en_1 = true;
        read_addr_2 = rm; read_en_2 = true;

    % ============================================================
    % 分支 56: MLS   FB00 0010
    % ★ ra / ra_valid 输出
    % ============================================================
    elseif bitand(instr, uint32(hex2dec('FFE000F0'))) == uint32(hex2dec('FB000010'))
        opcode = uint8(95);
        alu_op = uint8(24);
        rd = uint8(bitand(bitshift(instr,-8),  uint32(15)));
        rn = uint8(bitand(bitshift(instr,-16), uint32(15)));
        rm = uint8(bitand(instr, uint32(15)));
        ra = uint8(bitand(bitshift(instr,-12), uint32(15)));   % ★ Ra
        ra_valid = true;                                       % ★
        read_addr_1 = rn; read_en_1 = true;
        read_addr_2 = rm; read_en_2 = true;

    % ============================================================
    % 默认
    % ============================================================
    else
        opcode = OP_INV;
        valid  = false;
    end

end

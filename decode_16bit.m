function [opcode, s, cond, valid, rd, rn, rm, ra, ra_valid, ...
          rd_lo, rd_hi, two_wb, imm24, imm32, ...
          read_addr_1, read_en_1, read_addr_2, read_en_2, ...
          alu_op, alu_src_b, alu_use_carry, alu_shamt, ...
          alu_shift_type, reg_list] = decode_16bit(instr)
% =========================================================
% Thumb 16-bit 指令译码
% =========================================================

    % ---------- localparam 常量 ----------
    OP_INV   = uint8(127);
    ALU_PASS = uint8(12);
    SH_LSL = uint8(0); SH_LSR = uint8(1);
    SH_ASR = uint8(2); SH_ROR = uint8(3);

    % ---------- 默认输出（对应 always @(*) 的初值段）----------
    opcode    = OP_INV;
    s         = false;
    cond      = uint8(14);
    valid     = true;
    rd        = uint8(0);
    rn        = uint8(0);
    rm        = uint8(0);
    ra        = uint8(0);
    ra_valid  = false;   % ★ 16 位恒 0
    rd_lo     = uint8(0);% ★ 16 位恒 0
    rd_hi     = uint8(0);% ★ 16 位恒 0
    two_wb    = false;   % ★ 16 位恒 0（16 位指令永远不双写）
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

    % ---------- 取 instr[15:0] ----------
    h = uint16(bitand(instr, uint32(65535)));

    % ============================================================
    % 分支 1: ADD_H  (0100 0100 ? ????? ???)
    % ============================================================
    if bitand(h, uint16(hex2dec('FF00'))) == uint16(hex2dec('4400'))
        opcode = uint8(88);
        rd     = uint8(bitand(bitshift(h,-4), uint16(8)) + bitand(h, uint16(7)));
        rn     = rd;
        rm     = uint8(bitand(bitshift(h,-3), uint16(7)));
        alu_op = uint8(0);
        read_addr_1 = rd; read_en_1 = true;
        read_addr_2 = rm; read_en_2 = true;

    % ============================================================
    % 分支 2: CMP_H_REG (0100 0101 ? ????? ???)
    % ============================================================
    elseif bitand(h, uint16(hex2dec('FF00'))) == uint16(hex2dec('4500'))
        opcode = uint8(85);
        rd     = uint8(15);
        rn     = uint8(bitand(bitshift(h,-4), uint16(8)) + bitand(h, uint16(7)));
        rm     = uint8(bitand(bitshift(h,-3), uint16(15)));
        s      = true;
        alu_op = uint8(1);
        read_addr_1 = rn; read_en_1 = true;
        read_addr_2 = rm; read_en_2 = true;

    % ============================================================
    % 分支 3: STRB_REG (0101 010 ??? ??? ???)
    % ============================================================
    elseif bitand(h, uint16(hex2dec('FE00'))) == uint16(hex2dec('5400'))
        opcode = uint8(73);
        rm     = uint8(bitand(bitshift(h,-6), uint16(7)));
        rn     = uint8(bitand(bitshift(h,-3), uint16(7)));
        rd     = uint8(bitand(h, uint16(7)));
        alu_op = uint8(0);
        read_addr_1 = rn; read_en_1 = true;
        read_addr_2 = rm; read_en_2 = true;

    % ============================================================
    % 分支 3b: LDRB_REG (0101 011 ??? ??? ???)
    % ★新增: 5c12 LDRB r2,[r2,r0] 原先落到 default
    % ============================================================
    elseif bitand(h, uint16(hex2dec('FE00'))) == uint16(hex2dec('5C00'))
        opcode = uint8(103);
        rm     = uint8(bitand(bitshift(h,-6), uint16(7)));
        rn     = uint8(bitand(bitshift(h,-3), uint16(7)));
        rd     = uint8(bitand(h, uint16(7)));
        alu_op = uint8(0);
        read_addr_1 = rn; read_en_1 = true;
        read_addr_2 = rm; read_en_2 = true;

    % ============================================================
    % 分支 3c: STRH_REG (0101 001 ??? ??? ???)
    % ★新增（dump 未出现，补全编码空间）
    % ============================================================
    elseif bitand(h, uint16(hex2dec('FE00'))) == uint16(hex2dec('5200'))
        opcode = uint8(63);
        rm     = uint8(bitand(bitshift(h,-6), uint16(7)));
        rn     = uint8(bitand(bitshift(h,-3), uint16(7)));
        rd     = uint8(bitand(h, uint16(7)));
        alu_op = uint8(0);
        read_addr_1 = rn; read_en_1 = true;
        read_addr_2 = rm; read_en_2 = true;

    % ============================================================
    % 分支 3d: LDRH_REG (0101 101 ??? ??? ???)
    % ★新增（dump 未出现，补全编码空间）
    % ============================================================
    elseif bitand(h, uint16(hex2dec('FE00'))) == uint16(hex2dec('5A00'))
        opcode = uint8(64);
        rm     = uint8(bitand(bitshift(h,-6), uint16(7)));
        rn     = uint8(bitand(bitshift(h,-3), uint16(7)));
        rd     = uint8(bitand(h, uint16(7)));
        alu_op = uint8(0);
        read_addr_1 = rn; read_en_1 = true;
        read_addr_2 = rm; read_en_2 = false;

    % ============================================================
    % 分支 4: LDM_T1 (1100 1 ??? ????????)
    % ============================================================
    elseif bitand(h, uint16(hex2dec('F800'))) == uint16(hex2dec('C800'))
        opcode = uint8(78);
        rn     = uint8(bitand(bitshift(h,-8), uint16(7)));
        rd     = rn;
        alu_op = ALU_PASS;
        reg_list = bitand(h, uint16(255));
        read_addr_1 = rn; read_en_1 = true;
        read_addr_2 = uint8(0); read_en_2 = false;

    % ============================================================
    % 分支 5: STM_T1 (1100 0 ??? ????????)
    % ============================================================
    elseif bitand(h, uint16(hex2dec('F800'))) == uint16(hex2dec('C000'))
        opcode = uint8(79);
        rn     = uint8(bitand(bitshift(h,-8), uint16(7)));
        rd     = rn;
        alu_op = ALU_PASS;
        reg_list = bitand(h, uint16(255));
        read_addr_1 = rn; read_en_1 = true;
        read_addr_2 = uint8(0); read_en_2 = false;

    % ============================================================
    % 分支 6: 16-bit DP register T1 (0100 00 ???? ??? ???)
    %   opcode[3:0] = instr[9:6]
    % ============================================================
    elseif bitand(h, uint16(hex2dec('FC00'))) == uint16(hex2dec('4000'))
        rd = uint8(bitand(h, uint16(7)));
        rn = rd;
        rm = uint8(bitand(bitshift(h,-3), uint16(7)));
        read_addr_1 = rd; read_en_1 = true;
        read_addr_2 = rm; read_en_2 = true;
        sub_op = uint8(bitand(bitshift(h,-6), uint16(15)));
        if sub_op == 0        % ANDS
            opcode = uint8(6);  alu_op = uint8(6);   s = true;
        elseif sub_op == 1    % EORS
            opcode = uint8(8);  alu_op = uint8(8);   s = true;
        elseif sub_op == 2    % LSLS
            opcode = uint8(16); alu_op = uint8(11);
            alu_shamt = uint8(bitand(bitshift(h,-3), uint16(7))); s = true;
        elseif sub_op == 3    % LSRS
            opcode = uint8(21); alu_op = uint8(13);  s = true;
        elseif sub_op == 4    % ASRS
            opcode = uint8(1);  alu_op = uint8(15);  s = true;
        elseif sub_op == 5    % ADCS
            opcode = uint8(2);  alu_op = uint8(2); alu_use_carry = true; s = true;
        elseif sub_op == 6    % SBCS
            opcode = uint8(3);  alu_op = uint8(3); alu_use_carry = true; s = true;
        elseif sub_op == 7    % RORS
            opcode = uint8(4);  alu_op = uint8(29);  s = true;
        elseif sub_op == 8    % TST
            opcode = uint8(14); alu_op = uint8(6); rd = uint8(15); s = true;
        elseif sub_op == 9
            % ★修正: 1001 = RSBS/NEGS: Rd = 0 - Rm（原误写 alu_op=4）
            opcode = uint8(109);        % RSBS 新编号，避开已占用的 4
            s      = true;              % RSBS 改标志
            alu_op = uint8(1);          % SUB：A − B = 0 − Rm
            rd     = uint8(bitand(h, uint16(7)));
            rm     = uint8(bitand(bitshift(h,-3), uint16(7)));
            read_en_1   = false;        % A 口不使能 → ex_data_1 = 0
            read_addr_1 = uint8(0);
            read_addr_2 = rm; read_en_2 = true;
        elseif sub_op == 10   % CMP
            opcode = uint8(57); alu_op = uint8(1); rd = uint8(15); s = true;
        elseif sub_op == 11   % CMN
            opcode = uint8(12); alu_op = uint8(0); rd = uint8(15); s = true;
        elseif sub_op == 12   % ORRS  ← 本案元凶
            opcode = uint8(7);  alu_op = uint8(7);   s = true;
        elseif sub_op == 13   % MULS
            opcode = uint8(5);  alu_op = uint8(5);   s = true;
        elseif sub_op == 14   % BICS
            opcode = uint8(9);  alu_op = uint8(9);   s = true;
        else                  % MVNS
            opcode = uint8(10); alu_op = uint8(10);  s = true;
        end

    % ============================================================
    % 分支 7: BIC/MVN (0100 0011 1x ??? ???)
    % ============================================================
    elseif bitand(h, uint16(hex2dec('FFC0'))) == uint16(hex2dec('43C0'))
        opcode = uint8(9);
        rd     = uint8(bitand(h, uint16(7)));
        rn     = rd;
        rm     = uint8(bitand(bitshift(h,-3), uint16(7)));
        alu_op = uint8(9);
        read_addr_1 = rd; read_en_1 = true;
        read_addr_2 = rm; read_en_2 = true;

    % ============================================================
    % 分支 8: CMP_REG (0100 0010 10 ??? ???)
    % ============================================================
    elseif bitand(h, uint16(hex2dec('FFC0'))) == uint16(hex2dec('4280'))
        opcode = uint8(57);
        rd     = uint8(15);
        rn     = uint8(bitand(h, uint16(7)));
        rm     = uint8(bitand(bitshift(h,-3), uint16(7)));
        s      = true;
        alu_op = uint8(1);
        read_addr_1 = rn; read_en_1 = true;
        read_addr_2 = rm; read_en_2 = true;

    % ============================================================
    % 分支 9: MOVS (0000 00 00 0 0 ??? ???)
    % ============================================================
    elseif bitand(h, uint16(hex2dec('FFC0'))) == uint16(hex2dec('0000'))
        opcode = uint8(19);
        rd     = uint8(bitand(h, uint16(7)));
        rm     = uint8(bitand(bitshift(h,-3), uint16(7)));
        alu_op = ALU_PASS;
        s      = true;
        read_addr_1 = rm; read_en_1 = true;

    % ============================================================
    % 分支 10: LSLS_I (00000 ????? ??? ???)
    % ============================================================
    elseif bitand(h, uint16(hex2dec('F800'))) == uint16(hex2dec('0000'))
        opcode = uint8(30);
        rd     = uint8(bitand(h, uint16(7)));
        rm     = uint8(bitand(bitshift(h,-3), uint16(7)));
        alu_op = uint8(11);
        alu_shamt = uint8(bitand(bitshift(h,-6), uint16(31)));
        alu_shift_type = SH_LSL;
        s      = true;
        read_addr_1 = rm; read_en_1 = true;

    % ============================================================
    % 分支 10b: ASRS_I (00010 ????? ??? ???)
    % ★新增: 10a1 ASRS r1,r0,#2 原先落到 default
    % ============================================================
    elseif bitand(h, uint16(hex2dec('F800'))) == uint16(hex2dec('1000'))
        opcode = uint8(1);
        rd     = uint8(bitand(h, uint16(7)));
        rm     = uint8(bitand(bitshift(h,-3), uint16(7)));
        alu_op = uint8(15);
        alu_shamt = uint8(bitand(bitshift(h,-6), uint16(31)));
        alu_shift_type = SH_ASR;
        s      = true;
        read_addr_1 = rm; read_en_1 = true;

    % ============================================================
    % 分支 11: MOV (0100 0110 ? ???? ???)
    % ============================================================
    elseif bitand(h, uint16(hex2dec('FF00'))) == uint16(hex2dec('4600'))
        opcode = uint8(18);
        rd     = uint8(bitand(bitshift(h,-4), uint16(8)) + bitand(h, uint16(7)));
        rm     = uint8(bitand(bitshift(h,-3), uint16(15)));
        alu_op = ALU_PASS;
        read_addr_1 = rm; read_en_1 = true;

    % ============================================================
    % 分支 12: MOVS_I (00100 ??? ????????)
    % ============================================================
    elseif bitand(h, uint16(hex2dec('F800'))) == uint16(hex2dec('2000'))
        opcode = uint8(20);
        rd     = uint8(bitand(bitshift(h,-8), uint16(7)));
        alu_op = ALU_PASS;
        alu_src_b = true;
        s      = true;
        imm32  = uint32(bitand(h, uint16(255)));

    % ============================================================
    % 分支 13: LSRS_I (00001 ????? ??? ???)
    % ============================================================
    elseif bitand(h, uint16(hex2dec('F800'))) == uint16(hex2dec('0800'))
        opcode = uint8(21);
        rd     = uint8(bitand(h, uint16(7)));
        rm     = uint8(bitand(bitshift(h,-3), uint16(7)));
        alu_op = uint8(13);
        alu_shamt = uint8(bitand(bitshift(h,-6), uint16(31)));
        alu_shift_type = SH_LSR;
        s      = true;
        read_addr_1 = rm; read_en_1 = true;

    % ============================================================
    % 分支 14: STR_I (01100 ????? ??? ???)
    % ============================================================
    elseif bitand(h, uint16(hex2dec('F800'))) == uint16(hex2dec('6000'))
        opcode = uint8(22);
        rn     = uint8(bitand(bitshift(h,-3), uint16(7)));
        rd     = uint8(bitand(h, uint16(7)));
        alu_op = uint8(0);
        alu_src_b = true;
        imm32  = uint32(bitand(bitshift(h,-6), uint16(31)));
        read_addr_1 = rn; read_en_1 = true;
        read_addr_2 = rd; read_en_2 = true;

    % ============================================================
    % 分支 15: STR_I SP (1001 0 ??? ????????)
    % ============================================================
    elseif bitand(h, uint16(hex2dec('F800'))) == uint16(hex2dec('9000'))
        opcode = uint8(22);
        rn     = uint8(13);
        rd     = uint8(bitand(bitshift(h,-8), uint16(7)));
        alu_op = uint8(0);
        alu_src_b = true;
        imm32  = bitshift(uint32(bitand(h, uint16(255))), 2);
        read_addr_1 = uint8(13); read_en_1 = true;
        read_addr_2 = rd;        read_en_2 = true;

    % ============================================================
    % 分支 16: LDR_I_16 SP (1001 1 ??? ????????)
    % ============================================================
    elseif bitand(h, uint16(hex2dec('F800'))) == uint16(hex2dec('9800'))
        opcode = uint8(49);
        rn     = uint8(13);
        rd     = uint8(bitand(bitshift(h,-8), uint16(7)));
        alu_op = uint8(0);
        alu_src_b = true;
        imm32  = bitshift(uint32(bitand(h, uint16(255))), 2);
        read_addr_1 = uint8(13); read_en_1 = true;
        read_addr_2 = uint8(0);  read_en_2 = false;

    % ============================================================
    % 分支 17: LDR_I_16 (0110 1 ????? ??? ???)
    % ============================================================
    elseif bitand(h, uint16(hex2dec('F800'))) == uint16(hex2dec('6800'))
        opcode = uint8(49);
        rn     = uint8(bitand(bitshift(h,-3), uint16(7)));
        rd     = uint8(bitand(h, uint16(7)));
        alu_op = uint8(0);
        alu_src_b = true;
        imm32  = bitshift(uint32(bitand(bitshift(h,-6), uint16(31))), 2);
        read_addr_1 = rn; read_en_1 = true;

    % ============================================================
    % 分支 17b: STRB_I (0111 0 ??? ????? ???)
    % ============================================================
    elseif bitand(h, uint16(hex2dec('F800'))) == uint16(hex2dec('7000'))
        opcode = uint8(102);
        rn = uint8(bitand(bitshift(h,-3), uint16(7)));
        rd = uint8(bitand(h, uint16(7)));
        alu_op = uint8(0); alu_src_b = true;
        imm32 = uint32(bitand(bitshift(h,-6), uint16(31)));
        read_addr_1 = rn; read_en_1 = true;
        read_addr_2 = rd; read_en_2 = true;

    % ============================================================
    % 分支 17c: LDRB_I (0111 1 ??? ????? ???)
    % ============================================================
    elseif bitand(h, uint16(hex2dec('F800'))) == uint16(hex2dec('7800'))
        opcode = uint8(103);
        rn = uint8(bitand(bitshift(h,-3), uint16(7)));
        rd = uint8(bitand(h, uint16(7)));
        alu_op = uint8(0); alu_src_b = true;
        imm32 = uint32(bitand(bitshift(h,-6), uint16(31)));
        read_addr_1 = rn; read_en_1 = true;

    % ============================================================
    % 分支 18: STRH_I (1000 0 ????? ??? ???)
    % ============================================================
    elseif bitand(h, uint16(hex2dec('F800'))) == uint16(hex2dec('8000'))
        opcode = uint8(63);
        rn     = uint8(bitand(bitshift(h,-3), uint16(7)));
        rd     = uint8(bitand(h, uint16(7)));
        alu_op = uint8(0);
        alu_src_b = true;
        imm32  = uint32(bitand(bitshift(h,-6), uint16(31)));
        read_addr_1 = rn; read_en_1 = true;
        read_addr_2 = rd; read_en_2 = true;

    % ============================================================
    % 分支 19: LDRH_I (1000 1 ????? ??? ???)
    % ============================================================
    elseif bitand(h, uint16(hex2dec('F800'))) == uint16(hex2dec('8800'))
        opcode = uint8(64);
        rn     = uint8(bitand(bitshift(h,-3), uint16(7)));
        rd     = uint8(bitand(h, uint16(7)));
        alu_op = uint8(0);
        alu_src_b = true;
        imm32  = uint32(bitand(bitshift(h,-6), uint16(31)));
        read_addr_1 = rn; read_en_1 = true;

    % ============================================================
    % 分支 20: LDR_LIT (0100 1 ??? ????????)
    % ============================================================
    elseif bitand(h, uint16(hex2dec('F800'))) == uint16(hex2dec('4800'))
        opcode = uint8(58);
        rn     = uint8(15);
        rd     = uint8(bitand(bitshift(h,-8), uint16(7)));
        alu_op = uint8(0);
        alu_src_b = true;
        imm32  = bitshift(uint32(bitand(h, uint16(255))), 2);
        read_addr_1 = uint8(15); read_en_1 = false;
        read_addr_2 = uint8(0);  read_en_2 = false;

    % ============================================================
    % 分支 21: B (11100 ???????????)
    % ============================================================
    elseif bitand(h, uint16(hex2dec('F800'))) == uint16(hex2dec('E000'))
        opcode = uint8(23);
        alu_op = ALU_PASS;
        imm24  = uint32(bitand(h, uint16(hex2dec('07FF'))));

    % ============================================================
    % 分支 22: ADR_16 (1010 0 ??? ????????)
    % ============================================================
    elseif bitand(h, uint16(hex2dec('F800'))) == uint16(hex2dec('A000'))
        opcode = uint8(84);
        rn     = uint8(15);
        rd     = uint8(bitand(bitshift(h,-8), uint16(7)));
        alu_op = uint8(0);
        alu_src_b = true;
        imm32  = bitshift(uint32(bitand(h, uint16(255))), 2);
        read_addr_1 = uint8(15); read_en_1 = false;
        read_addr_2 = uint8(0);  read_en_2 = false;

    % ============================================================
    % 分支 23: BEQ (1101 0000 ????????)
    % ============================================================
    elseif bitand(h, uint16(hex2dec('FF00'))) == uint16(hex2dec('D000'))
        opcode = uint8(24); cond = uint8(0);
        alu_op = ALU_PASS;
        imm24  = uint32(bitand(h, uint16(255)));

    % ============================================================
    % 分支 24: BNE (1101 0001 ????????)
    % ============================================================
    elseif bitand(h, uint16(hex2dec('FF00'))) == uint16(hex2dec('D100'))
        opcode = uint8(27); cond = uint8(1);
        alu_op = ALU_PASS;
        imm24  = uint32(bitand(h, uint16(255)));

    % ============================================================
    % 分支 25: BHI (1101 1000 ????????)
    % ============================================================
    elseif bitand(h, uint16(hex2dec('FF00'))) == uint16(hex2dec('D800'))
        opcode = uint8(82); cond = uint8(8);
        alu_op = ALU_PASS;
        imm24  = uint32(bitand(h, uint16(255)));

    % ============================================================
    % 分支 26: BLT (1101 1011 ????????)
    % ============================================================
    elseif bitand(h, uint16(hex2dec('FF00'))) == uint16(hex2dec('DB00'))
        opcode = uint8(59); cond = uint8(11);
        alu_op = ALU_PASS;
        imm24  = uint32(bitand(h, uint16(255)));

    % ============================================================
    % 分支 27: BLE (1101 1101 ????????)
    % ============================================================
    elseif bitand(h, uint16(hex2dec('FF00'))) == uint16(hex2dec('DD00'))
        opcode = uint8(65); cond = uint8(13);
        alu_op = ALU_PASS;
        imm24  = uint32(bitand(h, uint16(255)));

    % ============================================================
    % 分支 28: BGE (1101 1010 ????????)  imm8 << 1
    % ============================================================
    elseif bitand(h, uint16(hex2dec('FF00'))) == uint16(hex2dec('DA00'))
        opcode = uint8(89); cond = uint8(10);
        alu_op = ALU_PASS;
        imm24  = bitshift(uint32(bitand(h, uint16(255))), 1);

    % ============================================================
    % 分支 29: B_COND_W 兜底 (1101 ???? ????????)
    % ============================================================
    elseif bitand(h, uint16(hex2dec('F000'))) == uint16(hex2dec('D000'))
        opcode = uint8(71);
        cond   = uint8(bitand(bitshift(h,-8), uint16(15)));
        alu_op = ALU_PASS;
        imm24  = uint32(bitand(h, uint16(255)));

    % ============================================================
    % 分支 30: SUBS_REG (0001 101 ??? ??? ???)
    % ============================================================
    elseif bitand(h, uint16(hex2dec('FE00'))) == uint16(hex2dec('1A00'))
        opcode = uint8(83);
        rd     = uint8(bitand(h, uint16(7)));
        rn     = uint8(bitand(bitshift(h,-3), uint16(7)));
        rm     = uint8(bitand(bitshift(h,-6), uint16(7)));
        s      = true;
        alu_op = uint8(1);
        read_addr_1 = rn; read_en_1 = true;
        read_addr_2 = rm; read_en_2 = true;

    % ============================================================
    % 分支 31: CBZ (1011 0 0 ? 1 ????? ???)
    % ============================================================
    elseif bitand(h, uint16(hex2dec('FD00'))) == uint16(hex2dec('B100'))
        opcode = uint8(25);
        rn     = uint8(bitand(h, uint16(7)));
        alu_op = ALU_PASS;
        imm24  = bitor(bitshift(uint32(bitand(bitshift(h,-9), uint16(1))), 6), ...
                       bitshift(uint32(bitand(bitshift(h,-3), uint16(31))), 1));
        read_addr_1 = rn; read_en_1 = true;

    % ============================================================
    % 分支 32: CBNZ (1011 1 0 ? 1 ????? ???)
    % ============================================================
    elseif bitand(h, uint16(hex2dec('FD00'))) == uint16(hex2dec('B900'))
        opcode = uint8(66);
        rn     = uint8(bitand(h, uint16(7)));
        alu_op = ALU_PASS;
        imm24  = bitor(bitshift(uint32(bitand(bitshift(h,-9), uint16(1))), 6), ...
                       bitshift(uint32(bitand(bitshift(h,-3), uint16(31))), 1));
        read_addr_1 = rn; read_en_1 = true;

    % ============================================================
    % 分支 33: CMP_I (00101 ??? ????????)
    % ============================================================
    elseif bitand(h, uint16(hex2dec('F800'))) == uint16(hex2dec('2800'))
        opcode = uint8(26);
        rd     = uint8(15);
        rn     = uint8(bitand(bitshift(h,-8), uint16(7)));
        s      = true;
        alu_op = uint8(1);
        alu_src_b = true;
        imm32  = uint32(bitand(h, uint16(255)));
        read_addr_1 = rn; read_en_1 = true;

    % ============================================================
    % 分支 34: ADDS (0001 100 ??? ??? ???)
    % ============================================================
    elseif bitand(h, uint16(hex2dec('FE00'))) == uint16(hex2dec('1800'))
        opcode = uint8(53);
        rd     = uint8(bitand(h, uint16(7)));
        rn     = uint8(bitand(bitshift(h,-3), uint16(7)));
        rm     = uint8(bitand(bitshift(h,-6), uint16(7)));
        s      = true;
        alu_op = uint8(0);
        read_addr_1 = rn; read_en_1 = true;
        read_addr_2 = rm; read_en_2 = true;

    % ============================================================
    % 分支 35: ADDS_I (0011 0 ??? ????????)  imm8
    % ============================================================
    elseif bitand(h, uint16(hex2dec('F800'))) == uint16(hex2dec('3000'))
        opcode = uint8(28);
        rd     = uint8(bitand(bitshift(h,-8), uint16(7)));
        rn     = rd;
        s      = true;
        alu_op = uint8(0);
        alu_src_b = true;
        imm32  = uint32(bitand(h, uint16(255)));
        read_addr_1 = rd; read_en_1 = true;

    % ============================================================
    % 分支 36: ADDS_I (0001 110 ??? ??? ???)  imm3
    % ============================================================
    elseif bitand(h, uint16(hex2dec('FE00'))) == uint16(hex2dec('1C00'))
        opcode = uint8(28);
        rd     = uint8(bitand(h, uint16(7)));
        rn     = uint8(bitand(bitshift(h,-3), uint16(7)));
        s      = true;
        alu_op = uint8(0);
        alu_src_b = true;
        imm32  = uint32(bitand(bitshift(h,-6), uint16(7)));
        read_addr_1 = rn; read_en_1 = true;

    % ============================================================
    % 分支 37: SUBS_I (0011 1 ??? ????????)  imm8
    % ============================================================
    elseif bitand(h, uint16(hex2dec('F800'))) == uint16(hex2dec('3800'))
        opcode = uint8(42);
        rd     = uint8(bitand(bitshift(h,-8), uint16(7)));
        rn     = rd;
        s      = true;
        alu_op = uint8(1);
        alu_src_b = true;
        imm32  = uint32(bitand(h, uint16(255)));
        read_addr_1 = rd; read_en_1 = true;

    % ============================================================
    % 分支 38: SUBS_I imm3 形式 (0001 111 ??? ??? ???)
    % ============================================================
    elseif bitand(h, uint16(hex2dec('FE00'))) == uint16(hex2dec('1E00'))
        opcode = uint8(83);
        rd     = uint8(bitand(h, uint16(7)));
        rn     = uint8(bitand(bitshift(h,-3), uint16(7)));
        s      = true;
        alu_op = uint8(1);
        alu_src_b = true;
        imm32  = uint32(bitand(bitshift(h,-6), uint16(7)));
        read_addr_1 = rn; read_en_1 = true;

    % ============================================================
    % 分支 39: UXTB (1011 0010 11 ??? ???)
    % ============================================================
    elseif bitand(h, uint16(hex2dec('FFC0'))) == uint16(hex2dec('B2C0'))
        opcode = uint8(29);
        rd     = uint8(bitand(h, uint16(7)));
        rm     = uint8(bitand(bitshift(h,-3), uint16(7)));
        alu_op = uint8(14);
        read_addr_1 = rm; read_en_1 = true;

    % ============================================================
    % 分支 39b: SXTH  (1011 0010 00 ?? ??? ???)
    % ============================================================
    elseif bitand(h, uint16(hex2dec('FFC0'))) == uint16(hex2dec('B200'))
        opcode = uint8(96);
        rd = uint8(bitand(h, uint16(7)));
        rm = uint8(bitand(bitshift(h,-3), uint16(7)));
        alu_op = uint8(16);
        read_addr_1 = rm; read_en_1 = true;

    % ============================================================
    % 分支 39c: SXTB  (1011 0010 01 ?? ??? ???)
    % ============================================================
    elseif bitand(h, uint16(hex2dec('FFC0'))) == uint16(hex2dec('B240'))
        opcode = uint8(97);
        rd = uint8(bitand(h, uint16(7)));
        rm = uint8(bitand(bitshift(h,-3), uint16(7)));
        alu_op = uint8(17);
        read_addr_1 = rm; read_en_1 = true;

    % ============================================================
    % 分支 39d: UXTH  (1011 0010 10 ?? ??? ???)
    % ============================================================
    elseif bitand(h, uint16(hex2dec('FFC0'))) == uint16(hex2dec('B280'))
        opcode = uint8(98);
        rd = uint8(bitand(h, uint16(7)));
        rm = uint8(bitand(bitshift(h,-3), uint16(7)));
        alu_op = uint8(18);
        read_addr_1 = rm; read_en_1 = true;

    % ============================================================
    % 分支 39e: REV  (1011 1010 00 ?? ??? ???)
    % ============================================================
    elseif bitand(h, uint16(hex2dec('FFC0'))) == uint16(hex2dec('BA00'))
        opcode = uint8(99);
        rd = uint8(bitand(h, uint16(7)));
        rm = uint8(bitand(bitshift(h,-3), uint16(7)));
        alu_op = uint8(19);
        read_addr_1 = rm; read_en_1 = true;

    % ============================================================
    % 分支 39f: REV16  (1011 1010 01 ?? ??? ???)
    % ============================================================
    elseif bitand(h, uint16(hex2dec('FFC0'))) == uint16(hex2dec('BA40'))
        opcode = uint8(100);
        rd = uint8(bitand(h, uint16(7)));
        rm = uint8(bitand(bitshift(h,-3), uint16(7)));
        alu_op = uint8(20);
        read_addr_1 = rm; read_en_1 = true;

    % ============================================================
    % 分支 39g: REVSH  (1011 1010 11 ?? ??? ???)
    % ============================================================
    elseif bitand(h, uint16(hex2dec('FFC0'))) == uint16(hex2dec('BAC0'))
        opcode = uint8(101);
        rd = uint8(bitand(h, uint16(7)));
        rm = uint8(bitand(bitshift(h,-3), uint16(7)));
        alu_op = uint8(21);
        read_addr_1 = rm; read_en_1 = true;

    % ============================================================
    % 分支 40: NOP (1011 1111 0000 0000)
    % ============================================================
    elseif h == uint16(hex2dec('BF00'))
        opcode = uint8(35);
        alu_op = ALU_PASS;

    % ============================================================
    % 分支 41: INV (1011 1111 1111 ????)
    % ============================================================
    elseif bitand(h, uint16(hex2dec('FFF0'))) == uint16(hex2dec('BFF0'))
        opcode = OP_INV;
        valid  = false;

    % ============================================================
    % 分支 42: IT (1011 1111 ???? ????)
    % ============================================================
    elseif bitand(h, uint16(hex2dec('FF00'))) == uint16(hex2dec('BF00'))
        opcode = uint8(67);
        cond   = uint8(bitand(bitshift(h,-4), uint16(15)));
        alu_op = ALU_PASS;

    % ============================================================
    % 分支 43: PUSH (1011 010 ? ????????)
    % ============================================================
    elseif bitand(h, uint16(hex2dec('FE00'))) == uint16(hex2dec('B400'))
        opcode = uint8(37);
        rn     = uint8(13);
        rd     = uint8(13);
        alu_op = ALU_PASS;
        reg_list = bitand(h, uint16(255));
        if bitget(h, 9)
            reg_list = bitor(reg_list, uint16(hex2dec('4000')));
        end
        read_addr_1 = uint8(13); read_en_1 = true;
        read_addr_2 = uint8(0);  read_en_2 = false;

    % ============================================================
    % 分支 44: POP (1011 110 ? ????????)
    % ============================================================
    elseif bitand(h, uint16(hex2dec('FE00'))) == uint16(hex2dec('BC00'))
        opcode = uint8(39);
        rn     = uint8(13);
        rd     = uint8(13);
        alu_op = ALU_PASS;
        reg_list = bitand(h, uint16(255));
        if bitget(h, 9)
            reg_list = bitor(reg_list, uint16(hex2dec('8000')));
        end
        read_addr_1 = uint8(13); read_en_1 = true;
        read_addr_2 = uint8(0);  read_en_2 = false;

    % ============================================================
    % 分支 45: ADD_SP (1010 1 ??? ????????)
    % ============================================================
    elseif bitand(h, uint16(hex2dec('F800'))) == uint16(hex2dec('A800'))
        opcode = uint8(43);
        rd     = uint8(bitand(bitshift(h,-8), uint16(7)));
        rn     = uint8(13);
        alu_op = uint8(0);
        alu_src_b = true;
        imm32  = bitshift(uint32(bitand(h, uint16(255))), 2);
        read_addr_1 = uint8(13); read_en_1 = true;

    % ============================================================
    % 分支 46: ADD_SP_16 (1011 0000 0 ???????)
    % ============================================================
    elseif bitand(h, uint16(hex2dec('FF80'))) == uint16(hex2dec('B000'))
        opcode = uint8(60);
        rn     = uint8(13); rd = uint8(13);
        alu_op = uint8(0);
        alu_src_b = true;
        imm32  = bitshift(uint32(bitand(h, uint16(127))), 2);
        read_addr_1 = uint8(13); read_en_1 = true;

    % ============================================================
    % 分支 47: SUB_SP (1011 0000 1 ???????)
    % ============================================================
    elseif bitand(h, uint16(hex2dec('FF80'))) == uint16(hex2dec('B080'))
        opcode = uint8(61);
        rn     = uint8(13); rd = uint8(13);
        alu_op = uint8(1);
        alu_src_b = true;
        imm32  = bitshift(uint32(bitand(h, uint16(127))), 2);
        read_addr_1 = uint8(13); read_en_1 = true;

    % ============================================================
    % 分支 48: BX (0100 0111 0 ???? 000)
    % ============================================================
    elseif bitand(h, uint16(hex2dec('FF87'))) == uint16(hex2dec('4700'))
        opcode = uint8(51);
        rm     = uint8(bitand(bitshift(h,-3), uint16(15)));
        alu_op = ALU_PASS;
        read_addr_1 = rm; read_en_1 = true;

    % ============================================================
    % 默认: 未识别
    % ============================================================
    else
        opcode = OP_INV;
        valid  = false;
    end

end

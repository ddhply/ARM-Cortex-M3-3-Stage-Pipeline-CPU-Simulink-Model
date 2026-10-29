function y = ThumbExpandImm(imm12_in)
% ThumbExpandImm: 对应 ARM Thumb-2 的立即数扩展
% 输入: 12 位立即数 (uint32)
% 输出: 扩展后的 32 位立即数 (uint32)

    imm12_in = uint32(imm12_in);

    % ★ 关键：先给输出赋默认值，避免 "not assigned on some execution paths"
    y = uint32(0);

    top2 = bitand(bitshift(imm12_in, -10), uint32(3));

    if top2 == 0
        sel  = bitand(bitshift(imm12_in, -8), uint32(3));
        low8 = bitand(imm12_in, uint32(255));
        if sel == 0
            y = low8;
        elseif sel == 1
            y = bitor(bitshift(low8, 16), low8);
        elseif sel == 2
            y = bitor(bitshift(low8, 24), bitshift(low8, 8));
        else
            y = bitor(bitor(bitshift(low8, 24), bitshift(low8, 16)), ...
                      bitor(bitshift(low8,  8), low8));
        end
    else
        unrotated = bitor(bitshift(uint32(1), 7), bitand(imm12_in, uint32(127)));
        rot = bitand(bitshift(imm12_in, -7), uint32(31));
        if rot == 0
            y = unrotated;
        else
            y = bitor(bitshift(unrotated, -double(rot)), ...
                      bitshift(unrotated, 32 - double(rot)));
        end
    end
end
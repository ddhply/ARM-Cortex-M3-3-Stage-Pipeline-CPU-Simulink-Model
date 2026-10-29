function y = it_count_of_mask(mask)
    mask = uint8(mask);
    if bitand(mask, uint8(1)) ~= 0,     y = uint8(4);
    elseif bitand(mask, uint8(2)) ~= 0, y = uint8(3);
    elseif bitand(mask, uint8(4)) ~= 0, y = uint8(2);
    else,                                y = uint8(1);
    end
end
function [y, slope] = groundHeight(x)

max(x(1))


if x >= 0 && x <= 3.0756
    y = 1 + sin(x+pi());
% else
%     y = 0.5 + sin(x+pi());
end


slope = cos(x + pi());

end
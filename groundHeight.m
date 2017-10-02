function [y, slope] = groundHeight(x)

% max(x(1))


y = x;

for i = 1:size(x,2)
    if(x(i) > -1 && x(i) < 0.5)
        y(i) = 2;
    elseif (x(i) > 0.5 && x(i) < 3)
        y(i) = -2;
    elseif (x(i) > 3 && x(i) < 6.5)
        y(i) = -6.9;        
    else
        y(i) = -5;
    end
    
    if (rem(x(i), 1) == 0)
        slope = inf;
    else
        slope = eps;
    end
end


end
function [y, slope] = groundHeight(x)

P = Set_Parameters();
% max(x(1))

% Make y the same size as x
y = x;
% Compute widths and heights of stairs
hs = stairs(P);
numIntervals = size(hs, 1);
bounds = zeros(numIntervals, 4);
for i = 1:numIntervals
    bounds(1, :) = [ hs(1) hs(2) ]; 
end

for i = 1:size(x,2)
    if(x(i) > -2 && x(i) < 0.5)
        y(i) = 5;
    elseif (x(i) > 0.5 && x(i) < 3)
        y(i) = -2;
    elseif (x(i) > 3 && x(i) < 6.5)
        y(i) = -6.9;        
    else
        y(i) = -5;
    end
    
    if (rem(x(i), 1) == 0)
        slope = NaN;
    else
        slope = eps;
    end
end



end

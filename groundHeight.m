function [y, slope] = groundHeight(x)

% max(x(1))


y = x;

for i = 1:size(x,2)
    if(x(i) > -1 && x(i) < 0.5)
        y(i) = 1;
    elseif (x(i) > 0.5 && x(i) < 1)
        y(i) = 0.75;
    elseif (x(i) > 1 && x(i) < 1.5)
        y(i) = 0.5;    
    elseif (x(i) > 1.5 && x(i) < 2)
        y(i) = 0.25;
    else
        y(i) = 1;
    end
    
    if (rem(x(i), 1) == 0)
        slope = inf;
    else
        slope = eps;
    end
end


% 
% if x >= 0 && x <= 3.0756
%     y = 1 + sin(x+pi());
% % else
% %     y = 0.5 + sin(x+pi());
% end

% slope = eps;
% slope = cos(x + pi());

end
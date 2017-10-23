function [y, slope] = groundHeight(x)

% Get parameters and initial conditions
P = Set_Parameters();
Pos_X = P.initCond(1);
Pos_Y = P.initCond(2);

% Make y the same size as x
y = zeros(size(x));

% Compute widths and heights of stairs
stairs = computeStairs(P);
numIntervals = size(stairs, 1);
bounds = zeros(numIntervals+1, 3);

bounds(1, :) = [ Pos_X-1 Pos_X+0.5 Pos_Y ];
lastWidth = Pos_X + 0.5;
lastHeight = Pos_Y;

for i = 1:numIntervals
    newWidth = lastWidth+stairs(i,1);
    newHeight = lastHeight-stairs(i,2);
    bounds(i+1, :) = [ lastWidth newWidth newHeight ]; 
    lastWidth = newWidth;
    lastHeight = newHeight;
end

% Get the height for the given x
for i = 1:size(x,2)
    % See which interval it falls between and set the height equal to its
    % computed height
    for j = 1:size(bounds,1)
        lowerX = bounds(j, 1);
        upperX = bounds(j, 2);
        if((x(i) > lowerX && x(i) < upperX) || j == size(bounds,1))
            y(i) = bounds(j, 3);
            break;
        end
    end
end
    
    % If the surface is flat, the slope is 0
    if (rem(x(i), 1) == 0)
        slope = NaN;
    % If the surface is vertical, the slope is undefined
    else
        slope = eps;
    end
end


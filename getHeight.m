function [height] = getHeight(vi, P, t)

a = P.gravity;
height = vi*t + 0.5*a*t^2;

end
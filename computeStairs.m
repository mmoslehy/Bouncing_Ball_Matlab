% Returns a struct with [width height]
function [ heights ] = computeStairs(P)

% Rhythm sequence to map the trajectory to
seq = P.seq;
% Initial conditions at the beginning of the trajectory
Vel_X = P.initCond(3);
Vel_Y = P.initCond(4);

% Size of sequence (how many stairs)
N = size(seq,2);

heights = zeros(N, 2);

for n = 1:N

    time = seq(n) * P.intervalTime;
    width = Vel_X * time;
    height = getHeight(Vel_Y, P, time);
    heights(n, :) = [width, height];
    Vel_Y = Vel_Y + P.gravity * time;
    
end

end
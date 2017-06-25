function createTerrain
figure
x = [];
y = [];
hPlot = plot(NaN,NaN,'o');
hold on
hPlot2 = plot(NaN,NaN,'k','LineWidth',2);
hold off
axis equal
axis([0 5 0 3])
title('Click points to create terrain. Press ENTER to finish.')
while true
    [xP,yP] = ginput(1);
    if isempty(xP)
        break
    end
    x = [x;xP];
    y = [y;yP];
    hPlot.XData = x;
    hPlot.YData = y;
    
    if length(x) > 1
        x2 = linspace(min(x),max(x),100);
        pp = interp1(x,y,'pchip','pp');
        y2 = ppval(pp,x2);
    else
        x2 = x;
        y2 = y;
    end
    hPlot2.XData = x2;
    hPlot2.YData = y2;
end
[x,sI] = sort(x);
y = y(sI);
x = [x(1)-1;x;x(end)+1];
y = [y(1);y;y(end)];
x2 = linspace(x(1),x(end),100);
pp = interp1(x,y,'pchip','pp');
y2 = ppval(pp,x2);
hPlot2.XData = x2;
hPlot2.YData = y2;

% Calculate derivative
coeff = arrayfun(@(x)polyder(pp.coefs(x,:)),2:size(pp.coefs,1)-1,'UniformOutput',false);
coeff = vertcat(coeff{:});
ppD = mkpp(pp.breaks,[0 0 0;coeff;0 0 0]);

save ppData pp ppD
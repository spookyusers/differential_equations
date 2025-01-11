function phasePortrait244(F, G, xmin, xmax, ymin, ymax, tmin, tmax, x0, y0)
% function phasePortrait244(F, G, xmin, xmax, ymin, ymax, tmin, tmax, x0, y0)
% 
% This function draws a 2 dimensional phase portrait for the system dx/dt =
% F(x,y) and dy/dt = G(x,y). The phase portrait will be draw with x bounds
% xmin <= x <= xmax and ymin <= y <= ymax. It is assumed that the initial 
% conditions x0 and y0 are at $t=0$, with tmin <= 0 and tmax >=0. x0 and y0
% can be inputted as vectors that are the same length, and a sample curve
% will be drawn for each of them. The black dot will always be plotted at tmin. 

DE = @(t,x) [F(x(1), x(2));G(x(1), x(2))];

figure;
% clf;

if length(x0) ~= length(y0)
    disp('Initial Conditions not the same length. Filling in missing entries with zero.');
    for lnd = length(x0)+1:length(y0)
        x0(lnd) = 0;
    end
    for lnd = length(y0)+1:length(x0)
        y0(lnd) = 0;
    end
end

hold on;

for ind = 1:length(x0)
    if tmin < 0
        [tl, xl] = ode45(DE, [0, tmin], [x0(ind); y0(ind)]);
        xl(:,1) = flip(xl(:, 1));
        xl(:,2) = flip(xl(:, 2));
        tl = flip(tl);
    else
        xl = [x0(ind), y0(ind)];
        tl = 0;
    end
    
    if tmax > 0
        [tr, xr] = ode45(DE, [0, tmax], [x0(ind); y0(ind)]);
    else
        xr = [x0(ind), y0(ind)];
        tr = 0;
    end
    
    tC = [tl; tr];
    xC = [xl; xr];
    
    plot(xC(:,1), xC(:,2), 'LineWidth', 2);
    plot(xC(1, 1), xC(1,2), 'k.', 'MarkerSize', 10);
end

hold off;

axis([xmin, xmax, ymin, ymax]);
xlabel('x');
ylabel('y');
title('Phase Portrait');
end
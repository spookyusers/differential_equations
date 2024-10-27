%% Plot x, y, and x, f(x)
xPts = [1,2,3,4,5];
fx = @(x) x.^2 + 2;
yPts = [2,3,2,3,1];

figure(1);
plot(xPts,yPts);
figure(2);
plot(xPts,fx(xPts));

%% Create x points with linspace and plot 2 functions on x
xPts = linspace(1,5,100);
fx = @(x) x.^2 +2;
gx = @(x) x.^2 - 3*x + 7;
figure(1);
hold on;
plot(xPts, fx(xPts));
plot(xPts, gx(xPts));
hold off;

%% Plot cos
xPts = linspace(0, 2*pi, 100);
plot(xPts, cos(xPts));
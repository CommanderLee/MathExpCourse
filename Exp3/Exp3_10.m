% Exp3.10, Page 65. Li Zhen, March 25th, 2014.

% Original data set
X = [0 3 5 7 9 11 12 13 14 15];
Y1 = [0 1.8 2.2 2.7 3.0 3.1 2.9 2.5 2.0 1.6];
Y2 = [0 1.2 1.7 2.0 2.1 2.0 1.8 1.2 1.0 1.6];

% Interpolate points
xi = 0:0.1:15;

% Linear interpolation
y1_L = interp1(X, Y1, xi);
y2_L = interp1(X, Y2, xi);

% Cubic spline interpolation
y1_S = spline(X, Y1, xi);
y2_S = spline(X, Y2, xi);

% Plot the graph of two interpolation methods
subplot(2, 1, 1);
plot(xi, y1_L, 'b', xi, y2_L, 'b');
title('Linear interpolation');

subplot(2, 1, 2);
plot(xi, y1_S, 'r', xi, y2_S, 'r');
title('Cubic spline interpolation');

% Trapezoidal integration of two interpolation methods
T_L = trapz(xi, y1_L - y2_L);
T_S = trapz(xi, y1_S - y2_S);

% Output the results
fprintf('\nInterpolation results:\nxi   y1_L   y2_L   y1_S   y2_S\n');
[xi' y1_L' y2_L' y1_S' y2_S']

fprintf('Wing area of two interpolation methods:\n');
fprintf('    Linear:%f,    Spline:%f\n', T_L, T_S);


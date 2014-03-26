% Exp3.12, Page 66. Li Zhen, March 26th, 2014.

% Original data set
X = [0 2 4 5 6 7 8 9 10.5 11.5 12.5 14 16 17 18 19 20 21 22 23 24];
X = X .* 60;    % convert (hour) into (minute)
Y = [2 2 0 2 5 8 25 12 5 10 12 7 9 28 22 10 9 11 8 9 3];

% Interpolate points
xi = 0:(24 * 60);

% Linear interpolation
y_L = interp1(X, Y, xi);

% Cubic spline interpolation
y_S = spline(X, Y, xi);

% Plot the graph of two interpolation methods
subplot(2, 1, 1);
plot(xi, y_L, 'b');
title('Linear interpolation');

subplot(2, 1, 2);
plot(xi, y_S, 'r');
title('Cubic spline interpolation');

% Trapezoidal integration of two interpolation methods
T_L = trapz(xi, y_L);
T_S = trapz(xi, y_S);

% Output the results
fprintf('\nInterpolation results:\nxi   y_L   y_S\n');
[xi' y_L' y_S']

fprintf('Estimated traffic flow on the bridge in one day:\n');
fprintf('    Linear:%f,    Spline:%f\n', T_L, T_S);
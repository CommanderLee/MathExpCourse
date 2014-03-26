% Exp3.11, Page 66. Li Zhen, March 25th, 2014.

% Original data set
X = [7.0 10.5 13.0 17.5 34.0 40.5 44.5 48.0 56.0 61.0 68.5 76.5 80.5 91.0 ...
    96.0 101.0 104.0 106.5 111.5 118.0 123.5 136.5 142.0 146.0 150.0 157.0 158.0];
Y1 = [44 45 47 50 50 38 30 30 34 36 34 41 45 46 43 37 33 28 32 65 55 54 52 50 66 66 68];
Y2 = [44 59 70 72 93 100 110 110 110 117 118 116 118 118 121 124 121 121 ...
    121 122 116 83 81 82 86 85 68];

% Interpolate points
xi = 7.0:0.1:158.0;

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
T_L = trapz(xi, y2_L - y1_L);
T_S = trapz(xi, y2_S - y1_S);

% Output the results
fprintf('\nInterpolation results:\nxi   y1_L   y2_L   y1_S   y2_S\n');
[xi' y1_L' y2_L' y1_S' y2_S']

fprintf('Area in the map(mm^2):\n');
fprintf('    Linear:%f,    Spline:%f\n', T_L, T_S);

real_L = T_L / power(18, 2) * power(40, 2);
real_S = T_S / power(18, 2) * power(40, 2);

fprintf('Real national area(km^2):\n');
fprintf('    Linear:%f,    Spline:%f\n', real_L, real_S);

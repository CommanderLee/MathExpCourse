% Exp4.6, Page 86. Li Zhen, Apr. 3rd, 2014.

d = 100;

ts = 0:0.1:200;                         % Time interval
xy0 = [0 -d];							% Starting conditions

[t out] = ode15s(@Exp4_6_func, ts, xy0);	% Using Runge-Kutta Algorithm
x = out(:, 1);
y = out(:, 2);

plot(t, out);
gtext('x(t)');
gtext('y(t)');
title('t-x(t)-y(t)');

figure;
plot(x, y);
xlabel('x(t)');
ylabel('y(t)');
title('x(t)-y(t)');



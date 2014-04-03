% Exp4.5, Page 86. Li Zhen, Apr. 3rd, 2014.

ts = 0:0.1:30;                          % Time interval
x0 = [0 0];								% Starting conditions

[t out] = ode45(@Exp4_5_func, ts, x0);	% Using Runge-Kutta Algorithm
v = out(:, 1);
x = out(:, 2);

plot(t, v);
xlabel('t');
ylabel('v(t)');
title('t-v(t)');

figure;
plot(t, x);
xlabel('t');
ylabel('x(t)');
title('t-x(t)');

dep = 300 * 0.3048;						% Depth: ft -> m
x1 = dep + 0 .* ts;
hold on;
plot(ts, x1, 'r');

figure;
plot(v, x);
xlabel('v(t)');
ylabel('x(t)');
title('v(t)-x(t)');

hold on;
plot(ts, x1, 'r');

v_max = 40 * 0.3048;					% Max velocity limit: ft/s -> m/s
x2 = 0:500;
v2 = v_max + 0 .* x2;
hold on;
plot(v2, x2, 'k');


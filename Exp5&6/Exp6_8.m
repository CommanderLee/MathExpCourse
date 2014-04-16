% Exp6.8, Page 138. Li Zhen, Apr. 16th, 2014.

ti = (0.1:0.0001:1.5)';
% iterate 200 times, and plot the last 100 times
n1 = 100;
n2 = 200;

[r c] = size(ti);
x0 = ones(r, 1) .* 0.5;
y = zeros(r, n2);

% y(:, 1) = feval(Exp6_8_Iter, x0, ti);
y(:, 1) = Exp6_8_Iter(x0, ti);
for col=2:n2
    % y(:, col) = feval(Exp6_8_Iter, y(:, col-1), ti);
    y(:, col) = Exp6_8_Iter(y(:, col-1), ti);
end

plot(ti, y(:, n1+1:n2), 'k.');
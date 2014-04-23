% Distance function of Exp7.5, Page 170. Li Zhen, Apr. 22nd, 2014.

function out = Exp7_5_Distance(X, Data)

I = Data(:, 1);
J = Data(:, 2);
Dis = Data(:, 3);

[row col] = size(Data); % Get the number of experiment data pairs

out = zeros(row, 1);

x = [0 X(1:24)];
y = [0 X(25:48)];

for r = 1:row
    out(r) = (x(I(r)) - x(J(r))) ^ 2 + (y(I(r)) - y(J(r))) ^ 2 - Dis(r) ^ 2;
end

end
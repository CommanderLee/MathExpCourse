% Exp7.5, Page 170. Li Zhen, Apr. 22nd, 2014.

X0 = ones(1, 48);
X0(1, 1:2) = zeros(1, 2);
X0(1, 25:26) = zeros(1, 2);

[x fv] = fminunc(@Exp7_5_Distance_2, X0);
fv
reshape(x, 2, 24)'
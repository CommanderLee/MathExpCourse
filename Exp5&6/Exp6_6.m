% Exp6.6, Page 137. Li Zhen, Apr. 16th, 2014.

% The parameters used in the formular
n = 4;
a = [18.607 15.841 20.443 19.293]';
b = [2643.31 2755.64 4628.96 4117.07]';
c = [239.73 219.16 252.64 227.44]';
p = 760;
Q = [1.0 0.192 2.169 1.611;
    0.316 1.0 0.477 0.524;
    0.377 0.36 1.0 0.296;
    0.524 0.282 2.065 1.0];

XT0 = [0 0.7 0 80];

[XT, Y] = fsolve(@Exp6_6_func, XT0, [], n, a, b, c, p, Q)

XT1 = [0 0.333 0.333 50];

[XT, Y] = fsolve(@Exp6_6_func, XT1, [], n, a, b, c, p, Q)

XT2 = [0.333 0 0.333 50];

[XT, Y] = fsolve(@Exp6_6_func, XT2, [], n, a, b, c, p, Q)

XT3 = [0.333 0.333 0 50];

[XT, Y] = fsolve(@Exp6_6_func, XT3, [], n, a, b, c, p, Q)

XT4 = [0.25 0.25 0.25 50];

[XT, Y] = fsolve(@Exp6_6_func, XT4, [], n, a, b, c, p, Q)

XT5 = [0.8 0.1 0.1 100];

[XT, Y] = fsolve(@Exp6_6_func, XT5, [], n, a, b, c, p, Q)

XT6 = [0.1 0.8 0.1 80];

[XT, Y] = fsolve(@Exp6_6_func, XT6, [], n, a, b, c, p, Q)

XT7 = [0.1 0.1 0.8 100];

[XT, Y] = fsolve(@Exp6_6_func, XT7, [], n, a, b, c, p, Q)

XT8 = [0.1 0.1 0.1 100];

[XT, Y] = fsolve(@Exp6_6_func, XT8, [], n, a, b, c, p, Q)

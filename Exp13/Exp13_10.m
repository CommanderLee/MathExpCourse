% Exp13.10, Page 337. Li Zhen, June 12th, 2014.

Data = [1	196	66.290	7	10	49	37.408	5
        2	63	40.964	5	11	105	54.376	2
        3	252	72.996	10	12	98	46.186	7
        4	84	45.010	6	13	77	46.130	4
        5	126	57.204	4	14	14	30.366	3
        6	14	26.852	5	15	56	39.060	5
        7	49	38.122	4	16	245	79.380	1
        8	49	35.840	6	17	133	52.766	8
        9	266	75.796	9	18	133	55.916	6];

N = 18;

y_ins = [Data(:, 2); Data(:, 6)];           % Insurance
x1_income = [Data(:, 3); Data(:, 7)];       % Income
x2_risk = [Data(:, 4); Data(:, 8)];         % Risk

X = [x1_income, x2_risk];                   % Input matrix
rstool(X, y_ins, 'purequadratic');

x3 = x1_income .* x2_risk;
x4 = x1_income .^ 2;
x5 = x2_risk .^ 2;
X2 = [X, x3, x4, x5];
stepwise(X2, y_ins);

X3 = [ones(N, 1), X, x4];
[b, bint, r, rint, s] = regress(y_ins, X3);
b, bint, s
figure;
rcoplot(r, rint);

X4 = [X3(1:4, :); X3(6:18, :)];
y_ins4 = [y_ins(1:4, :); y_ins(6:18, :)];
[b, bint, r, rint, s] = regress(y_ins4, X4);
b, bint, s
figure;
rcoplot(r, rint);


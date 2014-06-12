% Exp13.11, Page 337. Li Zhen, June 12th, 2014.

Data = [1	35	2	0	0.25
        2	43	2	0	0.50
        3	55	2	0	0.75
        4	47	2	1	0.25
        5	43	2	1	0.50
        6	57	2	1	0.75
        7	26	5	0	0.25
        8	27	5	0	0.50
        9	28	5	0	0.75
        10	29	5	1	0.25
        11	22	5	1	0.50
        12	29	5	1	0.75
        13	19	7	0	0.25
        14	11	7	0	0.50
        15	14	7	0	0.75
        16	23	7	1	0.25
        17	20	7	1	0.50
        18	22	7	1	0.75
        19	13	10	0	0.25
        20	8	10	0	0.50
        21	3	10	0	0.75
        22	27	10	1	0.25
        23	26	10	1	0.50
        24	5	10	1	0.75];

N = 24;

y_time = Data(:, 2);                % Recovery time
x1_dos = Data(:, 3);                % Dosage
x2_gender = Data(:, 4);             % Gender
x3_pres = Data(:, 5);               % Blood pressure

x4_12 = x1_dos .* x2_gender;
x5_13 = x1_dos .* x3_pres;
x6_23 = x2_gender .* x3_pres;
x7_1sqr = x1_dos .^ 2;
x8_3sqr = x3_pres .^ 2;

X = [x1_dos, x2_gender, x3_pres, x4_12, x5_13, x6_23, x7_1sqr, x8_3sqr];
stepwise(X, y_time);

X1 = [ones(N, 1), x1_dos, x3_pres, x4_12, x5_13, x7_1sqr];
[b, bint, r, rint, s] = regress(y_time, X1);
b, bint, s
figure;
rcoplot(r, rint);

X2 = [ones(N, 1), x1_dos, x4_12, x5_13, x7_1sqr, x8_3sqr];
[b, bint, r, rint, s] = regress(y_time, X2);
b, bint, s
figure;
rcoplot(r, rint);

X1_ = [X1(1:3, :); X1(5:22, :); X1(24, :)];
y_time1 = [y_time(1:3, :); y_time(5:22, :); y_time(24, :)];
[b, bint, r, rint, s] = regress(y_time1, X1_);
b, bint, s
figure;
rcoplot(r, rint);

X2_ = X2(1:22, :);
y_time2 = y_time(1:22, :);
[b, bint, r, rint, s] = regress(y_time2, X2_);
b, bint, s
figure;
rcoplot(r, rint);



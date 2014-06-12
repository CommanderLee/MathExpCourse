% Exp13.5, Page 333. Li Zhen, June 12th, 2014.

Data = [1	11.2	16.5	6.2	587		11	14.5	18.1	6	7895
    2	13.4	20.5	6.4	643		12	26.9	23.1	7.4	762
    3	40.7	26.3	9.3	635		13	15.7	19.1	5.8	2793
    4	5.3		16.5	5.3	692		14	36.2	24.7	8.6	741
    5	24.8	19.2	7.3	1248	15	18.1	18.6	6.5	625
    6	12.7	16.5	5.9	643		16	28.9	24.9	8.3	854
    7	20.9	20.2	6.4	1964	17	14.9	17.9	6.7	716
    8	35.7	21.3	7.6	1531	18	25.8	22.4	8.6	921
    9	8.7		17.2	4.9	713		19	21.7	20.2	8.4	595
    10	9.6		14.3	6.4	749		20	25.7	16.9	6.7	3353];

N = 20;

y_crime = [Data(:, 2); Data(:, 7)];         % Crime rate
x1_low = [Data(:, 3); Data(:, 8)];          % Low income rate
x2_unemploy = [Data(:, 4); Data(:, 9)];     % Unemployment rate
x3_pop = [Data(:, 5); Data(:, 10)];         % Population

problem = 2;

if problem == 1
    plot(x1_low, y_crime, 'b+');
    title('y-x1');
    figure;
    plot(x2_unemploy, y_crime, 'r+');
    title('y-x2');
    figure;
    plot(x3_pop, y_crime, 'k+');
    title('y-x3');
    
    X = [ones(N, 1), x1_low, x2_unemploy];          % Input matrix
    [b, bint, r, rint, s] = regress(y_crime, X);
    b, bint, s
    figure;
    rcoplot(r, rint);
    
    X1 = [X(1:7, :); X(9:19, :)];
    y_crime1 = [y_crime(1:7, :); y_crime(9:19, :)];
    [b, bint, r, rint, s] = regress(y_crime1, X1);
    b, bint, s
    figure;
    rcoplot(r, rint);
    
elseif problem == 2
    X2 = [ones(N, 1), x1_low, x2_unemploy, x3_pop];	% Input matrix
    [b, bint, r, rint, s] = regress(y_crime, X2);
    b, bint, s
    figure;
    rcoplot(r, rint);
    
    X2_ = [X2(1:7, :); X2(9:10, :); X(12:19, :)];
    y_crime_ = [y_crime(1:7, :); y_crime(9:10, :); y_crime(12:19, :)];
    [b, bint, r, rint, s] = regress(y_crime_, X2_);
    b, bint, s
    figure;
    rcoplot(r, rint);

    X3 = [ones(N, 1), x1_low, x2_unemploy, x3_pop, x1_low.*x3_pop,...,
        x2_unemploy.*x3_pop, x3_pop.^2];            % Input matrix
    [b, bint, r, rint, s] = regress(y_crime, X3);
    b, bint, s
    figure;
    rcoplot(r, rint);
end;

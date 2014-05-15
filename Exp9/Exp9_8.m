% Exp9.8, Page 221. Li Zhen, May 14th, 2014.

% History Price of the 3 stocks
Price = [1.300	1.225	1.149
		1.103	1.290	1.260
		1.216	1.216	1.419
		0.954	0.728	0.922
		0.929	1.144	1.169
		1.056	1.107	0.965
		1.038	1.321	1.133
		1.089	1.305	1.732
		1.090	1.195	1.021
		1.083	1.390	1.131
		1.035	0.928	1.006
		1.176	1.715	1.908];

Cov_P = cov(Price);			% Covariance matrix

Var_P = diag(Cov_P);		% Variances

Mean_P = mean(Price);

H = 2 .* Cov_P;
A1 = -Mean_P;
A2 = [1 1 1];
b2 = 1;
v1 = [0 0 0];
v2 = [1 1 1];
x0 = [0.3 0.3 0.4];
opt = optimset('largescale' ,'off', 'MaxIter', 3000, 'MaxFun', 100000);

problem = 2;
if problem == 0
    display('problem0');
	Target = 1.93;
	b1 = -Target;
    [x, fv, ef, out] = quadprog(H, [], A1, b1, A2, b2, v1, v2, x0, opt)
elseif problem == 1
    display('problem1');
    % Target = 1:0.001:2;
    Target = 1:0.0001:1.2347;
    [row col] = size(Target);
    risk = zeros(row, col);
    res = zeros(3, col);
	for i=1:col
		b1 = -Target(i);
		[x, fv, ef, out] = quadprog(H, [], A1, b1, A2, b2, v1, v2, x0, opt);
		fv
        risk(i) = fv;
        res(:, i) = x;
    end
    plot(Target, risk);
    [Target; res]'
elseif problem == 2
	National = 1.05 .* ones(12, 1);
	Price = [Price National];
	Cov_P = cov(Price);			% Covariance matrix
	Var_P = diag(Cov_P);		% Variances
	Mean_P = mean(Price);

	H = 2 .* Cov_P;
	A1 = -Mean_P;
	Target = 1.15;
	b1 = -Target;
    A2 = ones(1, 4);
    b2 = 1;
    v1 = zeros(1, 4);
    v2 = ones(1, 4);
    x0 = 0.25 .* ones(1, 4);
    [x, fv, ef, out] = quadprog(H, [], A1, b1, A2, b2, v1, v2, x0, opt)
elseif problem == 3
	
end
    


% Exp12.10, Page 299. Li Zhen, June 4th, 2014.

Data = [7.0 	124.5 	5.7 	122.5 	5.4 	123.4 	5.4 	121.8 	5.4 
		8.0 	129.4 	5.6 	128.1 	5.5 	128.4 	5.5 	127.6 	5.7 
		9.0 	134.6 	6.0 	133.4 	5.4 	134.3 	6.2 	133.5 	6.3 
		10.0 	139.3 	6.6 	138.9 	5.9 	140.0 	6.9 	140.2 	6.6 
		11.0 	145.1 	7.2 	144.9 	6.7 	146.7 	7.0 	146.7 	6.7 
		12.0 	151.2 	8.1 	152.0 	7.8 	152.5 	6.6 	151.9 	6.2 
		13.0 	160.0 	8.0 	159.6 	7.6 	156.3 	6.0 	155.1 	5.4 
		14.0 	165.1 	7.0 	165.1 	6.8 	157.7 	5.5 	156.7 	5.2 
		15.0 	168.3 	6.3 	168.5 	6.2 	158.9 	5.6 	157.4 	5.0 
		16.0 	170.1 	6.3 	170.0 	5.9 	159.3 	5.4 	157.9 	5.3 
		17.0 	171.0 	6.0 	170.8 	6.0 	159.3 	5.4 	158.1 	5.0 
		18.0 	170.8 	5.8 	171.1 	5.9 	159.1 	5.3 	158.2 	5.1];

Age = Data(:, 1);
BoyCN = Data(:, 2:3);
BoyJP = Data(:, 4:5);
GirlCN = Data(:, 6:7);
GirlJP = Data(:, 8:9);

[row col] = size(Data);
TotalCN = 200000;			% Total amount of Chinese data
n1 = (TotalCN / 2 / row) .* ones(row, 1);
n2 = 10000 .* ones(row, 1);  % Estimated amount of Japanese data in each group

alpha = 0.05;

disp('Boy between CN and JP:');
boyH = Exp12_10_ttest2(BoyCN(:, 1), BoyJP(:, 1), BoyCN(:, 2), BoyJP(:, 2), n1, n2, alpha);
for r = 1:row
    if boyH(r) == 0
        fprintf('Boy Age = %d, Same.\n', Age(r));
    else
        fprintf('Boy Age = %d, Different.\n', Age(r));
    end
end

disp('Girl between CN and JP:');
girlH = Exp12_10_ttest2(GirlCN(:, 1), GirlJP(:, 1), GirlCN(:, 2), GirlJP(:, 2), n1, n2, alpha);
for r = 1:row
    if girlH(r) == 0
        fprintf('Girl Age = %d, Same.\n', Age(r));
    else
        fprintf('Girl Age = %d, Different.\n', Age(r));
    end
end

% Exp12.8, Page 298. Li Zhen, June 4th, 2014.

Grade = [93	85	79	90	78	76	81	85	88	68	92	73	88	84	90	70	69	83	83	85
88	89	86	85	87	88	75	93	88	78	86	86	80	89	85	79	78	88	88	90];

% Hypothesis testing of grade change

gChange = Grade(1, :) - Grade(2, :);
disp('Jarque-Bera testing of grade change');
h = jbtest(gChange)

change = 0;
fprintf('Grade Change Hypothesis: %d\n', change);
[h sig ci] = ttest(gChange, change)

% Get estimation of each test
alpha = 0.05;
fprintf('Estimation of Test1(alpha=%f)\n', alpha);
[mu sigma muci sigmaci] = normfit(Grade(1, :), alpha)

fprintf('Estimation of Test2(alpha=%f)\n', alpha);
[mu sigma muci sigmaci] = normfit(Grade(2, :), alpha)
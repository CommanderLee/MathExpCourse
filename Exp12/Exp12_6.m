% Exp12.6, Page 298. Li Zhen, June 4th, 2014.

Data = [172	169	169	171	167	75	55	64	65	47
171	168	165	169	168	62	67	52	62	65
166	168	164	170	165	62	65	59	58	64
160	175	173	172	168	55	67	74	64	57
155	176	172	169	176	57	64	69	58	57
173	168	169	167	170	58	50	52	72	57
166	161	173	175	158	55	49	57	76	51
170	169	173	164	165	63	63	61	59	62
167	171	166	166	172	53	61	70	63	53
173	178	163	169	169	60	64	57	54	66
178	177	170	167	169	60	66	56	54	58
173	170	160	179	172	73	58	65	62	50
163	173	165	176	162	47	67	58	63	52
165	172	177	182	175	66	59	66	69	75
170	170	169	186	174	60	62	63	77	66
163	172	176	166	167	50	59	60	76	63
172	177	177	169	166	57	58	67	72	50
182	176	172	173	174	63	68	56	59	64
171	175	165	169	168	59	68	56	65	62
177	184	166	171	170	64	70	49	71	59];

Height = Data(:, 1:5);
Height = Height(:);
Weight = Data(:, 6:10);
Weight = Weight(:);

colormap(cool);         % Print the histogram of Height and Weight
hist(Height);
figure;
hist(Weight);
                        % Jarque-Bera Testing
disp('Jarque-Bera testing of Height');
h = jbtest(Height)

disp('Jarque-Bera testing of Weight');
h = jbtest(Weight)

alpha = 0.05;           % Get estimation of height and weight
fprintf('Estimation of height(alpha=%f)\n', alpha);
[mu sigma muci sigmaci] = normfit(Height, alpha)

fprintf('Estimation of weight(alpha=%f)\n', alpha);
[mu sigma muci sigmaci] = normfit(Weight, alpha)

oldHeight = 167.5;      % Hypothesis testing of height and weight
oldWeight = 60.2;

fprintf('Height Hypothesis: %f\n', oldHeight);
[h sig ci] = ttest(Height, oldHeight)

fprintf('Weight Hypothesis: %f\n', oldWeight);
[h sig ci] = ttest(Weight, oldWeight)

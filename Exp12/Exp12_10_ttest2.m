function out = Exp12_10_ttest2(x_, y_, s1, s2, n1, n2, alpha)
% My ttest2 function of Exp12.10
% x_, y_: average of two sets;
% s1, s2: standard deviation
% n1, n2: set size

s_2 = ((n1 - 1) .* (s1 .^ 2) + (n2 - 1) .* (s2 .^ 2)) ./ (n1 + n2 - 2);
t_res = (x_ - y_) ./ sqrt(s_2 ./ n1 + s_2 ./ n2);

t_value = tinv(1 - alpha / 2, (n1 + n2 - 2));
out = ~(abs(t_res) <= t_value);
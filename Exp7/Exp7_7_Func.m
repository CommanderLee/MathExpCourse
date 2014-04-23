% Function of Exp7.7, Page 171. Li Zhen, Apr. 23rd, 2014.

function out = Exp7_7_Func(x, KL)
a = x(1);
alpha = x(2);
beta = x(3);

K = KL(:, 1);
L = KL(:, 2);

% f(x)=aK^¦Á L^¦Â
out = a .* (K .^ alpha) .* (L .^ beta);

end
% Function of Exp6.6, Page 137. Li Zhen, Apr. 16th, 2014.

function out = Exp6_6_func(XT, n, a, b, c, p, Q)
T = XT(n);
x = XT';
x(n) = 1 - sum(XT) + T;

Sigma_XkQjk = Q * x;
lnP = log(p);

for i=1:n
    out(i) = x(i) * ( b(i) / ( T + c(i) ) + log(Q(i, :) * x) + sum(x .* Q(:, i) ./ Sigma_XkQjk) - 1 - a(i) + lnP );
end

end
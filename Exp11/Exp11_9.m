% Exp11.9, Page 273. Li Zhen, May 26th, 2014.

L = 2;                          % standard length(m)

sigma = 0.2;
% mu = 0.1:0.01:4;
mu = 1.8:0.0001:2.8;

S = 1 - normcdf(L, mu, sigma);  % the succeed probability

Waste1 = mu - L .* S;
[Y I] = min(Waste1);
mu(I)
plot(mu, Waste1);

figure;

Waste2 = mu ./ S - L;
[Y I] = min(Waste2);
mu(I)
plot(mu, Waste2);
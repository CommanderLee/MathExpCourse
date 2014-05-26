% Exp11.5, Page 273. Li Zhen, May 26th, 2014.

R = 1;                  % Radius of the circle (x100m)

sigma_x = 0.8;          % sigma and corr used in the norm
sigma_y = 0.5;
corr = 0.4;

N = 1000000;            % Test number of Monte Carlo
T = 10;                 % Test time
P = zeros(1, T);
mu = [0 0];
sigma = [sigma_x^2 sigma_x * sigma_y * corr;
         sigma_x * sigma_y * corr sigma_y^2];
     
for i = 1:T
    x = unifrnd(0, R, 1, N);
    y = unifrnd(0, R, 1, N);
    fprintf('Test No.%d:\n', i);
    
    hit = (x .^ 2 + y .^ 2) <= R ^ 2;
    pxy = mvnpdf([x' y'], mu, sigma)';
    
    P(i) = 4 * (R ^ 2) / N * sum(hit .* pxy);
    disp(P(i));
end

P
mean(P)
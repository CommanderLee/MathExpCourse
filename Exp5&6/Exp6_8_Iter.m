% Iterate Function of Exp6.8, Page 138. Li Zhen, Apr. 16th, 2014.
function out = Exp6_8_Iter(q, c)

% Some parameters:
u = 4.8;
d = 0.25;
r = 0.3;

out = (1 - r) .* q - r .* atan(u .* q) ./ d + r .* c ./ d;

end
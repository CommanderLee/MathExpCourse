% Constraint of Exp9.4, Page 220. Li Zhen, May 14th, 2014.

function [out eq] = Exp9_4_Cons(x)
% x1~x3: quantity of ingredient1~3; x4: quantity of 1-2 mixture used in A
% x5: quantity of ingredient 3 used in A

SC = [0.03 0.01 0.02];      % Sulphur Content in the ingredient
SCLimit = [0.025 0.015];    % Sulphur Content Limit of the product

QtA = x(4) + x(5);
QtB = x(1) + x(2) + x(3) - x(4) - x(5);
SC12 = (SC(1) * x(1) + SC(2) * x(2)) / (x(1) + x(2));

out = [(SC12 * x(4) + SC(3) * x(5)) / QtA - SCLimit(1);
       (SC12 * (x(1) + x(2) - x(4)) + SC(3) * (x(3) - x(5))) / QtB - SCLimit(2)];
eq = 0;
end
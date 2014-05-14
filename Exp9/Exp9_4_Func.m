% Object Function of Exp9.4, Page 220. Li Zhen, May 14th, 2014.

function out = Exp9_4_Func(x)
% x1~x3: quantity of ingredient1~3; x4: quantity of 1-2 mixture used in A
% x5: quantity of ingredient 3 used in A

SP = [9 15];                % Selling Price
PP = [6 16 10];             % Purchase Price

QtA = x(4) + x(5);
QtB = x(1) + x(2) + x(3) - x(4) - x(5);
out = SP(1) * QtA + SP(2) * QtB - sum(PP .* x(1:3));
out = - out; % get Max Value
end
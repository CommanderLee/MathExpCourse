% Exp9.4, Page 220. Li Zhen, May 14th, 2014.

Sup = [500 500 500];        % Supply of the ingredient
Dem = [600 200];            % Demand of the product

A1 = [-1 -1 0 1 0;
      0 0 -1 0 1;
      0 0 0 1 1;
      1 1 1 -1 -1];
  
b1 = [0 0 Dem(1) Dem(2)];

v1 = [0 0 0 0 0];
v2 = [Sup(1) Sup(2) Sup(3) Sup(1) + Sup(2) Sup(3)];

x0 = [300 0 300 300 300];
opt = optimset('largescale' ,'off', 'MaxIter', 3000, 'MaxFun', 100000);

problem = 1;
if problem == 1
    display('problem1');
    [x, fv, ef, out] = fmincon(@Exp9_4_Func, x0, A1, b1, [], [], v1, v2, @Exp9_4_Cons, opt)
elseif problem == 2
    display('problem2');
    Dem(1) = 600;
    b1 = [0 0 Dem(1) Dem(2)];
    [x, fv, ef, out] = fmincon(@Exp9_4_Func, x0, A1, b1, [], [], v1, v2, @Exp9_4_Cons, opt)
end
    


% Exp8.6, Page 196. Li Zhen, May 5th, 2014.

income = [4.3 5.4 5.0 4.4 4.5];    

A1 = [0 -1 -1 -1 0;                 % Constrain
      0.6 0.6 -0.4 -0.4 3.6;
      4 10 -1 -2 -3;
      1 1 1 1 1];
  
v1 = [0 0 0 0 0];                   % Lower bound

Problem = 3;

if Problem == 1
    % invert the income to maximize the answer
    c = - income .* 0.01 .* [1 0.5 0.5 0.5 1];
    
    M = 1000;
    b1 = [-400 0 0 M];
    disp('Problem 1');
    [x f exitflag output lambda] = linprog(c, A1, b1, [], [], v1)
elseif Problem == 2
    % invert the income to maximize the answer
    c = - (income .* 0.01 .* [1 0.5 0.5 0.5 1] - ones(1, 5) .* 2.75 .* 0.01);
    
    M = 1100;
    b1 = [-400 0 0 M];
    disp('Problem 1');
    [x f exitflag output lambda] = linprog(c, A1, b1, [], [], v1)
elseif Problem == 3
    % income(1) = 4.5;  
    income(3) = 4.8;
    % invert the income to maximize the answer
    c = - income .* 0.01 .* [1 0.5 0.5 0.5 1];
    
    M = 1000;
    b1 = [-400 0 0 M];
    disp('Problem 1');
    [x f exitflag output lambda] = linprog(c, A1, b1, [], [], v1)
end
% Exp8.10, Page 199. Li Zhen, May 6th, 2014.

sf = [5 5 5];       % sewage flow of the factory
fc = [100 60 50];   % factory sewage concentration
pf = [1 1 1];       % process factor
spf = [0 0.9 0.6];  % self-purification factor
wf = [1000 0 0 0];  % water flow
wf(2) = wf(1) + sf(1);
wf(3) = wf(2) + sf(2);
wf(4) = wf(3) + sf(3);

ul = 1;             % upper limit of the sewage concentration
uwc1 = 0.8;         % upstream water sewage concentration

v1 = [0 0 0];
v2 = fc;

% Cost
c = -ones(1, 3) .* pf .* sf;
    
problem = 2;

if problem == 1
    % Constrain
    A1 = [sf(1) / wf(2)                     0                       0;
          spf(2) * sf(1) / wf(3)            sf(2) / wf(3)           0;
          spf(3) * spf(2) * sf(1) / wf(4)   spf(3) * sf(2) / wf(4)  sf(3) / wf(4)];
    b1 = [ul - uwc1 * wf(1) / wf(2), ul - spf(2) * uwc1 * wf(1) / wf(3), ...,
        ul - spf(3) * spf(2) * uwc1 * wf(1) / wf(4)];
   
    disp('Problem 1');
    [x f exitflag output lambda] = linprog(c, A1, b1, [], [], v1, v2);
    x
    ans = f + sum(pf .* sf .* fc)
    exitflag
    output
    lambda
    
elseif problem == 2
    % Constrain
    A1 = [spf(2) * sf(1) / wf(2)            0                       0;
          spf(3) * spf(2) * sf(1) / wf(3)   spf(3) * sf(2) / wf(3)  0];
    b1 = [ul - spf(2) * uwc1 * wf(1) / wf(2), ul - spf(3) * spf(2) * uwc1 * wf(1) / wf(3)];
    
    disp('Problem 2');
    [x f exitflag output lambda] = linprog(c, A1, b1, [], [], v1, v2);
    x
    ans = f + sum(pf .* sf .* fc)
    exitflag
    output
    lambda
    
end
% Function of Exp4.6, Page 86. Li Zhen, Apr. 3rd, 2014.
function out = Exp4_6_func(t, in)
    x = in(1);
    y = in(2);
    
    v1 = 2;
    v2 = 2;
    tmp = sqrt(x * x + y * y);
	out = [v1 - v2 * x / tmp; -v2 * y / tmp];
end
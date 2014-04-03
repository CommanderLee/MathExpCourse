% Function of Exp4.5, Page 86. Li Zhen, Apr. 3rd, 2014.
function out = Exp4_5_func(t, in)
    v = in(1);
    x = in(2);
    
	G = 527.436 * 0.4536 * 9.8;			% Gravity: lbf -> N
	F = 470.327 * 0.4536 * 9.8;			% Flotage: lbf -> N
	b = (0.08 * 0.4536 * 9.8) / 0.3048;	% Resistance coeff. lbf*s/ft -> N*s/m
	m = 527.436 * 0.4536;				% Mass: lbf -> kg
    
	out = [(G - F - b * v) / m; v];
end
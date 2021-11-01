function [X, Y] = Henon(a,b,N, x0, y0)
	% Henon map generator. a and b are the constants and x0 and y0 are the initial conditions
	x_n1 = @(x_n, y_n, a) 1 - a*x_n^2 + y_n;
	y_n1 = @(x_n, b) b*x_n;

	X = zeros(1,N);
	Y = zeros(1,N);

	% Initialize the map
	X(1) = x_n1(x0, y0, a);
	Y(1) = y_n1(x0, b);

	for i = 1:1:N
		X(i+1) = x_n1(X(i), Y(i), a);
		Y(i+1) = y_n1(X(i), b);
	end
end

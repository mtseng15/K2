function C = Cd(X,epsilon, d)
	% Cd(epsilon from Grassberger's paper. 

	N = length(X);
	% The number of pairs of points (n,m) who's measured magnitude is less than epsilon
	p = 0; 

	% Note that you can't go all the way to N due to the size of d. 
	% Also note that this method counts (n,m) and (m,n) distinctly. 
	for n = 1:1:N-d
		for m = 1:1:N-d
			theSum = 0;
			for i = 1:1:d
				theSum = theSum + (X(n+i) - X(m+i)).^2;
			end
			if sqrt(theSum) < epsilon
				p = p + 1;
			end
		end
	end

	% Devide by N^2
	C = p*N^-2;
end

function [k2, cd] = K2 (X, epsilon, d, dt)
	% K2 returns the arrays K and Cd which will allow the user to determing 
	% the K2 approximation of Kolmogorov Entropy.
	% 
	% cd is a length(epsilon) X length(d) matrix of the value of Cd at d_n and epsilon_n
	% 
	% k2 is the K2 approximation caldulation for each value of epsilon.
	% Note that the length is one less than the length of d due to the recursive
	% algorithm



	N = length(X);
	cd = zeros(length(d), length(epsilon)); % Pre-allocate array
	
	% Calculate the Cd for each value of d and epsilon
	for j = 1:1:length(d)
		for i = 1:1:length(epsilon)
			cd(j,i) = Cd(X, epsilon(i), d(j));
		end
	end

	K = zeros(length(epsilon), length(d)-1);

	% Note that you must divide by the dt
	for j = 1:1:length(epsilon)
		for i = 1:1:(length(d)-1)
			K(j,i) = (1/dt)*log(cd((i),j)/cd((i+1), j));
		end
	end
end 

%% Grassberger's K2
clear all
close all

% Generate the Henon Map time series data
N = 15000;
[X,Y] = Henon(1.4, 0.3, N, 0.1,0.3);
figure 
plot(X,Y, '*');
title("Henon Map")
xlabel("X")
ylabel("Y")

% Set up plotting ln(Cd(epsilon)) vs. ln(epsilon)
N = length(X);
d = 2:2:22; % Same as Grassberger
epsilon = logspace(-6, 0, 20); % Same as Grassberger
cd = zeros(length(d), length(epsilon)); % Pre-allocate array
dt = 1; % Since it's a discrete map the dt is 1.

% Calculate the Cd for each value of d and epsilon
for j = 1:1:length(d)
	for i = 1:1:length(epsilon)
		disp(epsilon(i))
		disp(d(j))
		cd(j,i) = Cd(X, Y,epsilon(i), d(j));
		clc
	end
end

figure
plot(log(epsilon), log(cd))
title("Henon Map")
xlabel("ln(\epsilon)")
ylabel("ln(C_d(\epsilon))")
legend("d = 2", "d = 4", "d = 6", "d = 8", "d = 10", "d = 12", "d = 14", "d = 16", "d = 18", "d = 20", "d = 22", "Location", "northwest")

K = zeros(length(epsilon), length(d)-1);

for j = 1:1:length(epsilon)
	for i = 1:1:(length(d)-1)
		K(j,i) = (1/dt)*log(cd((i),j)/cd((i+1), j));
	end
end

% Remove the last entry in d to make things line up
d(end) = [];
figure
plot(d, K)
xlabel("d")
ylabel("K_{2,d}(\epsilon)")
title("K_{2,d} for different values of epsilon")

 

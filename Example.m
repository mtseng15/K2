%% Example of calculating Grassberger's K2 approximation for the Henon Map
% The Henon Map is a 2 dimensional chaotic map that has been thoughly researched.
clear all
close all

% Generate the Henon Map time series data
N = 1500;
[X,Y] = Henon(1.4, 0.3, N, 0.1,0.3);
figure 
set(gcf,'color','w');
plot(X,Y, '*');
title("Henon Map")
xlabel("X")
ylabel("Y")

% Set up plotting ln(Cd(epsilon)) vs. ln(epsilon)
N = length(X);
d = 2:2:14; % Note that we start at 2 becuase there are two degrees of freedom to the Henon Map
epsilon = 0.4:0.1:0.8;
cd = zeros(length(d), length(epsilon)); % Pre-allocate array
dt = 2; % Since it's a discrete map with 2 degrees of freedom dt = 1*2.

% Calculate the k2 and cd
[k2, cd] = K2(X, epsilon, d, dt);

figure
set(gcf,'color','w');
plot(log(epsilon), log(cd))
title("Henon Map")
xlabel("ln(\epsilon)")
ylabel("ln(C_d(\epsilon))")
legend("d = 2", "d = 4", "d = 6", "d = 8", "d = 10", "d = 12", "d = 14","Location", "northwest")

% Remove the last entry in d to make things line up
d(end) = [];
figure
set(gcf,'color','w');
plot(d, k2)
xlabel("d")
ylabel("K_{2,d}(\epsilon)")
title("K_{2,d} for different values of epsilon")
legend("\epsilon = 0.4","\epsilon = 0.5","\epsilon = 0.6","\epsilon = 0.7","\epsilon = 0.8")







 

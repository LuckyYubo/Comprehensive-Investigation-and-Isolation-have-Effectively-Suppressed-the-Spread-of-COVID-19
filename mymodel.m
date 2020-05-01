function dydt = mymodel(t,y)
%% This is the model we proposed
% Author: Yubo Huang
% Date: 03/20/2020
% Copyright: please cite our paper if the code or data is used to research
% INPUT: t: time
%        y: initial values
% OUTPUT: y(1): I, the current (not total) infected population 
%         y(2): C, the current (not total) confirmed infected population
%         y(3): R, the recovered population after infecting
%         y(4): D, the dead population 
% PARAMETER: alpha = M / T, propagation coefficient; T is the incubation; 
%                          M is the average number of people who a infected 
%                          person can infect during the incubation.
%            beta:  isolation rate. The proportion of the isolated  
%                   people to the current confirmed infected people:
%            gamma: harmonic coefficient
%            sigma: daily cure rate, the rate of the number of discharged 
%                   patients per day (in the group of confired patients) to 
%                   the number of confirmed patients.
%            kappa: daily death rate, the rate of the number of dead 
%                   patients per day (in the group of confired patients) 
%                   to the number of confirmed patients.    
%            delta: daily natural cure rate, the rate of the number of
%                   self-healing people per day (in the group of 
%                   unconfirmed  but infected category) to the number 
%                   of not isolated people.
%            mu:    daily natural dead rate, the rate of the number of
%                   dead people per day (in the group of 
%                   unconfirmed  but infected category) to the number 
%                   of not isolated people.
%            eta:   daily diagnosis rate.
%% setting static coefficient
% alpha = 1.2;
% beta = 0.999;
% gamma = 10;
% eta = 0.7;
% delta = 0.001;
% mu = 0.006;
% sigma = 0.020455;
% kappa = 0.00305;
% N = 11081000;                  % the population
%% setting dynamical coefficient
alpha = Alpha(t);
beta = Beta(t);
gamma = 10;
eta = Eta(t);
delta = 0.001;
mu = 0.006;
sigma = Sigma(t);
kappa = Kappa(t);
N = 11081000;                  % the population
%% dynamics model
dydt = [alpha * (y(1) - beta * y(2)) * (1 - nthroot(y(1)/N, gamma)) - (sigma + kappa) * y(2) - (delta + mu) * (y(1) - y(2)); 
        eta * (y(1) - y(2)) - (sigma + kappa) * y(2);
        sigma * y(2) + delta * (y(1) - y(2));
        kappa * y(2) + mu * (y(1) - y(2));
        sigma * y(2);
        kappa * y(2)];
end
%% the functions of different cofficients
function alpha = Alpha(t)
alpha = 1.6 * exp(-0.1 * t) + 0.2;
end

function beta = Beta(t)
beta = 0.2/pi * atan(2 * t) + 0.9;
end

function eta = Eta(t)
eta = 1/pi * atan(0.05 * t) + 0.2;
end

function sigma = Sigma(t)
sigma = 0.08638 * atan(0.0427 * (t - 44.79)) + 0.095;
end

function kappa = Kappa(t)
kappa = 0.017 * exp(-0.06919 * t);
end


function dydt = seir(t,y)
%The model of SEIR
%INPUT: y1 = S; 
%       y2 = E;
%       y3 = I;
%       y4 = R;
%PARAMETERS: beta: the rate of transmission for the susceptible to infected
%            sigma: incubation rate
%            gamma: the probability of recovery or death
%            xi:  the rate which recovered individuals return to the susceptible statue
%            mu: the birth rate
%            nu: the dead rate
%            N; the population of the targeted area
beta = 0.78735;
sigma = 0.1961;
gamma = 0.078431;
xi = 0.001;
mu = 0.01128;
nu = 0.00498;
N = 11081000; 
%% SEIR
dydt = [- beta * y(1) * y(3) / N; 
        beta * y(1) * y(3) / N - sigma * y(2);
        sigma * y(2) - gamma * y(3);
        gamma * y(3)];
% %% SEIR with vital dynamics
% dydt = [mu * N - nu * y(1) - beta * y(1) * y(3) / N; 
%         beta * y(1) * y(3) / N - (sigma + nu) * y(2);
%         sigma * y(2) - (gamma + nu) * y(3);
%         gamma * y(3) - nu * y(4)];
% %% SEIRS
% dydt = [- beta * y(1) * y(3) / N + xi * y(4); 
%         beta * y(1) * y(3) / N - sigma * y(2);
%         sigma * y(2) - gamma * y(3);
%         gamma * y(3) - xi * y(4)];
% %% SEIRS with vital dynamics
% dydt = [- beta * y(1) * y(3) / N + xi * y(4) - nu * y(1); 
%         beta * y(1) * y(3) / N - (sigma + nu) * y(2);
%         sigma * y(2) - (gamma + nu)* y(3);
%         gamma * y(3) - (xi + nu) * y(4)];
end


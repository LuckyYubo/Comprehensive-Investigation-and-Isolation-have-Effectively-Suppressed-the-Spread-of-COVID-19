%% Test the proposed model
% tspan = [0 150];
% y0 = [15000 1886 75 104 75 104];
% [t, y] = ode45(@(t, y) mymodel(t, y), tspan, y0);
% plot(t, y(:, 1), t, y(:,2), t, y(:, 3), t, y(:, 4), t, y(5), t, y(6))
% legend('Total', 'Confirm', 'Recover', 'Dead', 'Rec', 'Dea')
% % filename = 'E:\2019ncov\Results';
% % sheet = 'Dyna_coef';
% res = [t, y];
% % xlswrite(filename, y, sheet);
%% Test the coefficient of proposed model
tspan = [0 100];
y0 = [2150 1886 75 104 75 104];
[t, y] = ode45(@(t, y) mymodel(t, y), tspan, y0);
plot(t, y(:, 1), t, y(:,2), t, y(:, 3), t, y(:, 4), t, y(:, 5), t, y(:, 6))
legend('Total', 'Confirm', 'Recover', 'Dead', 'Rec.', 'Dea.')
% filename = 'E:\2019ncov\Results';
% sheet = 'Dyna_coef';
res = [t, y];
%% Test SEIR model
% tspan = [0 100];
% y0 = [11058140, 20899. 1886, 75];
% [t, y] = ode45(@(t, y) seir(t, y), tspan, y0);
% plot(t, y(:, 1), t, y(:,2), t, y(:, 3), t, y(:, 4))
% legend('Susceptible', 'Exposed', 'Infected', 'Recovered')
% % filename = 'E:\2019ncov\Results';
% % sheet = 'Dyna_coef';
% res = [t, y];
% % xlswrite(filename, y, sheet);

% x = 0:0.00001:0.005;
% y1 = 1 - nthroot(x, 6);
% y2 = 1 - nthroot(x, 8);
% y3 = 1 - nthroot(x, 10);
% y4 = 1 - nthroot(x, 13);
% y5 = 1 - nthroot(x, 16);
% plot(x, y1, x, y2, x, y3, x, y4, x, y5, 'LineWidth', 1.5)
% % legend('\gamma = 6', '\gamma = 8', '\gamma = 10', '\gamma = 13', '\gamma = 16')
% % xlabel('I/N')
% % ylabel('\gamma')
% grid on

filename = 'E:\2019ncov\Data\ncovData';
conf = xlsread(filename, 'China', 'AA:AA'); % the number of conformed patients
dead = xlsread(filename, 'China', 'Z:Z'); % the number of dead patients
rec = xlsread(filename, 'China', 'Y:Y'); % the number of recovered patients
conf = conf(30:90);
dead = dead(30:90);
rec = rec(30:90);
dead_rate = dead ./ conf;
rec_rate = rec ./ conf;
t = length(rec);
t = 1:t;
sigma = 0.08638 * atan(0.0427 * (t - 44.79)) + 0.09663;
kappa = 0.01166 * exp(-0.06919 * t);

sz = 25;
c = linspace(1,10,length(t));

subplot(1, 2, 1)
scatter(t, rec_rate,sz,c,'filled')
hold on
plot( t, sigma, 'g-', 'LineWidth', 1.5)
text(1, 0.24, '\fontsize{14} \bf (A)')
xlabel('Days since Jan. 28th','FontSize',12)
ylabel('Daily cure rate \sigma','FontSize',12)
legend('Statistic', 'Fitted','FontSize',14)
legend('boxoff')
grid on

subplot(1, 2, 2)
scatter(t, dead_rate,sz,c,'filled')
hold on
plot(t, kappa, 'k-', 'LineWidth', 1.5)
text(1, 0.0175, '\fontsize{14} \bf (B)')
xlabel('Days since Jan. 28th','FontSize',12)
ylabel('Daily mortality rate \kappa','FontSize',12)
legend('Statistic', 'Fitted','FontSize',14)
legend('boxoff')
grid on






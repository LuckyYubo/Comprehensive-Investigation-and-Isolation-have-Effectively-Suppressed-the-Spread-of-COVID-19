filename = 'E:\2019ncov\ncovData';
conf = xlsread(filename, 'China', 'AA:AA'); % the number of conformed patients
susp = xlsread(filename, 'China', 'AG:AG'); % the number of suspected patients
dead = xlsread(filename, 'China', 'AD:AD'); % the number of dead patients
rec = xlsread(filename, 'China', 'AC:AC'); % the number of recovered patients
conf = conf(28:end);
susp = susp(43:end);
ins = zeros(15,1);
susp = [ins; susp];
susp_up = susp + conf;
dead = dead(28:end);
rec = rec(28:end);
date = 1:57;
subplot(2,1,1)
plot(date, conf, date, susp_up, date, dead, date, rec);
legend('Confirmed', 'Confirmed up', 'Dead', 'Recovered')
subplot(2,1,2)
tspan = [0 57];
y0 = [11075858 4346 698 98];
[t, y] = ode45(@(t, y) seir(t, y), tspan, y0);
plot(t, y(:, 1), t, y(:, 2), t, y(:, 3), t, y(:, 4));
legend('Susceptible', 'Exposed', 'Infectious', 'Recovered')





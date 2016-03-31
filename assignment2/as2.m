% Assignment 2 Radio Engineering
% Henning Schei
close all
load('rx_power.mat');


% Task 1

time = linspace(0,10e-3*length(rx_power_dBm),length(rx_power_dBm) );
plot(time, rx_power_dBm)
ylabel 'Power [dBm]'
xlabel 'Time [s]'


rx_power_dBm_largeScaleFading = smooth(rx_power_dBm);
rx_power_dBm_smallScaleFading = rx_power_dBm_largeScaleFading - rx_power_dBm';
figure;
plot(time,rx_power_dBm_largeScaleFading,'r'); hold on
plot(time, rx_power_dBm_smallScaleFading,'b'); hold on
plot(time,rx_power_dBm,'g')
legend('Large scale fading', 'Small scale fading','Original measurements'  )

% Task 2
figure;
hist(rx_power_dBm_largeScaleFading,100);
figure;
histfit(10.^(rx_power_dBm_largeScaleFading./10 -30),100,'lognormal');

%Task 3
histfit(10.^(rx_power_dBm_smallScaleFading./10 -30),100,'nakagami');
title 'Nakagami'
histfit(10.^(rx_power_dBm_smallScaleFading./10 -30),100,'rician');
title 'Rician'
histfit(10.^(rx_power_dBm_smallScaleFading./10 -30),100,'rayleigh');
title 'Rayleigh'









% figure;
% plot(time, rx_power_dBm_extracted)
% ylabel 'Power [dBm]'
% xlabel 'Time [s]'




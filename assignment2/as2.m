% Assignment 2 Radio Engineering
% Henning Schei
close all
load('rx_power.mat');


%% Task 1


time = linspace(0,10e-3*length(rx_power_dBm),length(rx_power_dBm) );
plot(time, rx_power_dBm)
ylabel 'Power [dBm]'
xlabel 'Time [s]'


rx_power_dBm_largeScaleFading = smooth(rx_power_dBm, 100);
rx_power_dBm_smallScaleFading = rx_power_dBm_largeScaleFading - rx_power_dBm';
figure;

plot(time, rx_power_dBm_smallScaleFading,'b'); hold on
plot(time,rx_power_dBm,'g')
plot(time,rx_power_dBm_largeScaleFading,'r' ); hold on
ylabel 'Power [dBm]'
xlabel 'Time [s]'
legend('Large scale fading', 'Small scale fading','Original measurements', 'Large scale fading' );



%% Task 2

figure;
histfit(rx_power_dBm_largeScaleFading,100,'normal');
title 'Histogram overlay with a lognormal distribution'
fprintf('Variance: %f [dB]\n Mean: %f [dB]\n', var(rx_power_dBm_largeScaleFading), mean(rx_power_dBm_largeScaleFading) );





%% Task 3
figure;
histfit(10.^(rx_power_dBm_smallScaleFading./20 ),100,'nakagami');
title 'Nakagami distribution'
hold on
histfit(10.^(rx_power_dBm_smallScaleFading./20 ) ,100,'rician');
title 'Rician distribution'
hold on
histfit(10.^(rx_power_dBm_smallScaleFading./20 ),100,'rayleigh');
title 'Rayleigh distribution'
hold off;

%% Task 4
%
FFTSIZE = 512;
Fs = 7.68e6 ; % Hz
Fc = 859.6e6; % Carrier Frequency



pdp = mean(abs(ifft(H2,50)).^2,2);
figure; 
plot(linspace(0,222e-9 * 50,50), 10*log10(pdp))
title 'Power delay profile' 


Pm = sum(pdp); % total power


tau = linspace(0,222e-9 * 50,50);


tmp = 0;

Tm2= sum(tau*pdp)/Pm;

for i =1:length(pdp)
    tmp = tmp + pdp(i) *tau(i);
end
Tm = tmp/Pm; % Average mean delay



tmp2 = 0;
for i =1:length(pdp)
    tmp2 = tmp2 + pdp(i)*power(tau(i),2);
end

S = sqrt( tmp2/Pm - power(Tm,2)); % Average delay spread

fprintf('Average delay spread %e ns\n', S);
fprintf('Average mean delay %e ns\n', Tm); 



















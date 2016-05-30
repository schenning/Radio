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
p1=histfit(10.^(rx_power_dBm_smallScaleFading./20 ),1000,'nakagami');
title 'Nakagami distribution'
hold on
p2=histfit(10.^(rx_power_dBm_smallScaleFading./20 ) ,1000,'rician');
%set(h(1),'facecolor','g'); set(h(2),'color','m')
title 'Rician distribution'
hold on
p3= histfit(10.^(rx_power_dBm_smallScaleFading./20 ),1000,'rayleigh');


set(p1(1),'facecolor','b'); set(p1(2),'color','m');
set(p2(1),'facecolor','r'); set(p2(2),'color','b');
set(p3(1),'facecolor','b'); set(p3(2),'color','c');
uistack(p1(2), 'top');
%uistack(p2(2), 'top');
uistack(p3(2),'top')


%uistack(p1)

legend ([p1(1) ,p3(2), p2(2), p1(2)], {'Small scale fading',  'rician', 'nakagami','rayleigh'} );

xlabel('Time (s)'); ylabel('Power (dBm)'); title('Task 3 plot');






title 'Rayleigh distribution'
legend('Nakagami', 'Rician', 'Rayleigh');

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

%% 



















% Assignment 2 Radio Engineering
% Henning Schei
close all
load('rx_power.mat');

time = linspace(0,10e-3*length(rx_power_dBm)-1,length(rx_power_dBm) );
plot(time, rx_power_dBm)
ylabel 'Power [dBm]'
xlabel 'Time [s]'


rx_power_dBm_extracted = smooth(rx_power_dBm);




figure;
plot(time, rx_power_dBm_extracted)
ylabel 'Power [dBm]'
xlabel 'Time [s]'




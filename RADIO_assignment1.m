% Assignment 1
% Henning Schei

T  = 300; % Kelvin
Fc = 5.6e9; % Carrier frequency
%Bw = 60e6;  % System bandwidth
load('rssi_distance_omni_boat', '-mat')
% To obtain a SNR of 0 dB, the reciever must have a noise figure
% less than -97 dBm ? 



% Problem 2. 
subplot(1,2,1)
plot(d1, rssi1); 
xlabel 'Distance [km]'
ylabel 'Power [dBm]'
title 'Horizontal polarization'
subplot(1,2,2)
plot(d2,rssi2)
xlabel 'Distance [km]'
ylabel 'Power [dBm]'
title 'Vertical polarization'

figure;
% Linear scale 
test = rssi1 - 30;
test = power(10, test./10);

plot(d1, test);
title 'linear scale'









% Problem 3.
c0  = 3e6;
d = d1;
lamb = 1; %ask what value this is
E1 = lamb/(4*pi);
hTX = 25; hRX = 3; % 
d_phi = 2*hTX*hRX*2*pi*Fc ./ (d*c0);
Etot = E1.* (1./d).* sqrt((1-power(cos(d_phi),2) ) + power(sin(d_phi),2));
Etot = 10*log10(Etot);
figure;
plot(d1,Etot)


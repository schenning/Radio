%Tasks

T  = 300; % Kelvin
Fc = 5.6e9; % Carrier frequency
%Bw = 60e6;  % System bandwidth

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

% Problem 3.
c0  = 3e6;
d = d1;
lamb = 1; %ask what value this is
E1 = lamb/(4*pi);
hTX = 25; hRX = 3; % can vary from 10-100m
d_phi = 2*hTX*hRX*2*pi*Fc ./ (d*c0);
Etot = E1.* (1./d).* sqrt((1-power(cos(d_phi),2) ) + power(sin(d_phi),2));
Etot = 10*log10(Etot);
figure;
plot(d1,Etot)


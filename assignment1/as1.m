
% Assignment 1
% Henning Schei
close all;
clear all;

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
plot(d1,power(rssi1/10,10));



% Problem 3.
c0  = 3e8;
d = d1;
lamb = power((Fc/c0),1); %meters
E1 = lamb/(4*pi); % in meters
E1_km  = E1*1000;

hTX = 25; hRX = 3; % 
d_phi = 2*hTX*hRX*2*pi*Fc ./ (d*1000*c0);
Etot = E1.* (1./(d.*1000)).* sqrt( power(1-cos(d_phi),2) + power(sin(d_phi),2));
figure;
plot(d,Etot);
Etot = 20*log10(Etot) ;
figure;
plot(d,Etot,'r'); hold on; plot(d2,rssi2,'g'); hold on; plot(d1,rssi1);
xlabel 'Distance [km]'
ylabel 'Power [dBm]'

% Problem 4
%-------------------------
% Lowest MCS (-97 dBm)
% Highest MCS (-74 dBm)

MCS_low  = -97-30 + 10; %db
MCS_high = -74 -30 + 10; %db

TX_power_dbm = 23; %dbm
TX_power_db  = TX_power_dbm -30 ; 
TX_gain_db = 23;%dbi
RX_gain_db = 12; %dbi

TX_gain = 10^(TX_gain_db/10);
RX_gain = 10^(RX_gain_db/10);
TX_power= 10^(TX_power_db/10);


PRX = TX_power * TX_gain * RX_gain * power((hTX*hRX./(power(d1,2))),2);
PRX_db = TX_power_db+ TX_gain_db + RX_gain_db  + 2*(log10((hTX*hRX)) - 2*log10(d1));



figure;
plot(d1,PRX_db)
hold on 
plot(d1, MCS_high);
plot(d1,MCS_low);


figure;
plot(d1*1000,PRX);
hold on;
plot(d1*1000, 10^(MCS_high/10));
hold on;
plot(d1*1000, 10^( MCS_low/10));








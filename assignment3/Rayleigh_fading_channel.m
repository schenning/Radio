function [h_m] = Rayleigh_fading_channel(Ts, channel_length, w_max, P)
m=(1/Ts)*(channel_length); % sampling frequency times channel length





h_m=zeros(1, m);

beta=1/sqrt(P);
v_max=w_max*Ts;

phy =2*pi.*rand(m, P) - pi;
ksi = 2*pi.*rand(m, P) - pi;

for m_i=1:m
    h_m(m_i)=sum(beta*exp(2*pi*1j*(phy(1, :)+m_i*v_max*cos(ksi(1, :)))));    
end
end
%rayChanObj = rayleighchan(T_S, omega_max, 0, 0) ;
% rayChanObj.StoreHistory = 1;
% x = ones(nb_samples,1);
% y = filter(rayChanObj,x);
% g = rayChanObj.PathGains;
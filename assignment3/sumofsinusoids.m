function [h] = sumofsinusoids(Ts,P, w_max,m)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Generation of narrowband Rayleigh fading Channel
% using sum of sinusoids method. 
%  PARAMETERS
%      - [h]    - Channels Jakes Doppler spectrum ;                
%      - Ts     - Sampling interval 
%      - P      - Number of paths
%      - w_max  - maximum doppler shift
%      - m      - number of samples to generate   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    psy_p = zeros(1,P);
    phi_p = zeros(1,P);
    for j =1:20
        psy_p(j)  = randnum();
        phi_p(j)  = randnum();
    end
    
    h  = zeros(1,m);
    for i = 1:m
        su = 0;
        for p= 0:P-1
            beta_p = power(sqrt(P),-1);
            nu_max  = w_max*Ts;
            nu_p    = nu_max * cos(psy_p(p+1));
            su = su + beta_p * exp(1i*2*pi*(phi_p(p+1) + i*nu_p));
        end
        h(i) = su;
    end
end

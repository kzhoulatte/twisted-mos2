% This script is used to integrate to get the transmission from DOM results
% using Landauer formula:
% Conductivity = 
%      2*e^2/h*integrate(M(E)*T(E)*(-diff(f)/diff(E))*dE)

clc;
clear all;
load ME_MoS2_bulk_z_PBE.mat;
DOM = ME;
dE = 0.004;
KbT=26;
Ef=20;
I0=0;
%d_Fermi = -1/((e^((E-Ef)/(Kb*T))+1)^2)*e^((E-Ef)/(Kb*T))/(Kb*T);
t0 = 75/2;
t1 = 1.1;
%TE = (-E^2+4*t0^2)*t1^2/(t0^4-E^2*t1^2+2*t0^2*t1^2+t1^4); % for ballistic tranport

for i = 1:1001
    E = -2+0.004*(i-1);
    d_Fermi = -1/((exp((E-Ef)/(KbT))+1)^2)*exp((E-Ef)/(KbT))/(KbT);
    
    if (E>=Ef-2*t0) & (E<=Ef+2*t0)
        TE = (-E^2+4*t0^2)*t1^2/(t0^4-E^2*t1^2+2*t0^2*t1^2+t1^4);
    else
        TE = 0;
    end
    
    DOM = ME(i);
    I0 = I0 + TE*d_Fermi*DOM;
end






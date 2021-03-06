% Sum up the resistivity from DOM and T(E) relations

clear all;

format long;
G = 0;
kboltz = 8.617332e-5; %(eV/K)
Temp = 300; %(K)
m0 = 0.511e6; %(eV A)
mx = 0.62*m0;   
my = 0.62*m0;
hbarc = 1973.27; %(eV A)
c = 3.0*10^18; % (A/sec)
hc = 2*pi*hbarc;    
q = 1.602*10^-19;
t0 = 623.2/2000;
t1 = 518.0/2000;
t2 = 511.2/2000;
t3 = 482.7/2000;
KbT = kboltz * Temp;
h=6.626e-34;

N=100000;
dE = 2*t0/N;   %10*KbT/1000;
Ef = -2*t0-KbT;
%dF = ones(1,10000);

%     E0 = 0;
%     M0 = sqrt(mx*my)/(2*pi*hh*hh)*E0;% which=0
%     T0 = ((-E0*E0*t1^2+4*t0^2*t1^2)/(t0^4-E0^2*t1^2+2*t0^2*t1^2+t1^4));
%     dF0 = (1/KbT)*exp((E0-Ef)/KbT)/(exp((E0-Ef)/KbT)+1)^2;
%     dG0 = 2*q^2/h*M*T*dF*dE;

C= q*c/(2*pi^2)*sqrt(mx*my)/(hbarc^3);

tt = t0;

for i = -N:N
    E = i*dE;
    %M = sqrt(mx*my)/(2*pi*hbarc^2)*E;
    %T = 1;
    
    T = ((-E*E*tt^2+4*t0^2*tt^2)/(t0^4-E^2*tt^2+2*t0^2*tt^2+tt^4));
    if T <= 0
        T = 0;
    end
    %dF(i) = (1/KbT)*exp((E+KbT)/KbT)/(exp((E+KbT)/KbT)+1)^2;
    F = 1/(exp((E-Ef)/KbT)+1);
    
    dG = C*T*F*dE;
    G = G+dG;
end
G = G * 1.0e8; %(angstroms^2 / miron^2)
G
rho = 1/G; % (ohm*micron^2)
rho



% Charge density

% density =0;
% for i = 0:N
%     E = i*dE;
%     %DOS = sqrt(mx*my)/(2*pi*hbarc^2);
%     dF = (1/KbT)*exp((E-Ef)/KbT)/(exp((E-Ef)/KbT)+1)^2;
%     
%     dn = dF*dE;
%     density = density+dn;
% end
% 
% DOS = sqrt(mx*my)/(2*pi*hbarc^2);
% density = density * DOS;
% density = density * 10^16;  % Per cm^2
% density
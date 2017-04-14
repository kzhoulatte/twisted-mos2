% Sum up the resistivity from DOM and T(E) relations

clear all;


%To get gamma values from u mobility;




format long;
G = 0;
kboltz = 8.617332e-5; %(eV/K)
Temp = 300; %(K)
m0 = 0.511e6; %(eV A)
mx = 0.47*m0;   
my = 0.45*m0;
hbarc = 1973.27; %(eV A)
c = 3.0*10^18; % (A/sec)
hc = 2*pi*hbarc;    
q = 1.602*10^-19;
t0 = 7.6/2000;
t1 = 0.12/2000;  
t2 = 2.0/2000;
t3 = 0.594/2000;
KbT = kboltz * Temp;
%h=6.626e-34;
Gamma = 12.6 /1000; %80 meV
h=6.626e-34;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%  one variable integral %%%%%%%%%%%%%%%%%%%%%%

NE = 1000000;
dE = 10*KbT/NE;
Ef = -2*t0-KbT;

C= q*c/(2*pi^2)*sqrt(mx*my)/(hbarc^3);
t = t0;

for i = -NE:NE
        E = i*dE;
        %T = 1;
        %u = 2*E/Gamma;
        
        A = t^2*Gamma^2/((E^2+Gamma^2/4)^2);
        %dF(i) = (1/KbT)*exp((E+KbT)/KbT)/(exp((E+KbT)/KbT)+1)^2;
        F = 1/(exp((E-Ef)/KbT)+1);
    
        dG = C*A*F*dE;
        G = G+dG;
end

% NE = 3000;
% Ne = 3000;
% dE = 10*KbT/NE;
% de = 10*KbT/Ne;
% Ef = -KbT;
% %dF = ones(1,10000);
% 
% %     E0 = 0;
% %     M0 = sqrt(mx*my)/(2*pi*hh*hh)*E0;% which=0
% %     T0 = ((-E0*E0*t1^2+4*t0^2*t1^2)/(t0^4-E0^2*t1^2+2*t0^2*t1^2+t1^4));
% %     dF0 = (1/KbT)*exp((E0-Ef)/KbT)/(exp((E0-Ef)/KbT)+1)^2;
% %     dG0 = 2*q^2/h*M*T*dF*dE;
% 
% %C= 4*pi*q*c*sqrt(mx*my)/(hc^3);
% C= 4*pi*q^2*c*sqrt(mx*my)/(hc^3);
% 
% for i = -NE:NE
%     for j = 0:Ne
%         E = i*dE;
%         e = j*de;
%         %T = 1;
%         Asquare = Gamma^2/(((E-e)^2+Gamma^2/4)^2);
%         %dF(i) = (1/KbT)*exp((E+KbT)/KbT)/(exp((E+KbT)/KbT)+1)^2;
%         dF = (1/KbT)*exp((E-Ef)/KbT)/(exp((E-Ef)/KbT)+1)^2;
%     
%         dG = C*t1^2*Asquare*dF*dE*de;
%         G = G+dG;
%     end
% end

G = G * 1.0e8; %(angstroms^2 / miron^2)
G
rho = 1/G; % (ohm*micron^2)
rho



% % Charge density
% 
% density =0;
% for i = 0:1000
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
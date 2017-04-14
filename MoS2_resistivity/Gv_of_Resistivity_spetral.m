% Sum up the resistivity from DOM and T(E) relations

G = 0;
kboltz = 8.617332e-5; %(eV/K)
Temp = 300 %(K)
m0 = 0.511e6; %(eV A)
mx = 0.62*m0;   
my = 0.62*m0;
hbarc = 1973.27; %(eV A)
hc = 2*pi*hbarc;    
c = 3.0*10^18; % (A/sec)
q = 1.602*10^-19;
t0 = 623.2/2000;
t1 = 623.2/2000; %517.6/2000; 
t2 = 518.0/2000;
t3 = 511.2/2000;
t4 = 482.7/2000;
KbT = kboltz * Temp;
%h=6.626e-34;
Gamma = 80/1000; %80 meV


%%%%%%%%%%%%%%%%%%%%%%%%%%%%  one variable integral %%%%%%%%%%%%%%%%%%%%%%

NE = 300000;
dE = 10*KbT/NE;
Ef = -KbT;

C= q*c/(2*pi^2)*sqrt(mx*my)/(hbarc^3);

for i = -NE:NE
        E = i*dE;
        %T = 1;
        u = 2*E/Gamma;
        A = 2*t1^2/Gamma*(2*u/(1+u^2)+pi+2*atan(u));
        %dF(i) = (1/KbT)*exp((E+KbT)/KbT)/(exp((E+KbT)/KbT)+1)^2;
        dF = (1/KbT)*exp((E-Ef)/KbT)/(exp((E-Ef)/KbT)+1)^2;
    
        dG = C*A*dF*dE;
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
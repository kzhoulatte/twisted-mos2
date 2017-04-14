% Calculate phonon mediated conductance for twisted bilayer MoS2

clear all
clc
format long
angle = 13.79; %[13.79, 21.78, 27.79];
a = 3.179;% angstrom 

K = 4*pi/(3*a);   % angstrom^-1
kk = 0.2089; % The K vector in w q relation Bishjiwat
t = 1.137;  % eV. coupling between neighbours % from paper "Magnetoelectric effects in TMDC"
q = 2*K*sin(angle/180*pi/2); 
qq = q*kk/K;
disp(qq)    %0.0502   0.0789   0.1003

A0 = a*a*sqrt(3)/2;
% From phonon dispersion w_theta(q) and n_theta
% Use phonon dispersion for monolayer MoS2

% In monolayer
% MoS2, DFT calculation gives ge = 0.11 eV (0.08 eV)
% for LA (A1') phonons with wave vectors in the vicinity
% of M and gh 0.1 eV for TA phonons with wave
% vectors in the vicinity of -K'.

hbarc = 1973.27;%(eV A)
c = 3.0*10^18; % (A/sec)
e = 1; %1.602*10^-19;
kboltz = 8.617332e-5; %(eV/K)
Temp = 300; %(K)
h=4.1357*10^-15; % eV*s
KbT = kboltz * Temp;

vf = sqrt(3)*t*a*c/(2*hbarc);  % angstrom / s
m0 = 0.511e6/(c^2); %(eV/c^2)
%m0 = 9.109*10^-31;  % kg
g0 = 0.11; %eV
M = 1822.888*m0; % Mo mass
w = (177.8481+177.2354)/(2*33.356)*4.1357*10^-3; % 13 degree eV %*10^-8;
%w = 155.7580;   %(155.7580+176.3013)/2   % 27 degree
%w = 163.0175;   %(163.0175+174.4981)/2   % 21 degree
n = 1/(exp(w/KbT-1));
g = sqrt(2*M*w*c/(h*hbarc))*g0;
Ef = 1/2*m0*vf^2; 

Gph = 2*pi*e^2*g^2*n*Ef^2*A0*c^4/(M*(w/h)*pi^2*hbarc^4*vf^4)*10^8;
disp(Gph)

% 1 um = 10^-6 m 

% Or mobility from tau time in paper 

tau = 50*10^-15; % fs
m1 = m0;
masse = 0.60*m1;
massh = 0.68*m1;
sigmae = 0;
sigmah = 0;
ue = e*tau/masse;
uh = e*tau/massh;
for i = 1: 10000
    Ec = i*0.01; 
    Ev = i*0.01;
    gc = 8*pi*sqrt(2)/(h^3)*masse^(3/2)*sqrt(Ec+KbT);     % Density of States; 
    gv = 8*pi*sqrt(2)/(h^3)*massh^(3/2)*sqrt(Ev+KbT); 
    fEc = 1/(1+exp(Ec+KbT)/KbT);
    fEv = 1/(1+exp(Ev+KbT)/KbT);
    n = gc*fEc;
    p = gv*fEv;
    sigmae = sigmae+e*n*ue;
    sigmah = sigmah+e*p*uh;
end

disp(sigmae)
disp(sigmah)

% mass of e and h could be mz for bulk structure. 
% -KbT as fermi level; do intergral over the energy range




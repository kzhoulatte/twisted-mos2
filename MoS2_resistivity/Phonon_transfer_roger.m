% Calculate phonon mediated conductance for twisted bilayer MoS2

clear all
clc
format long
angle = [13.79, 21.78, 27.79];
a = 3.179;

 K = 4*pi/(3*a);   % angstrom^-1
% kk = 0.2089; % The K vector in w q relation Bishjiwat
% t = 1.137;  % eV. coupling between neighbours % from paper "Magnetoelectric effects in TMDC"
 q1 = 2*K*sin(angle(1)/180*pi/2); 
 q2 = 2*K*sin(angle(2)/180*pi/2); 
 q3 = 2*K*sin(angle(3)/180*pi/2); 
 
 qq1 = q1/(2*pi/a); 
 qq2 = q2/(2*pi/a);
 qq3 = q3/(2*pi/a);
% qq = q*kk/K;
disp(q1)    %0.0502   0.0789   0.1003
disp(q2)
disp(q3)

disp(qq1)    %0.0502   0.0789   0.1003
disp(qq2)
disp(qq3)

w1 = 107.8429/(33.356)*4.1357*10^-3;      % 177.2354/(2*33.356)*4.1357*10^-3; % 13 degree
w2 = 158.8931/(33.356)*4.1357*10^-3;     % 27 degree
w3 = 191.0945/(33.356)*4.1357*10^-3;     % 21 degree


kboltz = 8.617332e-5; %(eV/K)
Temp = 300; %(K)
KbT = kboltz * Temp;
sigma0 =  1.329; %6.53*10^(-4);
sigmae1 = 0;
sigmae2 = 0;
sigmae3 = 0;
n1 = 1/(exp(w1/KbT-1));
n2 = 1/(exp(w2/KbT-1));
n3 = 1/(exp(w3/KbT-1));
dE = 0.002;


for i = 0: 1000000
    Ec = i*dE; 
    fc = 1/(1+exp(Ec+KbT)/KbT);
    fcp = 1/(1+exp(Ec+w1+KbT)/KbT);
    %sum = (n1*fc*(1-fc)*(1-fcp)+(n1+1)*fc*(1-fc)*(fcp)+(n1+1)*fcp*(1-fcp)*(1-fc)+n1*fcp*(1-fcp)*fc);
    sum = dE*1/KbT*(n1*fc*(1-fc)*(1-fcp)+(n1+1)*fc*(1-fc)*(fcp)+(n1+1)*fcp*(1-fcp)*(1-fc)+n1*fcp*(1-fcp)*fc);
    sigmae1 = sigmae1+sigma0*sum;
end

for i = 0: 1000000
    Ec = i*dE; 
    fc = 1/(1+exp(Ec+KbT)/KbT);
    fcp = 1/(1+exp(Ec+w2+KbT)/KbT);
    %sum = (n2*fc*(1-fc)*(1-fcp)+(n2+1)*fc*(1-fc)*(fcp)+(n2+1)*fcp*(1-fcp)*(1-fc)+n2*fcp*(1-fcp)*fc);
    sum = dE*1/KbT*(n2*fc*(1-fc)*(1-fcp)+(n2+1)*fc*(1-fc)*(fcp)+(n2+1)*fcp*(1-fcp)*(1-fc)+n2*fcp*(1-fcp)*fc);
    sigmae2 = sigmae2+sigma0*sum;
end

for i = 0: 1000000
    Ec = i*dE; 
    fc = 1/(1+exp(Ec+KbT)/KbT);
    fcp = 1/(1+exp(Ec+w1+KbT)/KbT);
    %sum = (n3*fc*(1-fc)*(1-fcp)+(n3+1)*fc*(1-fc)*(fcp)+(n3+1)*fcp*(1-fcp)*(1-fc)+n3*fcp*(1-fcp)*fc);
    sum = dE*1/KbT*(n3*fc*(1-fc)*(1-fcp)+(n3+1)*fc*(1-fc)*(fcp)+(n3+1)*fcp*(1-fcp)*(1-fc)+n3*fcp*(1-fcp)*fc);
    %disp(sum)
    sigmae3 = sigmae3+sigma0*sum;
end

resis1 = 1/sigmae1;
resis2 = 1/sigmae2;
resis3 = 1/sigmae3;

% 
disp(sigmae1)
disp(sigmae2)
disp(sigmae3)

disp(resis1)
disp(resis2)
disp(resis3)

% 1 um = 10^-6 m 

% Or mobility from tau time in paper 

% mass of e and h could be mz for bulk structure. 
% -KbT as fermi level; do intergral over the energy range




% Can be used to get the Transmission manually for a kmesh.
% To integral Trans for the Kmesh;

clc;
clear;
cd /Users/kuanzhou/Documents/MATLAB/;
load KDatafile;
load Trans_Datafile;

Radius = 0.1;
K = KDatafile;
T = ones(81,1); %Trans_Datafile;
Angle0 = pi/6;
Kpoints1 = 21;
Kpoints2 = 20;
Kpoints3 = 20;
Kpoints4 = 20;
DeltaK = Radius / (Kpoints1-1);
DeltaTheta = Angle0 / 3;
TT1 = 0;TT2 = 0;
TT3 = 0;TT4 = 0;

% TTs are total transmission for each line
for i = 1:Kpoints1
   TT1 = TT1 + ((T(i)*i*DeltaK+T(i+1)*i*DeltaK)/2);% * DeltaK
end

for i = Kpoints1+1:Kpoints1+Kpoints2
   TT2 = TT2 + (T(i)+T(i+1))*(i-Kpoints1)*DeltaK/2; %*DeltaK;
end

for i = Kpoints1+Kpoints2+1:Kpoints1+Kpoints2+Kpoints3
   TT3 = TT3 + (T(i)+T(i+1))*(i-Kpoints1-Kpoints2)*DeltaK/2;  % *DeltaK;
end

for i = Kpoints1+Kpoints2+Kpoints3+1:Kpoints1+Kpoints2+Kpoints3+Kpoints4-1
   TT4 = TT4 + (T(i)+T(i+1))*(i-Kpoints1-Kpoints2-Kpoints3)*DeltaK/2; % *DeltaK;
end

TT4 = TT4 + T(Kpoints1+Kpoints2+Kpoints3+Kpoints4)*Kpoints1*DeltaK; %*DeltaK;
TotalT = (TT1+TT2+TT3+TT4)*DeltaK*DeltaTheta;
% AverageT = (TT1/(Kpoints1)+TT2/Kpoints2+TT3/Kpoints3+TT4/Kpoints4)/4;

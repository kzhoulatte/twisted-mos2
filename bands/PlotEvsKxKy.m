% Plot T vs Kx Ky - to get a 2D graph
% Kx Ky come from kmesh file, and T come from datafile generated.

clear;
clc;
cd /Users/kuanzhou/Documents/MATLAB/ToPlot3DEk_QE/;
load Kpoints;
load EDatafile;
figure;
% hold on;
%for i = 1:32
KpointsinCircle = Kpoints;
Evalues = EDatafile;
x = KpointsinCircle(:,1);
y = KpointsinCircle(:,2);
z = Evalues; %EKDatafile(:,i);
[X,Y]=meshgrid(min(x):0.1:max(x),min(y):0.1:max(y));
%Z = griddata(x,y,z,X,Y,'v4');
%surf(X,Y,Z);
%title('T vs Kx Ky');

%hold on
plot3(x,y,z,'*');
%end 


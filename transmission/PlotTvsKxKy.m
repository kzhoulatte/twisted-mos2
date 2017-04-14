% Plot T vs Kx Ky - to get a 2D graph
% Kx Ky come from kmesh file, and T come from datafile generated.

clear;
clc;
cd /Users/kuanzhou/Documents/Heterostructure/heterostructure/hetero_282_381/;
load Kpts;
load datafile_kpt381_5;
figure;
% hold on;
%for i = 1:32
Kpoints = Kpts;
trans = datafile_kpt381_5;
x = Kpoints(:,1);
y = Kpoints(:,2);
z = trans; %EKDatafile(:,i);
[X,Y]=meshgrid(min(x):0.1:max(x),min(y):0.1:max(y));
%Z = griddata(x,y,z,X,Y,'v4');
%surf(X,Y,Z);
%title('T vs Kx Ky');

%hold on
plot3(x,y,z,'*');

%gscatter(x,y,z,'br','xo');
%axis([0 0.5 0 0.5]);
%end 


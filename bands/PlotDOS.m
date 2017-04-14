clear;
clc;
cd /Users/kuanzhou/Documents/MATLAB/;
load mos2.dos
e1 = 6;
e2 = 12;
%t1 = 0;
x = mos2(:,1);
y = mos2(:,2);
z = mos2(:,3);

plot(x,y);
xlim([e1,e2]);

%axis([e1 e2 t1 t2]);

%clear;
clc;
cd /Users/kuanzhou/Documents/MATLAB/Datas/TE_dk100_a7/;
%load KpointsIn7lines_Gamma_Cart_100_angle7;
load TotalTrans;
mos2_trans = TotalTrans;
Energy = -0.55:-0.025:-1.3;
figure;
plot(Energy,mos2_trans,Energy,mos2_trans,'s');
xlabel('E-Ef');
ylabel('Transmission');
title('T vs E-Ef');


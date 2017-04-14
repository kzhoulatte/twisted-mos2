% Use HS_sum_calculator to get eigenvalues of different of HS of k points
% k1,k2,k3


% The orbitals are: 
% S:  0s 1s 0px 0py 0pz 1px 1py 1pz d3z^2-r^2 dx^2-y^2 dxy dxz dyz 
% Mo: 0s 1s 0px 0py 0pz 1px 1py 1pz d3z^2-r^2 dx^2-y^2 dxy dxz dyz 
% S:  0s 1s 0px 0py 0pz 1px 1py 1pz d3z^2-r^2 dx^2-y^2 dxy dxz dyz 

clear;clc;
format long;


k = [0.3333,0.3333,0];
g = [0,0,0];
m = [0.5,0,0];


for i=1:1
        k1 = 0; %0.3333/20*(20-i+1);
        k2 = 0; %0.3333/20*(20-i+1);
        k3 = 0;
        [HS,HS2] = sum_calculator(k1,k2,k3);
        [S,S2] = S_sum_calculator(k1,k2,k3);
        SS = (S+conj(S)')/2;
        SSS = round(S*10^10)/10^10;
        a = eig(HS,SS);
        b = real(a);
        c = sort(b);
        kk = sqrt((k1-k(1))^2+(k2-k(2))^2+(k3-k(3))^2);
        plot(kk,c,'s');
        hold on;
end



% for i=1:20
%         k1 = 0.5/20*(i);
%         k2 = 0;
%         k3 = 0;
%         [HS,HS2] = sum_calculator(k1,k2,k3);
%         [S,S2] = S_sum_calculator(k1,k2,k3);
%         SS = (S+conj(S)')/2;
%         SSS = round(S*10^10)/10^10;
%         a = eig(HS,SS);
%         b = real(a);
%         c = sort(b);
%         kk = 0.3333*sqrt(2)+sqrt(k1^2+k2^2+k3^2);
%         plot(kk,c,'s');
%         hold on;
% end
% 
% 
% for i=1:20
%         k1 = -(0.5-0.3333)/20*i+0.50;
%         k2 = 0.3333/20*i;
%         k3 = 0;
%         [HS,HS2] = sum_calculator(k1,k2,k3);
%         [S,S2] = S_sum_calculator(k1,k2,k3);
%         SS = (S+conj(S)')/2;
%         SSS = round(S*10^10)/10^10;
%         a = eig(HS,SS);
%         b = real(a);
%         c = sort(b);
%         kk = 0.3333*sqrt(2)+0.5+sqrt((k1-m(1))^2+(k2-m(2))^2+(k3-m(3))^2);
%         plot(kk,c,'s');
%         hold on;
% end
% 
% Efermi = -0.1953125000;
% xlim([0,1.2492]);
% ylim([-3,3]);
% 
% 
% % b = round(S*1000)/1000
% % c = round(HS*1000)/1000
% % eig(HS*inv(S))
% % eig_sort = sort(eig)



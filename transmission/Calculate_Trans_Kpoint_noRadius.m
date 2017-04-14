% function Calculate_Trans_Gamma(filein_Kfile,filein_Tfile)
%CALCULATE_TRANS Summary of this function goes here
%   Detailed explanation goes here
clear;
clc;
cd /Users/kuanzhou/Documents/MATLAB/Datas/T381_points/E_m60m70m80/;

%filin_Kfile = 'Kpoinsbetween4lines_381';
%filein_Tfile = 'datafile2_10';

load Kpointsbetween4lines_381;
load datafile2_m150;
kk = Kpointsbetween4lines_381;
tt = datafile2_m150;

Km = 0.2;
trans = 0;
count = 0;
n = 381;

for i = 1:n
    if (kk(i,1)^2+kk(i,2)^2 >= Km^2)
        count = count+1;
        trans = trans + tt(i);
    end
end

Transmission = trans / 381;

    



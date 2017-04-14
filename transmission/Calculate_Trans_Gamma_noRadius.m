% function Calculate_Trans_Gamma(filein_Kfile,filein_Tfile)
%CALCULATE_TRANS Summary of this function goes here
%   Detailed explanation goes here
clear;
clc;
cd /Users/kuanzhou/Documents/MATLAB/Datas/T381_points/E_m60m70m80/;

%filin_Kfile = 'Kpoinsbetween4lines_381';
%filein_Tfile = 'datafile2_10';

load Kpointsbetween4lines_381;
load datafile2_m60;
kk = Kpointsbetween4lines_381;
tt = datafile2_m60;

Km = 0.2;
trans = 0;
trans1 = 0;
trans2 = 0;
count = 0;
n = 381;

for i = 1:n
    if (kk(i,1)^2+kk(i,2)^2 <= Km^2)
        count = count+1;
        trans = trans + tt(i);
    end
end

for i = 1:n
    if (kk(i,2) / kk(i,1) == 0)
        count = count+1;
        trans1 = trans1 + tt(i);
    end
end

for i = 1:n
    if (abs(kk(i,2) / kk(i,1) - tan(pi/3)) <= 0.0001)
        count = count+1;
        trans2 = trans2 + tt(i);
    end
end

Transmission = (trans - 1/2*trans1 -1/2*trans2) / 381;

    



% to help find the datas in a specific file and generate another file with
% only the needed data.

clc;
clear;
cd /Users/kuanzhou/Documents/MATLAB/MoS2_Bulk/;
filein = 'mos2.band';
fileout = 'EKDatafile';
for i = 1:141
    line = 5 * i - 3;  % line = 3,4,5; 9,10,11; 15,16,17; ...
    EveryNlines_dataread(filein,fileout,line);
end

    

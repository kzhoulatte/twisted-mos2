% to help find the datas in a specific file and generate another file with
% only the needed data.

clc;
clear;
cd /Users/kuanzhou/Documents/MATLAB/Trans_near_Gamma_circle/M40_2/mos2_M40_M2.TRANS.cond_save/;
k=1:317;
e=2;
line =8;
fileout = 'datafile2';
for i = 1:317
    filein = ['transmission_k',num2str(k(i)),'_e',num2str(e)];
    Mydataread(filein,fileout,line);
end

    
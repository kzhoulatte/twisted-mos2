% In order to get the K points/K line along the G M line


clc;
clear;
cd /Users/kuanzhou/Documents/MATLAB/;

fid = fopen('KpointsInlineGM','a+');

Kpoints = 50;
%Kpoints2 = 50;
%Kpoints3 = 50;
wt = 6;
K0 = [0,0,0];
KM = [2/3,0,0];

for i = 0:Kpoints
    Kp1 = ((Kpoints-i)*K0+i*KM)/Kpoints;  
    fprintf(fid,'%16g ',Kp1);
    fprintf(fid,'%16g \n',wt);
end

%fprintf(fid,'\n');


%fprintf(fid,'\n');

fclose(fid);




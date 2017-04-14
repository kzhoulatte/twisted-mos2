% In order to get the K points/K line along the G M K line

% For the case 
%   0.0000000000     0.0000000000     0.5000000000     K.1
%   0.6666666667    -0.3333333333     0.5000000000     K.2
%   0.5000000000     0.0000000000     0.5000000000     K.3
%   0.0000000000     0.0000000000     0.5000000000     K.4

clc;
clear;
cd /Users/kuanzhou/Documents/MATLAB/ToGenerateKpoints/Angle120forBasis/;
%A1 = ((2/3)^2 + (-1/3)^2)^(1/2);
%A2 = ((2/3-1/2)^2 + (-1/3)^2)^(1/2);
%A3 = ((1/2)^2 + 0^2)^(1/2);

fid = fopen('KpointsInlineGMK','a+');

Kpoints1 = 20;
Kpoints2 = 20;
Kpoints3 = 20;
wt = 1/(60);

for i = 1:Kpoints1
    Kp1 = ((Kpoints1-i)*[0,0,0]+i*[1/2,0,0])/Kpoints1;  
    fprintf(fid,'%16g ',Kp1);
    fprintf(fid,'%16g \n',wt);
end

%fprintf(fid,'\n');

for i = 1:Kpoints2
    Kp2 = ((Kpoints2-i)*[1/2,0,0]+i*[2/3,1/3,0])/Kpoints2;  
    fprintf(fid,'%16g ',Kp2);
    fprintf(fid,'%16g \n',wt);
end

%fprintf(fid,'\n');

for i = 1:Kpoints3
    Kp3 = ((Kpoints3-i)*[2/3,1/3,0]+i*[0,0,0])/Kpoints3;  
    fprintf(fid,'%16g ',Kp3);
    fprintf(fid,'%16g \n',wt);
end

%fprintf(fid,'\n');

fclose(fid);




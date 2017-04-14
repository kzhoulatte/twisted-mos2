% This can be used to generate K points in 1/6 of the hexagonal Kmesh. In order to see the
% transmission or energy in a circle.
% For the K points Setting to be crystal

clc;
clear;
Angle0 = pi/6;
M0 = [0.5,0,0];
M1 = [0,0.5,0];
K0 = [1/3,1/3,0];
P0 = K0 + (M0 - K0)/2;
P1 = K0 + (M1 - K0)/2;

fid = fopen('KpointsIn5lines','a+');

Kpoints1 = 20;
Kpoints2 = 20;
Kpoints3 = 20;
Kpoints4 = 20;
Kpoints5 = 20;
wt0 = 1/(100);

for i = 1:Kpoints1
    Kp1 = M0 * i / Kpoints1;  
    fprintf(fid,'%15g ',Kp1);
    wt1 = wt0 ;
    fprintf(fid,'%15g \n',wt0);
end

%fprintf(fid,'\n');

for i = 1:Kpoints2
    Kp2 = P0 * i / Kpoints2;  
    wt2 = 1;
    fprintf(fid,'%15g ',Kp2);
    fprintf(fid,'%15g \n',wt0);
end

%fprintf(fid,'\n');

for i = 1:Kpoints3
    Kp3 = K0 * i/Kpoints3; 
    wt3 = 1;
    fprintf(fid,'%15g ',Kp3);
    fprintf(fid,'%15g \n',wt0);
end

for i = 1:Kpoints4
    Kp4 = P1 * i/Kpoints4;  
    wt4 = 1;
    fprintf(fid,'%15g ',Kp4);
    fprintf(fid,'%15g \n',wt0);
end

for i = 1:Kpoints5
    Kp5 = M1 * i/Kpoints5;  
    wt5 = 1;
    fprintf(fid,'%15g ',Kp5);
    fprintf(fid,'%15g \n',wt0);
end

%fprintf(fid,'\n');

fclose(fid);






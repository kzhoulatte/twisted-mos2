% This can be used to generate K points in a circle. In order to see the
% transmission in a circle.
% For the K points Setting to be default

clc;
clear;
Radius = 0.2;
Angle0 = pi/6;
K0 = [0,0,0];
K1 = [Radius,0,0];
K2 = [Radius*cos(Angle0),Radius*sin(Angle0),0];
Angle1 = Angle0 / 3;Angle2 = Angle0*2/3;
KM1 = [Radius*cos(Angle1),Radius*sin(Angle1),0];
KM2 = [Radius*cos(Angle2),Radius*sin(Angle2),0];

fid = fopen('KpointsIn4lines','a+');

Kpoints1 = 40;
Kpoints2 = 40;
Kpoints3 = 40;
Kpoints4 = 40;
% wt0 = 1/(80);

for i = 0:Kpoints1
    Kp1 = ((Kpoints1-i)*K0+i*K1)/Kpoints1;  
    fprintf(fid,'%15g ',Kp1);
    wt1 = 6;
    fprintf(fid,'%15g \n',wt1);
end

%fprintf(fid,'\n');

for i = 1:Kpoints2
    Kp2 = ((Kpoints2-i)*K0+i*KM1)/Kpoints2;  
    wt2 = 12;
    fprintf(fid,'%15g ',Kp2);
    fprintf(fid,'%15g \n',wt2);
end

%fprintf(fid,'\n');

for i = 1:Kpoints3
    Kp3 = ((Kpoints3-i)*K0+i*KM2)/Kpoints3; 
    wt3 = 12;
    fprintf(fid,'%15g ',Kp3);
    fprintf(fid,'%15g \n',wt3);
end

for i = 1:Kpoints4
    Kp4 = ((Kpoints4-i)*K0+i*K2)/Kpoints4;  
    wt4 = 6;
    fprintf(fid,'%15g ',Kp4);
    fprintf(fid,'%15g \n',wt4);
end

%fprintf(fid,'\n');

fclose(fid);






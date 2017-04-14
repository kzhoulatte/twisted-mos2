% This can be used to generate K points in a circle. In order to see the
% transmission in a circle.
% For the Gamma points Setting to be default

clc;
clear;
Radius = 0.2;
Angle0 = pi/6; Theta = pi / 18;
K0 = [0.5,0.2887,0];
Angle1 = Theta * [0,2,4,6,8,10,12]+15* Theta * [1,1,1,1,1,1,1];
% Angle1 = Angle0 / 3;Angle2 = Angle0*2/3;

  KG1 = [Radius*cos(Angle1(1)),Radius*sin(Angle1(1)),0]+K0;
   KG2 = [Radius*cos(Angle1(2)),Radius*sin(Angle1(2)),0]+K0;
    KG3 = [Radius*cos(Angle1(3)),Radius*sin(Angle1(3)),0]+K0;
     KG4 = [Radius*cos(Angle1(4)),Radius*sin(Angle1(4)),0]+K0;
      KG5 = [Radius*cos(Angle1(5)),Radius*sin(Angle1(5)),0]+K0;
       KG6 = [Radius*cos(Angle1(6)),Radius*sin(Angle1(6)),0]+K0;
        KG7 = [Radius*cos(Angle1(7)),Radius*sin(Angle1(7)),0]+K0;

fid = fopen('KpointsIn7linesKPOINT_Cart_120','a+');
m =120;
Kpoints1 = m;
Kpoints2 = m;
Kpoints3 = m;
Kpoints4 = m;
Kpoints5 = m;
Kpoints6 = m;
Kpoints7 = m;

% wt0 = 1/(80);

for i = 1:Kpoints1
    Kp1 = (K0*(Kpoints1-i)+i*KG1)/Kpoints1;  
    fprintf(fid,'%15g ',Kp1);
    wt1 = 1;
    fprintf(fid,'%15g \n',wt1);
end

%fprintf(fid,'\n');

for i = 1:Kpoints2
    Kp2 = (K0*(Kpoints2-i)+i*KG2)/Kpoints2;  
    fprintf(fid,'%15g ',Kp2);
    wt1 = 1;
    fprintf(fid,'%15g \n',wt1);
end

%fprintf(fid,'\n');

for i = 1:Kpoints3
    Kp3 = (K0*(Kpoints3-i)+i*KG3)/Kpoints3;  
    fprintf(fid,'%15g ',Kp3);
    wt1 = 1;
    fprintf(fid,'%15g \n',wt1);
end

for i = 1:Kpoints4
    Kp4 = (K0*(Kpoints4-i)+i*KG4)/Kpoints4;  
    fprintf(fid,'%15g ',Kp4);
    wt1 = 1;
    fprintf(fid,'%15g \n',wt1);
end

for i = 1:Kpoints5
    Kp5 = (K0*(Kpoints5-i)+i*KG5)/Kpoints5;  
    fprintf(fid,'%15g ',Kp5);
    wt1 = 1;
    fprintf(fid,'%15g \n',wt1);
end

for i = 1:Kpoints6
    Kp6 = (K0*(Kpoints6-i)+i*KG6)/Kpoints6;  
    fprintf(fid,'%15g ',Kp6);
    wt1 = 1;
    fprintf(fid,'%15g \n',wt1);
end

for i = 1:Kpoints7
    Kp7 = (K0*(Kpoints7-i)+i*KG7)/Kpoints7;  
    fprintf(fid,'%15g ',Kp7);
    wt1 = 1;
    fprintf(fid,'%15g \n',wt1);
end
%fprintf(fid,'\n');

fclose(fid);






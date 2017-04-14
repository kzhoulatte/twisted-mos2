% This can be used to generate K points in a circle. In order to see the
% transmission in a circle.
% For the Gamma points Setting to be default

clc;
clear;
Radius = 0.2;
num = 7;
fid = fopen('KpointsIn7lines_Gamma_Cart_200_angle7','a+');
Angle0 = pi/3; 
Theta = Angle0 / (num-1);
Gamma = [0,0,0];
% K1 = [0.5,0.2887,0];
AG = 1:num;
Angle1 = Theta * (AG-1);
KG = ones(num,3);
% Angle1 = Angle0 / 3;Angle2 = Angle0*2/3;

for i = 1: num
  KG(i,:) = [Radius*cos(Angle1(i)),Radius*sin(Angle1(i)),0];
end

Kpoints = 200;
Kp = ones(num,3);
% wt0 = 1/(80);

for i = 1:num
    for j = 1:Kpoints
         Kp1 = (j*KG(i,:))/Kpoints;  
         fprintf(fid,'%15g ',Kp1);
         wt1 = 1;
         fprintf(fid,'%15g \n',wt1);
    end
end

fclose(fid);






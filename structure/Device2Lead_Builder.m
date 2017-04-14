% This converter can convert POSCAR from Direct (Relative) coordinates to Cartsian in angstroms;  
% Cartsian coordinates are more favorable in calculations as I see.  


% From the original rotated device;
% Extend the structure and exchange the positions for one layer

clc;clear;
format long;

input = 'POSCAR_21_MoS2_rot';
output1 = 'Lead1_dat.POSCAR.vasp';
output2 = 'Lead2_dat.POSCAR.vasp';


 z_S1 = -0.072523697119310;
 z_S2 = 3.076215707323227;
 z_Mo = 1.502031963607006;
 dist = 4.2256717630000002/2;   % Distance between AB layers

fd1 = fopen(input,'r');
fd_lead1 = fopen(output1,'a+');
fd_lead2 = fopen(output2,'a+');

for i = 1:1 
    line = fgetl(fd1);
    fprintf(fd_lead1,'%s\n',line);
    fprintf(fd_lead2,'%s\n',line);
end

unit_length = fgetl(fd1);
unit_length = str2num(unit_length);
fprintf(fd_lead1,'%2.10f\n',unit_length);
fprintf(fd_lead2,'%2.10f\n',unit_length);

a = textscan(fd1,'%f %f %f',1);
fprintf(fd_lead1,'%2.16f    %2.16f    %2.16f\n',a{1},a{2},a{3});
fprintf(fd_lead2,'%2.16f    %2.16f    %2.16f\n',a{1},a{2},a{3});
b = textscan(fd1,'%f %f %f',1);
fprintf(fd_lead1,'%2.16f    %2.16f    %2.16f\n',b{1},b{2},b{3});
fprintf(fd_lead2,'%2.16f    %2.16f    %2.16f\n',b{1},b{2},b{3});
c = textscan(fd1,'%f %f %f',1);
fprintf(fd_lead1,'%2.16f    %2.16f    %2.16f\n',c{1},c{2},2*dist);
fprintf(fd_lead2,'%2.16f    %2.16f    %2.16f\n',c{1},c{2},2*dist);

R1 = [a{1},a{2},a{3}]*unit_length;
R2 = [b{1},b{2},b{3}]*unit_length;
R3 = [c{1},c{2},2*dist]*unit_length;


for i = 1:1
    tline = fgetl(fd1);
    line = fgetl(fd1);
    fprintf(fd_lead1,'%s\n',line);
    fprintf(fd_lead2,'%s\n',line);
end

NUM = fgetl(fd1);
NUM = str2num(NUM);
num = NUM(1);
fprintf(fd_lead1,'%2.0f %2.0f\n',num,num*2);
fprintf(fd_lead2,'%2.0f %2.0f\n',num,num*2);


for i = 1:1 
    line = fgetl(fd1);
    New = 'Direct';
    fprintf(fd_lead1,'%s\n',New);
    fprintf(fd_lead2,'%s\n',New);
end

pos = textscan(fd1,'%f %f %f',num*3);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Lead 1 for the unrotated part from bottom layer %%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Extend the structure to get the leads

% theta_deg = 2*180/pi*asin(1/(2*sqrt(7)));
% theta = 2*asin(1/(2*sqrt(7)));

for i = 1:num/2
    element = 'Mo';
    spin = 7.0;
    RR = pos{1}(i)*[1,0,0] + pos{2}(i)* [0,1,0]+pos{3}(i)*[0,0,1];
    x = RR(1);
    y = RR(2);
    z = RR(3);
    fprintf(fd_lead1,'%2.16f    %2.16f    %2.16f\n',x,y,z);
    %fprintf(fd2,'%g  %s  %2.16f    %2.16f    %2.16f   %2.1g   %2.1g\n',i,element,x,y,z,spin,spin);
end


% Mo atoms in extended layer:


for i = 2*num/2+1:num+num/2
    element = 'Mo';
    spin = 7.0;
    RR = pos{1}(i)*[1,0,0] + pos{2}(i)* [0,1,0]+pos{3}(i)*[0,0,1]+[0,0,dist];
    x = RR(1);
    y = RR(2);
%     z = RR(3);
    z3 = z_Mo+dist;
    fprintf(fd_lead1,'%2.16f    %2.16f    %2.16f\n',x,y,z3);
    %fprintf(fd2,'%g  %s  %2.16f    %2.16f    %2.16f   %2.1g   %2.1g\n',i,element,x,y,z,spin,spin);
end


% S atoms in extended layer


for i = 1:num/2
    element = 'S';
    spin = 7.0;
    RR = pos{1}(i)*[1,0,0] + pos{2}(i)* [0,1,0]+pos{3}(i)*[0,0,1]+ [0,0,dist];
    x = RR(1);
    y = RR(2);
    %z = RR(3);
    z1 = z_S1+dist;
    
    fprintf(fd_lead1,'%2.16f    %2.16f    %2.16f\n',x,y,z1);
    %fprintf(fd2,'%g  %s  %2.16f    %2.16f    %2.16f   %2.1g   %2.1g\n',i,element,x,y,z,spin,spin);
end


% S atoms in extended layer


for i = 1:num/2
    element = 'S';
    spin = 7.0;
    RR = pos{1}(i)*[1,0,0] + pos{2}(i)* [0,1,0]+pos{3}(i)*[0,0,1]+ [0,0,dist];
    x = RR(1);
    y = RR(2);
    %z = RR(3);
    
    z2 = z_S2+dist;
    
    fprintf(fd_lead1,'%2.16f    %2.16f    %2.16f\n',x,y,z2);
    %fprintf(fd2,'%g  %s  %2.16f    %2.16f    %2.16f   %2.1g   %2.1g\n',i,element,x,y,z,spin,spin);
end




% S atoms in layer:


for i = num/2*2+1:num+num/2
    element = 'S';
    spin = 3.0;
    RR = pos{1}(i)*[1,0,0] + pos{2}(i)* [0,1,0]+pos{3}(i)*[0,0,1];
    x = RR(1);
    y = RR(2);
    z = RR(3);
    fprintf(fd_lead1,'%2.16f    %2.16f    %2.16f\n',x,y,z);
    %fprintf(fd2,'%g  %s  %2.16f    %2.16f    %2.16f   %2.1g   %2.1g\n',i,element,x,y,z,spin,spin);
end


for i = num/2*4+1:2*num+num/2
    element = 'S';
    spin = 3.0;
    RR = pos{1}(i)*[1,0,0] + pos{2}(i)* [0,1,0]+pos{3}(i)*[0,0,1];
    x = RR(1);
    y = RR(2);
    z = RR(3);
    fprintf(fd_lead1,'%2.16f    %2.16f    %2.16f\n',x,y,z);
    %fprintf(fd2,'%g  %s  %2.16f    %2.16f    %2.16f   %2.1g   %2.1g\n',i,element,x,y,z,spin,spin);
end





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Lead 2 for the rotated part from top layer %%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


 zz_S1 = 6.904570233;
 zz_S2 = 10.033940133;
 zz_Mo = 8.470535668;
 dist = 12.8729190826/2;   % Distance between AB layers


% Extend the structure to get the leads

% theta_deg = 2*180/pi*asin(1/(2*sqrt(7)));
% theta = 2*asin(1/(2*sqrt(7)));

for i = num/2+1:num
    element = 'Mo';
    spin = 7.0;
    RR = pos{1}(i)*[1,0,0] + pos{2}(i)* [0,1,0]+pos{3}(i)*[0,0,1];
    x = RR(1);
    y = RR(2);
    z = RR(3);
    fprintf(fd_lead2,'%2.16f    %2.16f    %2.16f\n',x,y,z);
    %fprintf(fd2,'%g  %s  %2.16f    %2.16f    %2.16f   %2.1g   %2.1g\n',i,element,x,y,z,spin,spin);
end


% Mo atoms in extended layer:


for i = 3*num/2+1:num+num
    element = 'Mo';
    spin = 7.0;
    RR = pos{1}(i)*[1,0,0] + pos{2}(i)* [0,1,0]+pos{3}(i)*[0,0,1]+[0,0,-dist];
    x = RR(1);
    y = RR(2);
%     z = RR(3);
    z3 = zz_Mo-dist;
    fprintf(fd_lead2,'%2.16f    %2.16f    %2.16f\n',x,y,z3);
    %fprintf(fd2,'%g  %s  %2.16f    %2.16f    %2.16f   %2.1g   %2.1g\n',i,element,x,y,z,spin,spin);
end


% S atoms in extended layer


for i = num/2+1:num
    element = 'S';
    spin = 7.0;
    RR = pos{1}(i)*[1,0,0] + pos{2}(i)* [0,1,0]+pos{3}(i)*[0,0,1]+ [0,0,-dist];
    x = RR(1);
    y = RR(2);
    %z = RR(3);
    z1 = zz_S1-dist;
    
    fprintf(fd_lead2,'%2.16f    %2.16f    %2.16f\n',x,y,z1);
    %fprintf(fd2,'%g  %s  %2.16f    %2.16f    %2.16f   %2.1g   %2.1g\n',i,element,x,y,z,spin,spin);
end


% S atoms in extended layer


for i = num/2+1:num
    element = 'S';
    spin = 7.0;
    RR = pos{1}(i)*[1,0,0] + pos{2}(i)* [0,1,0]+pos{3}(i)*[0,0,1]+ [0,0,-dist];
    x = RR(1);
    y = RR(2);
    %z = RR(3);
    
    z2 = zz_S2-dist;
    
    fprintf(fd_lead2,'%2.16f    %2.16f    %2.16f\n',x,y,z2);
    %fprintf(fd2,'%g  %s  %2.16f    %2.16f    %2.16f   %2.1g   %2.1g\n',i,element,x,y,z,spin,spin);
end




% S atoms in layer:


for i = num/2*3+1:num+num
    element = 'S';
    spin = 3.0;
    RR = pos{1}(i)*[1,0,0] + pos{2}(i)* [0,1,0]+pos{3}(i)*[0,0,1];
    x = RR(1);
    y = RR(2);
    z = RR(3);
    fprintf(fd_lead2,'%2.16f    %2.16f    %2.16f\n',x,y,z);
    %fprintf(fd2,'%g  %s  %2.16f    %2.16f    %2.16f   %2.1g   %2.1g\n',i,element,x,y,z,spin,spin);
end


for i = num/2*5+1:2*num+num
    element = 'S';
    spin = 3.0;
    RR = pos{1}(i)*[1,0,0] + pos{2}(i)* [0,1,0]+pos{3}(i)*[0,0,1];
    x = RR(1);
    y = RR(2);
    z = RR(3);
    fprintf(fd_lead2,'%2.16f    %2.16f    %2.16f\n',x,y,z);
    %fprintf(fd2,'%g  %s  %2.16f    %2.16f    %2.16f   %2.1g   %2.1g\n',i,element,x,y,z,spin,spin);
end







%%%%%  For the rotated lead


% Rotz = [cos(theta),sin(theta),0;
%     -sin(theta),cos(theta),0;
%     0,0,1;];
% 
% for i = 1:num
%     element = 'Mo';
%     spin = 7.0;
%     RR = pos{1}(i)*[1,0,0] + pos{2}(i)* [0,1,0]+pos{3}(i)*[0,0,1];
%     RRR = Rotz*RR';
%     x = RRR(1);
%     y = RRR(2);
%     z = RRR(3);
%     fprintf(fd3,'%2.16f    %2.16f    %2.16f\n',x,y,z);
%     %fprintf(fd3,'%g  %s  %2.16f    %2.16f    %2.16f   %2.1g   %2.1g\n',i,element,x,y,z,spin,spin);
% end
% 
% 
% for i = num+1:num*3
%     element = 'S';
%     spin = 3.0;
%     RR = pos{1}(i)*[1,0,0] + pos{2}(i)* [0,1,0]+pos{3}(i)*[0,0,1];
%     RRR = Rotz*RR';
%     x = RRR(1);
%     y = RRR(2);
%     z = RRR(3);
%     fprintf(fd3,'%2.16f    %2.16f    %2.16f\n',x,y,z);
%     %fprintf(fd3,'%g  %s  %2.16f    %2.16f    %2.16f   %2.1g   %2.1g\n',i,element,x,y,z,spin,spin);
% end
% 


fclose('all');
    
% This converter can convert POSCAR from Direct (Relative) coordinates to Cartsian in angstroms;  
% Cartsian coordinates are more favorable in calculations as I see.  


clc;clear;
format long;

input = 'Lead1_dat.POSCAR.vasp';

d_device = 12.8729190825999993; %13.3500003814999992;

output = 'Lead1_dat';

fd1 = fopen(input,'r');
fd2 = fopen(output,'a+');

for i = 1:1 
    line = fgetl(fd1);
    fprintf(fd2,'%s\n',line);
end

unit_length = fgetl(fd1);
unit_length = str2num(unit_length);
fprintf(fd2,'%2.10f\n',unit_length);

a = textscan(fd1,'%f %f %f',1);
fprintf(fd2,'%2.16f    %2.16f    %2.16f\n',a{1},a{2},a{3});
b = textscan(fd1,'%f %f %f',1);
fprintf(fd2,'%2.16f    %2.16f    %2.16f\n',b{1},b{2},b{3});
c = textscan(fd1,'%f %f %f',1);
fprintf(fd2,'%2.16f    %2.16f    %2.16f\n',c{1},c{2},c{3});

R1 = [a{1},a{2},a{3}]*unit_length;
R2 = [b{1},b{2},b{3}]*unit_length;
R3 = [c{1},c{2},c{3}]*unit_length;


for i = 1:1
    tline = fgetl(fd1);
    line = fgetl(fd1);
    fprintf(fd2,'%s\n',line);
end

NUM = fgetl(fd1);
NUM = str2num(NUM);
num = NUM(1);
fprintf(fd2,'%2.0f %2.0f\n',num,num*2);

for i = 1:1 
    line = fgetl(fd1);
    New = 'Cartesian';
    fprintf(fd2,'%s\n',New);
end

pos = textscan(fd1,'%f %f %f',num*3);

for i = 1:num
    element = 'Mo';
    spin = 7.0;
    RR = pos{1}(i)*[1,0,0] + pos{2}(i)* [0,1,0]+pos{3}(i)*[0,0,1]-[0,0,d_device];
    x = RR(1);
    y = RR(2);
    z = RR(3);
    fprintf(fd2,'%g  %s  %2.16f    %2.16f    %2.16f   %2.1g   %2.1g\n',i,element,x,y,z,spin,spin);
end


for i = num+1:num*3
    element = 'S';
    spin = 3.0;
    RR = pos{1}(i)*[1,0,0] + pos{2}(i)* [0,1,0]+pos{3}(i)*[0,0,1]-[0,0,d_device];
    x = RR(1);
    y = RR(2);
    z = RR(3);
    fprintf(fd2,'%g  %s  %2.16f    %2.16f    %2.16f   %2.1g   %2.1g\n',i,element,x,y,z,spin,spin);
end


fclose('all');
    
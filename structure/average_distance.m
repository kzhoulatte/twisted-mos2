% This script is used for calculate average distance between layersn from POSCAR. 

clear;

format long;
dd = 0;
total1 = 0;
total2 = 0;

input = 'CONTCAR';

fd1 = fopen(input,'r');

for i = 1:1 
    line = fgetl(fd1);
end

unit_length = fgetl(fd1);
unit_length = str2num(unit_length);

a = textscan(fd1,'%f %f %f',1);
b = textscan(fd1,'%f %f %f',1);
c = textscan(fd1,'%f %f %f',1);

R1 = [a{1},a{2},a{3}]*unit_length;
R2 = [b{1},b{2},b{3}]*unit_length;
R3 = [c{1},c{2},c{3}]*unit_length;


for i = 1:1
    tline = fgetl(fd1);
end

NUM = fgetl(fd1);
NUM = str2num(NUM);
num = NUM(1);
num

for i = 1:1 
    line = fgetl(fd1);
end

pos = textscan(fd1,'%f %f %f',num*3);

for i = 1:num/2
    RR = pos{1}(i)*R1 + pos{2}(i)* R2+pos{3}(i)*R3;
    x = RR(1);
    y = RR(2);
    z = RR(3);
    total1 = total1+z;
end

for i = num/2+1:num
    RR = pos{1}(i)*R1 + pos{2}(i)* R2+pos{3}(i)*R3;
    x = RR(1);
    y = RR(2);
    z = RR(3);
    total2 = total2+z;
end

fclose('all');

dd = 2*(total2-total1)/num;
dd

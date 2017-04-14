% It can help generate K points by hand. The method is very stupid here. So
% use this script when you have no other methods.
clc;
clear;
a = 462;
k = ones(a,3);

for i = 1:63
    k(i,1) = 0;
end

for i = 64:120
    k(i,1)= 0.025;
end

for i = 121:174   %53
    k(i,1) = 0.05;
end

for i = 175:222  %47
    k(i,1) = 0.05;
end

for i = 223:267 %44
    k(i,1) = 0.05;
end

for i = 268:306  %38
    k(i,1) = 0.05;
end

for i = 307:342   %35
    k(i,1) = 0.05;
end

for i = 343:372
    k(i,1) = 0.05;
end

for i = 373:399
    k(i,1) = 0.05;
end

for i = 400:420
    k(i,1) = 0.05;
end

for i = 421:438
    k(i,1) = 0.05;
end

for i = 439:450
    k(i,1) = 0.05;
end

for i = 451:459
    k(i,1) = 0.05;
end

for i = 460:462
    k(i,1) = 0.05;
end

for i = 1:154
    k(3*i-2,2) = i*0.0289-0.0289;
    k(3*i-1,2) = i*0.0289-0.0289;
    k(3*i,2)   = i*0.0289-0.0289;
end

for i = 1:154
    k(3*i-2,3) = 0;
    k(3*i-1,3) = 0.0517;
    k(3*i,3)   = -0.1034;
end

[m,n]=size(k);
fid=fopen('Auto_kmesh.txt','a+');
for i=1:m 
        for j=1:n
        fprintf(fid,'%6g\t',k(i,j));
        end
fprintf(fid,'\n');
end

fclose(fid);
clear;

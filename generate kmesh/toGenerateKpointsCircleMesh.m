% In order to get the K points mesh in a circle

clc;
clear;
cd /Users/kuanzhou/Documents/MATLAB/ToGenerateKpoints/;
Radius = 0.34;
R = Radius;
x = -0:0.02:0.34;
y = -0:0.02:0.34;
n = 18;
k = cell(n,n);


fid = fopen('KpointsinCircle1','a+');

for i = 1:n
    for j = 1:n
        if x(i)*x(i)+y(j)*y(j) <= R*R
             k{i,j} = [x(i),y(j)];
             wt = 1;
             fprintf(fid,'%16g %16g %16g\n',x(i),y(j),wt);
        end
    end
end

%fprintf(fid,'\n');

fclose(fid);




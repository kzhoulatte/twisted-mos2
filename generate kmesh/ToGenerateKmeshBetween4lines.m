% In order to get the K points mesh between 4 lines

clc;
clear;
cd /Users/kuanzhou/Documents/MATLAB/ToGenerateKpoints/;
Radius = 0.5;
R = Radius;
x = -0:0.02:0.5;
y = -0:0.02:0.5;
n = 26;
%k = cell(n,n);


fid = fopen('Kpointsbetween4lines','a+');

for i = 1:n
    for j = 1:n
        if and(-0.5772 * x(i) - y(j) + 0.5772  >= 0, 0.4330 * x(i) - 0.25 * y(i) > 0)
             %k{i,j} = [x(i),y(j)];
             wt = 1;
             fprintf(fid,'%16g %16g %16g\n',x(i),y(j),wt);
        end
    end
end

%fprintf(fid,'\n');

fclose(fid);




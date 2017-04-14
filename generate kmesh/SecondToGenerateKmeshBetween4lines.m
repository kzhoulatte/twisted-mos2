% In order to get the K points mesh between 4 lines

clc;
clear;
cd /Users/kuanzhou/Documents/MATLAB/ToGenerateKpoints/;
load Kpointsbetween4lines;
n = 539;
%k = cell(n,n);


fid = fopen('Kpointsbetweennewlines','a+');
x = Kpointsbetween4lines(:,1);
y = Kpointsbetween4lines(:,2);

for i = 1:n
        if 0.4330 * x(i) - 0.25 * y(i) > 0
             %k{i,j} = [x(i),y(j)];
             wt = 1;
             fprintf(fid,'%16g %16g %16g\n',x(i),y(i),wt);
        end
end

%fprintf(fid,'\n');

fclose(fid);




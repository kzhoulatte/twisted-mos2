% This Kmesh program is used to get rid of useless columns, such as
% situations that we only need column 2,3,5

clear;
clc;
cd /Users/kuanzhou/Documents/MATLAB/ToGenerateKpoints/;
load KpointsIn7linesKPOINT_Cart;
kKmesh = KpointsIn7linesKPOINT_Cart;
A(:,1)=kKmesh(:,1);
A(:,2)=kKmesh(:,2);
A(:,3)=kKmesh(:,4);
[m,n]=size(A);
fid=fopen('New_kmesh','a+');
for i=1:m 
        for j=1:n
        fprintf(fid,'%16g\t',A(i,j));
        end
fprintf(fid,'\n');
end

fclose(fid);
clear;


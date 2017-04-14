% Read the file for K points in Crystal Coord and output the K points in
% Cart

clear;
clc;
cd /Users/kuanzhou/Documents/MATLAB/Datas/140_radius;
load Kpoints;
%fidin = 'KpointsIn5lines';
fidout = 'Kpoints_7lines_Gamma_Cart';
%fid1 = fopen(fidin,'r');
fid2 = fopen(fidout,'a+');
k = 140;   % the number of K points
KpointsIn5lines = Kpoints;

for i = 1:k
    n = KpointsIn5lines(i,1);
    m = KpointsIn5lines(i,2);
    x = n +  m / 2;
    y = sqrt(3) / 2 * m;
    z = KpointsIn5lines(i,3);
    %wt = KpointsIn5lines(i,4);
    fprintf(fid2,'%10g %10g %10g \n',x,y,z);
end

fclose(fid2);

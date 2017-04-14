% Read the file for K points in Cart. Coord and output the K points in
% Crystal Coord

clear;
clc;
cd /Users/kuanzhou/Documents/MATLAB/ToGenerateKpoints/;
load KpointsIn7lines_Gamma_Cart_200_angle7;
%fidin = 'KpointsIn5lines';
fidout = 'KpointsIn7lines_Gamma_Crys_200_angle7';
%fid1 = fopen(fidin,'r');
fid2 = fopen(fidout,'a+');
k = 200*7;   % the number of K points
Kpoints = KpointsIn7lines_Gamma_Cart_200_angle7;

for i = 1:k
    x = Kpoints(i,1);
    y = Kpoints(i,2);
    m = 2 * y / sqrt(3);
    n = x - m / 2;
    z = Kpoints(i,3);
    %wt = Kpoints(i,4);
    fprintf(fid2,'%10g %10g %10g \n',n,m,1);
end

fclose(fid2);

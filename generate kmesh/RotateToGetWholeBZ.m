
clear;
clc;
cd /Users/kuanzhou/Documents/MATLAB/Datas/Color_graph_E1400/;
load Kpoints;
load datafile;
%fidin = 'KpointsIn5lines';
fidout1 = 'Kpoints_Cart_BZ';
fidout2 = 'Trans_BZ';
%fid1 = fopen(fidin,'r');
fid1 = fopen(fidout1,'a+');
fid2 = fopen(fidout2,'a+');
k = 5800;   % the number of K points
Trans = datafile;
Theta = 5*pi/3;

for i = 1:k
    n = Kpoints(i,1);
    m = Kpoints(i,2);
    x = cos(Theta) * n + (-sin(Theta))* m ;
    y = sin(Theta)* n + cos(Theta) * m;
    z = Kpoints(i,3);
    %wt = KpointsIn5lines(i,4);
    fprintf(fid1,'%10g %10g %10g \n',x,y,z);
    fprintf(fid2,'%10g \n',Trans(i));
end

fclose(fid2);

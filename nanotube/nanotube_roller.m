% nanotube roller
% Roller should be better for twisted nanotubes. It is rolling the nanotube
% from nano ribbon

% Treating one line as the fixed line in the ribbon and then increase the
% angle of other atom lines. 

% Read in the initial struture from initial unit cell:


fp_in = fopen('POSCAR_ribbon','r');
for i=1:first line
    textscan 
    set as reference line
end

for i=1:all other lines
    textscan 
    minus by the line so get the relative positions
    group the points into lines 
    calculate different angels for different lines  ***
    change by different angles of theta to get new relative positions
    change them back to origianl positions
end

fp_out = fopen('POSCAR_nanotube','a+');
output the positions of nanotube;
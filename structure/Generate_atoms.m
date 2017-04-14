clear;
clc;
format long;

cd ~/Documents/Heterostructure/heterostructure/Atoms_layers/;
fid1 = fopen('layers_66','a+');
fid2 = fopen('layers_66_angstrom','a+');
Celldm1 = 6.008;   % in Bohr Radius;
dim = 0.529;   % 1 Bohr = 0.529 Angstrom;
a1 = [1,0,0];
Theta = 2*pi/3;
a2 = [cos(Theta),sin(Theta),0];
Nlayers = 12;
Dis_perlayer = 3.2;   % in Angstrom
Dis_between = 3.2; 

Celldm3 = (Dis_perlayer+Dis_between)*Nlayers/(Celldm1*dim);

atom = ones(6,3);
atom(1,:) = [1/3,2/3,1/8*1/4];  % S
atom(2,:) = [2/3,1/3,1/8*2/4];  % Mo/W
atom(3,:) = [1/3,2/3,1/8*3/4];  % S
atom(4,:) = [2/3,1/3,1/8*5/4];  % S  
atom(5,:) = [1/3,2/3,1/8*6/4];  % Mo/W
atom(6,:) = [2/3,1/3,1/8*7/4];  % S
element = 'S';

for i = 1:Nlayers
    for j=1:6
        atom_now = atom(j,:)+[0,0,1/8]*(i-1);
        if j==2
            element = 'Mo';
        end 
        if j==5
            element = 'Mo';
        end
            fprintf(fid,'%10s%10g%10g%10g\n',element,atom_now(1),atom_now(2),atom_now(3));
        element = 'S'; 
    end
end






clear;
clc;
format long;

cd ~/Documents/Calculations_MoS2/heterostructure/atom_layers_from_2+2_relaxation_results/;
fid = fopen('layers_11_angstrom','a+');
Celldm1 = 6.008163573453268;   % in Bohr Radius;
dim = 0.529177;   % 1 Bohr = 0.529 Angstrom;
a1 = [1,0,0];
A1 = a1*Celldm1*dim;
Theta = 2*pi/3;
a2 = [cos(Theta),sin(Theta),0];
A2 = a2*Celldm1*dim;

Nlayers = 2;
Dis_perlayer = 3.179381975;   % in Angstrom
Dis_between = 3.179381975; 

Celldm3 = (Dis_perlayer+Dis_between)*Nlayers/(Celldm1*dim);
C = [0,0,Celldm3*Celldm1*dim];
Natoms = Nlayers*3;
N = Nlayers;
atom = ones(6,3);
atom(1,:) = [1/3,2/3,1/N*1/4];  % S
atom(2,:) = [2/3,1/3,1/N*2/4];  % Mo/W
atom(3,:) = [1/3,2/3,1/N*3/4];  % S
atom(4,:) = [2/3,1/3,1/N*5/4];  % S  
atom(5,:) = [1/3,2/3,1/N*6/4];  % Mo/W
atom(6,:) = [2/3,1/3,1/N*7/4];  % S
element = 'S';

for i = 1:Nlayers/2
    for j=1:6
        atom_now = atom(j,:)+[0,0,2/N]*(i-1);
        atom_angstrom = atom_now(1)*A1+atom_now(2)*A2+atom_now(3)*C;
        for k = 1:3
            if atom_angstrom(k) <= 0.0000001
                atom_angstrom(k) = 0;
            end
        end
        if j==2
            element = 'Mo';
            if i > Nlayers / 4
            element = 'W';
        end
        end 
        if j==5
            element = 'Mo';
            if i > Nlayers / 4
            element = 'W';
        end
        end        
            fprintf(fid,'%s%16g%16g%16g\n',element,atom_angstrom(1),atom_angstrom(2),atom_angstrom(3));
        element = 'S'; 
    end
end






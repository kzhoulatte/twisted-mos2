clear;clc;
format long;

input = 'HS_graphene.out';
%output = 'sum.out';
fp = fopen(input,'r');
%fp_sum = fopen(output,'a+');

% Get the values for ct_atom num etc.
for i = 1:9
    line=fgetl(fp);
end

% Get the l1,l2,l3,glbal index, local index, grobal index, and blocks of HS 
% and sum them up with bloch functions formula

Nb = 134;  % The total lines of the hamiltonian part
Nd = 4;   % The dimension of the hamiltonian of the original cell 
Na = 2;   % How many atoms in the unit cell


for i=1:Nb
%     fprintf('current iteration: %d\n', i);
    c1 = fgetl(fp);
    c2 = textscan(fp,'%f %f %f %f %f %f %f',1);
%     tline = fgetl(fp);
    c3 = textscan(fp,'%f %f %f %f',Nd);
%     for ii=1:Nd
%         rline = fgetl(fp);
%     end
     tline = fgetl(fp);
     
     
     Gc_AN = c2{1};
     h_AN = c2{2};
     Gh_AN = c2{3};
     l1 = c2{5};
     l2 = c2{6};
     l3 = c2{7};
     
     a = [2.459512,0,0];
     b = [1.229756,2.13000,0];
     c = [0,0,25.37];
     
     if Gc_AN == 1
        rn = a*l1+b*l2+c*l3+1/3*(a+b);
     end
     
     if Gc_AN == 2
        rn = a*l1+b*l2+c*l3+2/3*(a+b);
     end
     
%      plot3(rn(1),rn(2),rn(3),'o');
%      hold on;
     
      scatter3(rn(1),rn(2),rn(3),Gc_AN*100,'o');
      hold on;
      
end

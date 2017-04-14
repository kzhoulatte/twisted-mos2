function [ S1,S2,l1,l2,l3 ] = S_sum_calculator( k1,k2,k3 )
% version of function for SS_sum_calculator  

% Read the SS.out file to get l1,l2,l3 and blocks of SS:
input = 'HS_graphene.out';
%output = 'sum.out';
fp = fopen(input,'r');
%fp_sum = fopen(output,'a+');


NN = 816;     % The first line that starts the matrix part.


% Get tSe values for ct_atom num etc.
for i = 1:NN
    line=fgetl(fp);
end

% Get the l1,l2,l3,glbal index, local index, grobal index, and blocks of SS 
% and sum them up with bloch functions formula

Nb = 134;  % The total lines of the hamiltonian part
Nd = 4;   % The dimension of the hamiltonian of the original cell 
Na = 2;   % How many atoms in the unit cell
S111 = zeros(Nd,Nd);
S112 = zeros(Nd,Nd);
S121 = zeros(Nd,Nd);
S122 = zeros(Nd,Nd);
S131 = zeros(Nd,Nd);
S132 = zeros(Nd,Nd);
S211 = zeros(Nd,Nd);
S212 = zeros(Nd,Nd);
S221 = zeros(Nd,Nd);
S222 = zeros(Nd,Nd);
S231 = zeros(Nd,Nd);
S232 = zeros(Nd,Nd);
S311 = zeros(Nd,Nd);
S312 = zeros(Nd,Nd);
S321 = zeros(Nd,Nd);
S322 = zeros(Nd,Nd);
S331 = zeros(Nd,Nd);
S332 = zeros(Nd,Nd);


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
     
     l1 = c2{5};
     l2 = c2{6};
     l3 = c2{7};
     
     c = c2{1};
     n = c2{3};
     
          
          PI = 3.1415926;
          kRn = (k1*l1 + k2*l2 + k3*l3);
          si = sin(2.0*PI*kRn);
          co = cos(2.0*PI*kRn);

          
if (c==1)&&(n==1)     
          for j=1:Nd
              for k=1:Nd
                  rh = c3{j}(k, 1);
                  S111(j,k) = S111(j,k)+rh*co;
                  S112(j,k) = S112(j,k)+rh*si;
              end
          end
end


if (c==1)&&(n==2)     
          for j=1:Nd
              for k=1:Nd
                  rh = c3{j}(k, 1);
                  S121(j,k) = S121(j,k)+rh*co;
                  S122(j,k) = S122(j,k)+rh*si;
              end
          end
end

% if (c==1)&&(n==3)     
%           for j=1:Nd
%               for k=1:Nd
%                   rh = c3{j}(k, 1);
%                   S131(j,k) = S131(j,k)+rh*co;
%                   S132(j,k) = S132(j,k)+rh*si;
%               end
%           end
% end

if (c==2)&&(n==1)     
          for j=1:Nd
              for k=1:Nd
                  rh = c3{j}(k, 1);
                  S211(j,k) = S211(j,k)+rh*co;
                  S212(j,k) = S212(j,k)+rh*si;
              end
          end
end

if (c==2)&&(n==2)     
          for j=1:Nd
              for k=1:Nd
                  rh = c3{j}(k, 1);
                  S221(j,k) = S221(j,k)+rh*co;
                  S222(j,k) = S222(j,k)+rh*si;
              end
          end
end

% if (c==2)&&(n==3)     
%           for j=1:Nd
%               for k=1:Nd
%                   rh = c3{j}(k, 1);
%                   S231(j,k) = S231(j,k)+rh*co;
%                   S232(j,k) = S232(j,k)+rh*si;
%               end
%           end
% end

% if (c==3)&&(n==1)     
%           for j=1:Nd
%               for k=1:Nd
%                   rh = c3{j}(k, 1);
%                   S311(j,k) = S311(j,k)+rh*co;
%                   S312(j,k) = S312(j,k)+rh*si;
%               end
%           end
% end
% 
% if (c==3)&&(n==2)     
%           for j=1:Nd
%               for k=1:Nd
%                   rh = c3{j}(k, 1);
%                   S321(j,k) = S321(j,k)+rh*co;
%                   S322(j,k) = S322(j,k)+rh*si;
%               end
%           end
% end

% if (c==3)&&(n==3)     
%           for j=1:Nd
%               for k=1:Nd
%                   rh = c3{j}(k, 1);
%                   S331(j,k) = S331(j,k)+rh*co;
%                   S332(j,k) = S332(j,k)+rh*si;
%               end
%           end
% end


          % clear c1;
          % clear c2;
          % clear c3;
end

fclose(fp);



S1 = zeros(Na*Nd,Na*Nd);
S2 = zeros(Na*Nd,Na*Nd);

for i = 1: Nd
    for j = 1:Nd
        S1(i,j) = S111(i,j);
        S2(i,j) = S112(i,j);
    end
end

for i = 1: Nd
    for j = 1:Nd
        S1(i,j+Nd*1) = S121(i,j);
        S2(i,j+Nd*1) = S122(i,j);
    end
end

% for i = 1: Nd
%     for j = 1:Nd
%         S1(i,j+Nd*2) = S131(i,j);
%         S2(i,j+Nd*2) = S132(i,j);
%     end
% end

for i = 1: Nd
    for j = 1:Nd
        S1(i+Nd,j) = S211(i,j);
        S2(i+Nd,j) = S212(i,j);
    end
end

for i = 1: Nd
    for j = 1:Nd
        S1(i+Nd,j+Nd) = S221(i,j);
        S2(i+Nd,j+Nd) = S222(i,j);
    end
end

% for i = 1: Nd
%     for j = 1:Nd
%         S1(i+Nd,j+Nd*2) = S231(i,j);
%         S2(i+Nd,j+Nd*2) = S232(i,j);
%     end
% end
% 
% for i = 1: Nd
%     for j = 1:Nd
%         S1(i+Nd*2,j) = S311(i,j);
%         S2(i+Nd*2,j) = S312(i,j);
%     end
% end
% 
% for i = 1: Nd
%     for j = 1:Nd
%         S1(i+Nd*2,j+Nd) = S321(i,j);
%         S2(i+Nd*2,j+Nd) = S322(i,j);
%     end
% end
% 
% for i = 1: Nd
%     for j = 1:Nd
%         S1(i+Nd*2,j+Nd*2) = S331(i,j);
%         S2(i+Nd*2,j+Nd*2) = S332(i,j);
%     end
% end


end


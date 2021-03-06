% Use the HS.out file to get the hamiltonian in a unit cell, which will
% has a smaller dimension like 39*39 for no SOC monolayer MoS2 system 


clear;clc;

% Read the HS.out file to get l1,l2,l3 and blocks of HS:
input = 'HS_sum.out';
%output = 'sum.out';
fp = fopen(input,'r');
%fp_sum = fopen(output,'a+');

% Get the values for ct_atom num etc.
for i = 1:9
    line=fgetl(fp);
end

% Get the l1,l2,l3,glbal index, local index, grobal index, and blocks of HS 
% and sum them up with bloch functions formula

Nb = 347;
Nd = 13;
H111 = zeros(Nd,Nd);
H112 = zeros(Nd,Nd);
H121 = zeros(Nd,Nd);
H122 = zeros(Nd,Nd);
H131 = zeros(Nd,Nd);
H132 = zeros(Nd,Nd);
H211 = zeros(Nd,Nd);
H212 = zeros(Nd,Nd);
H221 = zeros(Nd,Nd);
H222 = zeros(Nd,Nd);
H231 = zeros(Nd,Nd);
H232 = zeros(Nd,Nd);
H311 = zeros(Nd,Nd);
H312 = zeros(Nd,Nd);
H321 = zeros(Nd,Nd);
H322 = zeros(Nd,Nd);
H331 = zeros(Nd,Nd);
H332 = zeros(Nd,Nd);


for i=1:Nb
%     fprintf('current iteration: %d\n', i);
    c1 = fgetl(fp);
    c2 = textscan(fp,'%f %f %f %f %f %f %f',1);
%     tline = fgetl(fp);
    c3 = textscan(fp,'%f %f %f %f %f %f %f %f %f %f %f %f %f',Nd);
%     for ii=1:Nd
%         rline = fgetl(fp);
%     end
     tline = fgetl(fp);
     
     l1 = c2{5};
     l2 = c2{6};
     l3 = c2{7};
     
     c = c2{1};
     n = c2{3};
     
          k1 = 0;
          k2 = 0;
          k3 = 0;
          PI = 3.1415926;
          kRn = k1*l1 + k2*l2 + k3*l3;
          si = sin(2.0*PI*kRn);
          co = cos(2.0*PI*kRn);

          
if (c==1)&&(n==1)     
          for j=1:Nd
              for k=1:Nd
                  rh = c3{j}(k, 1);
                  H111(j,k) = H111(j,k)+rh*co;
                  H112(j,k) = H112(j,k)+rh*si;
              end
          end
end


if (c==1)&&(n==2)     
          for j=1:Nd
              for k=1:Nd
                  rh = c3{j}(k, 1);
                  H121(j,k) = H121(j,k)+rh*co;
                  H122(j,k) = H122(j,k)+rh*si;
              end
          end
end

if (c==1)&&(n==3)     
          for j=1:Nd
              for k=1:Nd
                  rh = c3{j}(k, 1);
                  H131(j,k) = H131(j,k)+rh*co;
                  H132(j,k) = H132(j,k)+rh*si;
              end
          end
end

if (c==2)&&(n==1)     
          for j=1:Nd
              for k=1:Nd
                  rh = c3{j}(k, 1);
                  H211(j,k) = H211(j,k)+rh*co;
                  H212(j,k) = H212(j,k)+rh*si;
              end
          end
end

if (c==2)&&(n==2)     
          for j=1:Nd
              for k=1:Nd
                  rh = c3{j}(k, 1);
                  H221(j,k) = H221(j,k)+rh*co;
                  H222(j,k) = H222(j,k)+rh*si;
              end
          end
end

if (c==2)&&(n==3)     
          for j=1:Nd
              for k=1:Nd
                  rh = c3{j}(k, 1);
                  H231(j,k) = H231(j,k)+rh*co;
                  H232(j,k) = H232(j,k)+rh*si;
              end
          end
end

if (c==3)&&(n==1)     
          for j=1:Nd
              for k=1:Nd
                  rh = c3{j}(k, 1);
                  H311(j,k) = H311(j,k)+rh*co;
                  H312(j,k) = H312(j,k)+rh*si;
              end
          end
end

if (c==3)&&(n==2)     
          for j=1:Nd
              for k=1:Nd
                  rh = c3{j}(k, 1);
                  H321(j,k) = H321(j,k)+rh*co;
                  H322(j,k) = H322(j,k)+rh*si;
              end
          end
end

if (c==3)&&(n==3)     
          for j=1:Nd
              for k=1:Nd
                  rh = c3{j}(k, 1);
                  H331(j,k) = H331(j,k)+rh*co;
                  H332(j,k) = H332(j,k)+rh*si;
              end
          end
end


          % clear c1;
          % clear c2;
          % clear c3;
end

fclose(fp);



HS1 = zeros(39,39);
HS2 = zeros(39,39);

for i = 1: 13
    for j = 1:13
        HS1(i,j) = H111(i,j);
        HS2(i,j) = H112(i,j);
    end
end

for i = 1: 13
    for j = 1:13
        HS1(i,j+13*1) = H121(i,j);
        HS2(i,j+13*1) = H122(i,j);
    end
end

for i = 1: 13
    for j = 1:13
        HS1(i,j+13*2) = H131(i,j);
        HS2(i,j+13*2) = H132(i,j);
    end
end

for i = 1: 13
    for j = 1:13
        HS1(i+13,j) = H211(i,j);
        HS2(i+13,j) = H212(i,j);
    end
end

for i = 1: 13
    for j = 1:13
        HS1(i+13,j+13) = H221(i,j);
        HS2(i+13,j+13) = H222(i,j);
    end
end

for i = 1: 13
    for j = 1:13
        HS1(i+13,j+13*2) = H231(i,j);
        HS2(i+13,j+13*2) = H232(i,j);
    end
end

for i = 1: 13
    for j = 1:13
        HS1(i+13*2,j) = H311(i,j);
        HS2(i+13*2,j) = H312(i,j);
    end
end

for i = 1: 13
    for j = 1:13
        HS1(i+13*2,j+13) = H321(i,j);
        HS2(i+13*2,j+13) = H322(i,j);
    end
end

for i = 1: 13
    for j = 1:13
        HS1(i+13*2,j+13*2) = H331(i,j);
        HS2(i+13*2,j+13*2) = H332(i,j);
    end
end







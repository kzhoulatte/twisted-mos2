%clear all

%% Total DOS, projected DOS (dos on a particular atomic site) and partial DOS (s,p d) plot from VASP data

ev_to_ryd=13.6;

          %%%%%%%% Inputs %%%%%%%
 
filename='DOSCAR';

Ef=-2.999;

% number of energy points for each direction %
Ne=3000;

% Number of atoms, required for pdos only
Na=3;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     



                    %%%%%%%%%  First Block: Reading Total DOS data  %%%%

fid=fopen(filename,'r'); % read in binary mode % avoid text mode  %

%skip first 6 lines

for i = 1:6
    line=fgetl(fid);
end

c = textscan(fid,'%f %f %f',Ne);  %% read the data %
col1 = c{1,1}(1:Ne); 
col2 = c{1,2}(1:Ne);
col3 = c{1,3}(1:Ne);

fclose(fid);

A=[col1 col2 col3];
E1=A(:,1)-Ef;

               
               %%%%%%%%%  Second Block: Plotting of Total DOS  %%%%
            


dos=A(:,2);


break


 %%%%%%%%%  Third Block: Reading of partial and projected DOS  %%%%

Ntotal=Ne*Na;
fid=fopen(filename,'r'); % read in binary mode % avoid text mode  %

col1 = zeros(Ntotal,1); col2 = zeros(Ntotal,1); col3 = zeros(Ntotal,1); 
col4 = zeros(Ntotal,1); col5 = zeros(Ntotal,1); col6 = zeros(Ntotal,1); 
col7 = zeros(Ntotal,1); col8 = zeros(Ntotal,1); col9 = zeros(Ntotal,1); 
col10 = zeros(Ntotal,1);  


%skip first Ne+6 lines

for i = 1:Ne+6
    line=fgetl(fid);
end

% loop (skip first 1 line and read Ne lines) until end

colIndex = 1;
%order is s, py, pz, px, dxy, dyz, dz2-r2, dxz, dx2-y2
%PDOS is output for each atom
for ii=1:Na
    c = textscan(fid,'%f %f %f %f %f %f %f %f %f %f',Ne+1);
    col1(colIndex:colIndex+Ne-1) = c{1,2}(2:Ne+1);
    col2(colIndex:colIndex+Ne-1) = c{1,3}(2:Ne+1);
    col3(colIndex:colIndex+Ne-1) = c{1,4}(2:Ne+1);
    col4(colIndex:colIndex+Ne-1) = c{1,5}(2:Ne+1);
    col5(colIndex:colIndex+Ne-1) = c{1,6}(2:Ne+1);
    col6(colIndex:colIndex+Ne-1) = c{1,7}(2:Ne+1);
    col7(colIndex:colIndex+Ne-1) = c{1,8}(2:Ne+1);
    col8(colIndex:colIndex+Ne-1) = c{1,9}(2:Ne+1);
    col9(colIndex:colIndex+Ne-1) = c{1,10}(2:Ne+1);
    col10(colIndex:colIndex+Ne-1) = c{1,1}(2:Ne+1);    
    colIndex = colIndex + Ne;
end

fclose(fid);

E2=col10(1:Ne)-Ef;
colt=col1+col2+col3+col4+col5+col6+col7+col8+col9;
colts=col1;
coltp=col2+col3+col4;  %%
coltd=col5+col6+col7+col8+col9;

% total DOS for each atom, then col1, col2, col3 etc are s, p, d etc.
% size of each column is Ne*Na i.e. first Ne (1:Ne) lines are for atom 1
% then next Ne lines for atom 2 etc. 

%B=[colt col1 col2 col3 col4 col5 col6 col7 col8 col9];
B=[colt colts coltp coltd];

tdos=zeros(Ne,1);
ddos=zeros(Ne,1);
dz2dos=zeros(Ne,1);
dxydos=zeros(Ne,1);
dx2y2dos=zeros(Ne,1);
pzdos=zeros(Ne,1);
pxdos=zeros(Ne,1);
pydos=zeros(Ne,1);


%total Density of states from PDOS
for jj=1:Na
    tdos=tdos+colt(Ne*(jj-1)+1:jj*Ne);
end


%total d-orbital Density of states from PDOS
for jj=1:Na
    ddos=ddos+coltd(Ne*(jj-1)+1:jj*Ne);
end

for jj=1:Na
    dz2dos=dz2dos+col7(Ne*(jj-1)+1:jj*Ne);
    dxydos=dxydos+col5(Ne*(jj-1)+1:jj*Ne);
    dx2y2dos=dx2y2dos+col9(Ne*(jj-1)+1:jj*Ne);

end

for jj=1:Na
    pzdos=pzdos+col3(Ne*(jj-1)+1:jj*Ne);
    pxdos=pxdos+col4(Ne*(jj-1)+1:jj*Ne);
    pydos=pydos+col2(Ne*(jj-1)+1:jj*Ne);

end

break
clear col1 col2 col3 col4 col5 col6 col7 col8 col9 col10 colt colts coltp coltd


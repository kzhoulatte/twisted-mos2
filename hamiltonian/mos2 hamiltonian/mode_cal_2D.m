 clear all

%% mode calculations from Vasp E-k data  %%
%% Written by Darshana Wickramaratne  %%
% Date: November 27, 2012  %%

%% 2D Structure %%
%% correct BZ k sampling %%
%% 1st method using BZsample.m %%


%% interchange of kx and ky for the 2D structure%
%% transmission is in ky direction (K point) but assume here it is kx %

ah=3.818e-10; %lattice constant


kymax=(2*pi/ah)*(1/sqrt(3)); %TMDC


%% layer thickness, convert 2D DOM to 3D DOM

Lz=5.193e-10; %%1L In2S2


%%% pre-factor for transmission per unit area, 2D case
%pre_factor =(1/(2*pi))*12*2*(1/4)*0.5; 
% 12 is for 1/12 of BZ sampled; 2 is for spin; 1/4 is for +ve velocity for
% 2D BZ (x-y), 0.5 is used if rectangle within BZ is sampled instead of 
% single triangle
pre_factor = 1/pi
%% shifting of the E-k to match Exp band gap %%
%% same amount of shift as in bulk %%
Eg_exp=1.9;
Eg_Vasp=1.68;
Eshift=(Eg_exp-Eg_Vasp)/2;

%% First step: load the Vasp E-k data and read  %%


filename='Ek_1L_InS_51_51';

% Fermi energy of the system in eV %

%BP
%Ef= 1.0591;

%------------------------------%

Nx=51; Ny=51; %% number of k points in each direction
% total number of k points %
Nk=Nx*Ny;
% number of bands for each k point %
Nb=64;  % 

% number of directions%
Nd=1; 
Ntotal=Nk*Nb*Nd;

Ne=2001; 
%number of integration steps
%Ne=1;
Emin=-2; Emax=2;
E = linspace(Emin,Emax,Ne); %Energy range of interest
%E = 0.5;

%% Read the "EIGENVAL" output of VASP and
%% produce eigenvalues in single column for each k and directions %%


fid=fopen(filename,'r'); % read in binary mode % avoid text mode  %
col = zeros(Ntotal,1);

%skip first 6 lines

for i = 1:6
    line=fgetl(fid);
end

% loop (skip 2 lines and read 56 lines) until end

colIndex = 1;

for ii=1:Nk*Nd
    c = textscan(fid,'%d %f',Nb+2);
    col(colIndex:colIndex+Nb-1) = c{1,2}(3:Nb+2);
    colIndex = colIndex + Nb;
end

fclose(fid);

A=col-Ef;
clear col
Eshift = 0;
%% shifting of E-k, increasing Eg
for ii=1:Ntotal
    if A(ii)<0
        A(ii)=A(ii)-Eshift;
    else
        A(ii)=A(ii)+Eshift;
    end
end
%%%%%

for ix=1:Nx
    for iy=1:Ny
        Ek(iy,:,ix)=A(1+(iy-1)*Nb+(ix-1)*Ny*Nb:(iy*Nb)+((ix-1)*Ny*Nb));
    end
end

clear A

ME=zeros(1,Ne);

ky=0:kymax/(Ny-1):kymax; 
dky=ky(2)-ky(1);


T=zeros(Nx,Ne);
%% Transmission from counting number of subbands
for Iky=1:Ny-1
    Ekk = squeeze(Ek(Iky,:,:))';
    for jj = 1:Nx-1
        [Iky jj]
        id=(Iky-1)*Nx + jj;
        %xx=kpoints(id,1); yy=kpoints(id,2); zz=kpoints(id,3);
        %BZ=BZsample_2D(xx,yy,zz);
        %if BZ
            index(id)=1;
            for hh = 1:Ne
                for ii = 1:Nb
                    if ((Ekk(jj,ii) < E(hh)) && (Ekk(jj+1,ii)> E(hh))) ...   % for conduction band
                            || ((Ekk(jj,ii) > E(hh)) && (Ekk(jj+1,ii)< E(hh))) ... % for valence band
                            T(Iky,hh) = T(Iky,hh) + 1;
                    end;
                end;
            end;
        %else
        %    index(id)=0;
        %end;
    end;
end;

% summing over ky-kx BZ and obtain T(E)
for IE=1:Ne
    ME(IE)=pre_factor*(sum(squeeze(T(:,IE))*dky));
end

ME_3D = ME/Lz;  % in unit of /m^2 %%
break
%save ME_2L_Graphene_Efield_01_101_101 E Ne Emin Emax ME ME_3D


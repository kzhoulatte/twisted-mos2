% EK calculation from VASP output files. 

clear all;
close all;
clc;
% figure(11);
%E-k plot from VASP data: Darshana W
%% just for chalcogenides: bulk(hexagonal) and 2D
format long;
ev_to_ryd=13.6057;

%%%%%%%% Inputs %%%%%%%
% Input file for E-k data in VASP:EIGVAL  %
%---------------------------------------%
filename='EIGENVAL';
% Fermi energy of the system in eV %
% Ef=-0;
Ef= -0.4149;
Emin=-1; Emax=2;

shift=0; % 0=do not shift, correct Ef; 1=shift to make 0 (i.e. reference enrgy) at valence maximum

%% Bandgap adjustment %%

Eg_adj=0.0;

% number of k points for each direction %
Nk=20;

% number of eigenvalues for each k point/number of bands %
Ne=552;

% number of directions%
% hex=7; 2D=3 %
Nd=3;
Ntotal=Nk*Ne*Nd;

%%%%%%%%%  First Block: Reading  %%%%

% Read the "EIGENVAL" output of VASP and
% produce eigenvalues in single column for each k and directions %%

fid=fopen(filename,'r'); % read in binary mode % avoid text mode  %
col = zeros(Ntotal,1);

%skip first 6 lines

for i = 1:6
    line=fgetl(fid);
end

% loop (skip 2 lines and read Ne lines) until end

colIndex = 1;

for ii=1:Nk*Nd
    
    c = textscan(fid,'%d %f',Ne+2);
    %c = textscan(fid,'%d %f %f',Ne+2); %use this for spin polarized calc
    %col(colIndex:colIndex+Ne-1) = c{1,2}(3:Ne+2); %use for spin polarized calc
    col(colIndex:colIndex+Ne-1) = c{1,2}(3:Ne+2);
    colIndex = colIndex + Ne;
end
fclose(fid);

A=col;

clear col
A=A-Ef;
%%%


%% for 2D structure: 1L, 2L %%

l1=0.5774; l2=l1+0.3333; l3=l2+0.6667;


k1=linspace(0,l1,Nk); k2=linspace(l1,l2,Nk);
k3=linspace(l2,l3,Nk);
kmesh=[k1' k2' k3'];

% for the vertical lines to show k directions

EE=[Emin Emax];
KD1=[l1 l1]; KD2=[l2 l2]; KD3=[l3 l3];

% for the horizontal line to show the Fermi level %
kmin=0; kmax=l3;
kk=[kmin kmax]; E=[0 0];
klabel=['G';'M';'K';'G'];


%% Band gap adjustment  %%

if Eg_adj ~=0
    for ii=1:Ntotal
        if A(ii) > 0
            A(ii)=A(ii)+Eg_adj;
        end
    end
end


%% Find the band gap  %%
%% works only when Ef is inside the bandgap %%

Nkk=Nk*Nd;
cond_min=zeros(1,Nkk);
valence_max=zeros(1,Nkk);


for ii=1:Nkk
    Ekk= A((ii-1)*Ne+1:ii*Ne);
    ind_valence = find(Ekk <= 0);
    ind_conduct = find(Ekk >= 0);
    valence_max(ii) = max(Ekk(ind_valence));
    cond_min(ii) = min(Ekk(ind_conduct));
end

[E_top_valence, ind_q_val] = max(valence_max);
[E_bot_conduct, ind_q_cond] = min(cond_min);


kmeshplot=[k1 k2 k3];

k_top_valence=kmeshplot(ind_q_val)
k_bot_conduct=kmeshplot(ind_q_cond)

%% Adjust the reference energy, set it to valence band maximum %%


if shift == 1
    A=A-E_top_valence;
    E_bot_conduct=E_bot_conduct - E_top_valence;
    E_top_valence=0;
    A=A-E_bot_conduct;
    E_top_valence=E_top_valence - E_bot_conduct;
    E_bot_conduct=0;
end


%figure('units','inches','position',[0.1 0.1 9 5]);
%%%%%%%%%  Plotting  %%%%
Ek_VB=[];
Ek_CB=[];
figure(2);
for jj=1:Nd
    Ek=[]; Ni=Nk*jj;
    %for each direction all bands for each k point along direction Nd
    %are plotted
    for ii=1+(Ni-Nk):Ni
        Ekk= A((ii-1)*Ne+1:ii*Ne);
        %%list all procar probabilities here for this set of kpoints
        %s = kall(:,(ii-1)*Ne+1:ii*Ne);
        %total = kall(:,(ii-1)*Ne+1:ii*Ne);
        
        Ek=[Ek;Ekk'];
    end
    hold on
    kmesh(:,jj);
    Ek';
    plot(kmesh(:,jj),Ek,'r','LineStyle','-','linewidth',3);
    
    
    hold on
    h_xlabel = get(gca, 'xlabel');
    h_ylabel = get(gca, 'ylabel');
    set(gca,'linewidth',[4],'fontsize',[36],'position',[0.15,0.2,0.74,0.7])
    
    set(h_ylabel,'string','E - E_{F} (eV)','fontsize',[32]);
end
plot([0 kmax], [0.0 0.0], 'k--', 'linewidth', 1.2')
axis([kmin kmax Emin Emax])


% vertical lines to show each k directions

plot(KD1, EE, 'k','linewidth',[1])
plot(KD2, EE, 'k','linewidth',[1])
plot(KD3, EE, 'k','linewidth',[1])

set(gca,'XTick',[0 l1 l2 l3  ])

set(gca, 'XTickLabel',klabel)
box on
set(gcf, 'Color','w')
hold on


plot(k_top_valence, E_top_valence,'LineStyle','none', 'linewidth', 4)
%hold on
plot(k_bot_conduct, E_bot_conduct,'LineStyle','none', 'linewidth', 4)

%legend('TVB', 'BCB')

if E_bot_conduct < E_top_valence
    E_gap = 0;
    fprintf('\n Band gap = 0 eV\n')
else
    E_gap = E_bot_conduct - E_top_valence;
    fprintf('\n Band gap = %f eV\n', E_gap)
end

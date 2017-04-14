
clear all
% Use atomic units (Hatree units) 
hev = 27.21138386; % the hartree in eV 
aB = 0.5291772; % Bohr radius in angstroms

%MoS2
a0=3.1592610000000; 
c0=12.8729190826; % for 2D

% Fermi energy
Ef = 5.8808; %Fermi level, eV
ymin = -0.174;   
ymax = -0.169;


%%%%%%%% Inputs %%%%%%%

% Input file for E-k data in VASP:EIGVAL  %                       
%---------------------------------------%

filename='EIGENVAL';
% number of k points for each direction %
Nk=21;
% number of eigenvalues for each k point %
Ne=32;
% number of directions%
Nd=1; 

Ntotal=Nk*Ne*Nd;


%%%%%%%%%  First Block: Reading  %%%%

% Read the "EIGENVAL" output of VASP and
% produce eigenvalues in single column for each k and directions

fid=fopen(filename,'r');   
col = zeros(Ntotal,1);

%skip first 6 lines

for i = 1:6
    line=fgetl(fid);
end

% loop (skip 2 lines and read Ne lines) until end

colIndex = 1;

for ii=1:Nk*Nd
    
    for tt = 1:2
        line = fgetl(fid);
    end
    
    c = textscan(fid,'%d %f',Ne);
    col(colIndex:colIndex+Ne-1) = c{1,2}(1:Ne);
    
    colIndex = colIndex + Ne;

end

fclose(fid);

A=col;
clear col
A=A-Ef; 



% hexagonal 2D reciprocal

sq=1/sqrt(3);
b0=2*pi/a0;
Btrans = b0*[2*sq 0 0; -sq 1 0; 0 0 a0/c0];
Btrans = Btrans';

% CB and VB band at K point

% direction 001 around Gamma point; 
qxmin=0.0000; qxmax=0.0000; qx=linspace(qxmin,qxmax,Nk);
qymin=0.0000; qymax=0.0000; qy=linspace(qymin,qymax,Nk);
qzmin=-0.050; qzmax=0.0500; qz=linspace(qzmin,qzmax,Nk);

Qv = [qx' qy' qz'];
Qv3=Qv;
Qv

dir = [0, 0, 1];
for ii=1:Nk
    Kv(ii)= dot((Btrans*Qv(ii,:)'), dir);
end

k3=Kv;
clear Qv Kv dir;

kmesh=[k3' ];
k3
kmesh

%%%%%%%%%  Plotting  %%%%
jj=1;
Ek=[]; Ni=Nk*jj;
for ii=1+(Ni-Nk):Ni
    Ekk= A((ii-1)*Ne+1:ii*Ne);
    Ek=[Ek;Ekk'];
end

Ek;


figure(1);
plot(kmesh(:,jj),Ek,'b','linewidth',[4]);
hold on;
% h_xlabel = get(gca, 'xlabel');
% h_ylabel = get(gca, 'ylabel');
% set(gca,'linewidth',[4],'fontsize',[36],'position',[0.15,0.2,0.74,0.7]);
% set(h_ylabel,'string','E (eV)','fontsize',[36]);


ylim([ymin, ymax]);

% break;

% calculate effective mass

yy1 = [];
%yy2 = [];

 
for ii=1+(Ni-Nk):Ni
    EigList = A((ii-1)*Ne+1:ii*Ne);
%     EigList(5)
    y0 = EigList(find(EigList > ymin & EigList < ymax));
    EigList
    y0
    
    y0 = sort(y0, 'descend'); % VB
    % y0 = sort(y0, 'ascend'); % CB
    ii
    y0
    %x0 = dot(Kvector, direction);
    %x0 = norm(Kvector); % needed for (1 1 1)
    %xx = [xx, x0];
    yy1 = [yy1, y0(1)];
    %yy2 = [yy2, y0(2)];
end 

xx = kmesh(:,jj);
xx=xx';

% figure(2);
% plot(xx,yy1,'ro', 'linewidth',[4]);
% %plot(xx,yy2,'ro', 'linewidth',[4]);
% ylim([ymin, ymax]);

p1 = polyfit(xx, yy1, 2);
%p2 = polyfit(xx, yy2, 2);

m1 = 1/(2*p1(1))*(hev*aB^2);  
%m2 = 1/(2*p2(1))*(hev*aB^2);

fprintf('calculated effective mass: \n');
fprintf('m1 = %6.3f \n', m1);
%fprintf('m2 = %6.3f \n', m2);




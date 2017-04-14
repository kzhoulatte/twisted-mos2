%**************************************************************
%********************* GET THE TRANSMISSION GRAPHS *********************
%**************************************************************


clc;
clear;

format long;


% To integrate the transmission T(E) from T(k)dk output from openMX.


% Settings for Nk Nk2 for the k mesh. And Ne for energies. Ymin Ymax for
% Ylim;


Nk = 60;
Nk2 = 60;
Ne = 200;
ymin = -16;
ymax = 5.8;


kpoints = ones(Nk*Nk2,2);
for i = 0 :Nk-1
    for j = 0:Nk2-1
      fid = fopen(['negf-mos2.tran',num2str(i),'_',num2str(j)],'r');
        for k = 1:39
            line = fgetl(fid);
        end
    c = textscan(fid,'%s %s  %7f %s %7f',1);
    col1 = c{1,3}(1:1); 
    col2 = c{1,5}(1:1);
    t = (i)*Nk2+(j+1);
    kpoints(t,1) = col1;
    kpoints(t,2) = col2;
    fclose(fid);  % Get the kpoints in order of t = (i)*Nk2+(j+1);
    end
end


% Sometimes need to convert kpoints from Recip. to Cart.
kpoints_Cart = ones(Nk*Nk2,2);
for i = 1:Nk*Nk2
    a1 = [1,0];
    a2 = [0,1];
    kpoints_Cart(i,:) = kpoints(i,1)*a1+kpoints(i,2)*a2;
end

tt = ones(Nk*Nk2,1);
%figure;
%scatter3(kpoints(:,1),kpoints(:,2),tt);
%figure;
%scatter3(kpoints_Cart(:,1),kpoints_Cart(:,2),tt);

%cd ~/Desktop/Hetero_openmx/negf_mos2_openmx/trans_files/;


% Can choose which Energy points you want to plot T vs K.
T_kpoints3 = ones(Nk*Nk2,1);
T_kpoints4 = ones(Nk*Nk2,1);
T_kpoints5 = ones(Nk*Nk2,1);
Nek3 = 20;
E3 = (Nek3-1)*(5.0/Ne)+(-3.0);
Nek4 = 30;
E4 = (Nek4-1)*(5.0/Ne)+(-3.0);
Nek5 = 40;
E5 = (Nek5-1)*(5.0/Ne)+(-3.0);


trans_E = zeros(Ne,1);
for i = 0:Nk-1
    for j = 0:Nk2-1
      fid = fopen(['negf-mos2.tran',num2str(i),'_',num2str(j)],'r');
        for k = 1:49
            line = fgetl(fid);
        end
    c = textscan(fid,'%f %f %f %f %f %f','EmptyValue',Ne);
    col1 = c{1,4}(1:2:2*Ne-1); 
    col2 = c{1,6}(1:2:2*Ne-1);
    col3 = c{1,6}(2*Nek3+1:2*Nek3+1);
    col4 = c{1,6}(2*Nek4+1:2*Nek4+1);
    col5 = c{1,6}(2*Nek5+1:2*Nek5+1);
    trans_E = trans_E + col2/(1*1);   % To store the total T vs E
    t = (i)*Nk2+(j+1);
    T_kpoints3(t) = col3;
    T_kpoints4(t) = col4;
    T_kpoints5(t) = col5;    % K resolved T for one energy
    fclose(fid);
    end
end


% Plot the T vs E.
figure;
plot(col1,trans_E/(Nk*Nk2));
%figure;
%scatter3(kpoints_Cart(:,1),kpoints_Cart(:,2),T_kpoints3);
%figure;
%scatter3(kpoints_Cart(:,1),kpoints_Cart(:,2),T_kpoints4);
%figure;
%scatter3(kpoints_Cart(:,1),kpoints_Cart(:,2),T_kpoints5);


% Plot the K resolved Trans for one energy 

Trans_K = T_kpoints3;

MAXVAL=max(Trans_K);
MAXT=MAXVAL;

NORM_color=Trans_K/MAXT;

% R G B  If the value is absolutely 0, then it is white; It is very small
% but not 0, it is blue. Otherwise, determined by color;
for i=1:size(NORM_color,1)
    if NORM_color(i,1) > 0.5
    MC(i,:)=[(NORM_color(i,1)-0.5)*2,sqrt(1-4*(NORM_color(i,1)-0.5)*(NORM_color(i,1)-0.5)),0];
    else
        MC(i,:)=[0,NORM_color(i,1)*2,sqrt(1-4*NORM_color(i,1)*NORM_color(i,1))];
    end

    if NORM_color(i,1)>0
    MS(i,1)=50;
    else
    MS(i,1)=10;
    end
end


figure;
scatter3(kpoints_Cart(:,1),kpoints_Cart(:,2),Trans_K,MS,MC,'filled');
axis equal;
view(0, 90);
xlim([-0.5,0.5]);
ylim([-0.5,0.5]);

%figure;
%plot3(kpoints_Cart(:,1),kpoints_Cart(:,2),Trans_K);
%axis equal;
%view(90,0);
%xlim([-0.5,0.5]);
%ylim([-0.5,0.5]);


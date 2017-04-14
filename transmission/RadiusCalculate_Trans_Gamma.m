%function [trans] = Calculate_Trans_Gamma(Km)
%CALCULATE_TRANS Summary of this function goes here
%   Detailed explanation goes here
clear;
clc;
format long;

%for i = 1:317
%    filein = ['transmission_k',numc2str(i),'_e',num2str(e)]; 
%end

cd /Users/kuanzhou/Documents/MATLAB/Datas/radius_Gamma_a7_0001/Gamma_a7_dk0001/;
load Kpoints_Gamma_Cart_0001_angle7_E800;
kk = Kpoints_Gamma_Cart_0001_angle7_E800;
Km = 0.12;
num = 120;
Na = 7;


for k = 1:4
  filein = ['datafile2_knum160_a30_',num2str(k)]; 
  fidoutcache = fopen('datafile_cache','a+');
  fidin=fopen(filein,'r');
        for j = 1:num*Na
            tline=fgetl(fidin);  
            fprintf(fidoutcache,'%s\n',tline);
        end
        fclose(fidoutcache);
        load datafile_cache;
        tt = datafile_cache;
        delete datafile_cache;
            
%load datafile2_knum100_a7_5;

dK = Km/num;
Angel0 = pi/(3*(Na-1));
trans = 0;
trans1 = 0;
trans2 = 0;
trans3 = 0;
count = 0;
n = num*Na;
m1 = num*(Na-1)+1;
m2 = num*(Na);

for i = 1:n
    if (kk(i,1)^2+kk(i,2)^2 <= Km^2)
        count = count+1;
        trans1 = trans1 + tt(i)*sqrt(kk(i,1)^2+kk(i,2)^2)*Angel0*dK;        
    end
end

for i = 1:n
    if (kk(i,2)/kk(i,1) == 0) 
        count = count+1;
        trans2 = trans2 + tt(i)*sqrt(kk(i,1)^2+kk(i,2)^2)*Angel0*dK;        
    end
end

for i = m1:m2
        count = count+1;
        trans3 = trans3 + tt(i)*sqrt(kk(i,1)^2+kk(i,2)^2)*Angel0*dK;        
end

trans = trans1 - 1/2*trans2 - 1/2*trans3;

Transmission = trans;

fidtrans = fopen('trans','a+');
fprintf(fidtrans,'%16g \n',Transmission);
fclose(fidtrans);

end

    



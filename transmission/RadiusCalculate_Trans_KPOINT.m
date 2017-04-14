%function [trans] = Calculate_Trans_KPOINT(Km)
%CALCULATE_TRANS Summary of this function goes here
%   Detailed explanation goes here
clear;
format long;
cd /Users/kuanzhou/Documents/MATLAB/Datas/TE_dk100_a7_KP/;
load KpointsIn7linesKPOINT_cart_100;
kk = KpointsIn7linesKPOINT_cart_100;
Km = 0.16;
num = 160;
Na = 7;

for k = 1:31
  filein = ['datafile2_knum100_a7_',num2str(k)]; 
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

dK = Km/num;
Angel0 = 2* pi/(3*(Na-1));
trans = 0;
trans1 = 0;
trans2 = 0;
trans3 = 0;
count = 0;
n = num*Na;
p1 = 1;
p2 = num;
m1 = (Na-1)*num+1;
m2 = Na*num;
K0 = [0.5,0.2887,0];

for i = 1:n
    if ((kk(i,1)-K0(1))^2+(kk(i,2)-K0(2))^2 <= Km^2)
        count = count+1;
        trans1 = trans1 + tt(i)*sqrt((kk(i,1)-K0(1))^2+(kk(i,2)-K0(2))^2)*Angel0*dK;        
    end
end

for i = p1:p2 
        count = count+1;
        trans2 = trans2 + tt(i)*sqrt((kk(i,1)-K0(1))^2+(kk(i,2)-K0(2))^2)*Angel0*dK;        
end

for i = m1:m2
        count = count+1;
        trans3 = trans3 + tt(i)*sqrt((kk(i,1)-K0(1))^2+(kk(i,2)-K0(2))^2)*Angel0*dK;        
end



trans = trans1 - 1/2*trans2 - 1/2*trans3;

Transmission = trans;

fidtrans = fopen('transK','a+');
fprintf(fidtrans,'%16g \n',Transmission);
fclose(fidtrans);

end


    



% to help find the datas in a specific file and generate another file with
% only the needed data.

clc;clear;
cd ~/QE_trans_MoS2/Bulk_unrot_valence_TE/Angles7_dk100_KP/T1/mos2_M55_M5.TRANS.cond_save/;
delete datafile*;
k=100 * 7 ;
e=5;
line =8;

for i = 1:k
    for j = 1:e
    filein = ['transmission_k',num2str(i),'_e',num2str(j)];
    t1 = j;
    fileout =['datafile2_knum100_a7_',num2str(t1)];
    Mydataread(filein,fileout,line);
    end
end

cd ~/QE_trans_MoS2/Bulk_unrot_valence_TE/Angles7_dk100_KP/T2/mos2_M675_M5.TRANS.cond_save/;
delete datafile*;
k=100 * 7 ;
e=5;
line =8;
for i = 1:k
    for j = 1:e
    filein = ['transmission_k',num2str(i),'_e',num2str(j)];
    t2 = j+5;
    fileout =['datafile2_knum100_a7_',num2str(t2)];
    Mydataread(filein,fileout,line);
    end
end

cd ~/QE_trans_MoS2/Bulk_unrot_valence_TE/Angles7_dk100_KP/T3/mos2_M80_M5.TRANS.cond_save/;
delete datafile*;
k=100 * 7 ;
e=5;
line =8;
for i = 1:k
    for j = 1:e
    filein = ['transmission_k',num2str(i),'_e',num2str(j)];
    t2 = j+10;
    fileout =['datafile2_knum100_a7_',num2str(t2)];
    Mydataread(filein,fileout,line);
    end
end


cd ~/QE_trans_MoS2/Bulk_unrot_valence_TE/Angles7_dk100_KP/T4/mos2_M925_M5.TRANS.cond_save/;
delete datafile*;
k=100 * 7 ;
e=5;
line =8;
for i = 1:k
for j = 1:e
filein = ['transmission_k',num2str(i),'_e',num2str(j)];
t2 = j+15;
fileout =['datafile2_knum100_a7_',num2str(t2)];
Mydataread(filein,fileout,line);
end
end

cd ~/QE_trans_MoS2/Bulk_unrot_valence_TE/Angles7_dk100_KP/T5/mos2_M105_M5.TRANS.cond_save;
delete datafile*;
k=100 * 7 ;
e=5;
line =8;
for i = 1:k
for j = 1:e
filein = ['transmission_k',num2str(i),'_e',num2str(j)];
t2 = j+20;
fileout =['datafile2_knum100_a7_',num2str(t2)];
Mydataread(filein,fileout,line);
end
end

cd ~/QE_trans_MoS2/Bulk_unrot_valence_TE/Angles7_dk100_KP/T6/mos2_M1175_M6.TRANS.cond_save/;
delete datafile*;
k=100 * 7 ;
e=6;
line =8;
for i = 1:k
for j = 1:e
filein = ['transmission_k',num2str(i),'_e',num2str(j)];
t2 = j+25;
fileout =['datafile2_knum100_a7_',num2str(t2)];
Mydataread(filein,fileout,line);
end
end
% kk is the values for kpoints.
% kn is the value for length of kpoints
% p1 is the Energies.

clc;
clear;
close all;
%cd /Users/kuanzhou/Documents/MATLAB/;
EF=5.3682; %Fermi level, eV
filename = 'EIGENVAL';
e1 = -3;
e2 = 3;

fid = fopen(filename);
if fid==-1
    fprintf('Fail to open the file "%s" \n The file does not exist or the file name is wrong.',filename);
    return;
else
    for i=1:4
        line=fgetl(fid);
    end
    tl = fgetl(fid);
%    tl2 = tl(2:11)
    a1 = fscanf(fid,'%g',[3 1]); % 3*1 values for this row.
    blank = fgetl(fid);    
    count=0;
    while ~feof(fid)    
        count=count+1;
        b2=fgetl(fid); %
        d1=fscanf(fid,'%g',[4,1]); d1=d1';
        kk(count,:)=d1;
        data=fscanf(fid,'%g',[2,a1(3)]); 
        data=data';        
       EIG(:,:,count)=data;   
       line2=fgetl(fid);  
       if count > 1e10 % for test read
           break
       end
    end
end
fclose(fid);
kt=0;
for i=2:a1(2)
    a=kk(i,:)-kk(i-1,:);    
    kt=kt+sqrt(sum(a.*a));
    kn(i,1)=kt; %kn(1,1)  
end
for i=1:a1(3) % 8
    for j=1:a1(2) %40
        p1(j,i)=EIG(i,2,j);
    end   
end
p1=p1-EF;
plot(kn,p1,'.-')
%axis([0 max(kn) ])
xlim([0 max(kn)])
%ylim([-10 20])
%title(tl2);
xlabel('k')
ylabel('Energy E-E_F (eV)')
%set( haxis, 'XLim', [ 2 20 ] ); 
%set( haxis, 'YLim', [ 2 20 ] );
axis([0 max(kn) e1 e2]);

hold off
    
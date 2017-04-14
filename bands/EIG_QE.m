% kk is the values for kpoints.
% kn is the value for length of kpoints
% p1 is the Energies.

clc;
clear;
close all;
cd /Users/kuanzhou/Documents/MATLAB/;
EF=8.3835; %Fermi level, eV
e1 = -3;e2 =2;
filename = 'mos2.band';
a1 = [48,58,32];
a2 = [4,10,2]; % The # of line for E values; The # of value each line/last line;

fid = fopen(filename);
if fid==-1
    fprintf('Fail to open the file "%s" \n The file does not exist or the file name is wrong.',filename);
    return;
else
 %   for i=1:1
  %      line=fgetl(fid);
   % end
    tl = fgetl(fid);
%    tl2 = tl(2:11)
%    a1 = fscanf(fid,'%g',[3 1]); % 3*1 values for this row.
%   blank = fgetl(fid);    
    count=0;
    for i = 1:58 
        %while ~feof(fid)    
        count=count+1;
        tt=fscanf(fid,'%f',3);
       % tt = fgetl(fid);
 
  %      fid2 = fopen('cache','w');
  %      fprintf(fid2,'%g',c1);
  %      d1 = fgetl(fid2);
        %A= '0 1 1 1 0 0 1 1 0 1 1 0 0 0 0 1 0 1 1 0 0 1 0 0 0'
       %   A= A(find(~isspace(A))),
      %  d1=d1';
        
    %    kk(count,:)=d1;
        data1=fscanf(fid,'%g',[1,a2(2)]);
        data2=fscanf(fid,'%g',[1,a2(2)]);
        data3=fscanf(fid,'%g',[1,a2(2)]);
        data4=fscanf(fid,'%g',[1,a2(3)]);
        data = ones(1,a1(3));
        data(1:a2(2)) = data1;
        data(a2(2)+1:2*a2(2)) = data2;
        data(2*a2(2)+1:3*a2(2)) = data3;
        data(3*a2(2)+1:a1(3)) = data4;
        num = 1:a1(3);
        newdata = ones(2,a1(3));
        newdata(1,:) = num;
        newdata(2,:) = data;
        data=newdata';        
       EIG(:,:,count)=data;   
   %    line2=fgetl(fid);  
       if count > 1e10 % for test read
           break
       end
    end
end
fclose(fid);
kt=0;
kk = ones(a1(3),3);
load KDatafile;
kk = KDatafile;
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
    
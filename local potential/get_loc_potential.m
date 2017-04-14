%*************************************************************
%************************* GET THE LOCAL POTENTIAL ******************
%*************************************************************

clc;
clear;

format long;

% Get the average of local potential for in plane

Ne = 252;
ymin = -20.0;
ymax = 10.0;
c_length = 26.688;

fid = fopen('VLINE_z','r');
for i = 1:1
    line = fgetl(fid);
end
c = textscan(fid,'%f %f',Ne);
col1 = c{1,1}(1:Ne)*c_length/Ne; 
col2 = c{1,2}(1:Ne);



fid2 = fopen('VLINE_y','r');
for i = 1:1
    line = fgetl(fid2);
end
Yc = textscan(fid2,'%f %f',Ne);
Ycol1 = Yc{1,1}(1:Ne)*c_length/Ne; 
Ycol2 = Yc{1,2}(1:Ne);

ttcol2 = cos(pi/6)*col2+sin(pi/6)*Ycol2;


% 75-142 / 143-210 for vertical localized space.

average1 = 0;
average2 = 0;
a1 = 1;
a2 = 89;
b1 = 91;
b2 = 180;
T1 = 0;
T2 = 0;
for i = a1:a2
    T1 = T1 + col2(i);
    
end

for i = b1:b2
    T2 = T2 + col2(i);
end

average1 = T1/(a2-a1+1);
average2 = T2/(b2-b1+1);

average_col1 = col1;
average_col2 = col2;

 for i=a1:a2
     average_col2(i) = average1;
 end
 average_col2(a2+1) = (average1*2+average2*1)/3;
 
 for i=b1:b2
     average_col2(i) = average2;
 end
 average_col2(b1-1) = (average2*2+average1*1)/3;
 
 h = figure(1);
 %plot(average_col1,average_col2);
 
 
 hold on;
 
 plot(col1,col2);
 
 ylim([ymin,ymax]);
 title('Local potential of in-plane heterostructure');
 xlabel('position along z direction / Angs');
 ylabel('local potential / eV');
 legend('averaged local potential');
 %annotation ('textbox', [0.6,0.4,0.1,0.1],...
 %   'String', ['WS2:',num2str(average2),' eV']);
 %annotation ('textbox', [0.3,0.4,0.1,0.1],...
 %   'String', ['MoS2:',num2str(average1),' eV']);
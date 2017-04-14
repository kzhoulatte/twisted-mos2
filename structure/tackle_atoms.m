
format long;

a_ws2= 6.125294136723753*3.941560638150937*0.529177;
a_mos2=6.125294136723753*3.961844286636765*0.529177;

fid = fopen('New_atoms4','a+');
load New_atoms_for_8+8layers;
a = New_atoms_for_8_8layers;
N = 48;
element = 'S';

deltaD = 0;
%deltaD = a_mos2;
%deltaD = a_mos2+a_ws2;
for i=1:N
    b = a(i,4)+deltaD;
    fprintf(fid,'%s%16f%16f%16f\n',element,a(i,2),a(i,3),b);
end
    
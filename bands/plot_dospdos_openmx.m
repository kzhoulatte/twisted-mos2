clc;clear;

% load MoS2_rot.DOS.Tetrahedron;
% x = MoS2_rot_DOS;
% plot(x(:,1),x(:,2));
% xlim([-3,2]);

xx = zeros(500,1);

for i =1: 42
    filein = ['MoS2_rot.PDOS.Tetrahedron.atom',num2str(i),'.d1'];
    fp = fopen(filein,'r');
    x1 = textscan(fp,'%f   %f   %f   %f   %f',500);
    for j = 1:500
        xx(j,1) = xx(j,1)+x1{2}(j,1);
    end
    fclose(fp);
end

plot(x1{1}(:,1),xx(:,1));
xlim([-3,2]);

hold on;


xx = zeros(500,1);

for i =1: 42
    filein = ['MoS2_rot.PDOS.Tetrahedron.atom',num2str(i),'.d2'];
    fp = fopen(filein,'r');
    x1 = textscan(fp,'%f   %f   %f   %f   %f',500);
    for j = 1:500
        xx(j,1) = xx(j,1)+x1{2}(j,1);
    end
    fclose(fp);
end

plot(x1{1}(:,1),xx(:,1));
xlim([-3,2]);

hold on;



xx = zeros(500,1);

for i =1: 42
    filein = ['MoS2_rot.PDOS.Tetrahedron.atom',num2str(i),'.d3'];
    fp = fopen(filein,'r');
    x1 = textscan(fp,'%f   %f   %f   %f   %f',500);
    for j = 1:500
        xx(j,1) = xx(j,1)+x1{2}(j,1);
    end
    fclose(fp);
end

plot(x1{1}(:,1),xx(:,1));
xlim([-3,2]);

hold on;


xx = zeros(500,1);

for i =1: 42
    filein = ['MoS2_rot.PDOS.Tetrahedron.atom',num2str(i),'.d4'];
    fp = fopen(filein,'r');
    x1 = textscan(fp,'%f   %f   %f   %f   %f',500);
    for j = 1:500
        xx(j,1) = xx(j,1)+x1{2}(j,1);
    end
    fclose(fp);
end

plot(x1{1}(:,1),xx(:,1));
xlim([-3,2]);

hold on;


xx = zeros(500,1);

for i =1: 42
    filein = ['MoS2_rot.PDOS.Tetrahedron.atom',num2str(i),'.d5'];
    fp = fopen(filein,'r');
    x1 = textscan(fp,'%f   %f   %f   %f   %f',500);
    for j = 1:500
        xx(j,1) = xx(j,1)+x1{2}(j,1);
    end
    fclose(fp);
end

plot(x1{1}(:,1),xx(:,1));
xlim([-3,2]);

hold on;


xx = zeros(500,1);

for i =1: 42
    filein = ['MoS2_rot.PDOS.Tetrahedron.atom',num2str(i),'.p1'];
    fp = fopen(filein,'r');
    x1 = textscan(fp,'%f   %f   %f   %f   %f',500);
    for j = 1:500
        xx(j,1) = xx(j,1)+x1{2}(j,1);
    end
    fclose(fp);
end

plot(x1{1}(:,1),xx(:,1));
xlim([-3,2]);

hold on;


xx = zeros(500,1);

for i =1: 42
    filein = ['MoS2_rot.PDOS.Tetrahedron.atom',num2str(i),'.p2'];
    fp = fopen(filein,'r');
    x1 = textscan(fp,'%f   %f   %f   %f   %f',500);
    for j = 1:500
        xx(j,1) = xx(j,1)+x1{2}(j,1);
    end
    fclose(fp);
end

plot(x1{1}(:,1),xx(:,1));
xlim([-3,2]);

hold on;


xx = zeros(500,1);

for i =1: 42
    filein = ['MoS2_rot.PDOS.Tetrahedron.atom',num2str(i),'.p3'];
    fp = fopen(filein,'r');
    x1 = textscan(fp,'%f   %f   %f   %f   %f',500);
    for j = 1:500
        xx(j,1) = xx(j,1)+x1{2}(j,1);
    end
    fclose(fp);
end

plot(x1{1}(:,1),xx(:,1));
xlim([-3,2]);

hold on;


xx = zeros(500,1);

for i =1: 42
    filein = ['MoS2_rot.PDOS.Tetrahedron.atom',num2str(i),'.s1'];
    fp = fopen(filein,'r');
    x1 = textscan(fp,'%f   %f   %f   %f   %f',500);
    for j = 1:500
        xx(j,1) = xx(j,1)+x1{2}(j,1);
    end
    fclose(fp);
end

plot(x1{1}(:,1),xx(:,1));
xlim([-3,2]);

hold on;


% load negf-mos2.PDOS.Tetrahedron.atom1.d2;
% x1 = negf-mos2_PDOS_Tetrahedron_atom1;
% load negf-mos2.PDOS.Tetrahedron.atom2.d2;
% x2 = negf-mos2_PDOS_Tetrahedron_atom2;
% load negf-mos2.PDOS.Tetrahedron.atom3.d2;
% x3 = negf-mos2_PDOS_Tetrahedron_atom3;
% load negf-mos2.PDOS.Tetrahedron.atom4.d2;
% x4 = negf-mos2_PDOS_Tetrahedron_atom4;
% load negf-mos2.PDOS.Tetrahedron.atom5.d2;
% x5 = negf-mos2_PDOS_Tetrahedron_atom5;
% load negf-mos2.PDOS.Tetrahedron.atom6.d2;
% x6 = negf-mos2_PDOS_Tetrahedron_atom6;
% x = x1+x2+x3+x4+x5+x6;
% plot(x1(:,1),x(:,2));
% xlim([-3,2]);
% 
% load negf-mos2.PDOS.Tetrahedron.atom1.d3;
% x1 = negf-mos2_PDOS_Tetrahedron_atom1;
% load negf-mos2.PDOS.Tetrahedron.atom2.d3;
% x2 = negf-mos2_PDOS_Tetrahedron_atom2;
% load negf-mos2.PDOS.Tetrahedron.atom3.d3;
% x3 = negf-mos2_PDOS_Tetrahedron_atom3;
% load negf-mos2.PDOS.Tetrahedron.atom4.d3;
% x4 = negf-mos2_PDOS_Tetrahedron_atom4;
% load negf-mos2.PDOS.Tetrahedron.atom5.d3;
% x5 = negf-mos2_PDOS_Tetrahedron_atom5;
% load negf-mos2.PDOS.Tetrahedron.atom6.d3;
% x6 = negf-mos2_PDOS_Tetrahedron_atom6;
% x = x1+x2+x3+x4+x5+x6;
% plot(x1(:,1),x(:,2));
% xlim([-3,2]);
% 
% load negf-mos2.PDOS.Tetrahedron.atom1.d4;
% x1 = negf-mos2_PDOS_Tetrahedron_atom1;
% load negf-mos2.PDOS.Tetrahedron.atom2.d4;
% x2 = negf-mos2_PDOS_Tetrahedron_atom2;
% load negf-mos2.PDOS.Tetrahedron.atom3.d4;
% x3 = negf-mos2_PDOS_Tetrahedron_atom3;
% load negf-mos2.PDOS.Tetrahedron.atom4.d4;
% x4 = negf-mos2_PDOS_Tetrahedron_atom4;
% load negf-mos2.PDOS.Tetrahedron.atom5.d4;
% x5 = negf-mos2_PDOS_Tetrahedron_atom5;
% load negf-mos2.PDOS.Tetrahedron.atom6.d4;
% x6 = negf-mos2_PDOS_Tetrahedron_atom6;
% x = x1+x2+x3+x4+x5+x6;
% plot(x1(:,1),x(:,2));
% xlim([-3,2]);
% 
% load negf-mos2.PDOS.Tetrahedron.atom1.d5;
% x1 = negf-mos2_PDOS_Tetrahedron_atom1;
% load negf-mos2.PDOS.Tetrahedron.atom2.d5;
% x2 = negf-mos2_PDOS_Tetrahedron_atom2;
% load negf-mos2.PDOS.Tetrahedron.atom3.d5;
% x3 = negf-mos2_PDOS_Tetrahedron_atom3;
% load negf-mos2.PDOS.Tetrahedron.atom4.d5;
% x4 = negf-mos2_PDOS_Tetrahedron_atom4;
% load negf-mos2.PDOS.Tetrahedron.atom5.d5;
% x5 = negf-mos2_PDOS_Tetrahedron_atom5;
% load negf-mos2.PDOS.Tetrahedron.atom6.d5;
% x6 = negf-mos2_PDOS_Tetrahedron_atom6;
% x = x1+x2+x3+x4+x5+x6;
% plot(x1(:,1),x(:,2));
% xlim([-3,2]);
% 
% load negf-mos2.PDOS.Tetrahedron.atom1.p1;
% x1 = negf-mos2_PDOS_Tetrahedron_atom1;
% load negf-mos2.PDOS.Tetrahedron.atom2.p1;
% x2 = negf-mos2_PDOS_Tetrahedron_atom2;
% load negf-mos2.PDOS.Tetrahedron.atom3.p1;
% x3 = negf-mos2_PDOS_Tetrahedron_atom3;
% load negf-mos2.PDOS.Tetrahedron.atom4.p1;
% x4 = negf-mos2_PDOS_Tetrahedron_atom4;
% load negf-mos2.PDOS.Tetrahedron.atom5.p1;
% x5 = negf-mos2_PDOS_Tetrahedron_atom5;
% load negf-mos2.PDOS.Tetrahedron.atom6.p1;
% x6 = negf-mos2_PDOS_Tetrahedron_atom6;
% x = x1+x2+x3+x4+x5+x6;
% plot(x1(:,1),x(:,2));
% xlim([-3,2]);
% 
% load negf-mos2.PDOS.Tetrahedron.atom1.p2;
% x1 = negf-mos2_PDOS_Tetrahedron_atom1;
% load negf-mos2.PDOS.Tetrahedron.atom2.p2;
% x2 = negf-mos2_PDOS_Tetrahedron_atom2;
% load negf-mos2.PDOS.Tetrahedron.atom3.p2;
% x3 = negf-mos2_PDOS_Tetrahedron_atom3;
% load negf-mos2.PDOS.Tetrahedron.atom4.p2;
% x4 = negf-mos2_PDOS_Tetrahedron_atom4;
% load negf-mos2.PDOS.Tetrahedron.atom5.p2;
% x5 = negf-mos2_PDOS_Tetrahedron_atom5;
% load negf-mos2.PDOS.Tetrahedron.atom6.p2;
% x6 = negf-mos2_PDOS_Tetrahedron_atom6;
% x = x1+x2+x3+x4+x5+x6;
% plot(x1(:,1),x(:,2));
% xlim([-3,2]);
% 
% load negf-mos2.PDOS.Tetrahedron.atom1.p3;
% x1 = negf-mos2_PDOS_Tetrahedron_atom1;
% load negf-mos2.PDOS.Tetrahedron.atom2.p3;
% x2 = negf-mos2_PDOS_Tetrahedron_atom2;
% load negf-mos2.PDOS.Tetrahedron.atom3.p3;
% x3 = negf-mos2_PDOS_Tetrahedron_atom3;
% load negf-mos2.PDOS.Tetrahedron.atom4.p3;
% x4 = negf-mos2_PDOS_Tetrahedron_atom4;
% load negf-mos2.PDOS.Tetrahedron.atom5.p3;
% x5 = negf-mos2_PDOS_Tetrahedron_atom5;
% load negf-mos2.PDOS.Tetrahedron.atom6.p3;
% x6 = negf-mos2_PDOS_Tetrahedron_atom6;
% x = x1+x2+x3+x4+x5+x6;
% plot(x1(:,1),x(:,2));
% xlim([-3,2]);
% 
% load negf-mos2.PDOS.Tetrahedron.atom1.s1;
% x1 = negf-mos2_PDOS_Tetrahedron_atom1;
% load negf-mos2.PDOS.Tetrahedron.atom2.s1;
% x2 = negf-mos2_PDOS_Tetrahedron_atom2;
% load negf-mos2.PDOS.Tetrahedron.atom3.s1;
% x3 = negf-mos2_PDOS_Tetrahedron_atom3;
% load negf-mos2.PDOS.Tetrahedron.atom4.s1;
% x4 = negf-mos2_PDOS_Tetrahedron_atom4;
% load negf-mos2.PDOS.Tetrahedron.atom5.s1;
% x5 = negf-mos2_PDOS_Tetrahedron_atom5;
% load negf-mos2.PDOS.Tetrahedron.atom6.s1;
% x6 = negf-mos2_PDOS_Tetrahedron_atom6;
% x = x1+x2+x3+x4+x5+x6;
% plot(x1(:,1),x(:,2));
% xlim([-3,2]);
% Used to grow nanotube structure of MoS2 for 6N atom (N unit cell) 

% Total atom number: 6N = 2N(Mo) + 4N(S);

format long;

N = 24;

%%%%%%%%%%%%%%%%%%%%%%%%% constants

d0 = 3.179;       % Mo - Mo
d1 = 2.39166;     % Mo - S 
d2 = 3.06618;     % S - S
theta_SMoS = 79.7352;  % Angle for S-Mo-S in one conventional unit cell
d_theta = 2*pi/N;
R0 = d0 / (2* sin(d_theta/2));   % radius of Mo ring

%%%%%%%%%%%%%%%%%%%%%%%%% Calculating the Unit Cell parameters

length_yz = R0+N;
xx = [d0*sqrt(3), 0.0000, 0.00000]; 
yy = [0.0000, length_yz , 0.0000];
zz = [0.0000, 0.0000, length_yz ];
C0_y = (length_yz )/2;
C0_z = (length_yz )/2;


%%%%%%%%%%%%%%%%%%%%%%%%%% Calculating some structure parameters

% First ring of Mo atoms 
R0 = d0 / (2* sin(d_theta/2));   % radius of Mo ring
x0 = 0;
%theta = theta+d_theta;
%Mo = (0, R0*cos(theta),R0*sin(theta));

% First double ring of S atoms
dd = sqrt((d0/2)^2+(d2/2)^2);  % distance between Mo-S in sideview 
r1 = R0*cos(d_theta/2) - sqrt((dd^2 - (R0*sin(d_theta/2))^2)); % radius for inner S 
r2 = R0*cos(d_theta/2) + sqrt((dd^2 - (R0*sin(d_theta/2))^2)); % radius for outer S
x1 = (d0/2)*tan(pi/6);
% theta = d_theta / 2;
% theta = theta+d_theta;
% origin x1 = (d0/2)*tan(pi/6);
% S1 = (original x1, r1*cos(theta),r1*sin(theta));
% S2 = (original x1, r2*cos(theta),r2*sin(theta));

% Second double ring of S atoms 
x2 = -1* (d0/2)*tan(pi/6)*2;
% origin x2 = -1* (d0/2)*tan(pi/6)*2;
% S1 = (original x2, r1*cos(theta),r1*sin(theta));
% S2 = (original x2, r2*cos(theta),r2*sin(theta));

% Second ring of Mo atoms
x3 = -1*d0/2*sqrt(3);
% theta = theta+d_theta;
% Mo = (-1*d0/2*sqrt(3), R0*cos(theta),R0*sin(theta));




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Output the positions as POSCAR file

fp = fopen('POSCAR','a+');

fprintf(fp,'%s\n','MoS2 Nanotube');
fprintf(fp,'%g\n',1.0);
fprintf(fp,'%16g%16g%16g\n',xx(1),xx(2),xx(3));
fprintf(fp,'%16g%16g%16g\n',yy(1),yy(2),yy(3));
fprintf(fp,'%16g%16g%16g\n',zz(1),zz(2),zz(3));
fprintf(fp,'%s\n','Mo   S');
fprintf(fp,'%16g%16g\n',N*2,N*4);
fprintf(fp,'%s\n','Cartesian');



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Getting the positions for atoms



% Mo:
theta0 = 0;
for i = 1: N
    theta = theta0 + d_theta*(i-1);
    Mo = [x0-x3, R0*cos(theta)+C0_y,R0*sin(theta)+C0_z];
    fprintf(fp,'%16g%16g%16g\n',Mo(1),Mo(2),Mo(3));
end

theta0 = 0 + d_theta/2;
for i = 1: N
    theta = theta0 + d_theta*(i-1);
    Mo = [x3-x3, R0*cos(theta)+C0_y,R0*sin(theta)+C0_z];
    fprintf(fp,'%16g%16g%16g\n',Mo(1),Mo(2),Mo(3));
end

% S: 
theta0 = 0 + d_theta/2;
for i = 1: N
    theta = theta0 + d_theta*(i-1);
    S1 = [x1-x3, r1*cos(theta)+C0_y,r1*sin(theta)+C0_z];
    S2 = [x1-x3, r2*cos(theta)+C0_y,r2*sin(theta)+C0_z];
    fprintf(fp,'%16g%16g%16g\n%16g%16g%16g\n',S1(1),S1(2),S1(3),S2(1),S2(2),S2(3));
end

theta0 = 0;
for i = 1: N
    theta = theta0 + d_theta*(i-1);
    S1 = [x2-x3, r1*cos(theta)+C0_y,r1*sin(theta)+C0_z];
    S2 = [x2-x3, r2*cos(theta)+C0_y,r2*sin(theta)+C0_z];
    fprintf(fp,'%16g%16g%16g\n%16g%16g%16g\n',S1(1),S1(2),S1(3),S2(1),S2(2),S2(3));
end




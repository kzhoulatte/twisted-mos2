% Reciprocal lattice calculator following converters.

% R1 = ;
% R2 = ;
% R3 = ;

K1 = 2*pi*(cross(R2,R3))/dot(R1,cross(R2,R3));
disp(K1);
K2 = 2*pi*(cross(R3,R1))/dot(R1,cross(R2,R3));
disp(K2);
K3 = 2*pi*(cross(R1,R2))/dot(R1,cross(R2,R3));
disp(K3);
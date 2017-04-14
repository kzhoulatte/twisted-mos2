
%************************************************************
%******************* MODIFY THE STRUCTURE etc *****************************************
%************************************************************


clc;
clear;

format long;


%************************************************************
%******************* Rotate the structure etc *****************************************
%************************************************************


% Rotate the structure for OpenMX NEGF calculation


%{
<Atoms.SpeciesAndCoordinates
1  S         0.000000000   1.871405846 1.605845446   3.0  3.0
2  Mo        1.620681382   0.935701903 3.210443637   7.0  7.0
3  S         0.000000000   1.871405846 4.815041827   3.0  3.0
4  S         1.620681382   0.935701903 8.026732719   3.0  3.0
5  Mo        0.000000000   1.871405846 9.631341007   7.0  7.0
6  S         1.620681382   0.935701903 11.235898807  3.0  3.0
Atoms.SpeciesAndCoordinates>
Atoms.UnitVectors.Unit             Ang # Ang|AU
<Atoms.UnitVectors
   3.179447   0.0000    0.000
   -1.589723  2.753482  0.000
   0.0000     0.0000    33.3761
Atoms.UnitVectors>

%}

%{
S1 = [0.000000000,1.871405846,1.605845446];
Mo1 = [1.620681382,0.935701903,3.210443637];
S2 = [0.000000000,1.871405846,4.815041827];
S3 = [1.620681382,0.935701903,8.026732719];
Mo2 = [0.000000000,1.871405846,9.631341007];
S4 = [1.620681382,0.935701903,11.235898807];

a1 = [3.179447,0.0000,0.000];
a2 = [-1.589723,2.753482,0.000];
a3 = [0.0000,0.0000,33.3761];

theta1 = -pi/2;
Rot1 = [cos(theta1),0,-sin(theta1)
    0  , 1,   0
    sin(theta1),0,cos(theta1)];

theta2 = 0;
Rot2 = [1,0,0
    0  , cos(theta2),  sin(theta2)
    0, -sin(theta2), cos(theta2)];

a1_new = [3.179447,0.0000,0.000];
a2_new = [-1.589723,2.753482,0.000];
a3_new = [0.0000,0.0000,33.3761];

S1_new = (Rot2*Rot1*S1')';
Mo1_new = (Rot2*Rot1*Mo1')';
S2_new = (Rot2*Rot1*S2')';
S3_new = (Rot2*Rot1*S3')';
Mo2_new = (Rot2*Rot1*Mo2')';
S4_new = (Rot2*Rot1*S4')';

fid = fopen('positions_after_rot','a');

fprintf(fid,'%g %g %g\n',a1_new(1),a1_new(2),a1_new(3));
fprintf(fid,'%g %g %g\n',a2_new(1),a2_new(2),a2_new(3));
fprintf(fid,'%g %g %g\n',a3_new(1),a3_new(2),a3_new(3));
fprintf(fid,'%g %g %g\n',S1_new(1),S1_new(2),S1_new(3));
fprintf(fid,'%g %g %g\n',Mo1_new(1),Mo1_new(2),Mo1_new(3));
fprintf(fid,'%g %g %g\n',S2_new(1),S2_new(2),S2_new(3));
fprintf(fid,'%g %g %g\n',S3_new(1),S3_new(2),S3_new(3));
fprintf(fid,'%g %g %g\n',Mo2_new(1),Mo2_new(2),Mo2_new(3));
fprintf(fid,'%g %g %g\n',S4_new(1),S4_new(2),S4_new(3));
%}



%************************************************************
%******************* Get Rectangular Unit Cell etc *****************************************
%************************************************************


% Get the new structure as Rectangular Unit Cell / Only Dealing with b c
% unit vectors


%{
a = 3.179447;
b = a / sqrt(3);

a1 = [3.179447,0.000000];
a2 = [-1.589723, 2.753482];
atom1 = 0.33983*a1+0.67965*a2; %[1.871405846,0.000000000]; %
atom2 = 0.67965*a1+0.33982*a2; %[0.935701903,1.620681382];%
atom3 = 0.67965*a1+1.33982*a2; %[1.871405846+b,0.000000000];% 
atom4 = 1.33983*a1+0.67965*a2; %[0.935701903,1.620681382+b*[cos(pi/6),sin(pi/6)]];% 

New_a1_length = a * sqrt(3);
New_a2_length = a;

New_O = a2 - 1/4* (a1+a2);
O_in_new_coord = - New_O;

New_atom1 = O_in_new_coord+atom1; %[1.871405846,0.000000000]; %
New_atom2 = O_in_new_coord+atom2; %[0.935701903,1.620681382];%
New_atom3 = O_in_new_coord+atom3; %[1.871405846+b,0.000000000];% 
New_atom4 = O_in_new_coord+atom4; %[0.935701903,1.620681382+b*[cos(pi/6),sin(pi/6)]];% 
%}


%************************************************************
%******************* Extent the Structure *****************************************
%************************************************************

%For Zigzag Interface:

%{
     0.000000000         0.000000000         3.067372537
     2.753481865         1.589723373         3.067372537
        
     3.671308934         0.000000000         1.534282034
     3.671308934         0.000000000         4.600463139
     0.917827234         1.589723373         1.534282034
     0.917827234         1.589723373         4.600463139
     9.1782726640        0.000000000         1.534282034
     9.1782726640        0.000000000         4.600463139
     6.42479096400       1.589723373         1.534282034
     6.42479096400       1.589723373         4.600463139
     
     5.506963730         0.000000000         3.067372537
     8.260445600         1.589723468         3.067372537
%}


mo1 = [0.000000000   ,     0.000000000   ,      3.067372537];
mo2 = [2.753481865   ,     1.589723373    ,     3.067372537];
S1 = [3.671308934   ,      0.000000000    ,     1.534282034];
S2 = [3.671308934   ,      0.000000000   ,      4.600463139];
S3 = [0.917827234   ,      1.589723373   ,      1.534282034];
S4 = [0.917827234   ,      1.589723373   ,      4.600463139];
S5 = [9.1782726640  ,      0.000000000   ,      1.534282034];
S6 = [9.1782726640   ,     0.000000000   ,      4.600463139];
S7 = [6.42479096400  ,     1.589723373   ,      1.534282034];
S8 = [6.42479096400  ,     1.589723373    ,     4.600463139];
w1 = [5.506963730     ,    0.000000000     ,    3.067372537];
w2 = [8.260445600    ,     1.589723468     ,    3.067372537];

a1 = 11.01400000/2;
a2 = 6.3589000000/2;

fid = fopen('extented_structure_retang_zigzag','a');

% For the Mo atoms:

for i = 1:5
    mo11 = mo1+(i-1)*[a1,0,0];
    mo22 = mo2+(i-1)*[a1,0,0];
    fprintf(fid,'%16f%16f%16f\n',mo11(1),mo11(2),mo11(3));
    fprintf(fid,'%16f%16f%16f\n',mo22(1),mo22(2),mo22(3));
end

% For the S atoms around Mo: 

for i = 1:5
    S11 = S1+(i-1)*[a1,0,0]*2;
    S22 = S2+(i-1)*[a1,0,0]*2;
    S33 = S3+(i-1)*[a1,0,0]*2;
    S44 = S4+(i-1)*[a1,0,0]*2;
    S55 = S5+(i-1)*[a1,0,0]*2;
    S66 = S6+(i-1)*[a1,0,0]*2;
    S77 = S7+(i-1)*[a1,0,0]*2;
    S88 = S8+(i-1)*[a1,0,0]*2;
    fprintf(fid,'%16f%16f%16f\n',S11(1),S11(2),S11(3));
    fprintf(fid,'%16f%16f%16f\n',S22(1),S22(2),S22(3));
    fprintf(fid,'%16f%16f%16f\n',S33(1),S33(2),S33(3));
    fprintf(fid,'%16f%16f%16f\n',S44(1),S44(2),S44(3));
    fprintf(fid,'%16f%16f%16f\n',S55(1),S55(2),S55(3));
    fprintf(fid,'%16f%16f%16f\n',S66(1),S66(2),S66(3));
    fprintf(fid,'%16f%16f%16f\n',S77(1),S77(2),S77(3));
    fprintf(fid,'%16f%16f%16f\n',S88(1),S88(2),S88(3));
end

    
% For the W atoms: 

for i = 1:5
    w11 = w1+(i-1+4)*[a1,0,0];
    w22 = w2+(i-1+4)*[a1,0,0];
    fprintf(fid,'%16f%16f%16f\n',w11(1),w11(2),w11(3));
    fprintf(fid,'%16f%16f%16f\n',w22(1),w22(2),w22(3));
end



%For Armchair Interface:

%{
      0.000000000         0.000000000         3.067372537
     2.753481865         1.58972500         3.067372537
     0.000000000         3.1794469357         3.067372537
     2.753481865         4.76917040355        3.067372537  
     3.671308934         0.000000000         1.534282034
     3.671308934         0.000000000         4.600463139
     0.917827234         1.589725000         1.534282034
     0.917827234         1.589725000         4.600463139   
     0.917845615         4.76917040355         1.534282034
     0.917845615         4.76917040355         4.600463139
     3.671327644         3.1794469357         1.534282034
     3.671327644         3.1794469357         4.600463139 
     3.671308934         6.358900000         1.534282034
     3.671308934         6.358900000         4.600463139
     0.917827234         7.948625000         1.534282034
     0.917827234         7.948625000         4.600463139  
     0.917845615         11.12807040355         1.534282034
     0.917845615         11.12807040355        4.600463139
     3.671327644         9.53834693570         1.534282034
     3.671327644         9.53834693570         4.600463139       
    0.000000000         6.358900000         3.067372537
     2.753481865         7.948625000         3.067372537 
     0.000000000         9.53834693570         3.067372537
     2.753481865         11.12807040355        3.067372537 
%}


 mo1 =  [ 0.000000000   ,      0.000000000    ,     3.067372537];
 mo2 =  [ 2.753481865   ,      1.58972500      ,   3.067372537];
 w1 =   [0.000000000    ,     3.1794469357     ,    3.067372537];
 w2 =   [  2.753481865  ,       4.76917040355   ,     3.067372537];  
 S1 =   [  3.671308934  ,       0.000000000     ,    1.534282034];
  S2 =  [3.671308934    ,     0.000000000       ,  4.600463139];
  S3 =  [0.917827234    ,     1.589725000       ,  1.534282034];
  S4 =  [0.917827234    ,     1.589725000       ,  4.600463139 ];  
  S5 =  [0.917845615    ,     4.76917040355     ,    1.534282034];
  S6 =  [0.917845615    ,     4.76917040355     ,    4.600463139];
  S7 =  [3.671327644    ,     3.1794469357      ,   1.534282034];
   S8 = [3.671327644    ,     3.1794469357      ,   4.600463139 ];
       
a1 = 11.01400000/2;
a2 = 6.3589000000/2;

fid = fopen('extented_structure_retang_armchair','a');

% For the Mo atoms:

for i = 1:5
    mo11 = mo1+(i-1)*[0,a2,0];
    mo22 = mo2+(i-1)*[0,a2,0];
    fprintf(fid,'%16f%16f%16f\n',mo11(1),mo11(2),mo11(3));
    fprintf(fid,'%16f%16f%16f\n',mo22(1),mo22(2),mo22(3));
end

% For the S atoms around Mo: 

for i = 1:5
    S11 = S1+(i-1)*[0,a2,0]*2;
    S22 = S2+(i-1)*[0,a2,0]*2;
    S33 = S3+(i-1)*[0,a2,0]*2;
    S44 = S4+(i-1)*[0,a2,0]*2;
    S55 = S5+(i-1)*[0,a2,0]*2;
    S66 = S6+(i-1)*[0,a2,0]*2;
    S77 = S7+(i-1)*[0,a2,0]*2;
    S88 = S8+(i-1)*[0,a2,0]*2;
    fprintf(fid,'%16f%16f%16f\n',S11(1),S11(2),S11(3));
    fprintf(fid,'%16f%16f%16f\n',S22(1),S22(2),S22(3));
    fprintf(fid,'%16f%16f%16f\n',S33(1),S33(2),S33(3));
    fprintf(fid,'%16f%16f%16f\n',S44(1),S44(2),S44(3));
    fprintf(fid,'%16f%16f%16f\n',S55(1),S55(2),S55(3));
    fprintf(fid,'%16f%16f%16f\n',S66(1),S66(2),S66(3));
    fprintf(fid,'%16f%16f%16f\n',S77(1),S77(2),S77(3));
    fprintf(fid,'%16f%16f%16f\n',S88(1),S88(2),S88(3));
end

    
% For the W atoms: 

for i = 1:5
    w11 = w1+(i-1+4)*[0,a2,0];
    w22 = w2+(i-1+4)*[0,a2,0];
    fprintf(fid,'%16f%16f%16f\n',w11(1),w11(2),w11(3));
    fprintf(fid,'%16f%16f%16f\n',w22(1),w22(2),w22(3));
end







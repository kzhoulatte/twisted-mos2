% To transfer xy of K points from Cart. Coord. to Crystal Coord. or verse
% versa.

% For hexagonal lattice.

function [x,y] = ToGetCartCoord(n,m)
%TOGETCRYSTALCOORD input are the Cart. Coord, and the function will give
%Crystal Coord.
x = n +  m / 2;
y = sqrt(3) / 2 * m;
%return n,m;

end

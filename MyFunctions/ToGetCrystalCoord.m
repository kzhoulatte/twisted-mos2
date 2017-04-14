function [n,m] = ToGetCrystalCoord(x,y)
%TOGETCRYSTALCOORD input are the Cart. Coord, and the function will give
%Crystal Coord.
m = 2 * y / sqrt(3);
n = x - m / 2;
%return n,m;

end


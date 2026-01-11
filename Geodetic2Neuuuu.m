clear all;clc; format long g;

LatP=39;
LonP=32;
hp=1100;

LatQ=40;
LonQ=33;
hQ=2000;

E=referenceEllipsoid('grs80');

[EastP, NorthP, UpP]=geodetic2enu(LatP, LonP, hp, LatQ, LonQ, hQ, E)
[az,elev,slantRange] = enu2aer(EastP, NorthP, UpP)


%hocaya sor
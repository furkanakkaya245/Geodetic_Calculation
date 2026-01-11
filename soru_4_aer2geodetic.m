clear all;clc;delete *.asv; format long g;
LatP = dms2degrees ([38 20 33.47]);
LonP = dms2degrees ([40 32 21.43]);
hP=2144.391;
az = 28;
elev = 90 - 32; %90'dan zenit açısını çıkarcaz
slantRange = 32000; %metre

E= referenceEllipsoid('grs80');

%aer2geodetic
% Q noktasının jeodezik koordinatları
[latQ,lonQ,hQ]= aer2geodetic(az, elev, slantRange, LatP, LonP, hP,E)
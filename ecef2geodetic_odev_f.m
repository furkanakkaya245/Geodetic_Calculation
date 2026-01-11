%% Soru 13 a)
clc;
clear all;
format long g;
s=referenceEllipsoid("grs80");
x = 4150401.17508757;
y = 2618003.14204082;
z = 4062248.11336046;

[lat,lon,h] = ecef2geodetic(s,x, y, z);

fi=degrees2dms(lat)
lam=degrees2dms(lon)
H=h

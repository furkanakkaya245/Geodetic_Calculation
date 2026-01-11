clc;clear all;format long g;
x = 4156406.6935;
y = 2647923.0962;
z = 4035803.5194;
R=6374018.98716534;
lat=rad2deg(atan(z/sqrt(x^2+y^2)))
lon=rad2deg(atan(y/x))
h=(z/sind(lat)-R)
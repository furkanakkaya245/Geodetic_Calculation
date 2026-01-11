format long g;
clc;
clear all;
ksi=0.0811681664/3600;
eta=-1.4753603264/3600;
asLon=(ksi/(cosd(37.4583)))+32.709567;
asLat=eta+39.960379;
asAz=37.4583+(ksi*tand(39.960379));
e=sqrt(power(ksi,2)+power(eta,2));
E=referenceEllipsoid('wgs84');
[x,y,z]=geodetic2ecef(E,39.960379,32.709567,900)
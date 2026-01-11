%areaguad.m
clc;clear all;
format long g;
phi1 = 36;
phi2 = 38;
lam1 = 34;
lam2 = 39;
E=referenceEllipsoid('grs80');
dphi = 2/60; % 2 yay-dak       ( dikkat et)
dlam = 24/3600; % 24 yay-san
[LON,LAT] = meshgrid(lam1:dlam:lam2, phi1 : dphi : phi2);
b=E.SemiminorAxis;
a=E.SemimajorAxis;
e2=E.Eccentricity^2;
M=rcurve('meridian',E,LAT);
N= rcurve('transverse',E,LAT);

F1 = N.*(1-e2).*cosd(LAT)-M.*(1+e2).*sind(LON);
F2=a.*sind(LAT).^2+b.*(1+e2).*cosd(LON);
F=F1.*F2;
a = trapz(deg2rad(phi1: dphi : phi2), trapz(deg2rad(lam1:dlam:lam2),F,2))*1E-6
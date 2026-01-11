clear all;clc;
format long g;
phi1 = 26;
phi2 = 27;
lam1 = 29;
lam2 = 30;

% (trapz.m)
E = referenceEllipsoid ('grs80');
b=E.SemiminorAxis;
a=E.SemimajorAxis;
e2=E.Eccentricity^2;
dphi = 0.5; % 0.1 yay-dakika       ( dikkat et)
dlam = 0.5; % 0.1 yay-dakika
[LON,LAT] = meshgrid(lam1:dlam:lam2, phi1 : dphi : phi2);

M=rcurve('meridian',E,LAT);
N = rcurve('transverse',E,LAT);
F1 = N.*sind(LON)+M.*cosd(LAT);
F2=N.*b+M.*sind(LON);
F=F1+F2;
a2 = trapz(deg2rad(phi1: dphi : phi2), trapz(deg2rad(lam1:dlam:lam2),F,2))*1E-6
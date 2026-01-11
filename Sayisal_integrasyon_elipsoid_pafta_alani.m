% Elipsoit Alan (S = doubleintegral (M*N*cos (phi) *dphi*dlam)
%areaguad.m
clc;clear all;
format long g;
phi1 = 36;
phi2 = 42;
lam1 = 26;
lam2 = 45;
E=referenceEllipsoid('grs80');

a1 = areaquad(phi1,lam1,phi2,lam2,E)*1E-6; % km2

% (trapz.m)
E = referenceEllipsoid ('grs80');
dphi = 0.1/60; % 0.1 yay-dakika       ( dikkat et)
dlam = 0.1/60; % 0.1 yay-dakika
[LON,LAT] = meshgrid(lam1:dlam:lam2, phi1 : dphi : phi2);

M=rcurve('meridian',E,LAT);
NcosPhi = rcurve('transverse',E,LAT).*cosd(LAT);
F = M.*NcosPhi;
a2 = trapz(deg2rad(phi1: dphi : phi2), trapz(deg2rad(lam1:dlam:lam2),F,2))*1E-6;

%（integral2.m）
E =referenceEllipsoid('grs80');
a = E.SemimajorAxis;
e2 = E.Eccentricity^2;
M = @(phi) (a.* (1-e2))./ (1-e2.*sin(phi).^2).^1.5;
N = @(phi) a ./ sqrt((1-e2.*sin(phi).^2));
a3 = integral2(@ (lam,phi) M(phi).*N(phi).*cos(phi),...
            deg2rad(lam1),deg2rad(lam2),deg2rad(phi1),deg2rad(phi2))*1E-6;

% (integral2 m)
E = referenceEllipsoid ('grs80');
a4 = integral2(@(lam,phi) rcurve ('meridian',E,rad2deg(phi)).*rcurve('transverse',E,rad2deg(phi)).*cos(phi),...
                  deg2rad(lam1),deg2rad(lam2),deg2rad(phi1),deg2rad(phi2)) *1E-6;
%compare
A = [a1;a2;a3;a4]
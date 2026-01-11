clc;
format long g;
clear all;
%% TRAPZ
%Tanımlamalar
E=referenceEllipsoid("grs80");
e2=E.Eccentricity^2;
a=E.SemimajorAxis;
b=E.SemiminorAxis;
%Aralık Tanımlama
phi1=36;
phi2=38;
lam1=34;
lam2=39;
dphi=2/60; %dakika
dlam=24/3600; %saniye
[LON,LAT]=meshgrid(lam1:dlam:lam2,phi1:dphi:phi2);
N=rcurve('transverse',E,LAT);
M=rcurve('meridian',E,LAT);
% %Fonksiyon Tanımlama
f1= N.*(1-e2).*cosd(LAT)-M.*(1+e2).*sind(LON);
f2=a.*sind(LAT).^2+b.*(1+e2).*cosd(LON);
f=f1.*f2;
% %Çözüm
Alan=trapz(deg2rad(phi1:dphi:phi2),trapz(deg2rad(lam1:dlam:lam2),f,2))*1E-6








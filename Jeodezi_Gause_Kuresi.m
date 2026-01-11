clc;clear all;format long g;

RefElip=referenceEllipsoid('wgs84');

lat=30;

M=rcurve('meridian',RefElip,lat)    %degree
M_m=(RefElip.SemimajorAxis*(1-RefElip.Eccentricity^2))/((1-RefElip.Eccentricity^2*sind(lat)^2)^1.5)
N=rcurve('transverse',RefElip,lat)  %degree
N_n=RefElip.SemimajorAxis/sqrt(1-RefElip.Eccentricity^2*sind(lat)^2)

% plot(lat,M/1000,'r-s');
% hold on;
% plot(lat,N/1000,'k-d');
% grid on;
% xlabel('Enlem');
% ylabel('(km)');
% legend('M','N');
R=sqrt(M*N);
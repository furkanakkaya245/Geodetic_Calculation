clc;clear all;format long g;

RefElip=referenceEllipsoid('wgs84');

lat=40.85382;

M=rcurve('meridian',RefElip,lat) %degree
N=rcurve('transverse',RefElip,lat)  %degree
 
% plot(lat,M/1000,'r-s',LineWidth=2);
% hold on;
% plot(lat,N/1000,'k-d',LineWidth=2);
% grid on;
% xlabel('Enlem');
% ylabel('(km)');
% legend('M','N');
R=sqrt(M*N)
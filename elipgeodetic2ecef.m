clc;
clear all;
lat_dms = [39 23 12.154];
lon_dms = [32 46 18.256];
h = 1100.112; 
lat=deg2rad(dms2degrees([39 23 12.154]));
lon=deg2rad(dms2degrees([32 46 18.256]));
e=0.0818191910435;
wgs84=referenceEllipsoid('wgs84');
a=wgs84.SemimajorAxis;
N=a/sqrt(1-e^2*sin(lat)^2);
x=(N+h)*cos(lat)*cos(lon);
y=(N+h)*cos(lat)*sin(lon);
z=(N*(1-e^2)+h)*sin(lat);

fprintf('x: %0.3f meters\n', x);
fprintf('y: %0.3f meters\n', y);
fprintf('z: %0.3f meters\n', z);
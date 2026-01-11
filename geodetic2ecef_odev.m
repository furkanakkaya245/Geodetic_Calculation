clc;
clear all;


s=referenceEllipsoid("grs80");
lat_dms = [39 48 29];
lon_dms = [32 14 35];
h = 956.3244; 

lat=dms2degrees([39 48 29]);
lon=dms2degrees([32 14 35]);


[x, y, z] = geodetic2ecef(s, lat, lon, h);
fprintf('x: %0.3f meters\n', x);
fprintf('y: %0.3f meters\n', y);
fprintf('z: %0.3f meters\n', z);
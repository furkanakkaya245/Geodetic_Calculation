addpath('D://Kod');
clc;
clear all;
format long g;
%E=referenceSphere("earth");
lat= deg2rad(dms2degrees([39 23 12.154]));
lon= deg2rad(dms2degrees([32 46 18.256]));
h= 1100.12;
%E.Radius=6371000;
%[x,y,z]=geodetic2ecef(E,lat,lon,h,"radians");
%fprintf("x: %.f km\ny: %.f km\nz: %.f km\n",x/1000,y/1000,z/1000);

x= 4140999.9;
y= 2665802.2;
z= 4043424.1;

%[lat1,lon1,h]=ecef2geodetic(E,x,y,z,'degrees');
%fprintf("Enlem: %.1f %.1f %.1f\nBoylam: %.1f %.1f %.1f\nh: %.1f\n",degrees2dms(lat1),degrees2dms(lon1),h);
S=referenceSphere("earth");
S.Radius=6371000;

x= 42685.132;
y= 20166.155;
z= 36483.416;
[lat, lon ,h]=geodetic2ecef(S,x,y,z,"degrees");

lat_a= lat + 15;
lon_a= lat - 15;
lat_b= lat + 15;
lon_b= lat + 15;
lat_c= lat - 15;
lon_c= lat - 15;
lat_d= lat - 15;
lon_d= lat + 15;

AC = meridianarc(deg2rad(lat_a),deg2rad(lat_c),S);
BD = meridianarc(deg2rad(lat_d),deg2rad(lat_b),S);
AB = departure(lon_b,lon_a,lat_a,S);
CD = departure(lon_b,lon_a,lat_d,S);

fprintf("AB: %.2f\nBD: %.2f\nAC: %.2f\nCD: %.2f\n",AB,BD,AC,CD);
clc;clear all;format long g;
x=4126517.7730;
y=2673008.3171;
z=4059587.8614;
R=6371000; %Eartsphere.radius    formullü her zaman küre verir.

lat=rad2deg(atan(z/sqrt(x^2+y^2)))
lon=rad2deg(atan(y/x))
h=(z/sind(lat)-R)


% Latitude: 39.54605250 degrees
% Longitude: 32.93370028 degrees
% Height: 4999.99988997 meters

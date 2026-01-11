clear all;clc;
format long g;
lat=39;
lon1=180;
lon2=0;
E = referenceEllipsoid('grs80');
N=rcurve('transverse',E,lat)


dist=((N*cosd(lat)*(deg2rad(lon1-lon2)))*2)*1E-3 %km


%% 
e=referenceEllipsoid("grs80");
Lon1=0;
Lon2=180;
Lat=39;

dist=((abs(departure(Lon1,Lon2,Lat,e)))*2)*1E-3  %km
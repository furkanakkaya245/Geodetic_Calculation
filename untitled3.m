%% 2.Temel Odev
% syf 96 2.s
clc;clear all;format long g;

Lat1=40;
Lon1=40;
Lat2=39;
Lon2=39;

EartSphere=referenceSphere('Earth');
EartSphere.Radius=6370000;
[arclen,az]= distance(Lat1,Lon1,Lat2,Lon2,EartSphere)% azimut: 1  den 2 ye  % derece alır
[arclen,az]= distance(Lat2,Lon2,Lat1,Lon1,EartSphere)% azimut: 2 den 1 e

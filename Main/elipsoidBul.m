%%ELİPSOİD İLE EĞRİ KOORDİNAT SİSTEMİ İLİŞKİSİ
addpath('D:\Kod');
clc;
clear all;
format long g
%Koordinatları verilen P noktasının WGS84,GRS80, ve R si olan küreye göre
%phi,landa,h değerlerini bul.
x=4199512,179;
y=2624146,454;
z=4010029,532;
R=6373000;
E=referenceEllipsoid("GRS80");
E1=referenceEllipsoid("WGS84");
S=referenceSphere("earth");
S.Radius=R;
[Lat,Lon,h]=ecef2geodetic(S,x,y,z);
[Lat1,Lon1,h1]=ecef2geodetic(E,x,y,z);
[Lat2,Lon2,h2]=ecef2geodetic(E1,x,y,z);
fprintf('Earth:\nLon: %0.5f , Lat: %0.5f , h= %0.5f \n',Lat,Lon,h);
fprintf('GRS80:\nLon: %0.5f , Lat: %0.5f , h= %0.5f \n',Lat1,Lon1,h1);
fprintf('WGS84:\nLon: %0.5f , Lat: %0.5f , h= %0.5f \n',Lat2,Lon2,h2);
%Bir p noktası Lon:39.188 , Lat: 32.000 h: 2357.4098 olan noktanın x,y,z
%koordinatlarını bul
E=referenceEllipsoid("GRS80");
E1=referenceEllipsoid("WGS84");
S=referenceSphere("earth");
S.Radius=6373000;
[X1,Y1,Z1]= geodetic2ecef(S,39.18828,32.00000,2357.40986);
[X2,Y2,Z2]= geodetic2ecef(E,39.18828,32.00000,2357.40986);
[X3,Y3,Z3]= geodetic2ecef(E1,39.18828,32.00000,2357.40986);
fprintf("(Earth): \nx: %0.5f \ny: %0.5f \nz: %0.5d \n ", X1,Y1,Z1);
fprintf("(Wgs84): \nx: %0.5f \ny: %0.5f \nz: %0.5d \n ", X2,Y2,Z2);
fprintf("(Grs80): \nx: %0.5f \ny: %0.5f \nz: %0.5d \n ", X3,Y3,Z3);









addpath('D:\Kod') 
%%Gauss Küresine göre verilen R'nin alınıp p noktasının hesaplanması
%Bir p noktası Lon:39.188 , Lat: 32.000 h: 2357.4098 olan noktanın x,y,z
%koordinatlarını bul
clc;
clear all;
lat=32;
S=referenceSphere("earth");
M=rcurve('meridian',S,lat);
Mf=S.SemimajorAxis*(1-S.Eccentricity^2)/(1-S.Eccentricity^2*sind(lat)^2)^1.5;
N=rcurve("transverse",S,lat);
N1=(S.SemimajorAxis)/(sqrt(1-((S.Eccentricity^2)*(sin(lat)^2))));
R=sqrt(M*N);
R1=sqrt(Mf*N1);
S.Radius=R;
[X1,Y1,Z1]= geodetic2ecef(S,39.18828,32.00000,2357.40986);
fprintf("(Earth): \nx: %0.5f \ny: %0.5f \nz: %0.5d \n ", X1,Y1,Z1);
S.Radius=R1;
[X1,Y1,Z1]= geodetic2ecef(S,39.18828,32.00000,2357.40986);
fprintf("(Earth12): \nx: %0.5f \ny: %0.5f \nz: %0.5d \n ", X1,Y1,Z1);





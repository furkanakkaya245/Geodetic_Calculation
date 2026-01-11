addpath('D:\Kod') 
% Help -> mapping toolbox hazır fonk.
%% TANIMLAMALAR
clc;clear all;
% Kürede Coğrafi - ECEF
format long g
% lat=39+23/60+12.154/3600 şeklinde yazmak yerine dms2degree kullanılır tam
% tersi de mevcut 4. basamakta kesmesin diye format long g yazılır
Lat = deg2rad(dms2degrees([39 23 12.154])); % deg2rad derece -> radyana
lon = deg2rad(dms2degrees([32 46 18.256]));
h=1100.12; %metre
R=6371000; %metre
%% MATEMATİKSEL ÇÖZÜM
x=(R+h)*cos(Lat)*cos(lon);
y=(R+h)*cos(Lat)*sin(lon);
z=(R+h)*sin(Lat);
%% HAZIR FONKSİYON
s=referenceSphere("earth"); 
s.Radius=6371000;
[X1,Y1,Z1]= geodetic2ecef(s,Lat,lon,h,'radians'); % Hazır Fonksiyon
%% YAZDIRMA
fprintf("Lat(Mat.):\nx: %0.5f \ny: %0.5f \nz: %0.5d \n", x,y,z);
fprintf("Lat(HazırFonk): \nx: %0.5f \ny: %0.5f \nz: %0.5d \n ", X1,Y1,Z1); 




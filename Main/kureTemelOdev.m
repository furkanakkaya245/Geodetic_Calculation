%% Kürede Temel Ödev
addpath('D:\Kod');
clc;
clear all;
format long g;
%% Kürede 1. Temel Ödev :
Lat1=40;  % enlem
Lon1=35;  % boylam
S=150000; % uzaklık
Az=40;    % P-Q arasındaki açı
EarthSphere=referenceSphere("earth");
EarthSphere.Radius=6370000;
[Lat2,Lon2]=reckon('rh',Lat1,Lon1,S,Az,EarthSphere);
fprintf("1. Temel Ödev: \n");
fprintf("2. Nokta Enlem: %f\n2. Nokta Boylam: %f\n--------------------------------\n",Lat2,Lon2);
%% Kürede 2. Temel Ödev :
Lat1=36.833333;
Lon1=30.75;
Lat2=35.333333;
Lon2=33.25;
EarthSphere=referenceSphere("earth");
EarthSphere.Radius=6371000;
[arclen,~]=distance(Lat1,Lon1,Lat2,Lon2,EarthSphere);
[arclen,az]=distance(Lat1,Lon1,Lat2,Lon2,EarthSphere);% azimut 1 den 2 ye göre çözüm
[arclen,az]=distance(Lat2,Lon2,Lat1,Lon1,EarthSphere);
az=azimuth(Lat1,Lon1,Lat2,Lon2,EarthSphere);
az1=azimuth(Lat2,Lon2,Lat1,Lon1,EarthSphere);
fprintf("2. Temel Ödev: \n");
fprintf("Azimut(Açı): %f\nMesafe: %f\n---------------------------------\n",az,arclen);




%% Ortodrom ve Loksodrom Hesabı
addpath('D:\Kod');
clc;
clear all;
format long g;
E=referenceSphere("earth");
E.Radius=6374249.664;
%% Ortodrom
Lat1=dms2degrees([35 15 00]);
Lon1=dms2degrees([43 26 00]);
Lat2=dms2degrees([39 45 00]);
Lon2=dms2degrees([43 15 00]);
[arclen,az]=distance('gc',Lat1,Lon1,Lat2,Lon2,E.Radius);
fprintf("Ortodrom:\nMesafe: %f m\nAçı:    %f\n\n",arclen,az);
%% Loksodrom
Az=rad2deg(atan2(deg2rad(Lon2-Lon1), log(tand(45+Lat2/2))- log(tand(45+Lat1/2))));
S=E.Radius*deg2rad(Lat2-Lat1)/cosd(Az);
[arclen1,az1]=distance('rh',Lat1,Lon1,Lat2,Lon2,[E.Radius,0]);
fprintf("Loksodrom:\nMesafe: %f m\nAçı:    %f\n",arclen1,az1);



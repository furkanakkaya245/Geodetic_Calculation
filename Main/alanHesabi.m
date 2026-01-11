%% Kürede Alan Hesabı:
%% Elle yapımı:
addpath('D:\Kod');
clc;
clear all;
format long g;

E=referenceSphere("earth");
E.Radius=6372000;

lonFark=deg2rad(6);

F1=2*power(E.Radius,2)*lonFark*(sind((45-40)/2)*cosd((45+40)/2));
fprintf("Pafta Alanı:  %f\n",F1);

%% Formülle Yapılışı:
E=referenceSphere("earth");
E.Radius=6371000;
Lat1=39;
Lat2=39.5;
Lon2=0.5;
Lon1=0;
Area=abs(2*E.Radius^2*(abs(Lon2-Lon1)*pi/180)*sind((Lat2-Lat1)/2)*cosd((Lat2+Lat1)/2));
Area1= areaquad(Lat1,Lon1,Lat2,Lon2,E.Radius);
fprintf("Pafta Alanı: \nArea:  %f\nArea1: %0.4f\n",Area,Area1)

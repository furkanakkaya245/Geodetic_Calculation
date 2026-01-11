%%1.Temel odev
clc;clear all;format long g;

Lat1=40;
Lon1=35;
S=150000;
Az=45;

EartSphere=referenceSphere('Earth');
EartSphere.Radius=6370000;
[Lat2,Lon2]=reckon('rh',Lat1,Lon1,S,Az,EartSphere)   %derece alır
% gc:ortodrom rh:loksodrom


%% 2.Temel Odev
clc;clear all;format long g;

Lat1=40;
Lon1=40;
Lat2=39;
Lon2=39;

EartSphere=referenceSphere('Earth');
EartSphere.Radius=6370000;
[arclen,az]= distance(Lat1,Lon1,Lat2,Lon2,EartSphere)% azimut: 1  den 2 ye  % derece alır
[arclen,az]= distance(Lat2,Lon2,Lat1,Lon1,EartSphere)% azimut: 2 den 1 e

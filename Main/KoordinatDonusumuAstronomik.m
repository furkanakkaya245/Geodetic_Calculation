%% Koordinat Dönüşümü astronomik koorinat
format long g;
clc;
clear all;

LatP=dms2degrees([39 32 23.47]);
LonP=dms2degrees([32 21 51.18]);
hP=987.122;
ES=12162729.417;
NS=15205475.950;
US=5914728.588;

E=referenceEllipsoid("wgs84");

% 1'inci istenen
[az,elev,slantRange]=enu2aer(ES,NS,US);
% 2'nci istenen
[XP,YP,ZP]=geodetic2ecef(E,LatP,LonP,hP);

XYZQ=[XP;YP;ZP]+rotNEU2ECEF(LatP,LonP)*[NS;ES;US];

[LatQ,LonQ,hQ]=ecef2geodetic(E,XYZQ(1),XYZQ(2),XYZQ(3));
[Lat,Lon,h]= enu2geodetic(ES,NS,US,LatP,LonP,hP,E);
%% soru
az=50;
zenit=60;
elev=90-zenit;
c=20000;

ES=12162729.417;
NS=15205475.950;
US=5914728.588;

E=referenceEllipsoid("wgs84");
[X,Y,Z]=geodetic2ecef(E,elev,az,c)












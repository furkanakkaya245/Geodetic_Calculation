clear all;clc;
LatP=39;
LonP=32;
hp=1100;

LatQ=40;
LonQ=33;
hQ=2000;

E=referenceEllipsoid('grs80');

% [XP, YP, ZP] = geodetic2ecef (E,LatP,LonP,hp);
% [XQ, YQ, ZQ] = geodetic2ecef (E,LatQ,LonQ,hQ);
% 
% Delta=[XQ-XP;
%        YQ-YP;
%        ZQ-ZP];
% 
% NEU = RotECEF2NEU(LatP,LonP) * Delta
% %NEU = RotNEU2ECEF (LatP, LonP) * * Delta
% S=sqrt(NEU(1)^2+NEU(2)^2+NEU(3)^2)
% S=norm(NEU)
% Az = rad2deg(atan2(NEU(2) ,NEU(1)))
% Elev = rad2deg(asin(NEU(3)/S))
% Zenith = rad2deg(acos(NEU(3)/S)) 
[EastQ, NorthQ, UpQ]=geodetic2enu(LatQ, LonQ, hQ, LatP, LonP, hp, E)
[az,elev,slantRange] = enu2aer(EastQ, NorthQ, UpQ)





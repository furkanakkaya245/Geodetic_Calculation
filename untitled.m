% kurede paralel daire yayi  
% syf 95 1.s

format long g;
Lat=(dms2degrees([41 00 00]));

EarthSphere=referenceSphere('earth');
EarthSphere.Radius=6370000;

Rlat=abs(EarthSphere.Radius*cosd(Lat))

Lon_d=degrees2dms(5000/Rlat*(180/pi))
LQ=dms2degrees([39 00 00]+Lon_d)
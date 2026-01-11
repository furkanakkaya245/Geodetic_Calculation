% syf 96 1.s
format long g;
Lat=(dms2degrees([39 00 00]));

EarthSphere=referenceSphere('earth');
EarthSphere.Radius=6370000;

Rlat=abs(EarthSphere.Radius*cosd(Lat))
Lon_d=degrees2dms((200000/Rlat)*(180/pi))
LQ=[39 00 00]+Lon_d


Lat_d=degrees2dms((200000/EarthSphere.Radius)*(180/pi))
LQ=[39 00 00]+Lat_d
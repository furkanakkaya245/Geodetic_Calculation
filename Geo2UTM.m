clc;clear all;

Latitude = dms2degrees ([39 12 25.381]);
Longitude = dms2degrees ([32 15 36.48]);

E = referenceEllipsoid('grs80');

utmstruct = defaultm('utm');

zone = utmzone (Latitude, Longitude);

utmstruct.zone = zone;
utmstruct.geoid =[E.SemimajorAxis E.Eccentricity];
utmstruct = defaultm (utmstruct);
[Saga, Yukari]=projfwd(utmstruct, Latitude, Longitude);
fprintf(1,'DILIM NU   :%12s\n', zone);
fprintf(1,'SAGA [m]   :%12.3f\n', Saga);
fprintf(1,'YUKARI [m] :%12.3f\n', Yukari);
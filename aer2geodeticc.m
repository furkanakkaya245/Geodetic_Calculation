clear all;clc;delete *.asv; format long g;
LatP = dms2degrees ([38 20 33.47]);
LonP = dms2degrees ([40 32 21.43]);
hP=2144.391;
az = 28;
elev = 90 - 32;
slantRange = 32000; %metre


[EQ, NQ, UQ] = aer2enu(az, elev, slantRange);
%[EQ,NQ, UQ] = aerenu (38,46, 56000)
%[az, elev, slantRange] = enu2aer(xBast, yNorth, zUp)

E= referenceEllipsoid('grs80');
[XP, YP, ZP] = geodetic2ecef (E,LatP,LonP,hP);

XYZQ = [XP; YP ; ZP ] + RotNEU2ECEF(LatP, LonP) * [NQ ; EQ ; UQ] ;

[LatQ, LonQ, hQ] = ecef2geodetic(E, XYZQ(1) , XYZQ(2) , XYZQ(3))
%aer2geodetic
[latQ,lonQ,hQ]= aer2geodetic(az, elev, slantRange, LatP, LonP, hP,E)
clc;
clear all;
format long g;

YYYY = 2025;
MM = 06;
DD = 19;             
HH = 11;
Mi = 38; 
SS = 24 + 0.5225833;  %UT1 UT1-UTC = 0.5225833 --> UT1=UTC+0.5225833

xp = 0.002852;        % yay saniyesi dereceye fonksiyonda ceviriliyor
yp = 0.336153;        % yay saniyesi dereceye fonksiyonda ceviriliyor


E = referenceEllipsoid('grs80');


lat = dms2degrees([39 27 36.42]);
lon = dms2degrees([32 34 57.21]);
h = 858.653;


fprintf("2-A)\nPresisyon ve Nutasyon:\n");
P = precession(YYYY, MM, DD, HH, Mi, SS)
N = nutation(YYYY, MM, DD, HH, Mi, SS)
fprintf("\n2-B)\nİlgili Tarihteki Kutup Hareket Matrisi:\n");
Rm = pol_motion(xp, yp) % kutup hareketi
fprintf("\n2-C)\nGAST:\n");
Teta = GAST(YYYY, MM, DD, HH, Mi, SS);
degrees2dms(Teta)
fprintf("\n2-D)\nDünya Dönüklük:\n");
Rs=R3(Teta)
fprintf("\n2-E)\nLAST:\n");
Last = LAST(YYYY,MM,DD,HH, Mi, SS, lat, lon);
degrees2dms(Last)
fprintf("\n2-F)\nICRF'deki Kartesyen Koordinatlar:\n");
[X,Y,Z] = geodetic2ecef(E,lat,lon,h);
XYZ_ter=[X,Y,Z];
XYZ_cel=XYZ_ter*(inv(P)*inv(N)*inv(Rs)*inv(Rm))


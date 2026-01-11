clc; clear all;

% GIRDILER
YYYY = 2024;
MM = 06;
DD = 13;             
HH = 10;
Mi = 38; 


%UT1-UTC = 0.5225833;

SS = 24 + 0.5225833;  %UT1 

xp = 0.002852;        % yay saniyesi dereceye fonksiyonda ceviriliyor
yp = 0.336153;        % yay saniyesi dereceye fonksiyonda ceviriliyor

E = referenceEllipsoid('grs80');

lat = dms2degrees([39 17 42.36]);
lon = dms2degrees([32 44 21.57]);
h = 758.653;

% Ciktilar
%% a
P = precession(YYYY, MM, DD, HH, Mi, SS)


N = nutation(YYYY, MM, DD, HH, Mi, SS)
%% b

Rm = pol_motion(xp, yp) % kutup hareketi

%% c
Teta = GAST(YYYY, MM, DD, HH, Mi, SS)
degrees2dms(Teta)

%% d 

Rs=R3(Teta)

%% e
Last = LAST(YYYY,MM,DD,HH, Mi, SS, lat, lon)
degrees2dms(Last)

[X,Y,Z] = geodetic2ecef(E,lat,lon,h);
XYZ_ter=[X,Y,Z];

%% f
XYZ_cel=XYZ_ter*(inv(P)*inv(N)*inv(Rs)*inv(Rm))
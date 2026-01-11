clc; clear all;
%% a
%% Koordinatlar
format long g;
t_from = datenum(2024, 6, 13) / 365.2425;
LatP = dms2degrees([39 13 20.02]);
LonP = dms2degrees([33 45 33.54]);
hP = 898.587;
E = referenceEllipsoid('grs80');
[Xt_from, Yt_from, Zt_from] = geodetic2ecef(E, LatP, LonP, hP);

Vx_from = -18.2 / 1000;
Vy_from = 25.8 / 1000;
Vz_from = 16.8 / 1000;

% Dönüşüm Parametreleri
to_transpar = 2000.00;
Tx_to_from = 4.8 / 1000;
Ty_to_from = 2.6 / 1000;
Tz_to_from = -3.2 / 1000;
D_to_from = 2.29e-9;
Rx_to_from = 0;
Ry_to_from = deg2rad(0.02 / 1000 / 3600);
Rz_to_from = deg2rad(0.06 / 1000 / 3600);
VTx_from = 0.1 / 1000;
VTy_from = -0.5 / 1000;
VTz_from = 3.2 / 1000;
VD_from = 0.09e-9;
VRx_from = deg2rad(0.02 / 1000 / 3600);
VRy_from = 0;
VRz_from = deg2rad(0.02 / 1000 / 3600);

% Çıktı Koordinat Yayım Epogu
tO_to = datenum(2006, 6, 13) / 365.2425;

%% HESAPLAMALAR
% Dönüşüm Parametrelerinin t_from Epoguna Ötelenmesi
Tx_t_from = Tx_to_from + (t_from - to_transpar) * VTx_from;
Ty_t_from = Ty_to_from + (t_from - to_transpar) * VTy_from;
Tz_t_from = Tz_to_from + (t_from - to_transpar) * VTz_from;
D_t_from = D_to_from + (t_from - to_transpar) * VD_from;
Rx_t_from = Rx_to_from + (t_from - to_transpar) * VRx_from;
Ry_t_from = Ry_to_from + (t_from - to_transpar) * VRy_from;
Rz_t_from = Rz_to_from + (t_from - to_transpar) * VRz_from;

% t_from Epogunda Koordinat ve Hız Dönüşümü
XYZ_t_from = [Xt_from; Yt_from; Zt_from];
T_t_from = [Tx_t_from; Ty_t_from; Tz_t_from];
R_t_from = [D_t_from, -Rz_t_from, Ry_t_from;
            Rz_t_from, D_t_from, -Rx_t_from;
            -Ry_t_from, Rx_t_from, D_t_from];
VXYZ_from = [Vx_from; Vy_from; Vz_from];
VT_from = [VTx_from; VTy_from; VTz_from];
VR_from = [VD_from, -VRz_from, VRy_from;
           VRz_from, VD_from, -VRx_from;
           -VRy_from, VRx_from, VD_from];

XYZ_t_to = XYZ_t_from + T_t_from + R_t_from * XYZ_t_from;
VXYZ_to = VXYZ_from + VT_from + VR_from * XYZ_t_from

% t_from Epogundan tO_to Epoguna Koordinat Teleme
XYZ_tO_to = XYZ_t_to + (tO_to - t_from) * VXYZ_to
%% b
[Lat, Lon, h] = ecef2geodetic(E, XYZ_tO_to(1), XYZ_tO_to(2), XYZ_tO_to(3))

%% c

utmstruct = defaultm('utm');
zone = utmzone(Lat, Lon);
utmstruct.zone = zone;
utmstruct.geoid = [E.SemimajorAxis, E.Eccentricity];
utmstruct = defaultm(utmstruct);
[Saga, Yukari] = projfwd(utmstruct, Lat, Lon);
fprintf(1, 'DİLİM NO : %12s\n', zone);
fprintf(1, 'SAGA [m] : %12.4f\n', Saga);
fprintf(1, 'YUKARI [m] : %12.4f\n', Yukari);

%% d
%lat=A_lat-ksi;
%lon=A_lon-(eta/cosd(fi));  bu formullerden geldi
ksi=dms2degrees([00 00 13.26]);
eta=dms2degrees([00 00 07.53]);
A_Lat = Lat + ksi
A_Lon = Lon + eta / cosd(Lat)

%% e
az = dms2degrees([161 26 12.42]);
elev = 90 - dms2degrees([13 34 36.34]);
slantRange = 14758.528;

[North, East, Down] = aer2ned(az, elev, slantRange)
[lat, lon, h] = aer2geodetic(az, elev, slantRange, Lat, Lon, h, E)
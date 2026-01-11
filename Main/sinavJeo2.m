%% İlk adımda koordinatları ecef yaptım
clc;
clear all;
format long g;

s=referenceEllipsoid("grs80");
lat_dms = [39 48 29];
lon_dms = [32 14 35];
h = 956.3244; 

lat=dms2degrees([39 48 29]);
lon=dms2degrees([32 14 35]);

[x, y, z] = geodetic2ecef(s, lat, lon, h);



% 2 ci adım 4.Durumu uyguladım

 % clear all;clc;
 % format long g;
% Koordinatlar
t_from     = datenum(2021,5,24)/365.2425;  %yıl ay gün;
Xt_from   = x;
Yt_from   = y;
Zt_from   = z;
Vx_from  = -27.1/1000; 
Vy_from  = 32.3/1000;
Vz_from  = 21.7/1000;
 
% Dönüşüm Parametreleri
t0_transpar  = 2000.00;
Tx_t0_from  = 2.6/1000;
Ty_t0_from  = 4.8/1000;
Tz_t0_from  = -33.2/1000;
D_t0_from   = 2.92*10^-9;
Rx_t0_from  = deg2rad(0.00/1000/3600);
Ry_t0_from  = deg2rad(0.00/1000/3600);
Rz_t0_from  = deg2rad(0.06/1000/3600);
VTx_from     = 0.1/1000;
VTy_from     = -0.5/1000;
VTz_from     = -3.2/1000;
VD_from      =  0.09*10^-9; %ppb oldugu için
VRx_from     =  deg2rad(0.02/1000/3600);
VRy_from     = deg2rad(0.00/1000/3600);
VRz_from     = deg2rad(0.0/1000/3600);
 
% Çıktı Koordinat Yayım Epoğu
t0_to =  datenum(1991,2,20)/365.2425;

% HESAPLAMALAR

% Dönüşüm Parametrelerinin t_from Epoğuna Ötelenmesi
Tx_t_from = Tx_t0_from + (t_from - t0_transpar) * VTx_from;
Ty_t_from = Ty_t0_from + (t_from - t0_transpar) * VTy_from ;
Tz_t_from = Tz_t0_from + (t_from - t0_transpar) * VTz_from;
D_t_from   = D_t0_from + (t_from - t0_transpar) * VD_from;
Rx_t_from = Rx_t0_from + (t_from - t0_transpar) * VRx_from;
Ry_t_from = Ry_t0_from + (t_from - t0_transpar) * VRy_from;
Rz_t_from = Rz_t0_from + (t_from - t0_transpar) * VRz_from;

% t_from Epoğunda Koordinat ve Hız Dönüşümü
XYZ_t_from = [Xt_from  ; Yt_from  ; Zt_from];
T_t_from      = [Tx_t_from  ; Ty_t_from ; Tz_t_from];
R_t_from      = [D_t_from     -Rz_t_from    Ry_t_from ;
                        Rz_t_from     D_t_from     -Rx_t_from;
                       -Ry_t_from    Rx_t_from    D_t_from];
 
VXYZ_from = [Vx_from  ; Vy_from ; Vz_from ];
VT_from      = [VTx_from ; VTy_from ; VTz_from ];
VR_from      = [VD_from  -VRz_from VRy_from ;
                       VRz_from VD_from -VRx_from;
                       -VRy_from    VRx_from    VD_from];
 
XYZ_t_to = XYZ_t_from  + T_t_from  + R_t_from* XYZ_t_from; %ilk sarı formul
VXYZ_to = VXYZ_from + VT_from + VR_from * XYZ_t_from % ref sistemi aynı t0_to yla

% t_from Epoğundan t0_to epoğuna Koordinat Öteleme
XYZ_t0_to = XYZ_t_to  + (t0_to - t_from) * VXYZ_to  %koordinatlar farklı ondan yeniden hesaplarız

% son adım koordinatları geodetic yaptım

% clc;
% clear all;
% format long g;
s=referenceEllipsoid("grs80");
x = 4150401.04037228;
y = 2618003.3024789;
z = 4062248.22055219; 
[lat,lon,h] = ecef2geodetic(s,x, y, z)
% 
% fi=degrees2dms(lat)
% lam=degrees2dms(lon)
% H=h



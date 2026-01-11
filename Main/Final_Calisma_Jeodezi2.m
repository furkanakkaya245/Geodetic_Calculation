clc;
clear all;
format long g;

E=referenceEllipsoid('wgs84');
LatP=dms2degrees([38 23 22.02]);
LonP=dms2degrees([32 45 33.54]);
hP=798.587;
[Xp,Yp,Zp]=geodetic2ecef(E,LatP,LonP,hP);
% fprintf("x: %10.6f\n",Xp);
% fprintf("y: %10.6f\n",Yp);
% fprintf("z: %10.6f\n",Zp);
% Koordinatlar
t_from   = datenum(2025,6,19)/365.2425;
Xt_from  = Xp;
Yt_from  = Yp;
Zt_from  = Zp;
Vx_from  = -18.2/1000; 
Vy_from  = 25.8/1000;
Vz_from  = 16.8/1000;
 
% Dönüşüm Parametreleri
t0_transpar = 2000.00;
Tx_t0_from  = 4.8/1000;
Ty_t0_from  = 2.6/1000;
Tz_t0_from  = -3.2/1000;%metre
D_t0_from   = 2.29*10^-9;% ppb ppm b(billion)(-9) milyar m milyon(-6) 
Rx_t0_from  = deg2rad(0.00/1000/3600); % miliarcsecond
% 1 mas = ((1*10^-3)/3600)*(pi/180) degree
Ry_t0_from  = deg2rad(0.02/1000/3600);
Rz_t0_from  = deg2rad(0.06/1000/3600);
VTx_from    = 0.1/1000;
VTy_from    = -0.5/1000;
VTz_from    = 3.2/1000;
VD_from     = 0.09*10^-9;
VRx_from    = deg2rad(0.02/1000/3600);
VRy_from    = deg2rad(0.00/1000/3600);
VRz_from    = deg2rad(0.02/1000/3600);
 
% Çıktı Koordinat Yayım Epoğu
t0_to =  datenum(2005,6,19)/365.2425;
%% HESAPLAMALAR

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
 
XYZ_t_to = XYZ_t_from  + T_t_from  + R_t_from* XYZ_t_from;
VXYZ_to = VXYZ_from + VT_from + VR_from * XYZ_t_from;

% t_from Epoğundan t0_to epoğuna Koordinat Öteleme
XYZ_t0_to = XYZ_t_to  + (t0_to - t_from) * VXYZ_to;
fprintf("1.SORU:\n");
fprintf("1_A)\n13.06.2006 tarihindeki Kartezyen Koordinatlar:\n");
fprintf("X: %10.6f\n",XYZ_t0_to(1));
fprintf("Y: %10.6f\n",XYZ_t0_to(2));
fprintf("Z: %10.6f\n",XYZ_t0_to(3));
fprintf("\n");
E=referenceEllipsoid('grs80');
[latP,lonP,hP]=ecef2geodetic(E,XYZ_t0_to(1),XYZ_t0_to(2),XYZ_t0_to(3));
fprintf("1_B)\n13.06.2006 tarihindeki Jeodezik Koordinatlar:\n");
fprintf("Lat: %10.6f\n",latP);
fprintf("Lon: %10.6f\n",lonP);
fprintf("H:   %10.6f\n",hP);
fprintf("13.06.2006 tarihindeki Noktanın Doğrusal Hızları:\n");
fprintf("Vx: %10.6f\n",VXYZ_to(1));
fprintf("Vy: %10.6f\n",VXYZ_to(2));
fprintf("Vz: %10.6f\n",VXYZ_to(3));
fprintf("\n");
fprintf("1_C)\n13.06.2006 tarihindeki UTM koordinatları:\n");
E=referenceEllipsoid('wgs84');
utmstruct = defaultm('utm');
zone = utmzone(latP, lonP);
utmstruct.zone = zone;
utmstruct.geoid = [E.SemimajorAxis, E.Eccentricity];
utmstruct = defaultm(utmstruct);
[Sag, Yukari] = projfwd(utmstruct, latP, lonP);
fprintf('Dilim No :   %12s\n', zone);
fprintf('SAGA [m] :   %12.4f\n', Sag);
fprintf('YUKARI [m] : %12.4f\n', Yukari);
fprintf("\n");
fprintf("1_D)\n13.06.2006 tarihindeki Astronomik Koordinatlar:\n");
saniyeKsi=0.26*60;
saniyeEta=0.53*60;
ksi=dms2degrees([0 0 saniyeKsi]); % Kuzey-Güney Bileşeni
eta=dms2degrees([0 0 saniyeEta]); % Doğu-batı Bileşeni
Ast_Lat=ksi+ latP;
Ast_Lon=(eta/cosd(latP)+lonP);
fprintf('Astronomik Enlem :  %12.4f\n', Ast_Lat);
fprintf('Asttronomik Boylam: %12.4f\n', Ast_Lon);
fprintf("\n");
fprintf("1_E)\n13.06.2006 tarihindeki toposentrik dik koordinatlarını ve jeodezik koordinatlarını bul:\n");
Elipsoid=referenceEllipsoid("wgs84");
mesafe=34758.528; %metre
az=dms2degrees([151 26 12.42]);
zenit=dms2degrees([23 34 36.54]);
elev=90-zenit;
[N, E, Down] = aer2ned(az, elev, mesafe);
[latQ,lonQ,hQ]=aer2geodetic(az,elev,mesafe,latP,lonP,hP,Elipsoid);
fprintf('Q noktası Toposentrik Koordinatlar:\n');
fprintf('N :   %12.4f\n', N);
fprintf('E :   %12.4f\n', E);
fprintf('Down :  %12.4f\n', Down);
fprintf('Q noktası Jeodezik Koordinatlar:\n');
fprintf("Lat: %10.6f\n",latQ);
fprintf("Lon: %10.6f\n",lonQ);
fprintf("H:    %10.6f\n",hQ);





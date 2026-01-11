%% GİRDİLER
 clear all;clc;
 format long g;
% Koordinatlar
t_from     = 2000.00;
Xt_from   = 4209766.4044;
Yt_from   = 2630554.0048;
Zt_from   = 3992914.8770;
Vx_from  = 0.12; 
Vy_from  = 0.09;
Vz_from  = 0.62;
 
% Dönüşüm Parametreleri
t0_transpar  = 2000.00;
Tx_t0_from  = 22.8/1000;
Ty_t0_from  = 2.6/1000;
Tz_t0_from  = -125.2/1000;
D_t0_from   = 10.41*10^-9;
Rx_t0_from  = deg2rad(0.10/1000/3600);
Ry_t0_from  = deg2rad(0.00/1000/3600);
Rz_t0_from  = deg2rad(0.06/1000/3600);
VTx_from     = 0.1/1000;
VTy_from     = -0.5/1000;
VTz_from     = -3.2/1000;
VD_from      =  0.09*10^-9; %ppb oldugu için
VRx_from     =  deg2rad(0.00/1000/3600);
VRy_from     = deg2rad(0.00/1000/3600);
VRz_from     = deg2rad(0.02/1000/3600);
 
% Çıktı Koordinat Yayım Epoğu
%t0_to =  2000.00;
t0_to = datenum(2024,5,9)/365.2425;  %year month day
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
 
XYZ_t_to = XYZ_t_from  + T_t_from  + R_t_from* XYZ_t_from %ilk sarı formul
VXYZ_to = VXYZ_from + VT_from + VR_from * XYZ_t_from

clear all; clc;
format long g;
% Örnek değerleri ata
% referans sistemi aynı epok farklı hız sabit
x_from = 4209766.4044;
y_from = 2630554.0048;
z_from = 3992914.8770;
vx_from = 0.12;
vy_from = 0.09; % durum 1 de hızlar aynı diye yazmıyoruz
vz_from = 0.62;
t_from=2014.178;
t0_to=2005.000;
% Sabit bir zaman aralığı tanımla
 dt = t_from-t0_to;

% Cismin konumunu hesapla
x_to = x_from + vx_from * dt
y_to = y_from + vy_from * dt
z_to = z_from + vz_from * dt





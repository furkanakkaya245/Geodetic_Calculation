%% Toposentrik Koordinat Sistemi
clear all;
clc;
format long g;
%Verilenler
az=38;
elev=90-44; % derece
slantRange=56000*1E-3; %metre

% FORMÜLSÜZ BULUNMASI
% Verilen değerlere göre ENU ya çevrimi aer->neu
Nf=slantRange*cosd(elev)*cosd(az);
Ef=slantRange*cosd(elev)*sind(az);
Uf=slantRange*sind(elev);
% Verilenlerden tersine çevirme  neu->aer
alantRange_f=sqrt(Nf^2+Ef^2+Uf^2);
elev_f=asind(Uf/alantRange_f);
az=atand(Ef/Nf);

% FORMÜLLE BULUNMASI
% azimut elevetion range
[EQ,NQ,UQ]=aer2enu(az,elev,slantRange) % [] içindekiler ENU olarak ayarla
[az1,elev1,slantRange1]=enu2aer(EQ,NQ,UQ);

%% Eksen Döndürme
% P=[0 100 0];
% c=P*R1(-90)*R2(90);% normal formülden farklı yazılmakta
% Q=[0 0 200];
% c1=Q*R2(90)*R1(-90)




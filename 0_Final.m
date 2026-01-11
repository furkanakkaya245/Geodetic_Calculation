%% Jeodezi-I Final Cevapları
% Hrt. Tğm. Furkan AKKAYA (2024-1)

format long g;
clear all;
clc;
%% 1.Soru (Enlem Dönüşümü)

% Tanımlamalar
E=referenceEllipsoid("grs80");
e2=E.Eccentricity^2;
psi=dms2degrees([17 34 51.36]);
beta=dms2degrees([24 38 32.16]);
% Jeosentrikten Coğrafiye Dönüşüm
phiP=atand((1/(1-e2))*tand(psi));
% İlgili Enlemdeki halka uzunluğu
Npsi=rcurve('transverse',E,phiP);
P_yay_uzun=Npsi*cosd(phiP)*deg2rad(180)*2;
% İndirgenmişten Coğrafiye
phiB=atand((1/sqrt(1-e2))*tand(beta));
% İlgili Enlemdeki halka uzunluğu
Nbeta=rcurve('transverse',E,phiB);
B_yay_uzun=Nbeta*cosd(phiB)*deg2rad(180)*2;
%Fark
uzun_fark=P_yay_uzun-B_yay_uzun

%% 2.Soru(Integral)
%% TRAPZ
%Tanımlamalar
E=referenceEllipsoid("grs80");
e2=E.Eccentricity^2;
a=E.SemimajorAxis;
b=E.SemiminorAxis;
%Aralık Tanımlama
phi1=36;
phi2=39;
lam1=34;
lam2=38;
dphi=20/3600; %20 yay saniyesi
dlam=24/60; % 24 yay dakikası
[LON,LAT]=meshgrid(lam1:dlam:lam2,phi1:dphi:phi2);
N=rcurve('transverse',E,LAT);
M=rcurve('meridian',E,LAT);
% %Fonksiyon Tanımlama
f1= M.*(1+e2).*cosd(LAT)-N.*(1+e2).*sind(LON);
f2=a.*sind(LAT).^2+b.*(1+e2).*cosd(LON);
f=f1.*f2;
% %Çözüm
Alan=trapz(deg2rad(phi1:dphi:phi2),trapz(deg2rad(lam1:dlam:lam2),f,2))

%% 3. soru
% sağ el kuralında saat yönünün tersi pozitiftir.
% x ekseni saat yönünde 90 derece (-90)
R1=[1    0      0;
   0  cosd(-90) sind(-90);
   0 -sind(-90) cosd(-90)];
% y ekseni saat yönünün tersinde 90 derece  (+90)
R2=[cosd(90)  0  -sind(90);
     0      1       0;
  sind(90)   0   cosd(90)];
N=[0; 300; 0]; 

Dondurulmus_Matris=R2*R1*N

%% 4.soru
% Genel tanımlamalar
E=referenceEllipsoid("wgs84");
% P noktasının tanımlanması
latP=dms2degrees([39 32 33.43]);
lonP=dms2degrees([40 23 21.34]);
hP=2144.931;

% Q noktasının P ENU sistemine göre tanımlanması
cQ=23000; %23 km metreye çevdildi
elevQ=90-23; % yükseklik açısı için zenit+yükseklik_açısı=90 
azQ=18;
% P noktasına göre lokal dik koordinatlar
[EQ, NQ, UQ] = aer2enu(azQ, elevQ,cQ)
% eğri koordinatların bulunması
[latQ,lonQ,hQ]= aer2geodetic(azQ, elevQ, cQ, latP, lonP, hP,E)
% dik koordinatların bulunması
[XQ,YQ,ZQ] = geodetic2ecef(E,latQ,lonQ,hQ)








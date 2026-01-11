%% Eğrilik Yarıçap dönüşümleri
% sınavda birbirlerine dönüşüm var
clc;
clear all;
format long g;
% tanımlamalar
E=referenceEllipsoid("grs80");
psiP= dms2degrees([26 40 38]);
betaQ= dms2degrees([42 28 24]);

% jeosenitrikten coğrafiye
phiiP= geodeticLatitudeFromGeocentric(psiP,E.Flattening); 
phipf= atand(tand(psiP)/(1-E.Eccentricity^2));
% indirgenmişten coğrafiye
phiQ= geodeticLatitudeFromParametric(betaQ,E.Flattening);
phiQf=atand(tand(betaQ)/(sqrt(1-E.Eccentricity^2)));
% jeosentrikten indirgenmişe
betaA=atand(tand(psiP)/(sqrt(1-E.Eccentricity^2)));
% indirgenmişten jeosentriğe
psiA=atand(tand(betaQ)*(sqrt(1-E.Eccentricity^2)));
% coğrafiden jeosentriğe
ceosentrikEnlem = geocentricLatitude(phiP,E.Flattening);
ceosentrikEnlem1 = atand((1-E.Eccentricity^2)*(tand(phiP)));
% coğrafiden indirgenmişe
indirgenmisEnlem = parametricLatitude(phiQ,E.Flattening);
indirgenmisEnlemFormul = atand(sqrt(1-E.Eccentricity^2)*tand(phiQ));


%% Elipsoid Merdiyen Yayı (S= integral(M*dphi))
phi1=36;
phi2=42;

E=referenceEllipsoid('grs80');
s1=meridianarc(deg2rad(phi1),deg2rad(phi2),E)*1E-3; % 1E-3 km'ye çevirmede kullanılır

% (trapz.m)
Dphi=1/3600; % 1 yay-saniyesi ARTTIRIM İÇİN KULLANILIR Dphi integralin d si
M=rcurve('meridian',E,phi1:Dphi:phi2); % phi1:Dphi:phi2 arttırımın eklenmesi birden fazla M heaplanır
%s2 = trapz(M*deg2rad(dphi)*1E-3;
s3= trapz(deg2rad(phi1:Dphi:phi2),M)*1E-3; % Arttırımla integral hesaplama

% (integral.m)
% normal integralin çözümü
E =referenceEllipsoid('grs80');
a =E.SemimajorAxis;
e2 =E.Eccentricity^2;
M = @(phi) (a.*(1-e2)) ./ (1-e2.*sin(phi).^2).^1.5;
% @phi dphi yerine belirtilmesi integral neye göre alınacak bilinmeyenin
% tanımlanması ./ nokta koymak numerik hesaplama için
s4= integral(M,deg2rad(phi1),deg2rad(phi2))*1E-3; % deg2rad(phi1),deg2rad(phi2) integralin 
% altının ve üstünün tanımlanması sembolik çözüm olarak adlandırılır

denk = @(x) (x.^2);
s9= integral(denk,4,6);
Dphi=0.001;
x=4:Dphi:6;
% M=rcurve('meridian',E,phi1:Dphi:phi2); Burada M bir matris 
s9= trapz(deg2rad(4:Dphi:6),(x.^2));

% (integral.m)
% E= referanceEllipsoid('grs80');
s5= integral(@(phi) rcurve('meridian',E,rad2deg(phi)),deg2rad(phi1),deg2rad(phi2))*1E-3;
% üst ile aynı işlem M rcurve ile tanımlanmıştır.
% compare
S=[s1,s3,s4,s5];

%% Elipsoid Alan (S= doubleintegral(M*N*cos(phi)*dphi*dlam)
% (areaquad.m)
phi1=36;
phi2=42;
lam1=26;
lam2=45;
E=referenceEllipsoid('grs80');
a1=areaquad(phi1,lam1,phi2,lam2,E)*1E-6; % km2 (m den km ye çevrim)
% pafta alanının hesaplanması
% (trapz.m)
E=referenceEllipsoid('grs80');
dphi=0.1/60;% 0.1 yay-dakika
dlam=0.1/60;% 0.1 yay-dakika dereceye çevirmek için 60 a bölünür 
% SINAVDA SANİYE DAKİAK DERECE FARKLI FARKLI VERİLEBİLİR DEĞİŞİMİ BİL
[LON,LAT]= meshgrid(lam1:dlam:lam2, phi1:dphi:phi2);
% Belirlenen aralıklarda tüm oluşacak noktaların enlem ve boylamının
% bulunması. Artırım aralıklarında bulunur

M=rcurve('meridian',E,LAT);
NcosPhi= rcurve('transverse',E,LAT).*cosd(LAT);
F=M.*NcosPhi;
a2=trapz(deg2rad(phi1:dphi:phi2),trapz(deg2rad(lam1:dlam:lam2),F,2))*1E-6;
% SONDAKİ 2 ÇİFT İNTEGTALDEN GELİYOR
% (integral2.m)
E=referenceEllipsoid('grs80');
a =E.SemimajorAxis;
e2 =E.Eccentricity^2;
M = @(phi) (a.*(1-e2)) ./ (1-e2.*sin(phi).^2).^1.5;
N = @(phi) a./sqrt((1-e2.*sin(phi).^2));
a3= integral2(@(lam,phi) M(phi) .*N(phi) .*cos(phi), ...
    deg2rad(lam1),deg2rad(lam2),deg2rad(phi1),deg2rad(phi2))*1E-6;

% (intergal2.m)
E=referenceEllipsoid('grs80');
a4=integral2(@(lam,phi) rcurve('meridian',E,rad2deg(phi)).*rcurve('transverse',E,rad2deg(phi)).*cos(phi),...
    deg2rad(lam1),deg2rad(lam2),deg2rad(phi1),deg2rad(phi2))*1E-6;
% compare
A=[a1;a2;a3;a4];

%% 45 derece Enlemin uzunluğu nedir
% Depature ile bulunması
E=referenceEllipsoid('wgs84');
lat=45;
EnlemUzunluk=2*departure(0,180,lat,E)*1E-3;
% İndirgenmiş r ile bulunması
N=rcurve('transverse',E,lat);
EnlemUzunluk2=2*pi*(N*cosd(45))*1E-3;
%% Trapz çift integral
E=referenceEllipsoid('grs80');
dphi=22/3600;
dlam=5/60; 
[LON,LAT]= meshgrid(22:dlam:27, 32:dphi:38);
M=rcurve('meridian',E,LAT);
N= rcurve('transverse',E,LAT).*cosd(LAT);
func1=((E1.SemiminorAxis)*cos(LAT))-((E1.SemimajorAxis-E1.Flattening)*(1+E1.Eccentricity^2)*(sin(LON))^2);
func2=N*(1+E1.Eccentricity^2)*cos(LAT)+(M*E1.MeanRadius*sin(LON));
func3=func1*func2;
a3=trapz(deg2rad(32:dphi:38),trapz(deg2rad(22:dlam:27),func3,2))*1E-6
%% 






























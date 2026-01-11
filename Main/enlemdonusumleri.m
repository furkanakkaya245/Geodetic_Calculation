format long g
clc;clear all;
psiP = dms2degrees([26 40 38]);%jeosentrik enlem değeri
betaQ = dms2degrees([42 28 24]);%indirgenmiş enlem değeri
E = referenceEllipsoid("grs80");

%% jeosentrikten coğrafi enleme dönüşüm yapıyor.
phiP = geodeticLatitudeFromGeocentric(psiP,E.Flattening);

%formül ile yapılan işlem fonksiyon ile aynı sonucu vermesi gerekmektedir.
phipf = atand((1/(1-E.Eccentricity^2)*tand(psiP)));

%% coğrafi den jeosentrike dönüşüm:
ceosentrikEnlem = geocentricLatitude(phiP,E.Flattening);
%formül ile çözüm
ceosentrikEnlem1 = atand((1-E.Eccentricity^2)*(tand(phiP)));

%% indirgenmişten coğrafiye dönüşüm
phiQ = geodeticLatitudeFromParametric(betaQ,E.Flattening);%indirgenmiş parametrik (yani indirgenmişten coğrafiye çeviriyor)
%formül ile yapılan işlem fonksiyon ile aynı sonuçları vermesi
%gerekmektedir.
phipf = atand((1/sqrt(1-E.Eccentricity^2)*tand(betaQ)));


%% coğrafiden indirgenmiş enleme dönüşüm
indirgenmisEnlem = parametricLatitude(phiQ,E.Flattening);
% formül ile coğrafiden indirgenmişe dönüşüm
indirgenmisEnlemFormul = atand(sqrt(1-E.Eccentricity^2)*tand(phiQ));


%% indirgenmiş ten jeosentirik enleme dönüşüm
jeosentrikenlem = degrees2dms(atand(sqrt(1-E.Eccentricity)*tand(betaQ)))

%% jeosentrikten indirgenmiş enlem dönüşüm
indirgenmisenlem = degrees2dms(atand((1/sqrt(1-E.Eccentricity^2))*tand(psiP)))

%% Kuşak Alanı Hesabı:
EarthEllipsoid = referenceEllipsoid("wgs84");
EarthEllipsoid.LengthUnit = 'km';
KusakAlanHesabi = 2*departure(0,180,45,EarthEllipsoid,"degrees")


%bu ikisi içinde hesap yapacağız ve ayraca fonksiyonsuz halinide yapacağız.
%parametricLatitude  %coğrafi enlem değerinden indirgenmişe çevirir 
%geocentricLatitude  %coğrafi enlem değerinden jeosentrik enlem değerine çevirir
%% ilk adımda geodetic2astronomic yaptım

clear all; clc;
format long g;

az=dms2degrees([130 41 47.27]);

fi=dms2degrees([39 43 25]);
lam=dms2degrees([32 25 46]);

ksi=dms2degrees([00 00 7.24]);
eta=dms2degrees([00 00 19.37]);

A_fi=degrees2dms(ksi+fi)          %sonuçları dms olacak
A=degrees2dms(az+eta*tand(fi))
A_lam=degrees2dms((eta/cosd(fi))+lam)

%% 2.adımda Buldugum degerleri yerine koydum ve hesaplamalarımı yaptım 
clear all;
clc;
%astronomik
% DMS'den dereceye dönüştürme
A_fi = dms2degrees([ 39 43 32.2399999999942]);
A_lam = dms2degrees([32 26 11.184094205671]);
A_az = dms2degrees([130 42 3.36477247309858]);
zenith = dms2degrees([56 57 19.12]);

GST=dms2degrees([0 14 25]); % hour min


delta=asind(cosd(A_fi)*cosd(A_az)*sind(zenith)+sind(A_fi)*cosd(zenith));
t=acosd((cosd(zenith)-sind(A_fi)*sind(delta))/(cosd(A_fi)*cosd(delta)))*24/360;  %hour min yapıyoruz
alfa=A_lam*24/360-t+GST+24;  %right ascension   A_lam derece oldugu için 24/360 çarp saat olsun
  % +24  bir gün

degrees2dms(delta) %degree minute % denklinasyon
degrees2dms(t) % hour minute
degrees2dms(alfa) % hour minute %right ascension
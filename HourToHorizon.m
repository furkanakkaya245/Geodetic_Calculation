% azimut zenit yükseklik açıları(elev) t buluyoruz  yani ufuk koordinatları
clear all; clc;

A_fi = dms2degrees([52 30 00]);
A_lam = dms2degrees([-01 55 00]);

alfa=dms2degrees([16 41 00]); %hour min % sağ açıklık açısı-right ascension
delta=dms2degrees([36 28 00]); % denklinasyon

d = datenum(1998,08,10,23,10,00) - datenum(2000,01,01,12,00,00);% yıl ay gün saat dakika saniye
GST=wrapTo360(100.46+0.985647*d); %degree min + hiçbirşey değişmeyecek

LST=wrapTo360(GST+A_lam+15*dms2degrees([23 10 00])) %UT 23.10 verdiği için 15*UT yaptık öğle vakti
%15 ut =360/24  saati derece dakikasına cevirdik

t=wrapTo360(LST-alfa*360/24) % degree min  

z=acosd(sind(A_fi)*sind(delta)+cosd(A_fi)*cosd(delta)*cosd(t))
%t=acosd(sind(A_fi)*sind(delta)+cosd(A_fi)*cosd(delta)*cosd(t))

elev=90-z  %yükseklik açısı

A=asind((sind(90-delta)*sind(t))/sind(z)) % azimut

clc ; clear all;  close all; format long g; delete *.asv;
% Defterdeki son örnek Ganegin dogusu ve batısı
A_fi=dms2degrees([39 55 4]) % sadece A_fi kullandık   % astronomik enlem vermiş soruda ksi eta yok ama hocaya sor

alf=dms2degrees([32 51 45])  % etkisiz eleman

t=datetime (2024,05,09);  % year month day
doy=day(t,'dayofyear') % yılın kacıncı gunu

dek=23.45*sind((360/365)*(doy+284)) ;
dek2=degrees2dms([dek])


t=acosd(-((sind(A_fi)*sind(dek))/(cosd(A_fi)*cosd(dek)))) *24/360; %hour
t2=degrees2dms([t]) % doguş

batis=12+t;
batis=degrees2dms(batis)
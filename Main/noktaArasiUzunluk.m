addpath('D:\Kod');
clc;
clear all;
format long g
%Kürede meridyen yayı(Boylamları aynı olan noktalar olduğundan enlemler üzerinden hesaplanır.)
%Aynı boylamda olduğundan aynı meridyen üzerinde bulunurlar.      
%Meridyen yay uzunluğu hesaplanmaktadır
Lat1=40;% 40'ıncı enlem
Lat2=43;% 43'üncü enlem
earthSphere=referenceSphere("earth");
S=referenceSphere("earth");
earthSphere.Radius=6372000;
Lat=deg2rad(dms2degrees([3 0 0]));%Derece verirse kullanılır derece dakika saniye usulü yaz.
s=meridianarc(deg2rad(Lat1),deg2rad(Lat2),S);
s_man=6371000*deg2rad(Lat2-Lat1);
fprintf('Meridyen Yay Uzunluğu:\nS(Hazır)=%0.3f metre\ns(Elle Hesap)=%0.3f metre\n',s,s_man);
%Kürede Paralel Daire Yay Hesabı(Enlemlerin aynı olması)
%Noktalar arasında yeni R tanımlanır ona göre hesap yapılır 
%yeni R=eğrilik yarıçapı olarak adlandırılır.
%Kürede paralel daire yayı
Lat=30;
Lon1=40;
Lon2=39;
E=referenceSphere("earth");
r=rcurve('parallel', E,Lat);
% r=6371000*cosd(Lat);
dist=departure(Lon1,Lon2,Lat,E);
dist1=r*deg2rad(Lon1-Lon2);
fprintf("Paralel Daire Yarıçap:\nDist(Fonk):%0.3f\nDist(Elle):%0.3f\n",dist,dist1);








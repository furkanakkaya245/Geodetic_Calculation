clear all;clc;
format long g;
Beta=dms2degrees([19 24 51.46]); % indirgenmiş enlem
omega=dms2degrees([27 35 32.36]); %jeosentrik enlem
lon1=180;
lon2=0;
s=referenceEllipsoid("grs80");
e=s.Eccentricity;
%indirgenmiş->cografi
lat_a=atand((1/sqrt(1-e^2))*tand(Beta))
N_a=rcurve('transverse',s,lat_a);
%paralel daire yayı uzunlugu
Paralel_a=N_a*cosd(lat_a)*deg2rad(lon1-lon2)*2
%jeosentril->cografi
lat_b=atand((1/(1-e^2))*tand(omega))
N_b=rcurve('transverse',s,lat_b);
%paralel daire yayı uzunlugu
Paralel_b=N_b*cosd(lat_b)*deg2rad(lon1-lon2)*2

Fark=Paralel_a-Paralel_b %fark kadar kısaltılmalı

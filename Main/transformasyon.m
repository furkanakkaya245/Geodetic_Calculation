clear all; clc;
format long g;
%astronomik

A_fi = dms2degrees([ 39 27 18.55]);
A_lam = dms2degrees([32 16 32.48]);
A_az = dms2degrees([114 26 56.87]);
zenith = dms2degrees([56 37 29.11]);

GST=dms2degrees([0 24 0.5]);


delta=asind(cosd(A_fi)*cosd(A_az)*sind(zenith)+sind(A_fi)*cosd(zenith));

t=acosd((cosd(zenith)-sind(A_fi)*sind(delta))/(cosd(A_fi)*cosd(delta)))*24/360;  %hour min yapıyoruz
alfa=A_lam*24/360-t+GST;  
    
degrees2dms(delta) %degree minute % denklinasyon
degrees2dms(t) % hour minute
degrees2dms(alfa+24) % hour minute %right ascension
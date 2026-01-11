% astronomic2geodetic aslında

clear all; clc;
A_fi=dms2degrees([39 22 54]);
A_lam=dms2degrees([32 19 58]);

H=987.415; % etkisiz

ksi=dms2degrees([00 00 18]);
eta=dms2degrees([00 00 9]);

K=6; %çöp

fi=A_fi-ksi;
lam=A_lam-(eta/cosd(fi));

LAT=degrees2dms(fi)  % dms
LON=degrees2dms(lam) % dms


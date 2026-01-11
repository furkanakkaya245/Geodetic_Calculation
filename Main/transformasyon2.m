clc;
clear all;
format long g;
addpath("D:/Kod/");
% jeodezik to astronomik
jlam=dms2degrees([32 29 46.44]);
ksi=dms2degrees([0 0 18]);
eta=dms2degrees([0 0 9]);
H=987,451;% jeoid ondülasyon
afi= jfi+ksi;
alam=jlam+(eta/cosd(afi));
h=H+N %elipsoid yükseklik

afi=dms2degrees([39 27 18.55])
alam=dms2degrees([])

% geodetic2astronomic aslında

clear all; clc;
format long g;

az=dms2degrees([130 41 47.27]);

fi=dms2degrees([39 43 25]);
lam=dms2degrees([32 25 46]);



%eta=(3.130040971401E+01)/3600;   % bunu uygulamadan bulduk değeri kom vercek
%ksi=(1.432435109279E+01)/3600;

ksi=dms2degrees([00 00 7.24]);
eta=dms2degrees([00 00 19.37]);

A_fi=degrees2dms(ksi+fi)          %sonuçları dms olacak
A=degrees2dms(az+eta*tand(fi))
A_lam=degrees2dms((eta/cosd(fi))+lam)


% A_fi = ksi + fi;  % Calculate without DMS conversion
% A = az + eta * tand(fi);  % Calculate without DMS conversion
% A_lam = (eta / cosd(fi)) + lam;  % Calculate without DMS conversion
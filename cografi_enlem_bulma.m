clear all;clc;
Beta=dms2degrees([27 35 32.36]); % indirgenmiş enlem
omega=dms2degrees([27 35 32.36]); %jeosentrik enlem

s=referenceEllipsoid("wgs84");
e=s.Eccentricity;

lat=atand((1/sqrt(1-e^2))*tand(Beta))

lat=atand((1/(1-e^2))*tand(omega))


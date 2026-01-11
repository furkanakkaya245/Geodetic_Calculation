% Tanımlamalar
E=referenceEllipsoid("grs80");
e2=E.Eccentricity^2;
beta=dms2degrees([19 24 51.46]);
omega=dms2degrees([27 35 32.36]);

% İndirgenmişten Coğrafiye
phiB=atand((1/sqrt(1-e2))*tand(beta));
Nbeta=rcurve('transverse',E,phiB);
B_yay_uzun=Nbeta*cosd(phiB)*deg2rad(180)*2;



% Jeosentrikten Coğrafiye
phiO=atand((1/(1-e2))*tand(omega));
Nomega=rcurve('transverse',E,phiO);
O_yay_uzun=Nomega*cosd(phiO)*deg2rad(180)*2;

%Fark
uzun_fark=B_yay_uzun-O_yay_uzun




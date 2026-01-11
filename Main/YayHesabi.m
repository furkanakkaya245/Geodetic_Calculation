%% Daire yayı 
format long g
% 45 derece 
E=referenceEllipsoid("wgs84");
a=E.SemimajorAxis;
e2=E.Eccentricity^2;
phi=45;
N=(a*(sqrt(1-e2*(sind(phi)^2))))*1E-3;
Ncos=N*cosd(45);
L=Ncos*(360-0);

%% soru
E=referenceEllipsoid("grs80");
a=E.SemimajorAxis;
e2=E.Eccentricity^2;
psiP = dms2degrees([27 35 32.36]);%jeosentrik enlem değeri
betaQ = dms2degrees([19 24 51.46]);%indirgenmiş enlem değeri

phiQ = geodeticLatitudeFromParametric(betaQ,E.Flattening);
phiP = geodeticLatitudeFromGeocentric(psiP,E.Flattening);

N1=a./sqrt(1-(e2.*(sind(phiP)^2)));
N1cos=N1*cosd(phiP);
N1cevre=2*pi*N1cos

N2=a./sqrt(1-(e2.*(sind(phiQ)^2)));
N2cos=N2.*cosd(phiQ);
N2cevre=2*pi*N2cos













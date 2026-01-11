clear all; clc;
format long g
E = referenceEllipsoid ('grs80');
betaP = dms2degrees([19 24 51.46]);
psiQ = dms2degrees([27 35 32.36]);
phiP = atand((tand(betaP)*E.SemiminorAxis)/(E.SemimajorAxis*(1-E.Eccentricity^2)))
NP = rcurve ('transverse',E, phiP);
ParaleIP = NP* cosd(phiP)*2*pi;
phiQ = atand(tand(psiQ)/(1-E.Eccentricity ^2))
NP = rcurve ('transverse', E, phiQ);
ParalelQ = NP*cosd (phiQ)*2*pi;
DiffParalel1 = ParaleIP - ParalelQ
% phiP = geodeticLatitudeFromParametric(betaP,E.Flattening)
% ParalelP = departure(0,180, phiP,E)*2
% phiQ = geodeticLatitudeFromGeocentric(psiQ,E.Flattening)
% ParalelQ = departure(0,180, phiQ,E) *2
% DiffParalel = ParalelP - ParalelQ
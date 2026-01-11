clear all; clc; 
RefEllp=referenceEllipsoid('grs80');

lat=39.50347483;
format long g;
M=rcurve('meridian',RefEllp,lat,'degrees')
M_m=(RefEllp.SemimajorAxis*(1-RefEllp.Eccentricity^2))/((1-RefEllp.Eccentricity^2*sind(lat)^2)^1.5)
N=rcurve('transverse',RefEllp,lat,'degrees')
N_n=RefEllp.SemimajorAxis/sqrt(1-RefEllp.Eccentricity^2*sind(lat)^2)

R=sqrt(M*N)
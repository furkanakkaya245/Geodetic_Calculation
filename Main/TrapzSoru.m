%% INTEGRAL SORU
% E=referenceEllipsoid('grs80');
% phi1=32;
% phi2=38;
% lam1=22;
% lam2=27;
% a=E.SemimajorAxis;
% b=E.SemiminorAxis;
% f=E.Flattening;
% dphi=22/3500;
% dlam=5/60;
% [LON,LAT]=meshgrid(lam1:dlam:lam2,phi1:dphi:phi2); 
% N=rcurve('transverse',E,LAT);
% M=rcurve('meridian',E,LAT);
% R=E.MeanRadius;
% f1=b*cos(LAT)-((a-f*a)*(1+E.Eccentricity^2)*sin(LON));
% f2=(N*(1+E.Eccentricity^2)*cos(LAT))+(M*R*sin(LON));
% f=f1*f2
% S=trapz(deg2rad(phi1:dphi:phi2),trapz(deg2rad(lam1:dlam:lam2),f,2));
X1=2:1:4;
Y1=2:1:5;
[X,Y]=meshgrid(X1,Y1);
f=X.*Y;
A=trapz(Y1,trapz(X1,f));
A1=integral2(@(x,y) x.*y,2,4,2,5);










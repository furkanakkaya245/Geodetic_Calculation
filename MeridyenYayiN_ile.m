clc;clear all;
%% Elipsoit meridyen yayı (S=integral(M*dphi)
%meridianarc.m
format long g;
phi1 = 36;
phi2 = 42;
E = referenceEllipsoid('grs80');
%s1 = meridianarc(deg2rad(phi1),deg2rad(phi2),E)*1E-3; %8 km %bu hep M ile
%olanı verir.

%(trapz.m)
dphi = 1/3600; % 1 yay-saniyesi
N = rcurve('transverse', E, phi1 : dphi : phi2);
%s2 = trapz (M*deg2rad (dphi)) *1E-3;
s3 = trapz(deg2rad(phi1: dphi : phi2) , N)*1E-3;
% （integral.m）
B = referenceEllipsoid('grs80');
a = E. SemimajorAxis;
e2 = E.Eccentricity^2;
N= @(phi) (a)./(sqrt(1-e2.*sin(phi).^2));
%N_n=RefEllp.SemimajorAxis/sqrt(1-RefEllp.Eccentricity^2*sind(lat)^2)
s4= integral(N,deg2rad(phi1),deg2rad(phi2))*1E-3;

%E=referenceEllipsoid('grs80')
s5=integral(@(phi) rcurve("transverse",E,rad2deg(phi)),deg2rad(phi1),deg2rad(phi2))*1E-3;
%compare
S=[s3;s4;s5]

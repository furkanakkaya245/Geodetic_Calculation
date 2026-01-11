function R = RotECEF2NEU(lat,lon)
%lat and lon must be in degree

P2=eye(3);
P2(2,2) = -1;

R=P2*R2(-(90-lat))*R3(-(180-lon));
function R = RotNEU2ECEF(Lat, Lon)
%lat and lon must be in degree

P2=eye(3);
P2(2,2)=-1;

R=R3(180-Lon) * R2(90-Lat)*P2
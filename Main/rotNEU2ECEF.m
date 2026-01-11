function R= rotNEU2ECEF(Lat,Lon)
% lat ve lon must be degree
P2=eye(3);% 3x3 matrix that diagonal elements are 1
P2(2,2)=-1;
R=R3(180-Lon)*R2(90-Lat)*P2;

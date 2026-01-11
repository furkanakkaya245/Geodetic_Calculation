function R=rotECEF2NEU(Lat,Lon)
% lat ve lon must be degree
P2=eye(3);% 3x3 matrix that diagonal elements are 1
P2(2,2)=-1;
R=P2*R2(-(90-Lat))*R3(-(180-Lon));

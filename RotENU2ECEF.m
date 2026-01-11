function R = RotENU2ECEF(lat,lon)
%lat and lon must be in degree

R=R3(-(90+lon))*R1(-(90-lat));
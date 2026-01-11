function R = R3(x)


%x must be in degrees

R=[cosd(x) sind(x) 0;
  -sind(x) cosd(x) 0;
     0        0    1 ];
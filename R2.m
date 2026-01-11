function R = R2(x)


%x must be in degrees

R=[cosd(x)  0  -sind(x);
     0      1       0;
  sind(x)   0   cosd(x)];
function R=R1(x)
% x must be in degrees
R=[ 1   0        0      ;
    0   cosd(x)  sind(x);
    0   -sind(x) cosd(x)];
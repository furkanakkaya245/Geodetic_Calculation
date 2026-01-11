clc; clear all;

% yersel(terrestrial) -> goksel(celestial)
XYZ_ter=[ 462763.46,  32620.21, 26921.38];
% Rs = R3(gast)
Teta = GAST(2025,05,29,10,54,00);

Rm = pol_motion(15,15);
Rs = R3(Teta);
N = nutation(2025,05,29,10,54,00)
P = precession(2025,05,29,10,54,00);


XYZ_cel = XYZ_ter*(inv(P)*inv(N)*inv(Rs)*inv(Rm))


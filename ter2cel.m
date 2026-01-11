clc; clear all;

% yersel(terrestrial) -> goksel(celestial)
XYZ_ter=[ -1.17710488986277,  1.89696957768333, 3.002653909395];
% Rs = R3(gast)
Teta = GAST(2024,06,06,10,54,00);

Rm = pol_motion(15,15);
Rs = R3(Teta);
N = nutation(2024,06,06,10,54,00);
P = precession(2024,06,06,10,54,00);




XYZ_cel = XYZ_ter*(inv(P)*inv(N)*inv(Rs)*inv(Rm))


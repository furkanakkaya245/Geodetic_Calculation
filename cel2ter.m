clear all; clc;
% goksel(celestial) -> yersel(terrestrial)
XYZ_cel=[1,2,3];
% Rs = R3(gast)
Teta = GAST(2024,06,06,10,54,00);

Rm = pol_motion(15,15);
Rs = R3(Teta);
N = nutation(2024,06,06,10,54,00);
P = precession(2024,06,06,10,54,00);




XYZ_ter = XYZ_cel*(Rm*Rs*N*P)
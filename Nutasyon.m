clear all; clc;

%notasyonla anlık sisteme

format long g;
YYYY = 2024;
MM = 6;
DD = 06;
HH = 10;
Mi = 54;
SS = 0;

N = nutation(YYYY, MM, DD, HH, Mi, SS)

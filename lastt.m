clear all; clc;

%presizyonla ortalama sisteme

format long g;
YYYY = 2024;
MM = 5;
DD = 27;
HH = 12;
Mi = 0;
SS = 0;
lat= dms2degrees([39 00 00])  %astronomik
lon= dms2degrees([36 00 00])  %astronomik

L= LAST(YYYY, MM, DD, HH, Mi, SS,lat,lon);
disp(L);
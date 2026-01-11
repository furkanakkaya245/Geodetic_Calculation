format long g;
clc;
clear all;

%% saat açısı sisteminden harizona geçiş
az=49;
yuk=1;
enlem=40.8
sagaciklik=21.5;
phi=50;
t=40;%saat açısı
dek=80;%deklinasyon
A1=[-sind(phi) 0 cosd(phi);
       0      -1     0;
    cosd(phi)  0 sind(phi)];

A2=[cosd(t)*sind(t);
    sind(t)*cosd(dek);
    sind(dek)];
Gecis=A1*A2;

z=acosd(Gecis(3));
A=(acosd(Gecis(1)/sind(z)));


addpath('D:\Kod');
clc;
clear all;
format long g
x=42685,132;
y=29166,155;
z=36483,416;

S=referenceSphere("earth");
S.Radius=6371000;

[Lat,Lon,h]=ecef2geodetic(S,x,y,z,"degrees");


latA=Lat+0.0625;%((7,5/2)/60)
lonA=Lon-0.0625;

latB=Lat+0.0625;
lonB=Lon+0.0625;

latC=Lat-0.0625;
lonC=Lon-0.0625;

latD=Lat-0.0625;
lonD=Lon+0.0625;

BD=meridianarc(deg2rad(latD),deg2rad(latB),S);% içine radyan değeri alır
AC=meridianarc(deg2rad(latC),deg2rad(latA),S);
AB=departure(lonB,lonA,latA,S);% içine derece alır
DC=departure(lonD,lonC,latD,S);

fprintf("1/25000'lik harita için;\n");
fprintf("AB: %0.3f\n",AB);
fprintf("BD: %0.3f\n",BD);
fprintf("DC: %0.3f\n",DC);
fprintf("AC: %0.3f\n",AC);

%% 1/100000 'lik harita üzerinden hesaplama
addpath('D:\Kod');
clc;
clear all;
format long g
x=42685,132;
y=29166,155;
z=36483,416;
S=referenceSphere("earth");
S.Radius=6371000;
[Lat,Lon,h]=ecef2geodetic(S,x,y,z,"degrees");

latA=Lat+15;
lonA=Lon-15;
latB=Lat+15;
lonB=Lon+15;
latC=Lat-15;
lonC=Lon-15;
latD=Lat-15;
lonD=Lon+15;

BD=meridianarc(deg2rad(latD),deg2rad(latB),S);% içine radyan değeri alır
AC=meridianarc(deg2rad(latC),deg2rad(latA),S);
AB=departure(lonB,lonA,latA,S);% içine derece alır
DC=departure(lonD,lonC,latD,S);

fprintf("1/100000'lik harita için;\n")
fprintf("AB: %0.3f\n",AB);
fprintf("BD: %0.3f\n",BD);
fprintf("DC: %0.3f\n",DC);
fprintf("AC: %0.3f\n",AC);







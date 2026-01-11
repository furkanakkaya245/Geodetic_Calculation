%% KÜREDE ORTODROM
clc;clear all;format long g;
lat1=dms2degrees([39 22 37]);
lon1=dms2degrees([32 22 30])
lat2=dms2degrees([39 37 37]);
lon2=dms2degrees([32 37 30]);
R=6374017;
[mesafe,az]=distance('gc',lat1,lon1,lat2,lon2,R)


% %bu da formüllü örnek
% clc;clear all;format long g;
% fi_1=dms2degrees([39 30 18]); % dms yi dereceye çeviriyoruz.
% lamda_1=dms2degrees([39 00 00]);
% fi_2=dms2degrees([39 00 36]);
% lamda_2=dms2degrees([39 30 00]);
% r=6374249.664;
% s=acosd((sind(fi_1)*sind(fi_2)+cosd(fi_1)*cosd(fi_2)*cosd(lamda_2-lamda_1)))*r*(pi/180)  %r*(pi/180) ile çarpıyoruz çünkü derceyi mesafeye çeviriyoruz.
% az=acotd((cosd(fi_1)*tand(fi_2)-sind(fi_1)*cosd(lamda_2-lamda_1))/sind(lamda_2-lamda_1))+180



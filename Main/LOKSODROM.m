%KÜREDE LOKSODROM
clc;clear all;format long g;
lat1=dms2degrees([39 30 18]);
lon1=39;
lat2=dms2degrees([39 0 36]);
lon2=dms2degrees([39 30 0]);
R=6374249.664;
[mesafe,az]=distance('rh',lat1,lon1,lat2,lon2,R)

%Az=rad2deg(atan2(deg2rad(lon2-lon1), log(tand(45+lat2/2))-log(tand(45+lat1/2))));
%s=R*deg2rad(lat2-lat1)/cosd(Az)

%burası da formüllü kodu
% clc;clear all;format long g;
% fi_1=dms2degrees([39 30 18]);
% lamda_1=dms2degrees([39 00 00]);
% fi_2=dms2degrees([39 00 36]);
% lamda_2=dms2degrees([39 30 00]);
% 
% % Küreyi referans alıyoruz.BURAYA DİKKAT ET
% EartSphere=referenceSphere('Earth');
% EartSphere.Radius=6374249.664;
% 
% az=rad2deg(atan2(deg2rad(lamda_2-lamda_1),(log(tand(45+fi_2/2))-log(tand(45+fi_1/2)))))
% 
% s=(EartSphere.Radius/cosd(az))*((fi_2-fi_1)/(180/pi))
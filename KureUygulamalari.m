% % Kurede meridyen yayı (A-B)
% format long g;
% Lat1=deg2rad(dms2degrees([36 00 00]));
% Lat2=deg2rad(dms2degrees([42 00 00]));
% EarthSphere=referenceSphere('earth');
% EarthSphere.Radius=6374018.98716534;
% s = abs(meridianarc((Lat1),(Lat2),EarthSphere))                           
% s = abs(EarthSphere.Radius*(Lat1-Lat2))                                   

%% kurede paralel daire yayi  (A-D)


format long g;
Lat=(dms2degrees([42  00  00]));
Lon1=(dms2degrees([26 00 00]));
Lon2=(dms2degrees([27 00 00]));
EarthSphere=referenceSphere('earth');
EarthSphere.Radius=6371;
dist=abs(departure(Lon1,Lon2,Lat,EarthSphere))    %derece alır
Rlat=abs(EarthSphere.Radius*cosd(Lat))
dist=abs(Rlat*(deg2rad(Lon1-Lon2)))


          
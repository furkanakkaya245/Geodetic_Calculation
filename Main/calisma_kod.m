clc;
clear all;
format long g;
s=referenceEllipsoid("grs80");
x = 4156406.6935;
y = 2647923.0962;
z = 4035803.5194;

[lat,lon,h] = ecef2geodetic(s,x, y, z);

fprintf('Latitude: %0.8f  degrees\n', lat)
fprintf('Longitude: %0.8f degrees\n', lon)
fprintf('Height: %0.8f    meters\n', h)
%--------------------------------------------------------------------------
%% b)
% 
latA=degrees2dms(lat-dms2degrees([0 7 30]));
lonA=degrees2dms(lon-dms2degrees([0 7 30]));
latB=degrees2dms(lat+dms2degrees([0 7 30]));
lonB=degrees2dms(lon-dms2degrees([0 7 30]));
latC=degrees2dms(lat+dms2degrees([0 7 30]));
lonC=degrees2dms(lon+dms2degrees([0 7 30]));
latD=degrees2dms(lat-dms2degrees([0 7 30]));
lonD=degrees2dms(lon+dms2degrees([0 7 30]));

 %% c)  
% 
RefEllp=referenceEllipsoid('grs80');

lat=39.50347483;
format long g;
M=rcurve('meridian',RefEllp,lat,'degrees');
M_m=(RefEllp.SemimajorAxis*(1-RefEllp.Eccentricity^2))/((1-RefEllp.Eccentricity^2*sind(lat)^2)^1.5);
N=rcurve('transverse',RefEllp,lat,'degrees');
N_n=RefEllp.SemimajorAxis/sqrt(1-RefEllp.Eccentricity^2*sind(lat)^2);

R=sqrt(M*N);
fprintf("Gauss yaricapi= %0.8f\n",R);


%% ç)

clc;clear all;format long g;
x = 4156406.6935;
y = 2647923.0962;
z = 4035803.5194;
R=6374018.98716534;
lat=rad2deg(atan(z/sqrt(x^2+y^2)));
lon=rad2deg(atan(y/x));
h=(z/sind(lat)-R);

%% d)
clc;
clear all;
format long g;
r= 6374018.98716534; 

h = -4174.14036079496; 
lat = 39.3147128064112;
lon = 32.4999999995092;
x=(r+h)*cosd(lat)*cosd(lon)
y=(r+h)*cosd(lat)*sind(lon)
z=(r+h)*sind(lat)

%% e) f) f şıkkını da burada yaptım
lat = 39.3147128064112;
lon = 32.4999999995092;

latA=degrees2dms(lat-dms2degrees([0 7 30]))
lonA=degrees2dms(lon-dms2degrees([0 7 30]))
latB=degrees2dms(lat+dms2degrees([0 7 30]))
lonB=degrees2dms(lon-dms2degrees([0 7 30]))
latC=degrees2dms(lat+dms2degrees([0 7 30]))
lonC=degrees2dms(lon+dms2degrees([0 7 30]))
latD=degrees2dms(lat-dms2degrees([0 7 30]))
lonD=degrees2dms(lon+dms2degrees([0 7 30]))


%% Kürede ortodrom (A-C)
clear all; clc; 
format long g;
Lat1=dms2degrees([39 11 22.9661030803237]);
Lon1=dms2degrees([32 22 29.999998233119]);
Lat2=dms2degrees([39 26 22.9661030803237]);
Lon2=dms2degrees([32 37 29.999998233119]);
R=6374018.98716534;


[arclen,az]= distance('gc',Lat1,Lon1,Lat2,Lon2,R)


% Kürede loksodrom (A-C)
% 
[arclen,az]= distance('rh',Lat1,Lon1,Lat2,Lon2,R)
% -------------------------------------------------------------
%% Kürede ortodrom (B-D)
clear all; clc; 
format long g;
Lat1=dms2degrees([39  26   22.9661030803237]);
Lon1=dms2degrees([32  22   29.999998233119]);
Lat2=dms2degrees([39  11   22.9661030803237]);
Lon2=dms2degrees([32  37   29.999998233119]);
R=6374018.98716534;


[arclen,az]= distance('gc',Lat1,Lon1,Lat2,Lon2,R)


% % Kürede loksodrom (B-D)
% 
[arclen,az]= distance('rh',Lat1,Lon1,Lat2,Lon2,R)


% % g) 
clc;clear all;format long g;

Lat1=dms2degrees([39 11 22.9661030803237]);
Lon1=dms2degrees([32 22 29.999998233119]);
Lat2=dms2degrees([39 26 22.9661030803237]);
Lon2=dms2degrees([32 37 29.999998233119]);

EartSphere=referenceSphere('Earth');
EartSphere.Radius=6374018.98716534;

Area2=areaquad(Lat1,Lon1,Lat2,Lon2,EartSphere.Radius)  %degree olarak giriyoruz


%% ğ)
Kurede meridyen yayı (A-B)
format long g;
Lat1=deg2rad(dms2degrees([39 11 22.9661030803237]));
Lat2=deg2rad(dms2degrees([39  26   22.9661030803237]));
EarthSphere=referenceSphere('earth');
EarthSphere.Radius=6374018.98716534;
s = abs(meridianarc((Lat1),(Lat2),EarthSphere))                           
s = abs(EarthSphere.Radius*(Lat1-Lat2))

% Kurede meridyen yayı (C-D)
format long g;
 Lat1=deg2rad(dms2degrees([39 26 22.9661030803237]));
 Lat2=deg2rad(dms2degrees([39 11 22.9661030803237]));
EarthSphere=referenceSphere('earth');
EarthSphere.Radius=6374018.98716534;
s = abs(meridianarc((Lat1),(Lat2),EarthSphere))                           
s = abs(EarthSphere.Radius*(Lat1-Lat2)) 
% --------------------------------------------------------------------------
% 
% kurede paralel daire yayi  (B-C)
% 
% 
format long g;
Lat=(dms2degrees([39 26 22.9661030803237]));
Lon1=(dms2degrees([32 22 29.999998233119]));
Lon2=(dms2degrees([32 37 29.999998233119]));
EarthSphere=referenceSphere('earth');
EarthSphere.Radius=6374018.98716534;
dist=abs(departure(Lon1,Lon2,Lat,EarthSphere))    %derece alır
Rlat=abs(EarthSphere.Radius*cosd(Lat))
dist=abs(Rlat*(deg2rad(Lon1-Lon2)))
% 
% kurede paralel daire yayi  (A-D)
% 
format long g;
Lat=(dms2degrees([39  11   22.9661030803237]));
Lon1=(dms2degrees([32 22 29.999998233119]));
Lon2=(dms2degrees([32  37   29.999998233119]));
EarthSphere=referenceSphere('earth');
EarthSphere.Radius=6374018.98716534;
dist=abs(departure(Lon1,Lon2,Lat,EarthSphere))    %derece alır
Rlat=abs(EarthSphere.Radius*cosd(Lat))
dist=abs(Rlat*(deg2rad(Lon1-Lon2)))
% 

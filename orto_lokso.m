%% Kürede ortodrom
clear all; clc; 
format long g;
Lat1=dms2degrees([36 00 00]);
Lon1=dms2degrees([26 00 00]);
Lat2=dms2degrees([42 00 00]);
Lon2=dms2degrees([45 00 00]);
R=6371;


[arclen,az]= distance('gc',Lat1,Lon1,Lat2,Lon2,R)


%% Kürede loksodrom

[arclen,az]= distance('rh',Lat1,Lon1,Lat2,Lon2,R)
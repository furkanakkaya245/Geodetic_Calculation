clc;
clear all;
format long g;

afi=dms2degrees([52 30 0]);
alam=dms2degrees([-1 55 0]);
d=datenum(1998,08,10,23,10,0)-datenum(2000,1,1,12,0,0);
GST=wrapTo360(100.46+0.985647*d);
dklnsyn=dms2degrees([35 28 0]);
right_asc=dms2degrees([16 41 42]);
LST=wrapTo360(GST+alam+15*dms2degrees([23 10 00]));
t=wrapTo360(LST-right_asc*360/24);

Z=acosd(sind(afi)*sind(dklnsyn)+cosd(afi)*cosd(dklnsyn)*cosd(t))
elev=90-Z
A=asind(sind(90-dklnsyn)*sind(t))/sind(Z)


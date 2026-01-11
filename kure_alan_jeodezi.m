clc;clear all;format long g;

Lat1=dms2degrees([39 11 22.9661030803237]);
Lon1=dms2degrees([32 22 29.999998233119]);
Lat2=dms2degrees([39 26 22.9661030803237]);
Lon2=dms2degrees([32 37 29.999998233119]);

EartSphere=referenceSphere('Earth');
EartSphere.Radius=6374018.98716534;

Area2=areaquad(Lat1,Lon1,Lat2,Lon2,EartSphere.Radius)  %degree olarak giriyoruz
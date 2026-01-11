%Toposentrik koordinat
E=referenceEllipsoid("grs80");
%Pnoktasının tanımlanması
phiP=dms2degrees([38 20 33.47]);
lamP=dms2degrees([40 32 21.43]);
ranP=2144.391;

AzQ=28;
ElevQ=90-32;
RangeQ=32000;

[phiQ,lamQ,xQ]=aer2geodetic(AzQ,ElevQ,RangeQ,phiP,lamP,ranP,E,"degrees");






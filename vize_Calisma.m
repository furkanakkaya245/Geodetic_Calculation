addpath('D:\Kod');
clc;
clear all;
format long g;


% Tanımlamalar
E=referenceSphere("earth"); 
E.Radius=6371000;
h=1100.12;
Lat=deg2rad(dms2degrees([39 23 12.154]));
Lon=deg2rad(dms2degrees([32 46 18.256]));
% Değerlerin Bulunması
[x,y,z]=geodetic2ecef(E,Lat,Lon,h,'radians');
X1=x/1000;
Y1=y/1000;
Z1=z/1000;
% Sonuc Bastırma
fprintf("X: %0.3f m \nY: %0.3f  m \nZ= %0.3f m\n\n",X1,Y1,Z1);


%Tanımlama
X= 4140999.868; 
Y= 2665802.247;
Z= 4043424.095;
E=referenceSphere("earth"); 
E.Radius=6371000;
[Lat1,Lon1,h1]=ecef2geodetic(E,x,y,z,"degrees");
lat=degrees2dms([Lat1]);
lon=degrees2dms([Lon1]);
fprintf("Enlem :[%.1f, %0.1f, %0.1f] \nBoylam:[%0.1f, %0.1f, %0.1f] \nUzunluk= %0.1f\n\n",lat,lon,h1);


% Tanımlama
x= 4199512,179;
y= 2624146,454;
z= 4010029,532;
S=referenceEllipsoid('wgs84');

[Lat,Lon,h]=ecef2geodetic(S,x,y,z,"degrees");
lat_dms=degrees2dms(Lat);
lon_dms=degrees2dms(Lon);
fprintf("Enlem: %.1f %.1f %.1f\nBoylam: %.1f%.1f%.1f\nYükseklik: %.1f\n",lat_dms,lon_dms,h);

%Tanımlama
% Verilen p orta koordinatlarını kullanarak pafta kenar uzunluklarını bul
% Yarıçap olarak p noktası için Gauss küresi tanımla
% 1/25000 lik harita için :
x=42685,132;
y=20166,155;
z=36483,416;
E=referenceSphere("earth");
[Lat_p,Lon_p,h_p]=ecef2geodetic(E,x,y,z,"degrees");
% Gauss Küresi Tanımlama
E1=referenceSphere("earth");
M=rcurve('meridian',E1,Lat);
N=rcurve("transverse",E1,Lat);
R=sqrt(M*N);
E1.Radius=R;
% A noktasının Hesaplanması
Lat_a= Lat_p + 0.0625;
Lon_a= Lon_p - 0.0625;
% B noktasının Hesaplanması
Lat_b= Lat_p + 0.0625;
Lon_b= Lon_p + 0.0625;
% C noktasının Hesaplanması
Lat_c= Lat_p - 0.0625;
Lon_c= Lon_p - 0.0625;
% D noktasının Hesaplanması
Lat_d= Lat_p - 0.0625;
Lon_d= Lon_p + 0.0625;

% Kenar Uzunluklarının Bulunması
% Boylamlar Farklı
AB=departure(Lon_b,Lon_a,Lat_a,E1);
CD=departure(Lon_b,Lon_a,Lat_a,E1);
% Enlemler farklı
AC= meridianarc(deg2rad(Lat_c),deg2rad(Lat_a),E1);
DB= meridianarc(deg2rad(Lat_d),deg2rad(Lat_b),E1);
fprintf("(250000)\nAB: %.2f\nCD: %.2f\nAC: %.2f\nBD: %.2f\n",AB,CD,AC,DB);
% 1/100000 lik harita için :
x=42685,132;
y=29166,155;
z=36483,416;
E1=referenceSphere("earth");
E1.Radius=6371000;
[Lat_p,Lon_p,h_p]=ecef2geodetic(E1,x,y,z,"degrees");
% A noktasının Hesaplanması
Lat_a= Lat_p + 15;
Lon_a= Lon_p - 15;
% B noktasının Hesaplanması
Lat_b= Lat_p + 15;
Lon_b= Lon_p + 15;
% C noktasının Hesaplanması
Lat_c= Lat_p - 15;
Lon_c= Lon_p - 15;
% D noktasının Hesaplanması
Lat_d= Lat_p - 15;
Lon_d= Lon_p + 15;
% Kenar Uzunluklarının Bulunması
% Boylamlar Farklı
AB=departure(Lon_b,Lon_a,Lat_a,E1);
CD=departure(Lon_d,Lon_c,Lat_d,E1);
% Enlemler farklı
AC= meridianarc(deg2rad(Lat_c),deg2rad(Lat_a),E1);
BD= meridianarc(deg2rad(Lat_d),deg2rad(Lat_b),E1);
fprintf("(100000)\nAB: %.2f\nCD: %.2f\nAC: %.2f\nBD: %.2f\n\n",AB,CD,AC,BD);

% TEMEL ÖDEV
% 1. temel ödev
Lat1=40;
Lon1=35;
s_12=15000;%metre
az_12=40;
% GAUSS KÜRESİ TANIMLAYARAK ÇÖZ
S=referenceSphere("earth");
M=rcurve('meridian',S,Lat1);
N=rcurve("transverse",S,Lat1);
R=sqrt(M*N);
S.Radius=R;
%Temel Ödev
[Lat2,Lon2]=reckon('rh',Lat1,Lon1,s_12,az_12,S);
fprintf("2. Nokta Enlem: %f\n2. Nokta Boylam: %f\n",Lat2,Lon2);
%2. temel ödev
lat1=40;
lon1=40;
lat2=39;
lon2=39;
%Temel ödev
[arclen1,~]=distance(Lat1,Lon1,Lat2,Lon2,S); % Sadece mesafenin bulunması
[arclen,az2]=distance(Lat1,Lon1,Lat2,Lon2,S);% azimut 1 den 2 ye göre çözüm
[arclen,az2]=distance(Lat2,Lon2,Lat1,Lon1,S);
az=azimuth(Lat1,Lon1,Lat2,Lon2,S);
az1=azimuth(Lat2,Lon2,Lat1,Lon1,S);
b=az2-az;
fprintf("%f\n%f\n%f\n%f\n%f\n%f\n",arclen1,arclen,az2,az,az1,b);
fprintf("Azimut(Açı): %f\nMesafe: %f\n",az,arclen);

% Ortodrom/Loksodrom
% koordinatları verilen noktaların mesafelerinin hesaplanması
Lat_1=dms2degrees([37 15 0]);
Lon_1=dms2degrees([30 30 0]);
Lat_2=dms2degrees([37 45 0]);
Lon_2=dms2degrees([33 30 0]);
%Ortodrom
[arclen,az]=distance('gc',Lat1,Lon1,Lat2,Lon2,E.Radius);
fprintf("Ortodrom:\nMesafe: %f m\nAçı:    %f\n",arclen,az);
%loksodrom
[arclen1,az1]=distance('rh',Lat1,Lon1,Lat2,Lon2,[E.Radius,0]);
fprintf("Loksodrom:\nMesafe: %f m\nAçı:    %f\n",arclen1,az1);














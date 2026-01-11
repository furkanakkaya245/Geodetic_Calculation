%% TANIMLAMALAR
addpath('D:\Kod'); 
clc;
clear all;
format long g; % sayıları 4. basamakta kesmesin diye koyulur
% Uygulama yapılacak yüzeyin tanımlanması 
E=referenceSphere("earth"); 
E.Radius=6371000;
E.LengthUnit='km';% kullanılacak değerleri km cinsinden alınması default değer metre
%% COĞRAFİ KOORDİNATLARDAN(GEODETİC)- KARTEZYEN KOORDİNAT(ECEF)
% p noktasının enlem ve boylamı verildi 
% enlem= 39der 23dk 12,154sn boylam= 32der 46dk 18.256sn
% h elipsoid yüksekliği R dünya yarıçapı
% NOKTANIN X,Y,Z KOORDİNATLARINI BULUNUZ
Lat = deg2rad(dms2degrees([39 23 12.154]));
lon = deg2rad(dms2degrees([32 46 18.256]));
h=1100.12; 
R=6371000; 
% %0.5 demek virgülsen sonra 5 sayı al demek
fprintf("Lat(Mat.):\nx: %0.5f \ny: %0.5f \nz: %0.5d \n", x,y,z);
%  Fonksiyon Kullanmadan
x=(R+h)*cos(Lat)*cos(lon);
y=(R+h)*cos(Lat)*sin(lon);
z=(R+h)*sin(Lat);
% Fonksiyon Kullanarak
[X1,Y1,Z1]= geodetic2ecef(s,Lat,lon,h,'radians'); 

%% ECEF - COĞRAFİ KOORDİNATLAR (GEODETİC) ÇEVİRME
% Verilen x,y,z değerlerini lat lon h a çevirme
[Lat,Lon,h]=ecef2geodetic(E , x , y , z , "degrees");
% 1/25000^lik haritada orta noktası verilen p noktasının oluşturduğu
% paftanın kenar uzunlukları nedir?
% Öncelik noktaların lat lon değerlerinin hesabı h değeri sabit
latA=Lat+0.0625;%((7,5/2)/60)
lonA=Lon-0.0625;
latB=Lat+0.0625;
lonB=Lon+0.0625;
latC=Lat-0.0625;
lonC=Lon-0.0625;
latD=Lat-0.0625;
lonD=Lon+0.0625;
% Ardından fonksiyon ile kenar uzunluklarının hesaplanması
% meridyenler arası için
BD=meridianarc(deg2rad(latD),deg2rad(latB),S);% içine radyan değeri alır
% boylamlar arası için 
AB=departure(lonB,lonA,latA,S);% içine derece alır
% DERECE ELDE EDİLEN VERİYİ DERECE DAKİKA SANİYE OLARAK YAZDIRMA
[Lat1,Lon1,h1]=ecef2geodetic(E,x,y,z,"degrees");
lat=degrees2dms([Lat1]);
lon=degrees2dms([Lon1]);
fprintf("Enlem: %.1f %0.1f %0.1f \nBoylam: %0.1f %0.1f %0.1f \nUzunluk= %0.1f\n\n",lat,lon,h1);
% DMS olduğu için enlem ve boylam için 3 adet değişkenmiş gibi tanımlanır.
% FORMÜLSÜZ
% Pa eğrilik yarıçapı
Pa=R*cos(latp)*cos(lata)*(Lona-Lonp);
% yay uzunluğu
Yay_uzun=R*(Latk-Latp) % uzundan kısa çıkartılır
%% ELİPSOİD İLE EĞRİ KOORDİNAT SİSTEMİ İLİŞKİSİ
% Koordinatları verilen P noktasının WGS84,GRS80, ve R si olan küreye göre
% phi,landa,h değerlerini bul.
% Farklı Elipsoidler ve Kürelerin Tanımlanması
x=4199512,179;
y=2624146,454;
z=4010029,532;
R=6373000;
E=referenceEllipsoid("GRS80");
E1=referenceEllipsoid("WGS84");
S=referenceSphere("earth");
S.Radius=R;
% Tanımlanan Referans Yüzeylere Göre Değerlerin Hesaplanması
[Lat,Lon,h]=ecef2geodetic(S,x,y,z);
[Lat1,Lon1,h1]=ecef2geodetic(E,x,y,z);
[Lat2,Lon2,h2]=ecef2geodetic(E1,x,y,z);
% Coğrafi koordinatlar verilirse Değerlerin Hesaplanması
[X1,Y1,Z1]= geodetic2ecef(S,39.18828,32.00000,2357.40986);
[X2,Y2,Z2]= geodetic2ecef(E,39.18828,32.00000,2357.40986);
[X3,Y3,Z3]= geodetic2ecef(E1,39.18828,32.00000,2357.40986);
%% Gauss Küresinin Tanımlanması
%Bir p noktası Lon:39.188 , Lat: 32.000 h: 2357.4098 olan noktanın x,y,z
%koordinatlarını bul
lat=32;
S=referenceSphere("earth");
M=rcurve('meridian',S,lat);% M nin hesaplanması
Mf=S.SemimajorAxis*(1-S.Eccentricity^2)/(1-S.Eccentricity^2*sind(lat)^2)^1.5;
N=rcurve("transverse",S,lat); % N değerinin hesaplanması
R=sqrt(M*N); % Gauss Küresi Yarıçapı Sistemde değiştirmeyi unurma (sqrt kök alma)
S.Radius=R;
[X1,Y1,Z1]= geodetic2ecef(S,39.18828,32.00000,2357.40986);
%% Kürede Temel Ödev
%% 1. Temel Ödev
% Temel ödev için ihtiyaç duyulan verilenlerin tanımlanması
Lat1=40;  % enlem
Lon1=35;  % boylam
S=150000; % uzaklık
Az=40;    % P-Q arasındaki açı
EarthSphere=referenceSphere("earth");
EarthSphere.Radius=6370000;
% Koordinatların Bulunması
[Lat2,Lon2]=reckon('rh',Lat1,Lon1,S,Az,EarthSphere);
fprintf("2. Nokta Enlem: %f\n2. Nokta Boylam: %f\n",Lat2,Lon2);
%% 2. Temel Ödev
% Tanımlamaların yapılması
Lat1=40;
Lon1=40;
Lat2=39;
Lon2=39;
EarthSphere=referenceSphere("earth");
EarthSphere.Radius=6370000;
% Değer Hesabı
[arclen,~]=distance(Lat1,Lon1,Lat2,Lon2,EarthSphere); % Sadece mesafenin bulunması
[arclen,az]=distance(Lat1,Lon1,Lat2,Lon2,EarthSphere);% azimut 1 den 2 ye göre çözüm
[arclen,az]=distance(Lat2,Lon2,Lat1,Lon1,EarthSphere);
az=azimuth(Lat1,Lon1,Lat2,Lon2,EarthSphere);
az1=azimuth(Lat2,Lon2,Lat1,Lon1,EarthSphere);
fprintf("Azimut(Açı): %f\nMesafe: %f\n",az,arclen);
%% KÜREDE ALAN HESABI (F)
% 40-45 enlemleri arasında ve boylam farkı 6 olan paftanın alanının
% bulunması
% Fonksiyon kullanmadan hesabın yapılması
F1=2*power(E.Radius,2)*lonFark*(sind((45-40)/2)*cosd((45+40)/2));
Area=abs(2*E.Radius^2*(abs(Lon2-Lon1)*pi/180)*sind((Lat2-Lat1)/2)*cosd((Lat2+Lat1)/2)); 
% abs mutlak değer anlamında kullanılır absulute value
%Fonksiyon kullanarak hesabın yapılması
Lat1=45;
Lat2=40;
Lon2=6;
Lon1=0; % fonksiyon kullandığın için boylam farkı verilsede tanımlamalısın
Area1= areaquad(Lat1,Lon1,Lat2,Lon2,E.Radius);
% 'radian' yazarak deneme
%% Ortodrom ve Loksodrom Hesabı
% Ortodrom
Lat1=dms2degrees([39 30 18]);
Lon1=39;
Lat2=dms2degrees([39 0 36]);
Lon2=dms2degrees([39 30 0]);
[arclen,az]=distance('gc',Lat1,Lon1,Lat2,Lon2,E.Radius);
%Loksodrom
Az=rad2deg(atan2(deg2rad(Lon2-Lon1), log(tand(45+Lat2/2))- log(tand(45+Lat1/2))));
S=E.Radius*deg2rad(Lat2-Lat1)/cosd(Az);
[arclen,az]=distance('rh',Lat1,Lon1,Lat2,Lon2,[E.Radius,0]);
fprintf("Loksodrom:\nMesafe: %f m\nAçı:    %f\n",arclen,az);





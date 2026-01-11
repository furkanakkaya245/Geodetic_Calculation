% addpath('D:\Kod'); 
%% VİZE SAYISAL BÖLÜM SORULARININ CEVAPLARI
clc;
clear all;
format long g;
%% a) 
% Parametrelerin tanımlanması
x= 4156476.6935;
y= 2647923.0962;
z= 4035503.5194;
% Referans yüzeyin tanımlanması
E=referenceEllipsoid('grs80');
% Çevrimin yapılması
[Latp,Lonp,hp]=ecef2geodetic(E , x , y , z , "degrees"); % derece istendiği için 'derece' yazıldı
fprintf("--------------------------------------------\n");
fprintf('Enlem: %.8f derece\nBoylam: %.8f derece\nYükseklik= %.6f m\n',Latp,Lonp,hp);
fprintf("--------------------------------------------\n");
%% b)
% Kenar koordinatlarının bulunması
% 30 dakika olduğu yarısı 15 dakika alınır
latA=Latp-dms2degrees([0 15 0]);
lonA=Lonp-dms2degrees([0 15 0]);
latB=Latp+dms2degrees([0 15 0]);
lonB=Lonp-dms2degrees([0 15 0]);
latC=Latp+dms2degrees([0 15 0]);
lonC=Lonp+dms2degrees([0 15 0]);
latD=Latp-dms2degrees([0 15 0]);
lonD=Lonp+dms2degrees([0 15 0]);
% dereceler derece dakika saniye cinsine çevirlmesi 
fprintf("[Derece Dakika Saniye]\n\n");
fprintf("A:\n");
fprintf("lon: [%.f %.f %f]\n",degrees2dms(lonA));
fprintf("lat: [%.f %.f %f]\n",degrees2dms(latA));
fprintf("B:\n");
fprintf("lon: [%.f %.f %f]\n",degrees2dms(lonB));
fprintf("lat: [%.f %.f %f]\n",degrees2dms(latB));
fprintf("C:\n");
fprintf("lon: [%.f %.f %f]\n",degrees2dms(lonC));
fprintf("lat: [%.f %.f %f]\n",degrees2dms(latC));
fprintf("D:\n");
fprintf("lon: [%.f %.f %f]\n",degrees2dms(lonD));
fprintf("lat: [%.f %.f %f]\n",degrees2dms(latD));
fprintf("--------------------------------------------\n");
%% c)
% r'nin parametrelerinin (M,N) bulunması
% p noktasının fit edilmesi latp= 39.50105174 lonp= 32.49956274 h= 172.77152235 
lat=39.50105174;
S=referenceSphere("earth"); % Gauss küre yüzey tanımlama
M=rcurve('meridian',S,lat);% M nin hesaplanması
N=rcurve("transverse",S,lat); % N değerinin hesaplanması
% formülsüz hesaplama
% Mf=S.SemimajorAxis*(1-S.Eccentricity^2)/(1-S.Eccentricity^2*sind(lat)^2)^1.5;
% N_n=RefEllp.SemimajorAxis/sqrt(1-RefEllp.Eccentricity^2*sind(lat)^2);
G_R=sqrt(M*N); % Tanımlanan Gauss küresinin yarıçap uzunluğı
fprintf("M yarıçap: %.6f m\nN yaricap: %.6f m\nGauss Yaricap: %.6f m\n",M,N,G_R);
fprintf("--------------------------------------------\n");
%% ç)
% tanımlanan Gauss yarıçapı ile orta noktanın eğri coğrafi koordinatlarının
% bulunması
S=referenceSphere("earth"); % Küre tanımlandı
S.Radius=G_R; % Gauss yarıçağının küreye tanımlanması
% P noktasının parametrelerin tanımlanması
x= 4156476.6935;
y= 2647923.0962;
z= 4035503.5194;
% Koordinat çevrimi
[Latp,Lonp,hp]=ecef2geodetic(S , x , y , z , "degrees");
fprintf("Tanımlanan Gauss Küresine göre p noktasının koordinatları:\nBoylam: %.8f derece\nEnlem: %.8f derece\nYukseklik: %.6f m\n",Lonp,Latp,abs(hp));
fprintf("--------------------------------------------\n");
%% d)
% Kürenin tanımlanması ve Gauss yarıcapının tanımlanması
% Boylam: 32.49956274
% Enlem: 39.31228857
% Yukseklik: 1299.545341
Lat_p= 39.31228857;
Lon_p= 32.49956274;
h_p= 1299.545341;
S=referenceSphere("earth"); % Küre tanımlandı
S.Radius=G_R;
[X,Y,Z]=geodetic2ecef(S,Lat_p,Lon_p,h_p,"degrees");
fprintf("Gauss Küresine göre ECEF Koordinatlar:\nX: %.6f m\nY: %.6f m\nZ: %.6f m\n",X,Y,Z);
% Gauss küresine göre pafta kenarlarının hesaplanması
Lat_A=Lat_p-dms2degrees([0 15 0]);
Lon_A=Lon_p-dms2degrees([0 15 0]);
Lat_B=Lat_p+dms2degrees([0 15 0]);
Lon_B=Lon_p-dms2degrees([0 15 0]);
Lat_C=Lat_p+dms2degrees([0 15 0]);
Lon_C=Lon_p+dms2degrees([0 15 0]);
Lat_D=Lat_p-dms2degrees([0 15 0]);
Lon_D=Lon_p+dms2degrees([0 15 0]);
fprintf("--------------------------------------------\n");
%% e)
% ORTODROM 'gc'
% A-C arasındaki ortodrom hesabı
% Gauss Yarıçapının tanımlanması
R=6371000.0000;
% A-C arası ortodrom uzunluğu
[arclen,az]= distance('gc',Lat_A,Lon_A,Lat_C,Lon_C,R);
fprintf("A-C ortodrom uzunluk: %.6f m\n\n",arclen);
% B-D arasındaki ortodrom hesabı
% Gauss Yarıçapının tanımlanması
R=6371000.0000;
% B-D arası ortodrom uzunluğu
[arclen1,az]= distance('gc',Lat_B,Lon_B,Lat_D,Lon_D,R);
fprintf("B-D ortodrom uzunluk: %.6f m\n",arclen1);
fprintf("--------------------------------------------\n");
% LOKDOSROM 'rh'
% Gauss Yarıçapının tanımlanması
R=6371000.0000;
% yukarıdaki değerler kullanılmıştır
% A-C arası loksodrom 
[arclen1,az]= distance('rh',Lat_A,Lon_A,Lat_C,Lon_C,R);
fprintf("A-C loksodrom uzunluk: %.6f \n\n",arclen1);
% B-D arası loksodrom
[arclen1,az]= distance('rh',Lat_B,Lon_B,Lat_D,Lon_D,R);
fprintf("B-D loksodrom uzunluk: %.6f m\n",arclen1);
fprintf("--------------------------------------------\n");
%% f)
% A-C arasındaki ortodrom ve loksodrom eğrilerinin azimutlarının
% hesaplanması
% Gauss Yarıçapının tanımlanması
R=6371000.0000;
[arclen2,az2]= distance('gc',Lat_A,Lon_A,Lat_C,Lon_C,R);
[arclen3,az3]= distance('rh',Lat_A,Lon_A,Lat_C,Lon_C,R);
fprintf("A-C Azimut açıları:\nOrtodrom azimut: %.8f derece\nLoksodrom azimut: %.8f derece\n",az2,az3);
fprintf("--------------------------------------------\n");
% Formülsüz 
% Az=rad2deg(atan2(deg2rad(Lon2-Lon1), log(tand(45+Lat2/2))- log(tand(45+Lat1/2))));
%% g
S1=referenceSphere("earth"); % Küre tanımlandı
S1.Radius=6371000.00000;
% pafta alan hesabı 
% A ve C köşeleri seçilerek köşelerin noktaları hesaplanmıştır
Area= areaquad(Lat_A,Lon_A,Lat_C,Lon_C,S1.Radius);
fprintf("Gauss Küresinin pafta alanı: %.6f km^2\n",(Area/1000));
fprintf("--------------------------------------------\n");
%% ğ
% Kenar uzunlukların bulunması
% Boylamları aynı olan noktalar
AB=meridianarc(deg2rad(Lat_B),deg2rad(Lat_A),S1);
CD=meridianarc(deg2rad(Lat_D),deg2rad(Lat_C),S1);
% Enlemleri aynı olan noktalar
BC=departure(lonB,lonC,latB,S1);% içine derece alır
DA=departure(lonD,lonA,latA,S1);
fprintf("AB= %.6f km\nCD= %.6f km\nBC= %.6f km\nDA= %.6f km\n",abs(AB)/1000,CD/1000,BC/1000,DA/1000);
fprintf("--------------------------------------------\n");









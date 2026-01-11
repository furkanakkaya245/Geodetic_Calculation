%% elipsoid meridyen yayı(s = integral(M*dphi))
format long g
clc;clear all;
phi1 = 36;
phi2 = 42;
E = referenceEllipsoid("grs80");
s1 = meridianarc(deg2rad(phi1),deg2rad(phi2),E)*1E-3;%(burada anlam on üzeri eksi 3 ü temsil ediyor yani km çevirdi);km.



%(trapz.m) buradada meridyan yay hesabını yaptık 
%trapz integral hesabı yapıyor saniye saniye doğru üzerinde geziyorum ve
%hepsini toplayıp alanı bularak buradaki meridyen yay uzunluğu biliyor
dphi = 1/3600; %1 yay-saniyesi yani 1 saniye 1 saniye arttırıyor 1 derece bölü 3600
M = rcurve("meridian",E,phi1 : dphi : phi2)*1E-3; %dphi 1 yay saniyesi aratacak
%s2 = trapz(M*deg2rad(dphi))*1E-3;
s3 = trapz(deg2rad(phi1 : dphi : phi2),M)*1E-3;

%(integral.m)
E = referenceEllipsoid("grs80");
a = E.SemimajorAxis;
e2 = E.Eccentricity^2;
%24 inci satırda formül ile M değerini bulduk . işaratei numeric sonuç
%bulabilmak için kullandık. @ işareti bilinmeyi ifade etmektedir.
M = @(phi) (a.* (1-e2)) ./(1-e2.*sin(phi).^2).^1.5; %at işareti bilinmeyeni tanımlıyor yani phi bilinmiyor nokta işareti numeric olarak bulmasını sağlıyor
s4 = integral(M,deg2rad(phi1),deg2rad(phi2))*1E-3;
% %(integral.m)
% E = referenceEllipsoid("grs80);

%31 inici satırda ise yine integral hesabı yapmış farkı sadece M yi recurve
%olarak hesaplamış farklı bir çözüm yöntemi
s5 = integral(@(phi) rcurve("meridian",E,rad2deg(phi)),deg2rad(phi1),deg2rad(phi2))*1E-3;




denklem = @(x) (x.^2);%burada örnek integral hesabı yaptık @ burada nokta işaretini koymak zorundayız. koymazsak vektör gibi algılıyor.
s4 = integral(denklem,4,6);

%burda integral hesabı yaptık ama binde bir orandında 4 den 6 ya kadar x
%karenin integralinin ala ala en son toplayıp toplam alanı buluyor.
%diğerinden farkı parça parça alana bölüp integral bulma işlemi buluyoruz.
dphi = 0.001;
x = 4:dphi:6;
s3 = trapz((4:dphi:6),(x.^2));


%% ELLIPSOID DE ALAN HESABI

%areaquad.m
phi1 = 36;
phi2 = 42;
lam1 = 26;
lam2 = 45;
E = referenceEllipsoid("grs80");
%bu ilk çözüm kürede olduğu gibi areaquad alanı kullandık
a1 = areaquad(phi1,lam1,phi2,lam2,E)*1E-6;%km2 ye çevrimek için kullandık

%(trapz.m)
E = referenceEllipsoid("grs80");
%iki tane artış miktarı yaptık çünkü iki integral hesabı yapkık
dphi = 0.1/60;%0.1yay-dakika 60 a bölmemizini nedeni dereceye çevirmek olduğu için ben dereceyi kullanıyoruz.
dlam = 0.1/60; %0.1 yay-dakika

%meshgrid fonksiyonuna bak 
[LON,LAT] = meshgrid(lam1:dlam:lam2,phi1:dphi:phi2);

M = rcurve("meridian",E,LAT);
NcosPhi = rcurve("transverse",E,LAT).*cosd(LAT);
F = M.*NcosPhi;
a2 = trapz(deg2rad(phi1:dphi:phi2),trapz(deg2rad(lam1:dlam:lam2),F,2))*1E-6;


%(integral2.m)

E = referenceEllipsoid("grs80");
a = E.SemimajorAxis;
e2 = E.Eccentricity^2;
M = @(phi) (a.*(1-e2))./(1-e2.*sin(phi).^2).^1.5;
N = @(phi) a ./sqrt((1-e2.*sin(phi).^2));
a3 = integral2(@(lam,phi) M(phi).*N(phi).*cos(phi), ...
    deg2rad(lam1),deg2rad(lam2),deg2rad(phi1),deg2rad(phi2))*1E-6;

%(integral2.m)
E = referenceEllipsoid("grs80");
a4 = integral2(@(lam,phi) rcurve("meridian",E,rad2deg(phi)).*rcurve("transverse",E,rad2deg(phi)).*cos(phi), ...
    deg2rad(lam1),deg2rad(lam2),deg2rad(phi1),deg2rad(phi2))*1E-6;


%@(lam,phi) HANGİ DEĞİŞKENLERE BAĞLI OLDUĞUNU GÖSTERİYORUM
%deg2rad(lam1),deg2rad(lam2),deg2rad(phi1),deg2rad(phi2) İNTEGRALİN SINIR
%DEĞERLERİ İÇERDEKİ VE DIŞARIDAKİ İNTEGRALİN SIRASINA GÖRE BURADAKİ SINIR
%DEĞERLERİNİ DE ONA GÖRE OLUŞTURMAM GEREKMEKTEDİR.
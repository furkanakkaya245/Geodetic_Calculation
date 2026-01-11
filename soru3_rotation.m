clear all; clc;

%fonksiyonları buraya aldım kodu size atınca çalıştıramazsınız diye
%komutanım

%R1 x ekseni saat yönünde 90 derece (-90)
R1=[1    0      0;
   0  cosd(-90) sind(-90);
   0 -sind(-90) cosd(-90)];

%R2 y ekseni saat yönünün tersinde 90 derece  (+90)
R2=[cosd(90)  0  -sind(90);
     0      1       0;
  sind(90)   0   cosd(90)];

P=[0; 0; 200];  %matrisimiz

Cikti_Matris=R2*R1*P     %çıktı matrisi 3x1 lik


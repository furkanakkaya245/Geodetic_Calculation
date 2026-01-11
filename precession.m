function P = precession(YYYY, MM, DD, HH, Mi, SS)
format long g;
t =(datenum(YYYY, MM, DD, HH, Mi, SS)-datenum(2000, 1, 1, 12, 0, 0))/36525

Zeta=(2306.2181*t + 0.30188*t^2 + 0.017988*t^3)/3600
Teta=(2004.3109*t - 0.42665*t^2-0.041833*t^3)/3600
z=(2306.2181*t + 1.09468*t^2+0.018203*t^3)/3600
P = R3(-z)*R2(Teta)*R3(-Zeta);

% astronomik enlem bass
%utc vercek ut1 yazcaz dikkat et

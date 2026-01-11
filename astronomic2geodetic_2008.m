clear all; clc;
format long g;
az=36.4583;
fi=40.34094700;
lam=46.94131800;
eta=(3.035752584305E+01)/3600;
ksi=(1.391624687235E+01)/3600;
A_fi=ksi+fi
A=az+eta*tand(fi)
A_lam=(eta/cosd(fi))+lam
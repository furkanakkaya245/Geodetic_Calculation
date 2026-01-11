clc;clear all;format long g;
wgs84 = wgs84Ellipsoid('kilometer');
X=4126517.7730;
Y=2673008.3171;
Z=4059587.8614;
a=wgs84.SemimajorAxis;
e=wgs84.Eccentricity;


lamda=atand(Y/X);

% h=0 için
    
    fi=atand((Z/sqrt(X*X+Y*Y))*(1+((e*e)/(1-e*e))));
    N=(a)/sqrt(1-power(e,2)*power(sin(fi),2));
    yedek_fi=fi;
    result=1;
for i=1:100
 %h=1 için
    if result >= power(10,-4)
    fi=atand((Z/sqrt(X*X+Y*Y))*(1+((N*e*e*sin(fi))/(Z))));
    N=(a)/sqrt(1-power(e,2)*power(sin(fi),2));

    result=fi-yedek_fi;
    yedek_fi=fi;
    
    
    else
    h=((sqrt(X*X+Y*Y)/(cosd(fi)))-N);
    fprintf('Lat: %0.8f  degree\n',fi)
    fprintf('Lon: %0.8f  degree\n',lamda)
    fprintf('H: %0.8f  metre\n',h)
    break;
    end
end

% Latitude: 39.73492461 degrees
% Longitude: 32.93370028 degrees
% Height: 6557.96857003 meters
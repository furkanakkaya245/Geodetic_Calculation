%addpath('D:\Kod')
function elipsoidparam2()
    elipsoidisim=input("Ekipsoid Adini Giriniz: ","s");
    Elipsoidisim=upper(elipsoidisim);
    if(Elipsoidisim=="WGS84")
        fprintf("[a,f]=[6378137, 0.0033528106647] elipsoidparam2('WGS84')\n");
    elseif(Elipsoidisim=="GRS80")
        fprintf("[a,f]=[6378137, 0.0033528106811] elipsoidparam2('GRS80')\n");
    else
        fprintf("Yanlis Deger Girdiniz...\n");
    end
end

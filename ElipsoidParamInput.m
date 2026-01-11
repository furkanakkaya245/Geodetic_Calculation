function [a, b, e, f, e_] = ElipsoidParamInput()

    % Kullanıcıdan Elipsoid adını girmesini isteyin
    elipsoidName = input('Elipsoid adini girin (WGS84 veya GRS80): ', 's');
    
    a = 0;
    b = 0;
    
    if strcmpi(elipsoidName, 'WGS84')
        a = 6378137;
        f = 0.003352810665;

    elseif strcmpi(elipsoidName, 'GRS80')
        a = 6378137;
        f = 0.003352810681;

    else
        disp('Yanlis...');
        return; % Geçersiz giriş durumunda fonksiyonu sonlandır
    end
    
    b = a * (1 - f);
    e = sqrt((a^2 - b^2) / a^2);
    e_ = sqrt((a^2 - b^2) / b^2);
    
    % Sonuçları ekrana yazdırın
    disp(['a = ', num2str(a)]);
    disp(['b = ', num2str(b)]);
    disp(['e = ', num2str(e)]);
    disp(['f = ', num2str(f)]);
    disp(['e_ = ', num2str(e_)]);

end
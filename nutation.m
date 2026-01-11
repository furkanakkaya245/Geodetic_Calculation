function N = nutation(YYYY, MM, DD, HH, Mi, SS)
    % Verilen tarih ile J2000 epoch arasındaki farkı hesapla
    t = (datenum(YYYY, MM, DD, HH, Mi, SS) - datenum(2000, 1, 1, 12, 0, 0)) / 36525
    d = datenum(YYYY, MM, DD, HH, Mi, SS) - datenum(2000, 1, 1, 12, 0, 0)

    % Ortalama eğim açısını (Epsi) hesapla
    Epsi = dms2degrees([23 26 21.448]) - (46.8150 * t - 0.00059 * t^2 + 0.001813 * t^3) / 3600

    % Nutasyon bileşenlerini hesapla
    DeltaEps = 0.0026 * cosd(125.0 - 0.05295 * d) + 0.0002 * cosd(200.9 + 1.97129 * d)
    DeltaPsi = -0.0048 * sind(125.0 - 0.05295 * d) - 0.0004 * sind(200.9 + 1.97129 * d)

    % Nutasyon matrisini hesapla
    N = R1(-Epsi - DeltaEps) * R3(-DeltaPsi) * R1(Epsi);
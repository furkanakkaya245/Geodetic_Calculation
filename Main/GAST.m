function Teta = GAST(YYYY, MM, DD, HH, Mi, SS)
    t = (datenum(YYYY, MM, DD, HH, Mi, SS) - datenum(2000, 1, 1, 12, 0, 0)) / 36525;
    d = datenum(YYYY, MM, DD, HH, Mi, SS) - datenum(2000, 1, 1, 12, 0, 0);

    %saat
    RASun = (12 + (24110.54841 + 8640184.812866 * t + 0.093104 * t^2 - 6.2e-6 * t^3) / 3600);

    %derece
    RASun = RASun * 15;

    UT1 = dms2degrees([HH, Mi, SS]) * 15;
    GMST = UT1 + RASun - 12*15    %(hepsi derece)
    Epsi = dms2degrees([23, 26, 21.4881]) - (46.8150 * t - 0.00059 * t^2 + 0.001813 * t^3) / 3600
    DeltaPsi = -0.0048 * sind(125 - 0.05295 * d) - 0.0004 * sind(200.9 + 1.97129 * d)

    %Gast=Teta
    Teta = wrapTo360(GMST + DeltaPsi * cosd(Epsi));
end
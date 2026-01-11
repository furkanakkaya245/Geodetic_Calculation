def ElipsoidParam2(ElipsoidName):
    if ElipsoidName == 'WGS84' or ElipsoidName == 'wgs84':
        a = 6378137
        f = 0.003352810665
    elif ElipsoidName == 'GRS80' or ElipsoidName == 'grs80':
        a = 6378137
        f = 0.003352810681
    else:
        print('Yanlış girdiniz...')
        return None

    b = a * (1 - f)
    e21 = (a**2 - b**2) / a**2
    e22 = (a**2 - b**2) / b**2

    print('b:',b,'e21:',e21,'e22:',e22)
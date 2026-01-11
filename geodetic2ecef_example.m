import math

lat = math.radians(sum([39, 23/60, 12.154/3600]))
lon = math.radians(sum([32, 46/60, 18.256/3600]))
h = 1100.112
R = 6371000

x = (R + h) * math.cos(lat) * math.cos(lon)
y = (R + h) * math.cos(lat) * math.sin(lon)
z = (R + h) * math.sin(lat)

print(f'x: {x:.3f} metre')
print(f'y: {y:.3f} metre')
print(f'z: {z:.3f} metre')

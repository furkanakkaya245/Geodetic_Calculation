import math

x = 4126517.7730
y = 2673008.3171
z = 4059587.8614
R = 6371000

lon = math.atan2(y,x)
lat = math.atan2(math.sqrt(x**2 + y**2), z)
h = (z / math.sin(lat)) - R

print(f'lon: {lon} radians')
print(f'lat: {lat} radians')
print(f'h: {h} meters')
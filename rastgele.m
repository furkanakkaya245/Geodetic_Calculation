% Elipsoidin yarıçaplarını ve merkezini belirleyin
a = 5; % x ekseni yarıçapı
b = 3; % y ekseni yarıçapı
c = 2; % z ekseni yarıçapı
x0 = 0; % Merkez x koordinatı
y0 = 0; % Merkez y koordinatı
z0 = 0; % Merkez z koordinatı

% Elipsoid yüzeyini çizmek için kullanılan açıları tanımlayın
[u, v] = meshgrid(linspace(0, 2*pi, 50), linspace(0, pi, 50));

% Elipsoidin yüzey koordinatlarını hesaplayın
x = a * cos(u) .* sin(v) + x0;
y = b * sin(u) .* sin(v) + y0;
z = c * cos(v) + z0;

% Elipsoidi çizdirin
figure;
surf(x, y, z);
xlabel('X Eksen');
ylabel('Y Eksen');
zlabel('Z Eksen');
title('Elipsoit Çizimi');
axis equal;
grid on;

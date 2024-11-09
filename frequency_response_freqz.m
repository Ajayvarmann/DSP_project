M = 22; % Filter Order is even
nn = 0:M; % "n index" vector
nsh = nn - M/2; % Center main lobe in h[n]
wb = 0.32 * pi; % Bandwidth parameter of sinc
bb = sin(wb * nsh) ./ (pi * nsh); % Filter Coefficients
bb(nsh == 0) = wb / pi; % Fix divide-by-zero
ww = -pi:(pi/500):pi; % Frequency vector
H = freqz(bb, 1, ww); % Frequency response

% Plotting the magnitude and phase
subplot(2,1,1);
plot(ww, abs(H)), grid on;
title('Magnitude Response');
xlabel('Normalized Radian Frequency');
ylabel('Magnitude');

subplot(2,1,2);
plot(ww, angle(H)), grid on;
title('Phase Response');
xlabel('Normalized Radian Frequency');
ylabel('Phase (radians)');

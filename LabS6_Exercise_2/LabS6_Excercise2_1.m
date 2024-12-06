% Parameters
M = 30; % Filter Order
fs = 10000; % Sampling Frequency in Hz
fc = 2000; % Cutoff Frequency in Hz
wc = 2 * pi * fc / fs; % Normalized cutoff frequency (rad/sample)

% Create ideal impulse response (sinc function)
n = 0:M;
ideal_h = sin(wc * (n - M/2)) ./ (pi * (n - M/2));
ideal_h(M/2 + 1) = wc / pi; % Fix division by zero

% Rectangular Window
rect_window = ones(1, M + 1);
h_rect = ideal_h .* rect_window;

% Hamming Window
n_window = 0:M; % Indices for the window
hamm_window = 0.54 - 0.46 * cos(2 * pi * n_window / M); % Hamming formula
h_hamm = ideal_h .* hamm_window;

% Frequency responses
[H_rect, f_rect] = freqz(h_rect, 1, 1024, fs); % Frequency in Hz
[H_hamm, f_hamm] = freqz(h_hamm, 1, 1024, fs);

% Plot frequency responses
figure;
subplot(2, 1, 1);
plot(f_rect, abs(H_rect), 'LineWidth', 1.5);
title('Frequency Response - Rectangular Window');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;

subplot(2, 1, 2);
plot(f_hamm, abs(H_hamm), 'LineWidth', 1.5);
title('Frequency Response - Hamming Window');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;

% Passband and Stopband Edges Measurement
% Rectangular Window
fprintf('Rectangular Window:\n');
measureEdges(H_rect, f_rect, 0.1, 0.1); % p = 0.1, s = 0.1

% Hamming Window
fprintf('Hamming Window:\n');
measureEdges(H_hamm, f_hamm, 0.01, 0.01); % p = 0.01, s = 0.01

% Function to analyze passband and stopband edges
function measureEdges(H, f, passband_ripple, stopband_ripple)
    magnitude = abs(H);

    % Passband Edge
    passband_edge = f(find(magnitude > (1 - passband_ripple), 1, 'last'));
    fprintf('  Passband Edge: %.2f Hz\n', passband_edge);

    % Stopband Edge
    stopband_edge = f(find(magnitude < stopband_ripple, 1, 'first'));
    fprintf('  Stopband Edge: %.2f Hz\n', stopband_edge);

    % Check if cutoff frequency is halfway
    cutoff = (passband_edge + stopband_edge) / 2;
    fprintf('  Cutoff Frequency (Halfway): %.2f Hz\n', cutoff);
end

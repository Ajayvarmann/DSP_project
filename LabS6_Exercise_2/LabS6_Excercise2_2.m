% Parameters for Filters
fs = 10000; % Sampling frequency in Hz
fc = 2000; % Cutoff frequency in Hz
wc = 2 * pi * fc / fs; % Normalized cutoff frequency

% (a) Design Filters with M = 30
M1 = 30; % Filter order
n1 = 0:M1;

% Ideal impulse response (sinc function)
ideal_h1 = sin(wc * (n1 - M1/2)) ./ (pi * (n1 - M1/2));
ideal_h1(M1/2 + 1) = wc / pi; % Handle division by zero

% Rectangular Window
rect_window = ones(1, M1 + 1);
h_rect1 = ideal_h1 .* rect_window;

% Hamming Window
hamm_window = 0.54 - 0.46 * cos(2 * pi * n1 / M1);
h_hamm1 = ideal_h1 .* hamm_window;

% Frequency Response for M = 30
[H_rect1, f_rect1] = freqz(h_rect1, 1, 1024, fs);
[H_hamm1, f_hamm1] = freqz(h_hamm1, 1, 1024, fs);

% Measure Passband and Stopband Edges
fprintf('For M = 30:\n');
fprintf('Rectangular Window:\n');
[wp_rect1, ws_rect1, tw_rect1] = measureEdges(H_rect1, f_rect1, 0.1, 0.1);

fprintf('Hamming Window:\n');
[wp_hamm1, ws_hamm1, tw_hamm1] = measureEdges(H_hamm1, f_hamm1, 0.01, 0.01);

% (c) Design Hamming Filter with M = 60
M2 = 60; % Double the order
n2 = 0:M2;

% Ideal impulse response
ideal_h2 = sin(wc * (n2 - M2/2)) ./ (pi * (n2 - M2/2));
ideal_h2(M2/2 + 1) = wc / pi;

% Hamming Window
hamm_window2 = 0.54 - 0.46 * cos(2 * pi * n2 / M2);
h_hamm2 = ideal_h2 .* hamm_window2;

% Frequency Response for M = 60
[H_hamm2, f_hamm2] = freqz(h_hamm2, 1, 1024, fs);

fprintf('For M = 60:\n');
fprintf('Hamming Window:\n');
[wp_hamm2, ws_hamm2, tw_hamm2] = measureEdges(H_hamm2, f_hamm2, 0.01, 0.01);

% (d) Compare Transition Widths
fprintf('\nTransition Width Comparison:\n');
fprintf('M = 30, Rectangular: Δω = %.4f Hz\n', tw_rect1);
fprintf('M = 30, Hamming: Δω = %.4f Hz\n', tw_hamm1);
fprintf('M = 60, Hamming: Δω = %.4f Hz\n', tw_hamm2);

% Calculate constant C
C_hamming = tw_hamm2 * (M2 + 1);
fprintf('Hamming Window Constant C = %.4f\n', C_hamming);

% Function to measure edges
function [wp, ws, tw] = measureEdges(H, f, passband_ripple, stopband_ripple)
    magnitude = abs(H);

    % Passband Edge (ωp)
    wp = f(find(magnitude > (1 - passband_ripple), 1, 'last'));

    % Stopband Edge (ωs)
    ws = f(find(magnitude < stopband_ripple, 1, 'first'));

    % Transition Width
    tw = ws - wp;

    fprintf('  Passband Edge (ωp): %.2f Hz\n', wp);
    fprintf('  Stopband Edge (ωs): %.2f Hz\n', ws);
    fprintf('  Transition Width (Δω): %.4f Hz\n', tw);
end

%% simple bandpass filter design: Lab P-13: 4.1 Lab Exercise

%% case for L=40

% Parameters
fs = 8000;                  % sampling frequency
L = 40;                     % length of FIR bandpass filters
fb = [697, 770, 852, 941, 1209, 1336, 1477, 1633]; % DTMF frequencies

% Step 1: Design the Bandpass Filters
hh = dtmfdesign(fb, L, fs); % call the function
frequencies = (0:1023) * fs / 1024; % FFT frequency axis

figure;
hold on;
for k = 1:length(fb)
    H = abs(fft(hh(:, k), 1024)); % frequency response
    plot(frequencies, 20*log10(H)); % plot as a dB scale
end

% DTMF
for f = fb
    xline(f, '--', [' ', num2str(f), ' Hz'], 'LabelHorizontalAlignment', 'center');
end

title('Frequency Responses of Bandpass Filters (L = 40)');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
xlim([0 fs/2]);
grid on;
hold off;

%% case for L=80
L = 80; % length of FIR bandpass filters

hh = dtmfdesign(fb, L, fs); % call the function

figure;
hold on;
for k = 1:length(fb)
    H = abs(fft(hh(:, k), 1024)); % frequency response
    plot(frequencies, 20*log10(H)); % plot as a dB scale
end

% DTMF
for f = fb
    xline(f, '--', [' ', num2str(f), ' Hz'], 'LabelHorizontalAlignment', 'center');
end

title('Frequency Responses of Bandpass Filters (L = 80)');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
xlim([0 fs/2]);
grid on;
hold off;


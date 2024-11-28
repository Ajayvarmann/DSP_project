%% A Scoring Function: Lab P-13: 4.2 Lab Exercise
% Parameters
fs = 8000; % Sampling frequency
fb = [697, 770, 852, 941, 1209, 1336, 1477, 1633]; % DTMF frequencies
L = 40; % Filter length

% Step 1: Design the Bandpass Filters
hh = dtmfdesign(fb, L, fs); % Design the filters using dtmfdesign

% Step 2: Generate a DTMF Signal
% Example: Generate a signal with two tones (770 Hz and 1336 Hz)
t = 0:1/fs:0.2; % 0.2 seconds duration
dtmf_signal = sin(2 * pi * 770 * t) + sin(2 * pi * 1336 * t);

% Step 3: Initialize scores
scores = zeros(1, length(fb)); % To store scores for each frequency

% Step 4: Analyze the signal using each filter
for i = 1:length(fb)
    scores(i) = dtmfscore(dtmf_signal, hh(:, i)); % Score for each frequency
end

% Step 5: Display Results
disp('Scores for each frequency:');
disp(array2table(scores, 'VariableNames', string(fb)));

% Step 6: Plot Frequency Responses
figure;
f = (0:1023) * fs / 1024; % Frequency vector for plotting
for i = 1:length(fb)
    H = abs(fft(hh(:, i), 1024)); % Frequency response of each filter
    plot(f, H); hold on;
end
xlim([0, 2000]);
title('Frequency Responses of the Bandpass Filters');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;
legend(string(fb) + " Hz");

%% Test Script for dtmfdial.m

% Define the sampling frequency
fs = 8000;

% Define a set of keys to test
tk = ['4', '0', '7', '*', '8', '9', '1', '3', '2', '#', 'B', 'A', 'D', 'C'];

% Generate the DTMF signal using dtmfdial
dtmf_signal = dtmfdial(tk, fs);

% Play the generated signal
disp('Playing the generated DTMF signal...');
soundsc(dtmf_signal, fs);
pause(2); % Wait for playback to finish

% Plot the spectrogram of the generated signal
figure;
spectrogram(dtmf_signal, 256, [], [], fs, 'yaxis');
title('Spectrogram of the DTMF Signal');
xlabel('Time (s)');
ylabel('Frequency (Hz)');

% Display a message
disp('Spectrogram displayed. Check for dual-tone frequencies.');

%% Test Script for dtmfrun.m

% Define the sampling frequency
fs = 8000;

% Define the keys to encode and decode
keys = ['4', '0', '7', '*', '8', '9', '1', '3', '2', '#', 'B', 'A', 'D', 'C'];

% Generate the DTMF signal using dtmfdial (ensure dtmfdial.m is implemented)
dtmf_signal = dtmfdial(keys, fs);

% Specify the filter length (based on design, e.g., L = 80)
L = 80;

% Decode the DTMF signal using dtmfrun
decoded_keys = dtmfrun(dtmf_signal, L, fs);

% Display the original and decoded keys
disp('Original keys:');
disp(keys);
disp('Decoded keys:');
disp(decoded_keys);

% Verify if the decoding matches the original keys
if isequal(keys, decoded_keys)
    disp('Decoding successful: Keys match!');
else
    disp('Decoding failed: Keys do not match.');
end

% Plot a single spectrogram for visualization
figure;
spectrogram(dtmf_signal, 256, [], [], fs, 'yaxis');
title('Spectrogram of the DTMF Signal');
xlabel('Time (s)');
ylabel('Frequency (Hz)');

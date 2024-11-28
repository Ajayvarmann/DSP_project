%% Test Script for dtmfrun.m

% Sampling frequency
fs = 8000; % Use this sampling rate in all functions

% Define the sequence of DTMF keys
tk = ['4', '0', '7', '*', '8', '9', '1', '3', '2', '#', 'B', 'A', 'D', 'C'];

% Generate a DTMF signal for the test sequence using dtmfdial
% Assuming dtmfdial is available or you have the signal pre-generated
xx = dtmfdial(tk, fs); % Replace this with your signal if pre-generate
% Define the filter length
L = 80; % Adjust this value as required by your implementation

% Test the dtmfrun function
disp('Testing dtmfrun...');
decoded_keys = dtmfrun(xx, L, fs);

% Display the original keys
disp('Original keys:');
disp(tk);

% Display the decoded keys
disp('Decoded keys:');
disp(decoded_keys);

% Verify if the decoded keys match the original sequence
if isequal(decoded_keys, tk)
    disp('Test Passed: Decoded keys match the input sequence.');
else
    disp('Test Failed: Decoded keys do not match the input sequence.');
    fprintf('Expected: %s\n', tk);
    fprintf('Decoded:  %s\n', decoded_keys);
end

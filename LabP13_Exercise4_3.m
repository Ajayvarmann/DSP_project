% Test script for dtmfrun

% Sampling frequency
fs = 8000; % Use this sampling rate in all functions

% Define the sequence of DTMF keys
tk = ['A', 'B', 'C', 'D', '*', '#', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

% Generate a DTMF signal for the test sequence using dtmfdial
% Assuming dtmfdial is available or you have the signal pre-generated
xx = dtmfdial(tk, fs); % Replace this with your signal if pre-generated

% Define the filter length
L = 80; % Adjust this value as required by your implementation

% Test the dtmfrun function
disp('Testing dtmfrun...');
decoded_keys = dtmfrun(xx, L, fs);

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

%%  DTMF Dial Function: Lab P-4: 4 dtmfdial function
% The detail of Dial function was infrom at Lab P-3: 1 DTMF Dial Function

function dtmfsig = dtmfdial(nums, fs)
%DTMFDIAL  Create a vector of tones which will dial 
%           a DTMF (Touch Tone) telephone system.
%
% usage:  dtmfsig = dtmfdial(nums, fs) 
%      nums = vector of characters ('0'-'9', '*', '#', 'A'-'D')
%        fs = sampling frequency
%   dtmfsig = vector containing the corresponding tones.

% Define the DTMF frequency table
tone_cols = [1209, 1336, 1477, 1633];  % Column frequencies
tone_rows = [697, 770, 852, 941];     % Row frequencies

% Define the extended DTMF key layout
keys = ['1', '2', '3', 'A'; 
        '4', '5', '6', 'B'; 
        '7', '8', '9', 'C'; 
        '*', '0', '#', 'D'];

% Duration of each tone and silence in seconds
tone_duration = 0.2; % 200 ms
silence_duration = 0.05; % 50 ms

% Create the time vectors
t_tone = 0:(1/fs):(tone_duration - 1/fs); % Time vector for tone
t_silence = 0:(1/fs):(silence_duration - 1/fs); % Time vector for silence

% Initialize the output signal
dtmfsig = [];

% Loop through each number in the input vector
for k = 1:length(nums)
    % Find the row and column indices of the key
    [row, col] = find(keys == nums(k), 1); 
    
    if isempty(row) || isempty(col)
        error('Invalid key: %s. Valid keys are ''0''-''9'', ''*'', ''#'', ''A''-''D''.', nums(k));
    end
    
    % Get the corresponding row and column frequencies
    freq_row = tone_rows(row);
    freq_col = tone_cols(col);
    
    % Generate the tone by summing two sinusoids
    tone = sin(2 * pi * freq_row * t_tone) + sin(2 * pi * freq_col * t_tone);
    
    % Append the tone and silence to the signal
    dtmfsig = [dtmfsig, tone, zeros(1, length(t_silence))];
end
end

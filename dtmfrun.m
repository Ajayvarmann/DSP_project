%% DTMF Decode Function: Lab P-4: 3 dtmfrun function

function keys = dtmfrun(xx, L, fs)
%DTMFRUN Decodes the DTMF tone sequence
% keys = dtmfrun(xx, L, fs)
% xx = DTMF waveform
% L = length of FIR filters
% fs = sampling frequency
% keys = array of decoded key names

% Define the DTMF frequencies (row and column)
row_freqs = [697, 770, 852, 941]; % Row frequencies
col_freqs = [1209, 1336, 1477, 1633]; % Column frequencies
center_freqs = [row_freqs, col_freqs]; % Combined center frequencies

% Design bandpass filters for the eight frequencies
hh = dtmfdesign(center_freqs, L, fs);

% Identify tone start and stop points
[nstart, nstop] = dtmfcut(xx, fs);

% Initialize result array
keys = [];

% DTMF key layout
dtmf.keys = ['1','2','3','A';
             '4','5','6','B';
             '7','8','9','C';
             '*','0','#','D'];

% Process each segment
for kk = 1:length(nstart)
    % Extract one segment of the signal
    x_seg = xx(nstart(kk):nstop(kk));
    
    % Score the segment against all filters
    scores = zeros(1, length(center_freqs));
    for jj = 1:length(center_freqs)
        scores(jj) = dtmfscore(x_seg, hh(:, jj));
    end
    
    % Identify the frequencies
    row_idx = find(scores(1:4) == 1);
    col_idx = find(scores(5:8) == 1);
    
    % Validate the scores
    if length(row_idx) == 1 && length(col_idx) == 1
        keys = [keys, dtmf.keys(row_idx, col_idx)];
    else
        keys = [keys, '?']; % Error indicator for invalid decoding
    end
end
end

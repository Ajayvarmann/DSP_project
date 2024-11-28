%% DTMF Decode Function: Lab P-4: 3 dtmfrun function

function keys = dtmfrun(xx, L, fs)
%DTMFRUN Decodes the DTMF waveform into a sequence of keys
% keys = decoded key names
% xx = DTMF waveform
% L = filter length
% fs = sampling frequency

    % Define the center frequencies for the DTMF tones
    center_freqs = [697, 770, 852, 941, 1209, 1336, 1477, 1633];

    % Design the bandpass filters for all the center frequencies
    hh = dtmfdesign(center_freqs, L, fs);

    % Find the start and stop points of each tone burst
    [nstart, nstop] = dtmfcut(xx, fs);

    % Initialize the array to store detected keys
    keys = [];

    % DTMF keyboard mapping
    dtmf_keys = ['1','2','3','A'; 
                 '4','5','6','B'; 
                 '7','8','9','C'; 
                 '*','0','#','D'];

    % Process each segment
    for kk = 1:length(nstart)
        % Extract one segment of the signal
        x_seg = xx(nstart(kk):nstop(kk));
        
        % Initialize score array
        scores = zeros(1, length(center_freqs));
        
        % Score the output of each filter
        for ii = 1:length(center_freqs)
            scores(ii) = dtmfscore(x_seg, hh(:, ii));
            % Close any plots generated inside dtmfscore
            close all;
        end
        
        % Find row and column frequencies
        row_freq = find(scores(1:4)); % Look for active row frequencies
        col_freq = find(scores(5:8)); % Look for active column frequencies

        % Ensure indices are valid
        if length(row_freq) == 1 && length(col_freq) == 1
            % Map to the DTMF key
            keys = [keys, dtmf_keys(row_freq, col_freq)];
        else
            % Invalid or ambiguous detection
            keys = [keys, '?']; % Append '?' for error
            fprintf('Invalid detection in segment %d: scores = %s\n', kk, mat2str(scores));
        end
    end

    % Plot a single spectrogram for debugging purposes
    figure;
    spectrogram(xx, 256, 200, 256, fs, 'yaxis');
    title('Spectrogram of the Input Signal');
end

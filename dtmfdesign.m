%% simple bandpass filter design: Lab P-4: 1 dtmfdesign function

function hh = dtmfdesign(fb, L, fs)

%DTMFDESIGN
% hh = dtmfdesign(fb, L, fs)
% returns a matrix L by length(fb) where each column contains
% the impulse response of a BPF, one for each frequency in fb
% fb = vector of center frequencies
% L = length of FIR bandpass filters
% fs = sampling freq
% Each BPF must be scaled so that its frequency response has a
% maximum magnitude equal to one.

% Initialize the matrix to store the impulse responses

hh = zeros(L, length(fb));

for k = 1:length(fb)
    
    % Calculate the impulse response for each center frequency
    n = 0:L-1;
    h = cos(2 * pi * fb(k) * n / fs);
    
    % Scale the filter so that the maximum value of the frequency response is 1
    H = abs(fft(h, 1024));
    beta = 1 / max(H);
    h = beta * h;
    
    % Store the scaled impulse response in the matrix
    hh(:, k) = h;
end
end
%% 


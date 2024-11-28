%% A Scoring Function: Lab P-4: 2 dtmfscore function

function sc = dtmfscore(xx, hh)
    % DTMFSCORE
    % usage: sc = dtmfscore(xx, hh)
    % returns a score based on the max amplitude of the filtered output
    % xx = input DTMF tone
    % hh = impulse response of ONE bandpass filter

    % Scale the input x[n] to the range [-2, +2]
    xx = xx * (2 / max(abs(xx))); 

    % Filter the input signal with the bandpass filter hh
    y = conv(xx, hh, 'same');  % Use 'same' to keep the output the same length as xx

    % Find the maximum amplitude of the filtered output
    max_amplitude = max(abs(y));

    % Scoring based on the threshold
    if max_amplitude >= 0.59
        sc = 1;  % Score 1 if condition is met
    else
        sc = 0;  % Score 0 otherwise
    end

    % Debugging: Plot the filtered output
    figure;
    plot(1:length(y), y, 'b'); % Entire filtered output
    hold on;
    plot(abs(y), 'r--');        % Highlight absolute value of the signal
    xlim([200, 500]);            % Focus on points 200 to 500
    title('Filtered Output');
    xlabel('Sample Index (n)');
    ylabel('Amplitude');
    legend('Filtered Output y[n]', '|y[n]|');
    grid on;
end

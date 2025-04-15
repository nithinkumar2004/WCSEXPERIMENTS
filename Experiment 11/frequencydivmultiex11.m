clc; clear; close all;

samples = 1000;
users = 2;
t = linspace(0, 1, samples);
mfreq = [30 40]; 
cfreq = [300 600];
freqdev = 10;
fs = 10 * max(cfreq); % Sampling frequency

% Generate & modulate signals
for i = 1:users
    m(i,:) = sin(2*pi*mfreq(i)*t) + 2*sin(pi*8*t);
    y(i,:) = fmmod(m(i,:), cfreq(i), fs, freqdev);
end

% Add noise to combined signal
ch_op = awgn(sum(y), 0, 'measured');

% Demodulate
for i = 1:users
    z(i,:) = fmdemod(y(i,:), cfreq(i), fs, freqdev);
end

% Plot combined modulated signal
figure;
plot(t, y(1,:), 'b', t, y(2,:), 'r');
title('Combined FM Signals'); xlabel('Time'); ylabel('Amplitude');
legend('User 1', 'User 2');

% Plot each user's modulating, modulated, and demodulated signal
for i = 1:users
    figure;
    subplot(3,1,1); plot(t, m(i,:)); title(['User ' num2str(i) ' - Modulating']);
    subplot(3,1,2); plot(t, y(i,:)); title('Modulated');
    subplot(3,1,3); plot(t, z(i,:)); title('Demodulated');
end

% Final channel output
figure;
plot(t, ch_op);
title('Noisy Combined Signal'); xlabel('Time'); ylabel('Amplitude');

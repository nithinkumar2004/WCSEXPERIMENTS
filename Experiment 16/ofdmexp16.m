clc; clear; close all;

N = 64;         % Number of subcarriers
Ncp = 16;       % Cyclic prefix length

% --- Transmitter ---
data = randi([0 1], N, 1);                  % Random bits
modData = qammod(data, 4);                  % QPSK modulation
ifftData = ifft(modData);                   % IFFT to get time domain
tx = [ifftData(end-Ncp+1:end); ifftData];   % Add cyclic prefix

% --- Channel (no noise or fading here) ---
rx = tx(Ncp+1:end);                         % Remove cyclic prefix

% --- Receiver ---
fftData = fft(rx);                          % FFT back to freq domain
demodData = qamdemod(fftData, 4);           % Demodulation
BER = sum(demodData ~= data) / length(data);% Bit Error Rate

disp(['Bit Error Rate: ', num2str(BER)]);

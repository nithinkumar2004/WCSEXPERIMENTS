clc; clear; close all;

% --------------------------
% Step 1: Basic Parameters
% --------------------------
numSymbols = 1000;           % Number of OFDM symbols
numSubcarriers = 64;         % Number of subcarriers (FFT size)
cpLength = 16;               % Cyclic prefix length
snr_dB = 0:2:20;             % SNR range in dB
dataBits = randi([0 1], numSymbols * numSubcarriers / 2, 1); % Random binary data

% --------------------------
% Step 2: Modulate Data using QPSK
% --------------------------
modData = qammod(dataBits, 4, 'InputType', 'bit'); % QPSK modulation

% --------------------------
% Step 3: Reshape data into OFDM symbols
% --------------------------
ofdmSymbols = reshape(modData, [], numSymbols).';  % Each row = one OFDM symbol

% --------------------------
% Step 4: Add Cyclic Prefix
% --------------------------
ofdmWithCP = [ofdmSymbols(:, end - cpLength + 1:end), ofdmSymbols];

% --------------------------
% Step 5: Simulate transmission over channel
% --------------------------
ber = zeros(size(snr_dB));  % Initialize BER array

for i = 1:length(snr_dB)
    % Simulate flat fading channel (random complex gains)
    h = (randn(size(ofdmWithCP)) + 1i * randn(size(ofdmWithCP))) / sqrt(2);

    % Calculate noise
    snrLinear = 10^(snr_dB(i) / 10); % Convert dB to linear
    noisePower = 1 / (2 * snrLinear);
    noise = sqrt(noisePower) * (randn(size(ofdmWithCP)) + 1i * randn(size(ofdmWithCP)));

    % Channel output = signal * channel + noise
    receivedSignal = ofdmWithCP .* h + noise;

    % --------------------------
    % Step 6: Remove Cyclic Prefix
    % --------------------------
    receivedSignal(:, 1:cpLength) = [];

    % --------------------------
    % Step 7: FFT to recover symbols
    % --------------------------
    receivedFFT = fft(receivedSignal, [], 2); % OFDM demodulation

    % --------------------------
    % Step 8: QPSK Demodulation
    % --------------------------
    receivedBits = qamdemod(receivedFFT(:), 4, 'OutputType', 'bit');

    % --------------------------
    % Step 9: Calculate BER
    % --------------------------
    ber(i) = sum(dataBits ~= receivedBits) / length(dataBits);
end

% --------------------------
% Step 10: Plot BER vs SNR
% --------------------------
figure;
semilogy(snr_dB, ber, 'b-o', 'LineWidth', 2);
xlabel('SNR (dB)');
ylabel('Bit Error Rate (BER)');
title('BER Performance of OFDM over Fading Channel');
grid on;

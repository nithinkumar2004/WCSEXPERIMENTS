clc; clear; close all;

% --- Parameters ---
numBits = 1000;
chipLen = 31;
EbNo_dB = 10;

% --- Generate data and chip sequence ---
data = randi([0 1], 1, numBits);
chipSeq = randi([0 1], 1, chipLen);

% --- Modulate (BPSK) and Spread ---
modData = 2*data - 1;                 % BPSK: 0->-1, 1->+1
spreadData = kron(modData, chipSeq); % Spreading using Kronecker product

% --- Add AWGN Noise ---
EbNo = 10^(EbNo_dB/10);
noiseVar = 1 / (2 * EbNo);
noise = sqrt(noiseVar) * randn(1, length(spreadData));
rx = spreadData + noise;

% --- Despread and Demodulate ---
correlation = conv(rx, fliplr(chipSeq)); 
samples = correlation(chipLen:chipLen:end);
demodData = samples > 0;

% --- Plot ---
figure;
subplot(2,1,1); stem(data(1:50)); title('Original Data'); ylabel('Bit'); xlabel('Index');
subplot(2,1,2); stem(demodData(1:50)); title('Demodulated Data'); ylabel('Bit'); xlabel('Index');

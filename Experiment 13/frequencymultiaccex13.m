numSymbols = 1000; 
numSubcarriers = 64; 
cpLength = 16; 
snr_dB = 0:2:20; 
data = randi([0,1], numSymbols*numSubcarriers/2, 1); 
modulatedData = qammod(data, 4); 
ofdmSymbols = reshape(modulatedData, numSubcarriers/2, numSymbols).'; 
ofdmSymbolsCP = [ofdmSymbols(:, end-cpLength+1:end), ofdmSymbols]; 
ber = zeros(size(snr_dB));
for k = 1:length(snr_dB) 
 h = 1/sqrt(2) * (randn(size(ofdmSymbolsCP)) + 1i * randn(size(ofdmSymbolsCP))); 
 snr = 10^(snr_dB(k)/10); 
 noiseVar = 1 / (2 * snr); 
 noise = sqrt(noiseVar) * (randn(size(ofdmSymbolsCP)) + 1i * randn(size(ofdmSymbolsCP))); 
 receivedSignal = ofdmSymbolsCP .* h + noise 
 receivedSignal(:, 1:cpLength) = [];
 receivedData = fft(receivedSignal, [], 2);
 detectedData = qamdemod(receivedData(:), 4);
 ber(k) = sum(data ~= detectedData) / length(data);
end 
figure;
semilogy(snr_dB, ber, 'b-o', 'LineWidth', 2);
title('BER Performance of FHSS communication System');
xlabel('SNR (dB)');
ylabel('BER');
grid on;
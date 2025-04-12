%% Parameters 
numBits = 1000; 
chipSequenceLength = 31; 
snr_dB = 10; 

% Generate random binary data (0 or 1)
data = randi([0,1], 1, numBits); 

% Generate chip sequence (0 or 1) and convert to BPSK (+1/-1)
chipSequence = 2*randi([0,1], 1, chipSequenceLength) - 1; 

% Map data to BPSK (+1/-1)
data_bpsk = 2*data - 1;

% Spread the data
encodedData = repmat(data_bpsk, chipSequenceLength, 1); 
spreadSequence = repmat(chipSequence', 1, numBits); 
spreadData = encodedData .* spreadSequence;

% Add Gaussian noise
snr = 10^(snr_dB/10); 
noiseVar = 1 / snr; 
noise = sqrt(noiseVar) * randn(size(spreadData)); 
receivedData = spreadData + noise; 

% Despread by correlating with chip sequence
correlationResult = sum(receivedData .* spreadSequence); 

% Threshold to decode: if correlation > 0 → bit = 1, else bit = 0
decodedData = correlationResult > 0; 

% Plotting
subplot(2,1,1); 
plot(data, 'b', 'LineWidth', 1); 
title('Transmitted Data'); 
xlabel('Bit Index'); 
ylabel('Data'); 
ylim([-0.1 1.1]); 

subplot(2,1,2); 
plot(decodedData, 'r', 'LineWidth', 1); 
title('Received Data after Decoding'); 
xlabel('Bit Index'); 
ylabel('Data'); 
ylim([-0.1 1.1]);

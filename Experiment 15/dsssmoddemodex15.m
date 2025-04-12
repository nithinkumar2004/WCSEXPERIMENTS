%% Parameters 
numBits = 1000; 
chipSequenceLength = 31; 
Eb_No_dB = 10; 
data = randi([0,1], 1, numBits); 
chipSequence = randi([0,1], 1, chipSequenceLength); 
modulatedData = 2 * data - 1; 
spreadData = kron(modulatedData, chipSequence); 
Eb_No_linear = 10^(Eb_No_dB/10); 
noiseVar = 1 / (2 * Eb_No_linear); 
noise = sqrt(noiseVar) * randn(1, length(spreadData)); 
receivedSignal = spreadData + noise; 
correlatedSignal = conv(receivedSignal, fliplr(chipSequence)); 
output = correlatedSignal(chipSequenceLength:chipSequenceLength:end); 
demodulatedData = sign(output); 
figure; 
subplot(2,1,1); 
plot(data); 
title('Original Data'); 
xlabel('Bit Index'); 
ylabel('Value'); 
subplot(2,1,2); 
plot(demodulatedData); 
title('Demodulated Data'); 
xlabel('Bit Index'); 
 ylabel('Value')
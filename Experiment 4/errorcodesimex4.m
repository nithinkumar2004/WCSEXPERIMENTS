messageLength = 1000; % Length of message in bits 
CRC_polynomial = [1 0 0 1 1 0 1 1 1]; % CRC-32 polynomial (x^32 + x^26 + x^23 + x^22 + x^16 + x^12 + x^11 + x^10 + x^8 + x^7 + x^5 + x^4 + x^2 + x + 1) 
% Generate random message bits 
message = randi([0 1], 1, messageLength); 
% Append zeros for CRC bits 
message = [message zeros(1, length(CRC_polynomial) - 1)]; 
% Calculate CRC checksum 
crc_checksum = zeros(1, length(CRC_polynomial) - 1); 
for i = 1:length(message) - length(CRC_polynomial) + 1 
 if message(i) == 1 
     message(i:i+length(CRC_polynomial)-1) = xor(message(i:i+length(CRC_polynomial)-1), CRC_polynomial); 
 end 
end 
% Simulate channel noise (introducing errors) 
SNR_dB = 10; % Signal-to-Noise Ratio in dB 
noisePower = 10^(-SNR_dB/10); 
receivedMessage = message + sqrt(noisePower)*(randn(1,length(message)) > 0); 
% Calculate CRC checksum for received message 
received_crc_checksum = zeros(1, length(CRC_polynomial) - 1); 
for i = 1:length(receivedMessage) - length(CRC_polynomial) + 1 
 if receivedMessage(i) == 1 
     receivedMessage(i:i+length(CRC_polynomial)-1) = xor(receivedMessage(i:i+length(CRC_polynomial)-1), CRC_polynomial); 
 end 
end 
% Check if CRC checksum matches 
if sum(received_crc_checksum) == 0 
 disp('No errors detected.'); 
else 
 disp('Errors detected and corrected.'); 
end
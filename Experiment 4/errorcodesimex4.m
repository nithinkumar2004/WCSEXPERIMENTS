% Parameters
msgLen = 1000;
poly = [1 0 0 1 1 0 1 1 1]; % CRC polynomial
msg = [randi([0 1], 1, msgLen), zeros(1, length(poly)-1)];

% CRC Encoding
for i = 1:msgLen
    if msg(i) == 1
        msg(i:i+length(poly)-1) = xor(msg(i:i+length(poly)-1), poly);
    end
end
txMsg = msg; % Transmitted message with CRC

% Simulate channel noise
SNR_dB = 10;
noise = sqrt(10^(-SNR_dB/10)) * (randn(1, length(txMsg)) > 0);
rxMsg = mod(txMsg + noise, 2); % Add noise, then modulo 2 to stay binary

% CRC Decoding
for i = 1:msgLen
    if rxMsg(i) == 1
        rxMsg(i:i+length(poly)-1) = xor(rxMsg(i:i+length(poly)-1), poly);
    end
end

% Check for errors
if any(rxMsg(end-length(poly)+2:end))
    disp('Errors detected.');
else
    disp('No errors detected.');
end

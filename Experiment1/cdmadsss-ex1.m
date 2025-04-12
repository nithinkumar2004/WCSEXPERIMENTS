% DSSS Modulation and Demodulation Example 
% Parameters 
data = [1 0 1 0 1 1 0 0]; % Original data signal
spreadingCode = [1 1 0 1]; % Spreading code
spreadingFactor = length(spreadingCode);

% DSSS Modulation 
modulatedSignal = [];
for i = 1:length(data) 
    chips = repmat(data(i), 1, spreadingFactor) .* spreadingCode;
    modulatedSignal = [modulatedSignal chips];
end 

% DSSS Demodulation 
demodulatedSignal = [];
for i = 1:length(modulatedSignal)/spreadingFactor 
    chips = modulatedSignal((i-1)*spreadingFactor+1:i*spreadingFactor);
    chipSum = sum(chips);
    if chipSum >= spreadingFactor/2 
        demodulatedSignal = [demodulatedSignal 1];
    else 
        demodulatedSignal = [demodulatedSignal 0];
    end 
end 

% Display Results 
disp('Original Data:');
disp(data);
disp('Demodulated Data:');
disp(demodulatedSignal);

% Define simulation parameters 
numBits = 1e6; % Number of bits to transmit
EbNo_dB = 10; % Eb/No in dB

% Generate QPSK symbols 
txSymbols = randi([0 3], 1, numBits);
modulatedSymbols = pskmod(txSymbols, 4, pi/4);

% Add noise to the symbols 
EbNo = 10^(EbNo_dB/10);
noiseVar = 1 / (2 * EbNo);
noise = sqrt(noiseVar) * (randn(size(modulatedSymbols)) + 1i * randn(size(modulatedSymbols)));
rxSymbols = modulatedSymbols + noise;

% Apply Rayleigh fading channel using modern System object
rayleighChan = comm.RayleighChannel( ...
    'SampleRate', 1e6, ...
    'PathDelays', 0, ...
    'AveragePathGains', 0, ...
    'MaximumDopplerShift', 30);

fadedSymbols = rayleighChan(rxSymbols.');

% Demodulate received symbols 
demodulatedSymbols = pskdemod(fadedSymbols.', 4, pi/4);

% Calculate Bit Error Rate (BER) 
numErrors = sum(txSymbols ~= demodulatedSymbols);
ber = numErrors / numBits;

% Display results 
fprintf('Bit Error Rate (BER): %.4f\n', ber);

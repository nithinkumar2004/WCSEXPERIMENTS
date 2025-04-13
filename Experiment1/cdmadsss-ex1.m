% DSSS Modulation & Demodulation
data = [1 0 1 0 1 1 0 0]; 
code = [1 1 0 1]; 
sf = length(code);

modSig = reshape(repmat(data, sf, 1) .* repmat(code', 1, length(data)), 1, []);
demodSig = arrayfun(@(i) sum(modSig((i-1)*sf+1:i*sf)) >= sf/2, 1:length(data));

disp('Original Data:'), disp(data)
disp('Demodulated Data:'), disp(demodSig)

% QPSK over Rayleigh Fading Channel
numBits = 1e6; EbNo_dB = 10;
tx = randi([0 3], 1, numBits);
modSym = pskmod(tx, 4, pi/4);

EbNo = 10^(EbNo_dB/10); 
noise = sqrt(1/(2*EbNo)) * (randn(size(modSym)) + 1i*randn(size(modSym)));
rx = modSym + noise;

chan = comm.RayleighChannel('SampleRate',1e6,'PathDelays',0,'AveragePathGains',0,'MaximumDopplerShift',30);
faded = chan(rx.');

demod = pskdemod(faded.', 4, pi/4);
ber = mean(tx ~= demod);

fprintf('Bit Error Rate (BER): %.4f\n', ber);

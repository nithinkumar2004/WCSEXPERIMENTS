clc; clear;

% Generate 20-bit random sequence
bits = round(rand(1,20));
time = linspace(0, 2*pi, 120);
input_sig = repelem(2*bits - 1, 120);       % Map 0→-1, 1→1
carrier = repmat(cos(time), 1, 20);
bpsk_mod = input_sig .* carrier;

% Define 6 carrier frequencies
carriers = {
    repmat(cos(linspace(0, 2*pi, 10)), 1, 120), ...
    repmat(cos(linspace(0, 2*pi, 20)), 1, 60), ...
    repmat(cos(linspace(0, 2*pi, 30)), 1, 40), ...
    repmat(cos(linspace(0, 2*pi, 40)), 1, 30), ...
    repmat(cos(linspace(0, 2*pi, 60)), 1, 20), ...
    repmat(cos(time), 1, 1)
};

% Generate spread signal using random carrier selection
spread = [];
for i = 1:20
    c = randi(6); spread = [spread, carriers{c}(1:120)];
end

% Frequency Hopped Spread Spectrum (FHSS)
fhss_tx = bpsk_mod .* spread;

% Demodulation
bpsk_demod = fhss_tx ./ spread;
original_bits = bpsk_demod ./ carrier;

% Plot results
figure;
subplot(4,1,1); plot(input_sig); title('Original Bit Sequence');
subplot(4,1,2); plot(bpsk_mod); title('BPSK Modulated Signal');
subplot(4,1,3); plot(spread); title('Spread Signal (Random Carriers)');
subplot(4,1,4); plot(fhss_tx); title('Frequency Hopped Spread Spectrum');

figure;
subplot(2,1,1); plot(bpsk_demod); title('Demodulated BPSK from FHSS');
subplot(2,1,2); plot(original_bits); title('Recovered Bit Sequence');

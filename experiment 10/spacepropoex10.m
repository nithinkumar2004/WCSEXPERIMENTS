clc; clear; close all;

f = input('Enter frequency (MHz): ');
lambda = 300 / f;  % Wavelength in meters
Gt = input('Enter Tx antenna gain (dB): ');
Gr = input('Enter Rx antenna gain (dB): ');
PTx = 1e-3;                     % Transmit power in watts
PTx_dBm = 10 * log10(PTx * 1000);  % Convert to dBm
d = 1:1000;                     % Distance in meters

FSPL = 32.44 + 20*log10(d) + 20*log10(f);  % Free Space Path Loss (dB)
Pr = PTx_dBm + Gt + Gr - FSPL;            % Received Power (dBm)

% Plotting
subplot(2,1,1);
plot(d, FSPL, 'r');
xlabel('Distance (m)'); ylabel('Path Loss (dB)');
title('Free Space Path Loss');

subplot(2,1,2);
plot(d, Pr);
xlabel('Distance (m)'); ylabel('Received Power (dBm)');
title('Received Power over Distance');

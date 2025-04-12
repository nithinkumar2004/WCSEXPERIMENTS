clc;
clear all;
close all;

samples = 1000;
nos = 2;

mfreq = [30 40 50 60 70 80 90 100]; 
cfreq = [300 600 900 1200 1500 1800 2100 2400];
freqdev = 10; 

t = linspace(0, 1, samples); % time should be in seconds, not range 0-1000

% Generate modulating signals
for i = 1:nos 
    m(i,:) = sin(2*pi*mfreq(i)*t) + 2*sin(pi*8*t); 
end 

% FM Modulation
for i = 1:nos 
    y(i,:) = fmmod(m(i,:), cfreq(i), 10*cfreq(i), freqdev); 
end 

% Add noise to the summed channel output
ch_op = awgn(sum(y), 0, 'measured'); 

% FM Demodulation
for i = 1:nos 
    z(i,:) = fmdemod(y(i,:), cfreq(i), 10*cfreq(i), freqdev); 
end 

% Plotting Colors
C = {'k','b','r','g','y',[.5 .6 .7],[.8 .2 .6],[.3 .2 .2]};

% Combined channel plot
figure(1); 
hold on;
for i = 1:nos 
    plot(y(i,:), 'color', C{i});
end
xlabel('Time index'); 
ylabel('Amplitude'); 
title('Signal from different users combined in the channel');
hold off;

% Individual user signals
for i = 1:nos 
    figure;
    subplot(3,1,1); 
    plot(m(i,:)); 
    xlabel('Time index'); 
    ylabel('Amplitude'); 
    title(['Modulating Signal from user ', num2str(i)]);

    subplot(3,1,2); 
    plot(y(i,:), 'color', C{i}); 
    xlabel('Time index'); 
    ylabel('Amplitude'); 
    title(['Modulated Signal from user ', num2str(i)]);

    subplot(3,1,3); 
    plot(z(i,:), 'color', C{i}); 
    xlabel('Time index'); 
    ylabel('Amplitude'); 
    title(['Demodulated Signal at base station for user ', num2str(i)]);
end

% Final channel output
figure; 
plot(ch_op); 
xlabel('Time index'); 
ylabel('Amplitude');
title('Signal after passing through the channel');

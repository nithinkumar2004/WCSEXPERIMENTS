clc; 
clear all; 
close all;
f=input('Enter the frequency in MHz: '); 
Lamda=300/f; %calculating wavelength 
Gt=input('enter the transmitting antenna gain in db: '); 
Gr=input('enter the receiving antenna gain in db: '); 
PTx=1e-3; %i.e 0.001 watt
PTxdBm=10*log10(PTx); 
d=1:1:1000;
FSPL = 32.44+20*log10(d)+20*log10(f);
disp('The Path Loss is:'); 
disp(FSPL); 
subplot(2,1,1);
plot(d, FSPL,'r');
xlabel('distance in meters >');
ylabel(' Path Loss in dB')
title('Free Space Propagation Loss'); 
Pr =PTx+Gt+Gr- FSPL;
subplot(2,1,2);
plot(d, Pr);
xlabel('distance in meters >');
ylabel('Power in dB') 
title('Received Power');
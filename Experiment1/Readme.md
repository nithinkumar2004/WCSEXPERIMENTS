# DSSS and QPSK Simulation

This repository contains MATLAB code for simulating Direct Sequence Spread Spectrum (DSSS) modulation/demodulation and Quadrature Phase Shift Keying (QPSK) transmission with noise and Rayleigh fading.

## DSSS Modulation/Demodulation

### Description

The `dsss_example.m` script demonstrates a simple DSSS modulation and demodulation process.

### Usage

1.  Open MATLAB.
2.  Run the `dsss_example.m` script.
3.  The script will display the original data and the demodulated data.

### Parameters

* `data`: Original binary data signal.
* `spreadingCode`: Spreading code used for modulation.
* `spreadingFactor`: Length of the spreading code.

## QPSK Simulation with Noise and Rayleigh Fading

### Description

The `qpsk_simulation.m` script simulates QPSK transmission over a Rayleigh fading channel with additive white Gaussian noise (AWGN). It calculates the Bit Error Rate (BER).

### Usage

1.  Open MATLAB.
2.  Run the `qpsk_simulation.m` script.
3.  The script will display the BER.

### Parameters

* `numBits`: Number of bits to transmit.
* `EbNo_dB`: Signal-to-Noise Ratio (SNR) per bit in dB.

### Dependencies

* MATLAB Communications Toolbox

### Code Breakdown

1.  **Generate QPSK Symbols:** Random QPSK symbols are generated.
2.  **Add Noise:** AWGN is added to the modulated symbols.
3.  **Rayleigh Fading:** A Rayleigh fading channel is applied to the noisy symbols.
4.  **Demodulation:** The faded symbols are demodulated.
5.  **BER Calculation:** The BER is calculated by comparing the transmitted and demodulated symbols.

### Results

The script outputs the calculated Bit Error Rate (BER).

### Notes

* Ensure you have the MATLAB Communications Toolbox installed.
* The Rayleigh fading channel parameters can be adjusted to simulate different channel conditions.
* The SNR (Eb/No) can be varied to observe its impact on the BER.

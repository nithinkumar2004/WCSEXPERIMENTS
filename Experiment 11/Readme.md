# 📶 Frequency Division Multiple Access (FDMA) Simulation in MATLAB

## 🧠 Objective

To simulate **Frequency Division Multiple Access (FDMA)** in MATLAB, enabling multiple users to transmit data simultaneously over separate frequency bands within a shared spectrum.

---

## 🧬 Theory: What is FDMA?

FDMA (Frequency Division Multiple Access) is a technique where:
- The total bandwidth is divided into **multiple frequency channels**.
- Each user is assigned a **unique frequency band**.
- All users transmit **simultaneously**, without interference.

### Real World Example:
Like how different FM radio stations broadcast on **different frequencies**, but all play at the same time.

---

## 🧪 System Components

### FDM Transmitter:

1. Each user’s data **modulates** a separate carrier frequency.
2. All modulated signals are **added linearly** to form a **composite signal**.
3. The composite signal is transmitted over a **single channel**.

> 💡 Note: The signals are added in **time domain**, but they remain separate in **frequency domain**.

---

## 📋 Algorithm Steps

1. Set the **total available bandwidth (BW)**.
2. Decide the **number of users (N)**.
3. **Generate data** for each user (e.g., random bits).
4. **Split** the bandwidth into **N frequency bands**.
5. **Assign** each user a unique band.
6. **Modulate** each user’s data (e.g., using ASK or PSK).
7. **Add** all modulated signals = Composite signal.
8. (Optional) Pass it through a **channel** (with noise/fading).
9. At the receiver, **filter out** each frequency band.
10. **Demodulate** each user’s signal.
11. Optionally, **compare** received vs. transmitted data for error checking.

---

## 🧾 MATLAB Code Description

- `fdma_simulation.m`:
  - Generates random data for users
  - Assigns carrier frequencies
  - Performs modulation using carriers
  - Adds signals to create composite
  - (Optional) adds noise
  - Performs demodulation and recovery
  - Plots time & frequency domain graphs

---

## 📊 Output Plots

- 🔍 Individual modulated signals
- 🧠 Composite signal in time domain
- 🌈 Spectrum showing frequency division
- 📉 Recovered data signals

---

## 📌 Notes

- The **modulation type** can be simple like Amplitude Shift Keying (ASK).
- You can use MATLAB’s `fft()` to see the frequency spectrum.
- If you want to simulate noise, use `awgn()` (Additive White Gaussian Noise).

---

## 🎯 Conclusion

This project demonstrates how **multiple users** can **share bandwidth** efficiently using **FDMA**, which is widely used in systems like satellite communication, TV broadcasting, and early generation cellular systems.

---


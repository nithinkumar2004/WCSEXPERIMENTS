# 📶 Frequency Division Multiplexing (FDM) vs Frequency Division Multiple Access (FDMA) – MATLAB Simulation

## 🎯 Objective

To generate and compare **waveforms** for FDM and FDMA using MATLAB in order to observe how **multiple signals** or **users** are managed over the **same bandwidth** using frequency-based techniques.

---

## 📖 Theory

### 🔹 Frequency Division Multiplexing (FDM)

- A **multiplexing technique** used at the **physical layer**
- Allows multiple signals to share the same transmission channel
- Each signal is modulated onto a **unique frequency band**
- Common in TV broadcasting, radio, DSL

### 🔹 Frequency Division Multiple Access (FDMA)

- An **access technique** used at the **data link layer**
- Based on FDM but focuses on **user-level sharing** of spectrum
- Each user is assigned a **separate frequency band**
- Used in GSM cellular networks and satellite systems

---

## 🛠 Simulation Overview

### 💡 What the MATLAB Code Does:
1. Generates **multiple data signals** (sinusoidal or random)
2. Assigns each signal a **unique frequency band**
3. Modulates and combines them:
   - Using **FDM** (combine using MUX-style modulation)
   - Using **FDMA** (simulate user-specific frequency band allocation)
4. Plots:
   - Time-domain waveforms
   - Frequency spectra
   - Spectrograms (optional)

---

## 🧪 Steps Involved

1. **Define system parameters**
   - Number of users/signals
   - Carrier frequencies
   - Sampling frequency
2. **Generate input signals** (sine waves, random binary, etc.)
3. **Modulate each signal** onto different carrier frequencies
4. **Add signals** to form composite waveform
5. **Plot time-domain and frequency-domain** representations

---

## 🖥 File Structure

- `fdm_vs_fdma.m` – Main MATLAB script
- `generate_signal.m` – Helper function to simulate user/signal data
- `plot_spectrum.m` – Plots frequency spectrum for visualization

---

## 📊 Output

- 📈 Time-domain waveforms of each signal
- 📊 Composite signal showing combined spectrum
- 🔍 Spectrum plot to visualize channel usage

---

## 🧠 Observations

- **FDM**: Efficient for combining continuous signals, but idle bandwidth can't be reused
- **FDMA**: Allows fair access for users but suffers from **wastage** during silence or idle periods
- Both techniques can be combined with **TDMA/CDMA** to improve overall channel utilization

---

## 🌱 Future Enhancements

- Add support for **modulation schemes** (QPSK, QAM)
- Combine with **TDMA** for better resource management
- Visualize spectrogram to show dynamic usage over time
- Simulate channel effects (noise, fading)

---

## 📚 References

- "Digital Communications" by Simon Haykin
- "Wireless Communications" by Theodore Rappaport
- MATLAB Signal Processing Toolbox documentation

---


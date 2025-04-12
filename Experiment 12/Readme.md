# 📡 BER Simulation of OFDM System Over Multipath Fading Channel

## 🎯 AIM

To simulate and evaluate the **Bit Error Rate (BER)** performance of an **OFDM** system under **multipath fading channels** including AWGN, Rayleigh, and Rician fading, using MATLAB.

---

## 📖 Theory

**Orthogonal Frequency Division Multiplexing (OFDM)** is a digital multi-carrier modulation scheme used in modern communication systems like 4G LTE and Wi-Fi.

### ⚡ Key Features of OFDM:
- High data rate support
- Efficient use of bandwidth
- Strong immunity to multipath fading and ISI
- Used in 4G, 5G, DSL, DVB, Wi-Fi, etc.

### 🌊 Channel Models:
- **AWGN**: Simple white noise added to signal
- **Rayleigh Fading**: No line of sight; used for urban/dense scenarios
- **Rician Fading**: Line of sight + multipath; used for open spaces

---

## 🧪 Simulation Steps

1. **Generate Random Bits**
2. **Modulate the Bits** (e.g., QPSK)
3. **Group & Map to Subcarriers** (OFDM symbol)
4. Apply **IFFT** to create time-domain signal
5. Add **Cyclic Prefix (CP)** to combat ISI
6. Pass the signal through:
   - AWGN Channel
   - Rayleigh Channel
   - Rician Channel
7. **Remove CP**, apply **FFT**
8. **Demodulate** the received data
9. **Calculate BER** by comparing transmitted vs. received bits
10. Plot **BER vs. SNR** curve

---

## ⚙️ MATLAB File Structure

- `ofdm_ber_simulation.m` – Main simulation script
- Includes toggles to test different channel types
- Outputs clean BER vs. SNR plot

---

## 📊 Expected Output

- Plots of **BER vs. SNR (dB)** for:
  - AWGN
  - Rayleigh fading
  - Rician fading

---

## 🧠 Observations

- OFDM under **AWGN** performs best (least BER)
- **Rayleigh** causes higher BER due to severe fading
- **Rician** performs in-between (depends on LOS strength)
- **BER decreases** with increasing SNR for all channels

---

## 🛠 Future Extensions

- Try with **16-QAM**, **64-QAM**
- Simulate **channel estimation & equalization**
- Add **coding techniques** like convolutional codes
- Extend to **MIMO-OFDM**

---

## 🧾 Reference

- Digital Communication by Proakis
- LTE Physical Layer by Sassan Ahmadi
- MATLAB help docs (`awgn()`, `rayleighchan()`, `ricianchan()`)

---


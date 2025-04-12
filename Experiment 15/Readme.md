# 🔐 DSSS – Direct Sequence Spread Spectrum | MATLAB Simulation

## 🎯 Objective

To simulate **DSSS modulation and demodulation** in MATLAB. The simulation demonstrates how data is spread using a pseudo-random code, transmitted, and recovered with reduced interference effects.

---

## 📖 Theory

**Direct Sequence Spread Spectrum (DSSS)** is a digital modulation technique that:
- Spreads each data bit using a **high-rate pseudo-random code (chip sequence)**.
- Transmits the spread signal using **BPSK modulation**.
- Recovers the signal at the receiver by **correlating** it with the same spreading code.

This process makes the signal more resilient to:
- Narrowband interference
- Jamming attempts
- Multipath fading

DSSS is commonly used in:
- Wi-Fi (802.11b)
- GPS
- Military communications
- CDMA systems

---

## ⚙️ Simulation Steps

1. **Input Parameters**
   - Data bit sequence (random or fixed)
   - Spreading code (e.g., 7-bit PN sequence)
   - Chip rate (number of chips per bit)

2. **Modulation (Spreading)**
   - Convert binary data to bipolar format (0 → -1, 1 → +1)
   - Multiply each data bit with the spreading code
   - Transmit the spread signal (optionally with BPSK)

3. **Demodulation (Despreading)**
   - Multiply the received signal with the same spreading code
   - Sum the chips for each bit
   - Decision logic: sign of the sum gives the original bit

---

## 📈 Output

- Plots of:
  - Original binary signal
  - Spreading code
  - DSSS modulated signal
  - Received signal (with or without noise)
  - Demodulated signal (recovered bits)

- Bit Error Rate (BER) if channel noise is added

---

## 📌 Key MATLAB Functions

- `randint` or `randi` – generate binary sequences
- `repmat` – repeat spreading code for each data bit
- `plot`, `stairs` – visualize digital waveforms
- Logical operations for correlation and bit recovery

---

## 📚 Future Enhancements

- Add AWGN to simulate real-world noise
- Simulate multi-user DSSS using orthogonal codes
- Compare performance with narrowband systems
- Integrate with BPSK/QPSK baseband modulators

---

## 🧠 Learning Outcomes

- Understand how DSSS improves robustness in communication
- Visualize the spreading and despreading processes
- Learn to simulate digital modulation techniques in MATLAB

---


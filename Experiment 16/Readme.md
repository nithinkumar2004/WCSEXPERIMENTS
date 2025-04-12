# 📡 OFDM BER Simulation over Multipath Fading Channels using GNU Radio & SDR

## 🎯 AIM

To simulate **Orthogonal Frequency Division Multiplexing (OFDM)** in a realistic communication channel using **GNU Radio** and **Software Defined Radio (SDR)**, and to evaluate system performance via **Bit Error Rate (BER)** under various channel conditions like **AWGN**, **Rayleigh**, and **Rician fading**.

---

## 📘 THEORY

### 🧩 What is OFDM?

**OFDM** is a multicarrier modulation technique where a high-speed data stream is split into multiple lower-speed streams and transmitted simultaneously over different subcarriers. The subcarriers are **orthogonal**, meaning their cross-interference is minimal even though their frequency bands overlap.

> OFDM = Efficient + Robust + Scalable 😎

### 🌪️ Why Multipath Fading Matters?

In the real world, transmitted signals bounce around — buildings, trees, even people. This causes:
- **Rayleigh fading**: When there’s **no line-of-sight**.
- **Rician fading**: When there **is a dominant direct path**.
- **AWGN**: The classic baseline channel with thermal noise only.

All of these affect the reliability of communication systems. That’s where OFDM shines.

---

## 🛠️ SYSTEM DESIGN

### 🧱 Block Diagram

```text
Tx Data → OFDM Modulator → Channel (AWGN / Rayleigh / Rician) → OFDM Demodulator → Rx Data
                                                ↓
                                           BER Estimation


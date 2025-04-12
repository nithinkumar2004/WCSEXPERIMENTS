# 📡 CDMA – Code Division Multiple Access | MATLAB Simulation

## 🎯 Objective

To simulate a basic **CDMA system** using MATLAB, where multiple users share the same frequency band using unique spreading codes. The simulation showcases how CDMA allows parallel data transmission and recovers user-specific signals from a combined transmission.

---

## 📖 Theory

**Code Division Multiple Access (CDMA)** is a multiple access technique where:
- Each user is assigned a **unique spreading code**.
- Signals from all users are **spread** using their code and **transmitted simultaneously** over the same channel.
- At the receiver, the original signal is **retrieved** by **correlating** the combined signal with the user's spreading code.

CDMA's key strength lies in **code orthogonality**, enabling multiple users to communicate without stepping on each other's signals.

---

## 🛠 Simulation Workflow

1. **Define Parameters**
   - Number of users
   - Spreading code length
   - Bit sequences for each user

2. **Generate Data**
   - Create binary data sequences for all users

3. **Spreading**
   - Assign orthogonal spreading codes (e.g., Walsh codes)
   - Multiply each user’s data with their code

4. **Channel Mixing**
   - Sum all spread signals to form a composite CDMA transmission

5. **Receiver Side**
   - Despread each user’s signal using the corresponding code
   - Recover original data via correlation and demodulation

6. **Compare**
   - Verify bit recovery by comparing transmitted vs received data
   - Evaluate performance in presence of noise (optional)

---

## 🔍 Key MATLAB Components

- `cdma_simulation.m` – Main script for CDMA simulation
- `generate_spreading_codes.m` – Function to generate orthogonal codes
- `correlate_and_recover.m` – Performs despreading and bit recovery

---

## 📈 Outputs

- Composite CDMA signal waveform
- Time-domain plots of individual and composite signals
- BER (Bit Error Rate) performance (if noisy channel is simulated)
- User-wise recovered data

---

## 🧠 Observations

- CDMA allows simultaneous user access without needing time or frequency splits
- System performance depends heavily on:
  - Quality of spreading codes
  - Signal synchronization
  - Handling of near-far issues
- Adding noise (AWGN) can test CDMA’s robustness

---

## 🌱 Extensions

- Add support for QPSK/BPSK modulation
- Introduce channel effects like AWGN or Rayleigh fading
- Implement Rake Receiver structure
- Add simulation of near-far effect and use power control

---

## 📚 References

- Proakis, "Digital Communications"
- Haykin, "Communication Systems"
- MATLAB Signal Processing Toolbox

---


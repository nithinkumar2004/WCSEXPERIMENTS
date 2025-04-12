# 📡 Free Space Propagation & Log Normal Shadowing Model (MATLAB)

## 🎯 Objective

To simulate and analyze the **Free Space Path Loss** and **Log Normal Shadowing** models in MATLAB and compute the **received power** over a range of distances.

---

## 📖 Theory

### 1. Free Space Path Loss (FSPL)

Free Space Path Loss models how a wireless signal weakens over an unobstructed, straight-line path in space. It’s calculated using the formula:


##Where:
#- `d`: Distance (meters)
#- `f`: Frequency (MHz)

### Received Power: Pr = Pt + Gt + Gr - FSPL


Where:
- `Pt`: Transmitter Power (dBm)
- `Gt`: Gain of Transmitting Antenna (dBi)
- `Gr`: Gain of Receiving Antenna (dBi)

---

### 2. Log Normal Shadowing Model

Real-world conditions cause **shadowing** due to obstacles like trees, hills, and buildings. To model this, we use:


Where:
- `PL(d0)`: Path loss at reference distance (d0)
- `n`: Path loss exponent (varies by environment)
- `Xσ`: Gaussian noise with standard deviation `σ` (in dB)
- `d`: Distance at which PL is to be found

> Typically, `d0 = 1m` to `10m` for microcells.

---

## 🧪 MATLAB Code Overview

1. **Inputs:**
   - Frequency (MHz)
   - Distance range (meters)
   - Transmitted Power
   - Antenna gains
   - Path loss exponent `n`
   - Standard deviation `σ`

2. **Outputs:**
   - FSPL vs Distance plot
   - Received Power vs Distance plot (for both models)

---

## 📊 Output Plots

- 📉 FSPL over Distance
- 📉 Received Power over Distance (Free Space + Shadowing)

---

## 📂 Files

- `fspl_shadowing_model.m` – MATLAB script implementing both models
- `README.md` – This file

---

## 💡 Notes

- Use `randn()` in MATLAB for Gaussian noise `Xσ`.
- Choose realistic values for frequency (e.g., 2400 MHz for Wi-Fi), Pt, and antenna gains.

---

## 🔚 Conclusion

This simulation helps understand how wireless signals behave in ideal (free space) and real-world (shadowing) environments, crucial for wireless system design.

---


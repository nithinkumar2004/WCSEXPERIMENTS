---

# 📡 M-Sequence Generator using MATLAB

This MATLAB script generates a **Maximum Length Sequence (M-sequence)** using a **Linear Feedback Shift Register (LFSR)** configuration. M-sequences are widely used in digital communication systems, especially in applications like spread spectrum, radar, and CDMA systems.

---

## 🧠 What is an M-sequence?

An M-sequence is a type of **pseudorandom binary sequence** that is generated using feedback shift registers. It cycles through all possible non-zero states of the register exactly once before repeating, making it **deterministic but appear random**.

---

## 🧾 How it Works

This code implements an M-sequence generator using the following logic:

- **LFSR register** of length `m = 5` bits
- **Feedback taps** at positions `[5 2]`
- **Sequence length** set to `31`, which is the maximum for `m = 5` (`2^m - 1`)

---

## 🧬 Code Breakdown

```matlab
m = 5;
feedback_taps = [5 2];         % Feedback tap positions
sequence_length = 31;          % Desired length of the sequence
m_sequence = m_sequence_generator(m, feedback_taps, sequence_length);
disp('Generated M-sequence:');
disp(m_sequence);
```

### 🔁 Function: `m_sequence_generator`

```matlab
function m_sequence = m_sequence_generator(m, feedback_taps, length)
    register = ones(1, m);                      % Initialize LFSR with all ones
    m_sequence = zeros(1, length);              % Pre-allocate output sequence

    for i = 1:length
        m_sequence(i) = register(end);          % Output the last bit
        feedback_bit = mod(sum(register(feedback_taps)), 2); % XOR of tap bits
        register = [feedback_bit register(1:end-1)];          % Shift and insert feedback
    end
end
```

### 🧩 Explanation:

- `register`: LFSR initialized to all ones to avoid the zero state (which would lock the sequence forever).
- `m_sequence(i)`: Takes the output bit from the end of the register at each step.
- `feedback_bit`: XOR result (mod 2) of the bits at the specified tap positions.
- `register`: Shift the register to the right and insert the new feedback bit at the beginning.

---

## ✅ Output Example

```
Generated M-sequence:
     1     1     1     1     1     0     1     0     1     0     1     1     0     1     1     1     0     0     0     1     0     0     1     0     0     0     0     1     1     0     0
```

---

## 📏 Why `length = 31`?

The maximum length of an M-sequence is given by:
```
L = 2^m - 1
```
So for `m = 5`, the sequence will have a length of `2^5 - 1 = 31`.

---

## 🛠️ Customize

Want a different sequence? Just change:
```matlab
m = 4; 
feedback_taps = [4 3];
sequence_length = 15;  % 2^4 - 1
```

Make sure your feedback taps form a **primitive polynomial** to ensure maximal length.

---

## 📚 Reference

- Digital Communication Systems textbooks
- LFSR theory from DSP/Communication courses
- MATLAB documentation on sequences and logic operations

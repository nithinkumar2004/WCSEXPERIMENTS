# Cyclic Redundancy Check (CRC) Simulation in MATLAB

## Overview

This project simulates the Cyclic Redundancy Check (CRC) error detection and correction code using MATLAB for a binary symmetric channel (BSC) with varying error probabilities. CRC is a powerful technique used in digital networks and storage devices to detect accidental changes to raw data.

## Theory Explained Simply

Imagine you're sending a message (data) to a friend. To make sure they receive the message correctly, you add a special "checksum" to it. This checksum is calculated using CRC.

**How CRC Works:**

1.  **Adding Extra Bits:**
    * We take the message and add some extra '0's to the end. The number of '0's we add depends on a special number called the "generator polynomial."
2.  **Binary Division (Modulo-2):**
    * We perform a special kind of binary division (called modulo-2 division) on the message with the added '0's. This division uses XOR operations.
    * The remainder of this division is our checksum (CRC).
3.  **Sending the Message:**
    * We append the checksum to the original message and send it to the receiver.
4.  **Checking for Errors:**
    * The receiver performs the same modulo-2 division on the received message (including the checksum).
    * If the remainder is '0', the message is likely error-free.
    * If the remainder is not '0', the message has errors.

**Example:**

* **Message:** 100100
* **Generator polynomial:** x^3 + 1, which in binary is 1001. So k=4. k-1 = 3 so we add 3 zeros.
* **Message with zeros:** 100100000.
* **Perform modulo 2 division:**
    * The division is performed using XOR operations.
    * The result of the division is a remainder.
* **Append remainder:** the remainder is appended to the original message.
* **Reciever side:** the reciever performs the same modulo 2 division. if the result is zero, no errors occured.

**Binary Symmetric Channel (BSC):**

* This simulates a noisy channel where bits can be flipped (0 to 1 or 1 to 0) with a certain probability.
* Varying this error probability allows us to see how well CRC performs under different noise levels.

## MATLAB Simulation

The MATLAB code will:

1.  **Generate a random binary message.**
2.  **Calculate the CRC checksum using a chosen generator polynomial.**
3.  **Simulate transmission through a BSC, introducing errors with a specified probability.**
4.  **Perform CRC checking at the receiver.**
5.  **Calculate and display the error detection rate for various error probabilities.**
6.  Optionally, the simulation can try to implement error correction.

## Key Benefits of CRC

* **Simple and Efficient:** CRC is relatively easy to implement in hardware and software.
* **High Error Detection Rate:** It can detect a wide range of common errors.
* **Widely Used:** CRC is used in many applications, including Ethernet, hard drives, and data compression.

## Viva Questions and Solutions

* **What is CRC and why is it used?**
    * CRC (Cyclic Redundancy Check) is an error detection technique used to ensure data integrity during transmission or storage. It calculates a checksum based on the data, which is then appended to the data. The receiver uses the same calculation to verify the data's integrity.
* **Explain the steps involved in CRC encoding and decoding.**
    * **Encoding:**
        1.  Append '0's to the data.
        2.  Perform modulo-2 division using the generator polynomial.
        3.  Append the remainder (CRC checksum) to the original data.
    * **Decoding:**
        1.  Perform modulo-2 division on the received data (including the checksum).
        2.  If the remainder is '0', no error is detected; otherwise, an error is detected.
* **What is a generator polynomial and how does it affect CRC performance?**
    * A generator polynomial is a binary polynomial used in the modulo-2 division. Its degree determines the number of bits in the CRC checksum. A well-chosen generator polynomial can detect a wide range of errors.
* **What is modulo-2 division?**
    * Modulo-2 division is a binary division operation that uses XOR instead of subtraction. It's crucial for CRC calculation.
* **How does a Binary Symmetric Channel simulate noise?**
    * A BSC simulates noise by randomly flipping bits in the transmitted data with a certain probability (error probability).
* **What is the difference between error detection and error correction?**
    * **Error detection:** Identifies if an error has occurred.
    * **Error correction:** Identifies and corrects the error. CRC is primarly an error detection code.
* **What are the limitations of CRC?**
    * CRC can detect many errors, but it's not foolproof. It cannot correct errors on its own (without additional coding). It may also fail to detect certain patterns of errors.
* **How does the error probability affect the performance of CRC?**
    * As the error probability increases, the likelihood of undetected errors also increases. CRC's effectiveness decreases in very noisy channels.
* **Explain the matlab code and the functions used.**
    * The matlab code will use functions to: generate random binary data, perform modulo-2 division, simulate a BSC channel, and test the CRC. it will utilize XOR operations, and array manipulation.
* **Explain the difference between different CRC standards, like CRC32.**
    * Different CRC standards use different generator polynomials and checksum lengths. CRC32, for example, uses a 32-bit checksum and a specific 32-degree generator polynomial, providing a higher level of error detection compared to shorter CRC codes.

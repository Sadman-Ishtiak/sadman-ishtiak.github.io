---
title: 'Quantization Error: Derivation and Numerical Example'
date: 2026-01-10 00:00:00 +0600
categories:
- Academic
- Digital Signal Processing
tags:
- dsp
- quantization
- adc
- academic
- cse409
- cse410
- jkkniu
description: 'The difference between input and quantized output is the **quantization
  error** $e[n]$:'
math: true
---
## Quantization Error: The Inevitable Distortion

The difference between input and quantized output is the **quantization error** $e[n]$:

$$e[n] = x_q[n] - x[n]$$

For a uniform mid-tread quantizer with step size $\Delta$, the error is bounded:

$$-\frac{\Delta}{2} \le e[n] \le \frac{\Delta}{2}$$

### Derivation of Quantization Error Formula

Assume the error is uniformly distributed over $[-\Delta/2, \Delta/2]$:

- **Mean error**: $\mu_e = 0$
- **Variance (power)**: $\sigma_e^2 = \frac{\Delta^2}{12}$
- **RMS error**: $\sigma_e = \frac{\Delta}{\sqrt{12}}$

This is the **quantization noise power**.

---

## Worked Numerical Example

**Problem:** A signal ranges from -5V to +5V. An 8-bit quantizer is used. Find:
1. Step size $\Delta$
2. Quantized output for input $x = 2.3$V

**Solution:**
- Full-scale range: $10$ V
- Levels: $L = 2^8 = 256$
- Step size: $\Delta = \frac{10}{256} = 0.0390625$ V $\approx 39.1$ mV
- Quantized output: $x_q = \text{round}\left(\frac{2.3}{\Delta}\right) \cdot \Delta = \text{round}(58.88) \cdot 0.0390625 = 59 \cdot 0.0390625 = 2.3047$ V

---
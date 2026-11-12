---
title: Bits, Levels, and Dynamic Range Relationships
date: 2026-01-11 00:00:00 +0600
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
description: '| Parameter | Formula | Example (10V range) |'
math: true
---
## Bits, Levels, and Step Size: The Fundamental Relationship

| Parameter | Formula | Example (10V range) |
|---|---|---|
| **Bits** $B$ | — | 8 bits |
| **Levels** $L$ | $L = 2^B$ | 256 |
| **Step size** $\Delta$ | $\Delta = \frac{V_{\text{FSR}}}{L} = \frac{V_{\text{FSR}}}{2^B}$ | 39.1 mV |
| **Dynamic range (dB)** | $6.02B + 1.76$ dB | 49.9 dB |

**Each additional bit:**
- Doubles the number of levels
- Halves the step size
- Adds ~6 dB of dynamic range

---
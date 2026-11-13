---
title: "Computing DFT by Hand and DFT Properties"
date: 2026-01-28 00:00:00 +0600
categories: ['Academic', 'CSE-409 Digital Signal Processing']
tags: ['dsp', 'dft', 'fft', 'frequency-analysis', 'academic', 'cse409', 'cse410', 'jkkniu']
description: '## DFT Properties (Circular, Not Linear!)'
math: true
---
## DFT Properties (Circular, Not Linear!)

| Property | Formula |
|---|---|
| **Linearity** | $a x_1[n] + b x_2[n] \leftrightarrow a X_1[k] + b X_2[k]$ |
| **Circular Shift** | $x[(n-m)_N] \leftrightarrow W_N^{km} X[k]$ |
| **Circular Convolution** | $x_1[n] \circledast x_2[n] \leftrightarrow X_1[k] X_2[k]$ |
| **Multiplication** | $x_1[n] x_2[n] \leftrightarrow \frac{1}{N} X_1[k] \circledast X_2[k]$ |
| **Parseval** | $\sum \vert x[n]\vert ^2 = \frac{1}{N} \sum \vert X[k]\vert ^2$ |

> **Critical:** DFT convolution is **circular**, not linear! For linear convolution, zero-pad to length $\ge N_1 + N_2 - 1$.

---
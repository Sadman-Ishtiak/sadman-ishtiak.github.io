---
title: "Z-Transform Properties and Convolution"
date: 2026-01-24 00:00:00 +0600
categories: ['Academic', 'CSE-409 Digital Signal Processing']
tags: ['dsp', 'z-transform', 'poles-zeros', 'academic', 'cse409', 'cse410', 'jkkniu']
description: '## Z-Transform Properties'
math: true
---
## Z-Transform Properties

| Property | Time Domain | Z-Domain |
|---|---|---|
| **Linearity** | $a x_1[n] + b x_2[n]$ | $a X_1(z) + b X_2(z)$ |
| **Time Shift** | $x[n-k]$ | $z^{-k} X(z)$ |
| **Scaling in z** | $a^n x[n]$ | $X(z/a)$ |
| **Time Reversal** | $x[-n]$ | $X(1/z)$ |
| **Differentiation** | $n x[n]$ | $-z \frac{dX(z)}{dz}$ |
| **Convolution** | $x_1[n] * x_2[n]$ | $X_1(z) X_2(z)$ |
| **Initial Value** | $x[0]$ | $\lim_{z\to\infty} X(z)$ (causal) |
| **Final Value** | $\lim_{n\to\infty} x[n]$ | $\lim_{z\to 1} (1-z^{-1})X(z)$ |

---

## The Convolution Property: Why Z-Transform Matters

$$y[n] = x[n] * h[n] \quad \overset{\mathcal{Z}}{\longleftrightarrow} \quad Y(z) = X(z) H(z)$$

**Convolution becomes multiplication.** This is the entire foundation of digital filter analysis.

---
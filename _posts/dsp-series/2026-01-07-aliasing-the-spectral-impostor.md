---
title: "Aliasing: The Spectral Impostor"
date: 2026-01-07 00:00:00 +0600
categories: ['Academic', 'CSE-409 Digital Signal Processing']
tags: ['dsp', 'sampling', 'aliasing', 'nyquist', 'academic', 'cse409', 'cse410', 'jkkniu']
description: '## From Sampling Frequency to Discrete Sequence'
math: true
---
## From Sampling Frequency to Discrete Sequence

Given $x(t)$ and sampling frequency $F_s$, the discrete sequence is:

$$x[n] = x_a(nT) = x_a\left(\frac{n}{F_s}\right)$$

### Example:
$$x(t) = \cos(2\pi \cdot 100 t), \quad F_s = 500 \text{ Hz}$$
$$x[n] = \cos\left(2\pi \cdot 100 \cdot \frac{n}{500}\right) = \cos(0.4\pi n)$$

The **digital frequency** $\omega = 2\pi F / F_s$ (radians/sample) replaces analog frequency $F$.

---

## Aliasing: The Spectral Impostor

### What Is Aliasing?

When $F_s < 2F_{\text{max}}$, high-frequency components **masquerade as lower frequencies** in the sampled signal. The spectrum "folds over" at multiples of $F_s/2$.

### Frequency-Domain View

In the frequency domain, sampling replicates the original spectrum at intervals of $F_s$:

$$X_s(F) = F_s \sum_{k=-\infty}^{\infty} X(F - k F_s)$$

If these replicas overlap, aliasing occurs. The spectral content above $F_s/2$ folds back into the baseband $[0, F_s/2]$.

### Aliasing Formula

A frequency component at $F$ appears at an **alias frequency** $F_{\text{alias}}$ in the sampled signal:

$$F_{\text{alias}} = |F - k F_s| \quad \text{for integer } k \text{ such that } F_{\text{alias}} \in [0, F_s/2]$$

### Example: 60 Hz Power-Line Hum
- Signal contains 60 Hz interference
- Sampled at $F_s = 100$ Hz (below Nyquist rate of 120 Hz)
- Alias: $\vert 60 - 100\vert = 40$ Hz
- The 60 Hz hum appears as a 40 Hz artifact in the digital signal!

---
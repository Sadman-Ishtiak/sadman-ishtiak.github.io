---
title: "Pole-Zero Analysis and Stability"
date: 2026-01-25 00:00:00 +0600
categories: ['Academic', 'Digital Signal Processing']
tags: ['dsp', 'z-transform', 'poles-zeros', 'academic', 'cse409', 'cse410', 'jkkniu']
description: '## System Function $H(z)$ and Pole-Zero Analysis'
math: true
---
## System Function $H(z)$ and Pole-Zero Analysis

For an LTI system with impulse response $h[n]$:

$$H(z) = \sum_{n=-\infty}^{\infty} h[n] z^{-n} = \frac{Y(z)}{X(z)}$$

For systems described by linear constant-coefficient difference equations:

$$\sum_{k=0}^{N} a_k y[n-k] = \sum_{k=0}^{M} b_k x[n-k]$$

Taking Z-transform:

$$H(z) = \frac{\sum_{k=0}^{M} b_k z^{-k}}{\sum_{k=0}^{N} a_k z^{-k}} = \frac{B(z)}{A(z)}$$

### Poles and Zeros

- **Zeros**: Roots of numerator $B(z)$ → $H(z) = 0$
- **Poles**: Roots of denominator $A(z)$ → $H(z) \to \infty$

### Stability from Pole Locations

| Pole Location | System |
|---|---|
| **All poles inside unit circle** ($|z| < 1$) | **Stable** (causal) |
| **Any pole outside unit circle** ($|z| > 1$) | **Unstable** |
| **Poles on unit circle** ($|z| = 1$) | **Marginally stable** (oscillatory) |

### Zero Locations → Frequency Response Shaping

- Zeros **on** unit circle → **notches** (complete rejection at that frequency)
- Zeros **near** unit circle → **dips** in response
- Poles **near** unit circle → **peaks** (resonance)

---
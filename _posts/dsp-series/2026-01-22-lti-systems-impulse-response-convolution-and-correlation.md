---
title: 'LTI Systems: Impulse Response, Convolution, and Correlation'
date: 2026-01-22 00:00:00 +0600
categories:
- Academic
- Digital Signal Processing
tags:
- dsp
- lti-systems
- convolution
- academic
- cse409
- cse410
- jkkniu
description: When a system is **both Linear and Time-Invariant**, it unlocks a complete
  mathematical
toolkit: ''
math: true
---
## Why LTI Systems Are Special

When a system is **both Linear and Time-Invariant**, it unlocks a complete mathematical toolkit:

| Tool | What It Gives You |
|---|---|
| **Impulse Response $h[n]$** | Complete characterization: $y[n] = x[n] * h[n]$ |
| **Convolution** | Output for any input via $y[n] = \sum x[k]h[n-k]$ |
| **Frequency Response $H(e^{j\omega})$** | Eigenfunction: $e^{j\omega n} \to H(e^{j\omega})e^{j\omega n}$ |
| **Z-Transform $H(z)$** | Algebraic analysis, stability, filter design |
| **Difference Equation** | $y[n] + \sum a_k y[n-k] = \sum b_k x[n-k]$ |
| **Pole-Zero Plot** | Visual stability, frequency response shaping |

---

## Standard LTI Operators and Their Impulse Responses

| System | Difference Equation | $h[n]$ | Notes |
|---|---|---|---|
| **Identity** | $y[n] = x[n]$ | $\delta[n]$ | Pass-through |
| **Unit Delay** | $y[n] = x[n-1]$ | $\delta[n-1]$ | $z^{-1}$ |
| **Unit Advance** | $y[n] = x[n+1]$ | $\delta[n+1]$ | Non-causal |
| **Moving Average (M)** | $y[n] = \frac{1}{M}\sum_{k=0}^{M-1} x[n-k]$ | $\frac{1}{M}[u[n]-u[n-M]]$ | FIR, lowpass |

---

## Convolution: The LTI Output Formula

$$y[n] = x[n] * h[n] = \sum_{k=-\infty}^{\infty} x[k] h[n-k]$$

### Numerical Example

$x[n] = \{1, 2, 3\}$ (at $n=0,1,2$)
$h[n] = \{1, 1\}$ (at $n=0,1$) — 2-point moving average

```
       k:  0   1   2
x[k]:      1   2   3

n=0:  x[0]h[0] = 1·1 = 1
n=1:  x[0]h[1] + x[1]h[0] = 1·1 + 2·1 = 3
n=2:  x[1]h[1] + x[2]h[0] = 2·1 + 3·1 = 5
n=3:  x[2]h[1] = 3·1 = 3

y[n] = {1, 3, 5, 3}
```

---

## Correlation: Measuring Similarity

### Auto-Correlation
$$R_{xx}[k] = \sum_n x[n] x[n-k] = x[k] * x[-k]$$

- $R_{xx}[0]$ = energy
- Peak at $k=0$, symmetric: $R_{xx}[-k] = R_{xx}[k]$
- Periodicity detection, pitch estimation

### Cross-Correlation
$$R_{xy}[k] = \sum_n x[n] y[n-k]$$

- Time delay estimation (radar, sonar, GPS)
- Pattern matching, template detection
- $R_{xy}[k] \ne R_{yx}[k]$ but $R_{xy}[k] = R_{yx}[-k]$

---

## Comprehensive Classification Summary

| System | Static? | TI? | Linear? | Causal? | Stable? | LTI? |
|---|---|---|---|---|---|---|
| $y[n] = x[n]$ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| $y[n] = x[n-1]$ | ✗ | ✓ | ✓ | ✓ | ✓ | ✓ |
| $y[n] = x[n+1]$ | ✗ | ✓ | ✓ | ✗ | ✓ | ✓* |
| $y[n] = 3x[n]+2$ | ✓ | ✓ | ✗ | ✓ | ✓ | ✗ |
| $y[n] = x^2[n]$ | ✓ | ✓ | ✗ | ✓ | Depends | ✗ |
| $y[n] = nx[n]$ | ✓ | ✗ | ✓ | ✓ | ✗ | ✗ |
| $y[n] = x[-n]$ | ✗ | ✗ | ✓ | ✗ | Depends | ✗ |

*Non-causal LTI (realizable offline)

---
---
title: 'Digital Filters: FIR vs IIR Comparison'
date: 2026-01-31 00:00:00 +0600
categories:
- Academic
- Digital Signal Processing
tags:
- dsp
- filter-design
- fir
- iir
- academic
- cse409
- cse410
- jkkniu
description: '> **Digital filters are preferred over analog** for almost all modern
  applications.'
math: true
---
## Why Digital Filters?

> **Digital filters are preferred over analog** for almost all modern applications.

| Advantage | Description |
|---|---|
| **Precision** | Coefficients stored digitally—no component tolerance drift |
| **Flexibility** | Reconfigure via software, no soldering |
| **Stability** | FIR always stable; IIR poles controllable |
| **Complexity** | Arbitrary response shapes (linear phase, adaptive) |
| **Integration** | Single chip implements hundreds of filters |
| **No aging** | Performance doesn't degrade over time |

---

## FIR vs IIR: The Fundamental Choice

| Aspect | **FIR (Finite Impulse Response)** | **IIR (Infinite Impulse Response)** |
|---|---|---|
| **Impulse response** | Finite length $M$ | Infinite duration |
| **Difference equation** | $y[n] = \sum_{k=0}^{M-1} b_k x[n-k]$ | $y[n] = \sum b_k x[n-k] - \sum a_k y[n-k]$ |
| **Transfer function** | $H(z) = \sum b_k z^{-k}$ (all zeros) | $H(z) = \frac{\sum b_k z^{-k}}{\sum a_k z^{-k}}$ (poles + zeros) |
| **Feedback** | None (non-recursive) | Yes (recursive) |
| **Stability** | **Always stable** | Conditionally stable (poles inside unit circle) |
| **Phase response** | **Exact linear phase** (symmetric coeffs) | Nonlinear phase (usually) |
| **Efficiency** | More taps for sharp cutoff | Fewer coefficients for same spec |
| **Roundoff noise** | Lower | Higher (feedback accumulates error) |
| **Design methods** | Window, Parks-McClellan, frequency sampling | Bilinear transform, impulse invariance |

### When to Choose Which?

- **FIR**: Linear phase critical (audio, comms), adaptive filters, simple implementation
- **IIR**: Computational efficiency paramount, minimum phase acceptable, sharp cutoffs needed

---
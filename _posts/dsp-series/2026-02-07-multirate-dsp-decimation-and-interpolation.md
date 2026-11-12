---
title: 'Multirate DSP: Decimation and Interpolation'
date: 2026-02-07 00:00:00 +0600
categories:
- Academic
- Digital Signal Processing
tags:
- dsp
- multirate
- decimation
- interpolation
- polyphase
- academic
- cse409
- cse410
- jkkniu
description: 'Different subsystems need different sampling rates:'
math: true
---
## Why Multirate?

Different subsystems need different sampling rates:
- Audio CD: 44.1 kHz
- Telephony: 8 kHz
- Professional audio: 48/96/192 kHz
- Video: MHz–GHz range

**Multirate DSP** changes sampling rate **entirely in digital domain**—no D/A → A/D conversion needed.

---

## Decimation (Down-Sampling) by Factor $M$

**Process:**
```
x[n] ──► [Lowpass Filter H(z)] ──► [↓M] ──► y[n]
           (Anti-aliasing)           (Keep every M-th)
```

### Steps:
1. **Filter**: Lowpass with cutoff $\omega_c = \pi/M$ to prevent aliasing
2. **Down-sample**: $y[n] = x[Mn]$

### Frequency Domain:
$$Y(e^{j\omega}) = \frac{1}{M} \sum_{k=0}^{M-1} X(e^{j(\omega-2\pi k)/M})$$

Spectra stretch by $M$ and replicate. Filter removes replicas that would alias.

### Example: Decimate by 2
- Input: $x[n]$ at $F_s$
- Filter: LPF cutoff $\pi/2$ (Nyquist of new rate)
- Output: $y[n] = x[2n]$ at $F_s/2$

---

## Interpolation (Up-Sampling) by Factor $L$

**Process:**
```
x[n] ──► [↑L] ──► [Lowpass Filter H(z)] ──► y[n]
        (Insert L-1 zeros)        (Anti-imaging)
```

### Steps:
1. **Up-sample**: Insert $L-1$ zeros between samples
   $$v[n] = \begin{cases} x[n/L] & n \text{ multiple of } L \\ 0 & \text{otherwise} \end{cases}$$
2. **Filter**: Lowpass with cutoff $\pi/L$ to interpolate zeros → smooth signal
3. **Gain**: Multiply by $L$ to compensate for zero-insertion energy loss

### Frequency Domain:
$$V(e^{j\omega}) = X(e^{j\omega L})$$
Images appear at multiples of $2\pi/L$. Filter removes images.

---
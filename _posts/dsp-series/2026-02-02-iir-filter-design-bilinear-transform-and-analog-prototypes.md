---
title: "IIR Filter Design: Bilinear Transform and Analog Prototypes"
date: 2026-02-02 00:00:00 +0600
categories: ['Academic', 'CSE-409 Digital Signal Processing']
tags: ['dsp', 'filter-design', 'fir', 'iir', 'academic', 'cse409', 'cse410', 'jkkniu']
description: '## IIR Filter Design: Bilinear Transform'
math: true
---
## IIR Filter Design: Bilinear Transform

### The Standard Approach
1. Design **analog prototype** (Butterworth, Chebyshev, Elliptic)
2. Apply **bilinear transform** to map $s$-plane to $z$-plane

### Bilinear Transform Mapping

$$s = \frac{2}{T} \frac{1 - z^{-1}}{1 + z^{-1}} \quad \Leftrightarrow \quad z = \frac{1 + sT/2}{1 - sT/2}$$

**Properties:**
- $j\omega$ axis in $s$ $\leftrightarrow$ unit circle in $z$ (stable ↔ stable)
- **Frequency warping:** $\omega = \frac{2}{T} \tan^{-1}(\frac{\Omega T}{2})$
- **Pre-warp** critical frequencies: $\Omega_c = \frac{2}{T} \tan(\omega_c T / 2)$

### Analog Prototype: Butterworth Lowpass

| Order $N$ | Magnitude Response | Poles |
|---|---|---|
| All-pole | Maximally flat passband | $N$ poles on semicircle |

**Design steps for digital Butterworth:**
1. Pre-warp specs: $\Omega_p, \Omega_s$ from $\omega_p, \omega_s$
2. Find minimum order $N$ from:
   $$N \ge \frac{\log_{10}[(10^{0.1A_s}-1)/(10^{0.1A_p}-1)]}{2\log_{10}(\Omega_s/\Omega_p)}$$
3. Find cutoff $\Omega_c$ from $\Omega_p$: $\Omega_c = \Omega_p / (10^{0.1A_p}-1)^{1/2N}$
4. Place poles: $p_k = \Omega_c e^{j\pi(2k+N-1)/2N}$ for $k=1..N$ (left half-plane)
5. Form $H(s)$, apply bilinear transform → $H(z)$

### Chebyshev Type I
- Equiripple in passband, monotonic stopband
- Sharper transition than Butterworth for same order

### Elliptic (Cauer)
- Equiripple in **both** passband and stopband
- **Minimum order** for given specs
- Most complex design

---
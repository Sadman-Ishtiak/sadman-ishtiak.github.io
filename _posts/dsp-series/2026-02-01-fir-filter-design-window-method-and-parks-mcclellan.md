---
title: 'FIR Filter Design: Window Method and Parks-McClellan'
date: 2026-02-01 00:00:00 +0600
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
description: 1. Start with ideal frequency response $H_d(e^{j\omega})$ (brick-wall)
math: true
---
## FIR Filter Design: Window Method

### Principle
1. Start with ideal frequency response $H_d(e^{j\omega})$ (brick-wall)
2. Compute ideal impulse response $h_d[n]$ via IDTFT
3. **Truncate** to finite length $M$ using window $w[n]$
4. $h[n] = h_d[n] \cdot w[n]$

### Ideal Impulse Responses

| Filter Type | $h_d[n]$ |
|---|---|
| **Lowpass** ($\omega_c$) | $\frac{\omega_c}{\pi} \text{sinc}(\omega_c n)$ |
| **Highpass** ($\omega_c$) | $\delta[n] - \frac{\omega_c}{\pi} \text{sinc}(\omega_c n)$ |
| **Bandpass** ($\omega_1, \omega_2$) | $\frac{\omega_2}{\pi}\text{sinc}(\omega_2 n) - \frac{\omega_1}{\pi}\text{sinc}(\omega_1 n)$ |
| **Bandstop** | $\delta[n] - h_{\text{bandpass}}[n]$ |

### Window Functions: The Trade-off Table

| Window | Main Lobe Width | Peak Sidelobe | Transition Width | Stopband Atten. |
|---|---|---|---|---|
| **Rectangular** | $4\pi/M$ | -13 dB | $0.9\pi/M$ | 21 dB |
| **Bartlett (Triangular)** | $8\pi/M$ | -27 dB | $1.8\pi/M$ | 25 dB |
| **Hanning** | $8\pi/M$ | -31 dB | $3.1\pi/M$ | 44 dB |
| **Hamming** | $8\pi/M$ | -43 dB | $3.3\pi/M$ | 53 dB |
| **Blackman** | $12\pi/M$ | -58 dB | $5.5\pi/M$ | 74 dB |
| **Kaiser ($\beta$)** | Adjustable | Adjustable | Adjustable | Adjustable |

> **Rule of thumb:** For stopband attenuation $A$ dB, choose window with sidelobes < $A$ dB. Then $M \approx \frac{\text{Transition width factor} \cdot \pi}{\Delta\omega}$.

### Worked Example: Lowpass FIR via Hamming Window

**Specs:** $\omega_p = 0.2\pi$, $\omega_s = 0.3\pi$, $A_s > 50$ dB

1. **Cutoff:** $\omega_c = (\omega_p + \omega_s)/2 = 0.25\pi$
2. **Transition:** $\Delta\omega = \omega_s - \omega_p = 0.1\pi$
3. **Window:** Hamming (53 dB > 50 dB)
4. **Length:** $M \approx \frac{3.3\pi}{0.1\pi} = 33$ → use $M=33$ (odd for Type I linear phase)
5. **Ideal response:** $h_d[n] = 0.25 \text{sinc}(0.25(n-16))$ for $n=0..32$
6. **Window:** $w[n] = 0.54 - 0.46\cos(2\pi n / 32)$
7. **Final:** $h[n] = h_d[n] \cdot w[n]$

---

## FIR Design: Parks-McClellan (Optimal Equiripple)

The **Parks-McClellan** algorithm (Remez exchange) designs **optimal minimax** FIR filters.

### Advantages over Window Method
- Directly specifies passband/stopband edges and ripples
- **Optimal**: Minimizes maximum error (Chebyshev criterion)
- Often requires **fewer taps** for same specs

### Design Parameters
```
Passband edge:    ωp
Stopband edge:    ωs
Passband ripple:  δp (linear) or Ap (dB)
Stopband ripple:  δs (linear) or As (dB)
Weight ratio:     W = δp/δs (trade-off)
```

### MATLAB: `firpm(N, f, a, w)`
- `f`: Frequency vector [0, ωp, ωs, 1] normalized to π
- `a`: Desired amplitude [1, 1, 0, 0] for lowpass
- `w`: Weight vector [W, 1] (higher weight = tighter constraint)

### Linear Phase Types
| Type | Symmetry | Length | Zero at ω=π? | Use Case |
|---|---|---|---|---|
| **Type I** | Even ($h[n]=h[M-1-n]$) | Odd | No | General LP, HP, BP |
| **Type II** | Even | Even | **Yes** | LP, BP only |
| **Type III** | Odd ($h[n]=-h[M-1-n]$) | Odd | **Yes** | Differentiators, Hilbert |
| **Type IV** | Odd | Even | No | Differentiators, Hilbert |

---
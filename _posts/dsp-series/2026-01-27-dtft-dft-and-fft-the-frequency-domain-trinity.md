---
title: "DTFT, DFT, and FFT: The Frequency Domain Trinity"
date: 2026-01-27 00:00:00 +0600
categories: ['Academic', 'CSE-409 Digital Signal Processing']
tags: ['dsp', 'dft', 'fft', 'frequency-analysis', 'academic', 'cse409', 'cse410', 'jkkniu']
description: '## The Frequency Domain Trinity'
math: true
---
## The Frequency Domain Trinity

| Transform | Input | Output | Use Case |
|---|---|---|---|
| **DTFT** | Infinite discrete-time $x[n]$ | Continuous periodic $X(e^{j\omega})$ | Theoretical analysis |
| **DFT** | Finite $N$-point $x[n]$ | Discrete $N$-point $X[k]$ | **Computational** (what we actually compute) |
| **FFT** | Finite $N$-point $x[n]$ | Discrete $N$-point $X[k]$ | **Fast algorithm** for DFT |

---

## DTFT: The Theoretical Foundation

**Definition:**
$$X(e^{j\omega}) = \sum_{n=-\infty}^{\infty} x[n] e^{-j\omega n}$$

**Inverse:**
$$x[n] = \frac{1}{2\pi} \int_{-\pi}^{\pi} X(e^{j\omega}) e^{j\omega n} d\omega$$

**Key Properties:**
- Periodic in $\omega$ with period $2\pi$: $X(e^{j(\omega+2\pi)}) = X(e^{j\omega})$
- Exists if $\sum \vert x[n]\vert < \infty$ (absolutely summable) or finite energy
- Continuous frequency variable $\omega \in [-\pi, \pi]$

**Limitation:** Cannot compute on a computer—infinite sum, continuous output.

---

## DFT: The Computable Version

**Definition (Forward DFT):**
$$X[k] = \sum_{n=0}^{N-1} x[n] e^{-j\frac{2\pi}{N}kn}, \quad k = 0, 1, \dots, N-1$$

**Definition (Inverse DFT / IDFT):**
$$x[n] = \frac{1}{N} \sum_{k=0}^{N-1} X[k] e^{j\frac{2\pi}{N}kn}, \quad n = 0, 1, \dots, N-1$$

### DFT vs DTFT: Key Differences

| Aspect | DTFT | DFT |
|---|---|---|
| **Time domain** | Infinite $x[n]$ | Finite $N$ samples (periodic extension) |
| **Frequency domain** | Continuous $X(e^{j\omega})$ | Discrete $N$ samples $X[k]$ |
| **Periodicity** | $2\pi$ in $\omega$ | $N$ in $k$ (implicit periodic) |
| **Computable?** | No | Yes (via FFT) |

### DFT as Sampled DTFT

$$X[k] = X(e^{j\omega})\big|_{\omega = 2\pi k/N}$$

The DFT samples the DTFT at $N$ equally spaced frequencies.

---

## Computing N-Point DFT by Hand

### Example: 4-Point DFT of $x[n] = \{1, 2, 3, 4\}$

Let $W_N = e^{-j2\pi/N}$. For $N=4$, $W_4 = e^{-j\pi/2} = -j$.

| $k$ | $X[k] = \sum_{n=0}^3 x[n] W_4^{kn}$ |
|---|---|
| 0 | $1 + 2 + 3 + 4 = 10$ |
| 1 | $1 + 2(-j) + 3(-1) + 4(j) = -2 + 2j$ |
| 2 | $1 + 2(-1) + 3(1) + 4(-1) = -2$ |
| 3 | $1 + 2(j) + 3(-1) + 4(-j) = -2 - 2j$ |

**Result:** $X[k] = \{10, -2+2j, -2, -2-2j\}$

### Symmetry for Real Signals

If $x[n]$ is real:
- $X[0]$ = sum (real, DC component)
- $X[N/2]$ = alternating sum (real, Nyquist for even $N$)
- $X[k] = X^*[N-k]$ (conjugate symmetry)
- Only $N/2 + 1$ unique values for real signals

---
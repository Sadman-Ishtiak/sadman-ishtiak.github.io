---
title: "Fourier Series, Spectral Density, Bandwidth, and DTFT Symmetry"
date: 2026-02-23 00:00:00 +0600
categories: ['Academic', 'CSE-409 Digital Signal Processing']
tags: ['dsp', 'fourier-series', 'spectrum', 'bandwidth', 'frequency-analysis', 'academic', 'cse409', 'cse410', 'jkkniu']
description: The discrete Fourier series, power and energy density spectra, how bandwidth is defined, DTFT symmetry for real signals, and the frequency ranges of natural signals.
math: true
---
## The Discrete Fourier Series

A periodic sequence $x[n]$ with period $N$ can be represented exactly by $N$ harmonically related complex exponentials:

$$\tilde X[k]=\sum_{n=0}^{N-1}\tilde x[n]e^{-j2\pi kn/N},\qquad k=0,1,\dots,N-1$$

$$\tilde x[n]=\frac{1}{N}\sum_{k=0}^{N-1}\tilde X[k]e^{j2\pi kn/N},\qquad n=0,1,\dots,N-1$$

These are the **discrete Fourier series (DFS)** pair. They are identical in form to the DFT — the only difference is interpretation: the DFS describes a periodic sequence, the DFT describes one period of a finite sequence.

The basis set $\{e^{j2\pi kn/N}\}$ has exactly $N$ distinct members, because

$$e^{j2\pi(k+N)n/N}=e^{j2\pi kn/N}e^{j2\pi n}=e^{j2\pi kn/N}$$

So the representation is finite and exact. This is fundamentally different from the continuous-time Fourier series, which needs infinitely many harmonics.

### From Fourier Series to the Fourier Transform

| Domain | Periodic | Aperiodic |
|---|---|---|
| Continuous time | Fourier **series** (discrete spectrum) | Fourier **transform** (continuous spectrum) |
| Discrete time | **DFS/DFT** (discrete, periodic spectrum) | **DTFT** (continuous, periodic spectrum) |

Making a signal periodic in one domain makes its spectrum discrete in the other. This duality is the whole reason the DFT exists.

---

## Power Density Spectrum

For a **power signal**, total energy is infinite, so we cannot talk about an energy spectrum. Instead we use **average power** and its distribution over frequency.

### Parseval for Power Signals

$$P=\lim_{N\to\infty}\frac{1}{2N+1}\sum_{n=-N}^{N}\vert x[n]\vert^2=\frac{1}{2\pi}\int_{-\pi}^{\pi}S_{xx}(e^{j\omega})\,d\omega$$

where $S_{xx}(e^{j\omega})$ is the **power density spectrum** (also written $P_{xx}(\omega)$).

For a periodic signal with period $N$:

$$P=\frac{1}{N}\sum_{n=0}^{N-1}\vert x[n]\vert^2=\sum_{k=0}^{N-1}\vert c_k\vert^2$$

where $c_k=\tilde X[k]/N$ are the Fourier coefficients. This is **Parseval's theorem for the DFS**: average power in time equals the sum of squared coefficient magnitudes.

**Example.** $x[n]=\cos(2\pi n/8)$.

$$P=\frac{1}{2}$$

The two Fourier coefficients at $k=1$ and $k=7$ each have magnitude $\tfrac12$, and $\left(\tfrac12\right)^2+\left(\tfrac12\right)^2=\tfrac12$ ✓.

### The Wiener–Khinchine Theorem

The power density spectrum is the DTFT of the autocorrelation sequence:

$$S_{xx}(e^{j\omega})=\sum_{l=-\infty}^{\infty}r_{xx}[l]\,e^{-j\omega l}$$

$$r_{xx}[l]=\frac{1}{2\pi}\int_{-\pi}^{\pi}S_{xx}(e^{j\omega})e^{j\omega l}\,d\omega$$

This is why autocorrelation and spectrum are two views of the same information. Every spectrum estimator in practice is an autocorrelation estimator in disguise.

---

## Energy Density Spectrum

For a **finite-energy** signal:

$$E=\sum_{n=-\infty}^{\infty}\vert x[n]\vert^2=\frac{1}{2\pi}\int_{-\pi}^{\pi}\vert X(e^{j\omega})\vert^2\,d\omega$$

The quantity

$$S_{xx}(e^{j\omega})=\vert X(e^{j\omega})\vert^2$$

is the **energy density spectrum**. It is non-negative, real, and even for a real signal.

| Signal type | Total measure | Density function | Units |
|---|---|---|---|
| Energy signal | $E$ (joules) | $\vert X(e^{j\omega})\vert^2$ | energy/rad |
| Power signal | $P$ (watts) | $S_{xx}(e^{j\omega})$ | power/rad |
| Periodic | $P$ from Fourier coefficients | line spectrum at harmonics | power per line |

> **Exam distinction:** an energy signal has $P=0$ and a continuous energy density; a power signal has $E=\infty$ and a power density. Never mix the two integrals.

---

## Bandwidth

There is no single definition of bandwidth. The definition depends on the application.

### 1. Absolute (Null-to-Null) Bandwidth

The width between the first zeros of the spectrum. For a rectangular pulse of length $N$, the main lobe of the sinc spans

$$B_{\text{null}}=\frac{2}{N}\quad\text{(in radians/sample)}$$

### 2. 3-dB Bandwidth

The width where the power is half the peak value (magnitude $1/\sqrt2$). Standard for filters.

### 3. Percentage Bandwidth

For a signal whose spectrum is concentrated in $F_1\le F\le F_2$, the $95\%$ bandwidth is the width containing 95% of the energy or power:

$$B_{95}=F_2-F_1 \quad\text{such that}\quad \int_{F_1}^{F_2}S(f)\,df=0.95\,E_{\text{total}}$$

You also see 75%, 90%, and 99% versions. This is the definition used for real measured signals where the spectrum has no clean edges.

### 4. Equivalent Noise Bandwidth

The width of an ideal rectangular filter with the same peak gain and the same integrated noise power:

$$B_{\text{eq}}=\frac{1}{\vert H_{\max}\vert^2}\int_0^{\infty}\vert H(f)\vert^2\,df$$

### 5. Bandlimited Signals

A signal is **bandlimited** if its spectrum is zero outside $\vert F\vert\le B$. That is the condition under which the sampling theorem applies and exact reconstruction is possible.

### Time–Bandwidth Product

The shorter a pulse in time, the wider its bandwidth:

$$\Delta t\cdot\Delta f\ge\frac{1}{4\pi}\quad\text{(Gaussian)}$$

For a rectangular pulse of duration $T$: $B_{\text{null}}=2/T$. This is the transform's uncertainty principle, and it is why you cannot have arbitrarily sharp time resolution and arbitrary frequency resolution at the same time.

---

## Frequency Ranges of Natural Signals

Some context for choosing a sampling rate (from Proakis Table 4.2):

| Signal | Typical frequency range |
|---|---|
| Speech | 50 Hz – 4 kHz (telephone: 300–3400 Hz) |
| Music / audio | 20 Hz – 20 kHz |
| ECG | 0.05 – 150 Hz |
| EEG | 0.1 – 100 Hz |
| EMG | 10 Hz – 1 kHz |
| Sonar | 10 Hz – 1 MHz |
| Radar | 1 MHz – 100 GHz |
| Visible light | $4\times10^{14}$ – $7.5\times10^{14}$ Hz |

The Nyquist rate follows directly: audio needs $\ge40$ kHz (hence 44.1 kHz CD), telephony needs $\ge8$ kHz (hence 8 kHz PCM), ECG needs only a few hundred Hz.

---

## DTFT Symmetry Properties

For a sequence decomposed into even and odd parts, $x[n]=x_e[n]+x_o[n]$:

| Time domain | Frequency domain |
|---|---|
| $x[n]$ real | $X(e^{j\omega})=X^*(e^{-j\omega})$ (conjugate symmetric) |
| $x[n]$ real and even | $X(e^{j\omega})$ real and even |
| $x[n]$ real and odd | $X(e^{j\omega})$ purely imaginary and odd |
| $x[n]$ purely imaginary | $X(e^{j\omega})=-X^*(e^{-j\omega})$ (conjugate antisymmetric) |
| $x_e[n]$ | $\operatorname{Re}\{X(e^{j\omega})\}$ |
| $x_o[n]$ | $j\operatorname{Im}\{X(e^{j\omega})\}$ |

### The Four Symmetries in Full

For a real $x[n]$, write $X(e^{j\omega})=X_R(\omega)+jX_I(\omega)$:

$$X_R(\omega)=X_R(-\omega) \quad\text{(even)}$$
$$X_I(\omega)=-X_I(-\omega) \quad\text{(odd)}$$
$$\vert X(e^{j\omega})\vert=\vert X(e^{-j\omega})\vert \quad\text{(even magnitude)}$$
$$\angle X(e^{j\omega})=-\angle X(e^{-j\omega}) \quad\text{(odd phase)}$$

**Practical consequences:**

1. A real signal's spectrum is fully described by $\omega\in[0,\pi]$; the rest is redundant.
2. The DFT of a real $N$-point sequence satisfies $X[N-k]=X^*[k]$, so only $N/2+1$ values are independent.
3. This is exactly why real-input FFT algorithms can halve the work — they pack two real sequences into one complex FFT and unpack the conjugate symmetry afterwards.

### Worked Check

$x[n]=\delta[n]+\delta[n-1]$ is real and **not** even and **not** odd. Its transform:

$$X(e^{j\omega})=1+e^{-j\omega}=e^{-j\omega/2}\left(e^{j\omega/2}+e^{-j\omega/2}\right)=2\cos(\omega/2)e^{-j\omega/2}$$

Magnitude $2\cos(\omega/2)$ is even ✓. Phase $-\omega/2$ is odd ✓. Consistent with conjugate symmetry.

$x[n]=\delta[n+1]+\delta[n-1]$ is real and even:

$$X(e^{j\omega})=e^{j\omega}+e^{-j\omega}=2\cos\omega$$

Real and even ✓.

---

## Summary

1. The DFS is the DFT applied to a periodic sequence; $N$ harmonics represent it exactly.
2. Power signals use a power density spectrum; energy signals use $\vert X\vert^2$.
3. Wiener–Khinchine: the power spectrum is the DTFT of the autocorrelation.
4. Bandwidth has at least five definitions — always state which one.
5. Time and bandwidth are inversely related; you cannot beat the uncertainty principle.
6. Real signals have conjugate-symmetric spectra, which halves the independent data.

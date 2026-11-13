---
title: "Stationary vs Non-Stationary Signals"
date: 2026-02-16 00:00:00 +0600
categories: ['Academic', 'CSE-409 Digital Signal Processing']
tags: ['dsp', 'signals', 'statistics', 'signal-analysis', 'academic', 'cse409', 'cse410', 'jkkniu']
description: Why the statistics of a signal decide which analysis tool is valid.
math: true
---
## The Definition

A **stationary signal** has statistical parameters (mean, variance, amplitude, standard deviation, frequency content) that **do not change with time**. Its long-term statistics are constant.

A **non-stationary signal** has statistics that **change with time**.

$$\text{Stationary: } \mu_x(t)=\mu_x, \quad \sigma_x^2(t)=\sigma_x^2 \quad \forall t$$

$$\text{Non-stationary: } \mu_x(t) \text{ or } \sigma_x^2(t) \text{ varies with } t$$

This is a statement about **statistics**, not about the waveform repeating. A stationary random signal can look different from one instant to the next; its *distribution* stays the same.

---

## Worked Examples

### Stationary

$$x(t)=\cos(2\pi\cdot 10t)+\cos(2\pi\cdot 25t)+\cos(2\pi\cdot 50t)+\cos(2\pi\cdot 100t)$$

At **any** time instant the signal contains the same four frequencies, 10, 25, 50 and 100 Hz, with the same amplitudes. Its spectrum does not move. It is stationary.

### Non-Stationary

> 0–300 ms: a 100 Hz sinusoid
> 300–600 ms: a 50 Hz sinusoid
> 600–800 ms: a 25 Hz sinusoid
> 800–1000 ms: a 10 Hz sinusoid

The frequency content changes with time. Its long-term statistics change. It is non-stationary.

This is exactly what a **chirp** does continuously:

$$x(t)=\cos\left(2\pi\left(f_0 t + \frac{k}{2}t^2\right)\right)$$

---

## Why It Matters

Most of the theory in this series assumes **wide-sense stationarity (WSS)**:

- The Fourier transform of a random signal is not defined in the ordinary sense; we use the **power spectral density**, which assumes stationary statistics.
- The Wiener filter and the autocorrelation function assume the statistics do not drift.
- Adaptive filters exist precisely because real signals are often **non-stationary** and the filter must track the change.

| Signal | Stationary? | Correct tool |
|---|---|---|
| Thermal noise | Yes | Fourier/PSD, Wiener filter |
| Pure tone | Yes | DFT/FFT |
| Speech | No (phonemes change) | Short-time Fourier transform, LPC |
| Music | No | Spectrogram, filter banks |
| Chirp/radar pulse | No | Time-frequency analysis, matched filter |
| ECG | Quasi-periodic, non-stationary | Wavelet/STFT, adaptive filtering |

---

## How to Detect Non-Stationarity

1. **Sliding statistics**: compute mean/variance over short windows. If they drift, the signal is non-stationary.
2. **Spectrogram**: a windowed FFT over time. A stationary signal shows horizontal bands; a non-stationary one shows moving or changing bands.
3. **Segmentation tests**: compare statistics of adjacent blocks (change-point detection).

```matlab
% Spectrogram exposes non-stationarity
spectrogram(x, 256, 128, 256, fs, 'yaxis');
```

```python
import numpy as np
import matplotlib.pyplot as plt
from scipy.signal import spectrogram

fs = 1000
t = np.arange(0, 2, 1/fs)
x = np.cos(2*np.pi*(50*t + 100*t**2))   # chirp
f, tt, S = spectrogram(x, fs=fs, nperseg=256, noverlap=128)
plt.pcolormesh(tt, f, 10*np.log10(np.abs(S)+1e-12), shading='auto')
plt.ylabel('Frequency (Hz)'); plt.xlabel('Time (s)')
plt.show()
```

---

## The Exam Question

> "Sketch a signal that has a 6 Hz sinusoid from 0–2 s and a 4 Hz sinusoid from 2–4 s. Is it stationary?"

**Sketch:** two equal-length segments, 6 cycles per second in the first half and 4 cycles per second in the second half.

**Answer:** It is **non-stationary**. The frequency — a statistical property of the signal — changes at $t=2$ s. A single Fourier transform would smear energy across 4 Hz and 6 Hz and hide the switch; a spectrogram shows it clearly.

---

## Stationarity Is a Spectrum of Conditions

| Level | Condition |
|---|---|
| **Strict-sense stationary** | Full probability distribution is time-invariant |
| **Wide-sense stationary (WSS)** | Mean is constant and autocorrelation depends only on lag $k$ |
| **Cyclostationary** | Statistics vary periodically (e.g., digital modulation) |
| **Non-stationary** | Statistics vary arbitrarily |

In DSP practice, "stationary" almost always means **WSS**, because that is all the autocorrelation and power-spectrum tools need.

---

## Key Takeaways

1. Stationary = constant statistics over time; non-stationary = changing statistics.
2. A sum of fixed sinusoids is stationary even if it looks complicated.
3. Changing frequency, amplitude, or noise level makes a signal non-stationary.
4. Use the FFT/PSD for stationary signals, the STFT/spectrogram or adaptive methods for non-stationary ones.

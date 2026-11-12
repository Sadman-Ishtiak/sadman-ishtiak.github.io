---
title: "Practical DFT/FFT Considerations and Cepstrum"
date: 2026-01-30 00:00:00 +0600
categories: ['Academic', 'Digital Signal Processing']
tags: ['dsp', 'dft', 'fft', 'frequency-analysis', 'academic', 'cse409', 'cse410', 'jkkniu']
description: '## Practical DFT/FFT Considerations'
math: true
---
## Practical DFT/FFT Considerations

### 1. Zero-Padding
- Appending zeros to $x[n]$ before DFT
- **Increases frequency resolution** (interpolates DTFT)
- Does **not** add new information

### 2. Windowing
- Multiply $x[n]$ by window $w[n]$ before DFT
- Reduces **spectral leakage** (sinc sidelobes)
- Trade-off: Main lobe width vs. sidelobe level

| Window | Main Lobe Width | Peak Sidelobe | Use Case |
|---|---|---|---|
| Rectangular | $4\pi/N$ | -13 dB | Default, high resolution |
| Hamming | $8\pi/N$ | -43 dB | General purpose |
| Hanning | $8\pi/N$ | -31 dB | Good all-around |
| Blackman | $12\pi/N$ | -58 dB | Low sidelobes critical |
| Kaiser | Adjustable | Adjustable | Parametric control |

### 3. Frequency Resolution
$$\Delta f = \frac{F_s}{N} \quad \text{(Hz per bin)}$$

To resolve two tones at $f_1, f_2$: need $N > F_s / |f_1 - f_2|$

### 4. Spectral Leakage
Energy from one frequency "leaks" into adjacent bins due to:
- Finite observation window (rectangular window = sinc in freq)
- Non-integer periods in window

---

## The Cepstrum (Proakis 4.2.7)

The **cepstrum** is the inverse Fourier transform of the log spectrum. It separates convolved signals.

### Complex Cepstrum
$$\hat{x}[n] = \mathcal{F}^{-1}\{\ln X(e^{j\omega})\} = \frac{1}{2\pi} \int_{-\pi}^{\pi} \ln X(e^{j\omega}) e^{j\omega n} d\omega$$

Using $X(e^{j\omega}) = |X(e^{j\omega})| e^{j\theta(\omega)}$:
$$\ln X(e^{j\omega}) = \ln |X(e^{j\omega})| + j\theta(\omega)$$

### Real Cepstrum (Magnitude only)
$$c[n] = \mathcal{F}^{-1}\{\ln |X(e^{j\omega})|\} = \frac{1}{2\pi} \int_{-\pi}^{\pi} \ln |X(e^{j\omega})| e^{j\omega n} d\omega$$

### Applications
| Use Case | How Cepstrum Helps |
|---|---|
| **Pitch detection** (speech) | Separates vocal tract (slow) from pitch (fast) in quefrency domain |
| **Echo/deconvolution** | Convolution → addition in log domain → separation in cepstrum |
| **Homomorphic deconvolution** | $y[n] = x[n] * h[n] \rightarrow \hat{y}[n] = \hat{x}[n] + \hat{h}[n]$ |

> **Key insight:** If $y[n] = x[n] * h[n]$, then $\hat{y}[n] = \hat{x}[n] + \hat{h}[n]$. Convolution becomes **addition** in cepstral domain!

---

## Circular Convolution vs Linear Convolution

| Aspect | Linear Convolution | Circular Convolution (DFT) |
|---|---|---|
| Length | $N_1 + N_2 - 1$ | $N$ (same as DFT size) |
| Formula | $y[n] = \sum x[k]h[n-k]$ | $y[n] = \sum_{k=0}^{N-1} x[k]h[(n-k)_N]$ |
| To compute linear via DFT | Zero-pad both to $\ge N_1+N_2-1$ | Use DFT size $\ge N_1+N_2-1$ |

### Overlap-Add / Overlap-Save Methods
For filtering long signals with FFT:
- **Overlap-Add**: Break input into blocks, convolve each with $h[n]$, add overlapping outputs
- **Overlap-Save**: Keep only valid (non-circular) part of each block's output

---

## IDFT: Recovering Time Domain

$$x[n] = \frac{1}{N} \sum_{k=0}^{N-1} X[k] e^{j\frac{2\pi}{N}kn}$$

**Practical note:** Many FFT libraries put $1/N$ in forward transform. Check your library!

**MATLAB/Octave:** `fft` = forward (no $1/N$), `ifft` = inverse (has $1/N$)
**Python/NumPy:** `np.fft.fft` = forward (no $1/N$), `np.fft.ifft` = inverse (has $1/N$)

---

## Worked Example: 8-Point DFT of Cosine

$x[n] = \cos(2\pi \cdot 2 \cdot n / 8) = \cos(\pi n / 2)$ for $n=0..7$

$x[n] = \{1, 0, -1, 0, 1, 0, -1, 0\}$

Using Euler: $\cos(\theta) = \frac{e^{j\theta} + e^{-j\theta}}{2}$

DFT bins at $k=2$ and $k=6$ (which is $N-2$):
$$X[2] = 4, \quad X[6] = 4, \quad \text{all others } = 0$$

**Why?** Frequency $\pi/2$ corresponds to $k = \frac{\omega N}{2\pi} = \frac{(\pi/2) \cdot 8}{2\pi} = 2$.

---

## FFT in Practice: MATLAB / Python

```matlab
% MATLAB
Fs = 1000;              % Sampling frequency
t = 0:1/Fs:1-1/Fs;      % 1 second
x = cos(2*pi*50*t) + 0.5*cos(2*pi*120*t);  % 50 Hz + 120 Hz
N = length(x);
X = fft(x);
f = (0:N-1)*Fs/N;       % Frequency axis
plot(f, abs(X)/N);      % Magnitude spectrum
```

```python
# Python
import numpy as np
import matplotlib.pyplot as plt

Fs = 1000
t = np.arange(0, 1, 1/Fs)
x = np.cos(2*np.pi*50*t) + 0.5*np.cos(2*np.pi*120*t)
N = len(x)
X = np.fft.fft(x)
f = np.fft.fftfreq(N, 1/Fs)
plt.plot(f[:N//2], np.abs(X[:N//2])/N)
plt.show()
```

---
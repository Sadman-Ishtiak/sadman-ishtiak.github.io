---
title: "Nonparametric Spectrum Estimation: Periodogram, Bartlett, Welch, and Blackman-Tukey"
date: 2026-03-03 00:00:00 +0600
categories: ['Academic', 'CSE-409 Digital Signal Processing']
tags: ['dsp', 'spectrum-estimation', 'periodogram', 'welch', 'academic', 'cse409', 'cse410', 'jkkniu']
description: Estimating a power spectrum directly from data, why the periodogram is inconsistent, and how averaging and windowing fix it.
math: true
---
## The Estimation Problem

In theory the power spectrum is

$$P_{xx}(e^{j\omega})=\sum_{l=-\infty}^{\infty}r_{xx}[l]e^{-j\omega l}$$

In practice you have $N$ samples and no true autocorrelation. Nonparametric methods estimate the spectrum **directly from the data** without assuming a model — hence "nonparametric".

Two unavoidable facts:

1. You only see a finite record, so the estimate is biased (spectral leakage).
2. The estimate is a **random variable**, so it has variance.

The whole game is trading bias against variance.

---

## The Periodogram

The simplest estimator replaces the expectation with a finite sum:

$$\hat P_{xx}(e^{j\omega})=\frac{1}{N}\left\vert\sum_{n=0}^{N-1}x[n]e^{-j\omega n}\right\vert^2=\frac{1}{N}\vert X(e^{j\omega})\vert^2$$

This is the **periodogram**. Computed at the DFT bins:

$$\hat P[k]=\frac{1}{N}\vert X[k]\vert^2,\qquad k=0,\dots,N-1$$

### Properties

**Bias.** The expected value is the true spectrum convolved with the **Fejér kernel** (the squared magnitude of the rectangular window transform):

$$E\{\hat P(\omega)\}=\frac{1}{2\pi}\int_{-\pi}^{\pi}P_{xx}(\lambda)\,W_R(\omega-\lambda)\,d\lambda$$

The window smears sharp peaks. As $N\to\infty$ the kernel narrows and the bias vanishes — the periodogram is **asymptotically unbiased**.

**Variance.** For a Gaussian process,

$$\operatorname{var}\{\hat P(\omega)\}\approx P_{xx}^2(\omega)$$

The variance does **not** go to zero as $N\to\infty$. The standard deviation is as large as the mean, no matter how much data you collect.

> **This is the central fact of spectrum estimation:** the periodogram is **inconsistent**. More data does not make it smoother. It only makes the estimate resolve finer detail while remaining equally noisy.

### Why the Variance Stays

The periodogram at frequency $\omega$ is roughly the squared magnitude of a complex Gaussian with variance $P_{xx}$. A squared Gaussian has variance $2P^2$ regardless of $N$. Increasing $N$ adds more independent frequency bins, but each individual bin is still a single noisy measurement.

---

## Bartlett's Method: Average Periodograms

Split the $N$-sample record into $K$ non-overlapping segments of length $L$ ($N=KL$):

$$\hat P^{(i)}(\omega)=\frac{1}{L}\left\vert\sum_{n=0}^{L-1}x[iL+n]e^{-j\omega n}\right\vert^2$$

Average:

$$\hat P_{\text{Bartlett}}(\omega)=\frac{1}{K}\sum_{i=0}^{K-1}\hat P^{(i)}(\omega)$$

### The Trade-off

If the segments are independent,

$$\operatorname{var}\{\hat P_{\text{Bartlett}}\}=\frac{1}{K}\operatorname{var}\{\hat P\}$$

So the variance drops by a factor $K$ — the estimate becomes **consistent** as $K\to\infty$.

The price: each segment is only $L=N/K$ long, so the frequency resolution is

$$\Delta f_{\text{Bartlett}}=\frac{F_s}{L}=\frac{KF_s}{N}$$

Resolution degrades by the same factor $K$ that the variance improves. This is the **bias–variance trade-off** of spectrum estimation, and it cannot be beaten.

| $K$ | Variance | Resolution |
|---|---|---|
| 1 | $P^2$ | $F_s/N$ |
| 4 | $P^2/4$ | $4F_s/N$ |
| 16 | $P^2/16$ | $16F_s/N$ |

---

## Welch's Method: Overlap and Window

Welch improves on Bartlett in two ways:

1. **Overlap** the segments (typically 50%), so more segments fit in the same record.
2. **Window** each segment with a taper (Hamming, Hann) to reduce leakage.

$$\hat P_{\text{Welch}}(\omega)=\frac{1}{K}\sum_{i=0}^{K-1}\frac{1}{LU}\left\vert\sum_{n=0}^{L-1}w[n]x[iD+n]e^{-j\omega n}\right\vert^2$$

where $D$ is the hop size, $K$ is the number of segments, and

$$U=\frac{1}{L}\sum_{n=0}^{L-1}w^2[n]$$

normalizes the window power so the estimate stays unbiased.

### Why Overlap Helps

With 50% overlap, an $N$-point record yields about $K=2N/L-1$ segments instead of $N/L$ — nearly twice the averaging for the same resolution. The segments are no longer independent, so the variance reduction is slightly less than $1/K$, but the gain is still substantial.

### Why the Window Helps

The rectangular window has −13 dB sidelobes that leak strong tones across the whole spectrum. A Hann window drops the sidelobes to −31 dB. For a signal with a large dynamic range, this matters far more than the slightly wider main lobe.

### Typical Parameter Choices

| Parameter | Typical value | Effect |
|---|---|---|
| Segment length $L$ | 256–4096 | Sets resolution |
| Overlap | 50% (Hann) or 75% | More averages |
| Window | Hann or Hamming | Low leakage |
| FFT length | $\ge L$, usually power of 2 | Zero-pad for smooth curve |

### Rule of Thumb

- **Narrowband tones, low noise:** long segments, little overlap, rectangular or Hann.
- **Broadband noise, smooth spectrum:** short segments, 50% overlap, many averages.
- **Transients:** short segments with high overlap (spectrogram).

---

## Blackman–Tukey: Window the Autocorrelation

The classical method estimates the autocorrelation first, then transforms:

$$\hat r_{xx}[l]=\frac{1}{N}\sum_{n=0}^{N-1-\vert l\vert}x[n]x[n+\vert l\vert]$$

$$\hat P_{BT}(\omega)=\sum_{l=-(M-1)}^{M-1}w[l]\,\hat r_{xx}[l]\,e^{-j\omega l}$$

where $w[l]$ is a **lag window** of length $2M-1$ and $M\ll N$.

### The Lag Window

Truncating the autocorrelation at lag $M-1$ is equivalent to multiplying by a rectangular lag window. That produces **negative sidelobes** in the spectral estimate (the Gibbs phenomenon of the triangular window). A smoother lag window (Bartlett, Parzen, Hamming) tapers the autocorrelation and removes the negatives.

| Lag window | Spectral window | Sidelobe |
|---|---|---|
| Rectangular | Fejér (sinc²) | −13 dB, can go negative |
| Bartlett | Triangular | −27 dB |
| Hann | Hann | −31 dB |
| Parzen | Parzen | −53 dB |

### Relation to the Periodogram

The Blackman–Tukey estimate is the periodogram **smoothed by the spectral window**:

$$\hat P_{BT}(\omega)=\frac{1}{2\pi}\int_{-\pi}^{\pi}\hat P_{\text{per}}(\lambda)\,W(\omega-\lambda)\,d\lambda$$

So it is a **frequency-domain smoothing** operation. Smoothing reduces variance exactly the way averaging does, and it costs resolution the same way.

### Choosing $M$

- Large $M$: good resolution, high variance.
- Small $M$: smooth estimate, poor resolution.
- Typical: $M\approx N/5$ to $N/10$.

---

## Comparing the Methods

| Method | How it reduces variance | Resolution | Leakage | Cost |
|---|---|---|---|---|
| Periodogram | Does not | $F_s/N$ | High (rectangular) | 1 FFT |
| Bartlett | $K$ non-overlapping averages | $K F_s/N$ | High | $K$ FFTs |
| Welch | $K$ overlapping, windowed | $\approx K F_s/N$ | Low | $K$ FFTs |
| Blackman–Tukey | Lag-window smoothing | $\approx F_s/M$ | Controlled by window | 1 FFT + autocorr |

**Welch is the default** in practice: it gives a consistent, low-leakage estimate with a single parameter (segment length) to tune.

---

## Worked Example: Resolving Two Tones

Two tones at 100 Hz and 110 Hz, $F_s=1000$ Hz, $N=1000$ samples.

**Resolution needed:** $\Delta f=10$ Hz.

**Periodogram:** resolution $F_s/N=1$ Hz, so the tones are resolvable — but the estimate is noisy, with $\operatorname{std}\approx P$.

**Bartlett with $K=10$:** each segment $L=100$, resolution $F_s/L=10$ Hz. The tones are **just barely** resolvable, and the variance is 10× lower. Any more averaging and they merge.

**Welch with $L=256$, 50% overlap:** resolution $\approx3.9$ Hz, about 7 segments. Both tones resolved with much lower variance. This is why Welch is the practical choice for this kind of measurement.

**Lesson:** if you need both resolution and low variance, you need **more data**, not a better algorithm. The uncertainty principle of spectrum estimation is as firm as the one in time–frequency analysis.

---

## Practical Code

```python
import numpy as np
from scipy.signal import welch, periodogram

fs = 1000
t = np.arange(0, 2, 1/fs)
x = np.cos(2*np.pi*100*t) + np.cos(2*np.pi*110*t) + 0.1*np.random.randn(len(t))

# Periodogram: noisy
f1, P1 = periodogram(x, fs=fs)

# Welch: smooth, overlapping, windowed
f2, P2 = welch(x, fs=fs, nperseg=256, noverlap=128, window='hann')
```

Plot both on a dB scale and the difference is immediate: the periodogram looks like grass; the Welch estimate shows two clean peaks.

---

## Summary

1. The periodogram is $\vert X\vert^2/N$; it is asymptotically unbiased but its variance never shrinks with $N$.
2. Bartlett averages non-overlapping periodograms: variance drops by $K$, resolution degrades by $K$.
3. Welch overlaps and windows the segments — the practical default.
4. Blackman–Tukey smooths the periodogram with a lag window; it is frequency-domain smoothing by another name.
5. Every nonparametric method trades resolution for variance; only more data improves both.

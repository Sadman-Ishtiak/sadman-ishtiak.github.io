---
title: "Goertzel Algorithm, Chirp-Z Transform, and the DCT"
date: 2026-02-26 00:00:00 +0600
categories: ['Academic', 'CSE-409 Digital Signal Processing']
tags: ['dsp', 'dft', 'fft', 'dct', 'algorithms', 'academic', 'cse409', 'cse410', 'jkkniu']
description: Computing a few DFT bins with one resonator per bin, evaluating the z-transform on arbitrary contours, and the cosine transform behind JPEG and MP3.
math: true
---
## The Goertzel Algorithm

The FFT computes **all** $N$ bins in $O(N\log N)$. If you only need **one** bin — a DTMF digit, a single tone detector — the FFT is wasteful. Goertzel computes a single bin in $O(N)$ with one real multiply and two adds per sample.

### Derivation

Start from the DFT and multiply by the trivial factor $W_N^{-kN}=1$:

$$X[k]=W_N^{-kN}\sum_{m=0}^{N-1}x[m]W_N^{km}=\sum_{m=0}^{N-1}x[m]W_N^{-k(N-m)}$$

Define the convolution

$$y_k[n]=\sum_{m=0}^{N-1}x[m]W_N^{-k(n-m)}$$

Then $X[k]=y_k[N]$. The filter has impulse response

$$h_k[n]=W_N^{-kn}u[n]$$

and system function

$$H_k(z)=\frac{1}{1-W_N^{-k}z^{-1}}$$

This is a **single-pole resonator** with its pole exactly at the DFT frequency $W_N^k$ on the unit circle. The DFT is therefore a bank of $N$ such resonators, one per bin.

### The Two-Pole Real Form

A single complex pole needs complex arithmetic. Pair $k$ with $N-k$ to get a real second-order section:

$$H_k(z)=\frac{1-W_N^{k}z^{-1}}{1-2\cos(2\pi k/N)z^{-1}+z^{-2}}$$

The difference equations are

$$v_k[n]=2\cos\!\left(\frac{2\pi k}{N}\right)v_k[n-1]-v_k[n-2]+x[n]$$

$$y_k[n]=v_k[n]-W_N^{k}v_k[n-1]$$

with $v_k[-1]=v_k[-2]=0$. Iterate the first equation for $n=0,1,\dots,N$; evaluate the second **once** at $n=N$.

$$X[k]=y_k[N]$$

Only **one real multiply** ($2\cos(2\pi k/N)$ is precomputed) and two additions per sample. For a real input, the same run gives both $X[k]$ and $X[N-k]$ because they are conjugates.

### Cost

| Method | Real multiplications for all $N$ bins | For $M$ bins |
|---|---|---|
| Direct DFT | $4N^2$ | $4NM$ |
| Radix-2 FFT | $\approx 2N\log_2N$ | $\approx 2N\log_2N$ |
| Goertzel | $N^2$ | $NM$ |

Goertzel wins when $M<\log_2N$ — exactly the condition stated in Proakis. For a DTMF decoder that detects 8 tones out of 205 samples, Goertzel is clearly cheaper.

### Worked Example

Detect the bin $k=2$ of an $N=8$ signal. The coefficient is

$$2\cos\frac{4\pi}{8}=2\cos\frac{\pi}{2}=0$$

so the recursion collapses to

$$v[n]=-v[n-2]+x[n]$$

For $x=\{1,0,0,0,0,0,0,0\}$: $v[0]=1$, $v[1]=0$, $v[2]=-1$, $v[3]=0$, $v[4]=1$, … and

$$X[2]=v[8]-W_8^2v[7]=1-e^{-j\pi/2}\cdot0=1$$

which matches the direct DFT of an impulse: $X[k]=1$ for all $k$ ✓.

### Goertzel in Code

```python
import numpy as np

def goertzel(x, k):
    N = len(x)
    w = 2 * np.pi * k / N
    coeff = 2 * np.cos(w)
    v1 = v2 = 0.0
    for sample in x:
        v0 = coeff * v1 - v2 + sample
        v2, v1 = v1, v0
    # final complex output
    return v1 - np.exp(-1j * w) * v2
```

---

## The Chirp-Z Transform

The DFT evaluates $X(z)$ at $N$ equally spaced points **on the unit circle**. Sometimes you need:

- a finer grid (zoom FFT),
- a contour of radius $r\ne1$,
- an arc rather than the full circle,
- more or fewer than $N$ output points.

The **chirp-z transform (CZT)** evaluates

$$X(z_k)=\sum_{n=0}^{N-1}x[n]z_k^{-n},\qquad k=0,1,\dots,L-1$$

on the contour

$$z_k=A\,W^{-k}$$

where $A=A_0e^{j\theta_0}$ sets the starting point and $W=W_0e^{-j\phi_0}$ sets the spacing. The name comes from the quadratic phase — the same shape as a chirp signal.

### Making It an FFT

Substitute $z_k$ and use the identity

$$nk=\tfrac12\left[n^2+k^2-(k-n)^2\right]$$

Then

$$X(z_k)=W^{k^2/2}\sum_{n=0}^{N-1}\left(x[n]A^{-n}W^{n^2/2}\right)W^{-(k-n)^2/2}$$

The sum is a **convolution** of a pre-chirped input with a chirp kernel. Both can be computed with FFTs, so the CZT costs $O((N+L)\log(N+L))$ instead of $O(NL)$.

```
x[n] ──► ×A⁻ⁿW^{n²/2} ──► * h[n] ──► ×W^{k²/2} ──► X(z_k)
                          (via FFT)
```

### What the CZT Buys You

| Feature | DFT | CZT |
|---|---|---|
| Contour | unit circle only | any circle/arc/spiral |
| Radius | 1 | arbitrary $A_0,W_0$ |
| Number of output points | $N$ | any $L$ |
| Frequency spacing | $2\pi/N$ only | arbitrary |
| Zoom into a band | zero-pad / resample | direct, no resampling |
| Cost | $N\log N$ | $(N+L)\log(N+L)$ |

**Applications:** narrowband spectral zoom without resampling, pole-zero analysis near the unit circle, and evaluating the Z-transform on a contour chosen to expose a resonance.

---

## The Discrete Cosine Transform

The DFT of a real signal is complex and has a discontinuity at the block edges when you process blocks independently. The **DCT** fixes both problems: it is real, and its even extension makes the signal continuous across block boundaries, so energy compacts into few coefficients.

### DCT-II (the standard one)

$$C[k]=\alpha(k)\sum_{n=0}^{N-1}x[n]\cos\left[\frac{\pi(2n+1)k}{2N}\right],\qquad k=0,1,\dots,N-1$$

with

$$\alpha(0)=\sqrt{\frac1N},\qquad \alpha(k)=\sqrt{\frac2N}\ \text{ for } k\ge1$$

### Inverse DCT

$$x[n]=\sum_{k=0}^{N-1}\alpha(k)C[k]\cos\left[\frac{\pi(2n+1)k}{2N}\right],\qquad n=0,\dots,N-1$$

The pair is orthonormal: the forward and inverse use the **same** matrix, transposed. No $1/N$ asymmetry like the DFT.

### How the DCT Relates to the DFT

Construct the $2N$-point **even-symmetric extension**

$$s[n]=\begin{cases}x[n], & 0\le n\le N-1\\ x[2N-n-1], & N\le n\le 2N-1\end{cases}$$

It is symmetric about the **half-sample point** $n=N-\tfrac12$. Then

$$C[k]=\operatorname{Re}\left\{W_{2N}^{k/2}\,S[k]\right\}$$

where $S[k]$ is the $2N$-point DFT of $s[n]$. So the DCT is a $2N$-point DFT of a symmetrized signal, keeping only the real part.

Practical recipe:

1. Build the $2N$-point even extension.
2. Take the $2N$-point FFT.
3. Multiply by $e^{-j\pi k/(2N)}$.
4. Keep the real part.

The symmetry makes $S[k]$ Hermitian, so the result is real and only $N$ distinct values emerge.

### The DCT Matrix

$$C_{kn}=\alpha(k)\cos\left[\frac{\pi(2n+1)k}{2N}\right]$$

$$\mathbf{C}\mathbf{C}^T=\mathbf{I}$$

The rows are orthogonal cosine basis vectors. Column 0 is constant (DC), column 1 is a half-cycle cosine, column 2 a full cycle, and so on — increasing "frequency" in cosine form.

### Why DCT Beats DFT for Compression

| Property | DFT | DCT |
|---|---|---|
| Output | complex | real |
| Boundary discontinuity | yes (periodic wrap) | no (even extension) |
| Energy compaction | good | **better** |
| Leakage at block edges | severe | minimal |
| Used in | spectral analysis | JPEG, MP3, MPEG, H.264 |

The reason is the even extension: a smooth signal extended symmetrically has no jump at the block boundary, so the spectrum decays faster. Fewer coefficients need to be kept for the same quality, which is exactly what a codec wants.

**JPEG** uses $8\times8$ DCT blocks and quantizes the coefficients; the DC and a few low-frequency terms survive. **MP3/AAC** use an MDCT (modified DCT) with overlapping windows to avoid block artifacts.

### DCT in Code

```python
import numpy as np
from scipy.fft import dct, idct

x = np.array([1.0, 2.0, 3.0, 4.0])
c = dct(x, type=2, norm='ortho')     # forward DCT-II
xr = idct(c, type=2, norm='ortho')   # exact inverse
```

The `norm='ortho'` option is what makes the transform orthonormal (the $\alpha(k)$ factors above).

---

## Choosing Between the Three

| Task | Tool |
|---|---|
| Full spectrum, general purpose | FFT |
| A handful of bins (DTMF, tone detection) | Goertzel |
| Zoom into a band / arbitrary contour | Chirp-Z |
| Compression, real coefficients, block processing | DCT |

---

## Summary

1. Goertzel is a single-bin DFT as a resonator: one real multiply and two adds per sample, $O(N)$ per bin.
2. Goertzel beats the FFT when the number of wanted bins is below $\log_2N$.
3. The chirp-z transform evaluates the Z-transform on any circle or arc by turning the sum into a convolution with a chirp.
4. The DCT is the real part of the $2N$-point DFT of an even-symmetric extension.
5. DCT energy compaction and absence of block-edge discontinuity make it the transform of choice for compression.

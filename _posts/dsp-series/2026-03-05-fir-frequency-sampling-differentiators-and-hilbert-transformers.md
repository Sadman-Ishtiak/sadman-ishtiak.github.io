---
title: "FIR Design by Frequency Sampling, Differentiators, and Hilbert Transformers"
date: 2026-03-05 00:00:00 +0600
categories: ['Academic', 'CSE-409 Digital Signal Processing']
tags: ['dsp', 'fir-filters', 'filter-design', 'hilbert', 'differentiator', 'academic', 'cse409', 'cse410', 'jkkniu']
description: Designing an FIR directly from desired frequency samples, the ideal differentiator and Hilbert transformer, and when each FIR design method is the right choice.
math: true
---
## The Frequency-Sampling Design Method

Instead of starting from an ideal impulse response and windowing it, specify the desired response **at $N$ equally spaced frequencies** and take the inverse DFT.

$$H[k]=H(e^{j2\pi k/N}),\qquad k=0,1,\dots,N-1$$

$$h[n]=\frac{1}{N}\sum_{k=0}^{N-1}H[k]e^{j2\pi kn/N}$$

The resulting filter has exactly the specified response **at the sample frequencies**. Between the samples, the response is the DFT interpolation of those values.

### Linear Phase Built In

Choose the samples to satisfy the symmetry of a linear-phase FIR:

$$H[k]=\vert H[k]\vert e^{-j2\pi k(N-1)/(2N)},\qquad \vert H[k]\vert=\vert H[N-k]\vert$$

For a Type I filter (odd length, symmetric), this gives

$$h[n]=\frac{1}{N}\left[H[0]+2\sum_{k=1}^{(N-1)/2}\vert H[k]\vert\cos\left(\frac{2\pi k(n-\alpha)}{N}\right)\right]$$

with $\alpha=(N-1)/2$.

### The Problem: Ripple Between Samples

The response between the specified points is **not** controlled. It oscillates, and the ripple is worst in the transition band. The standard fix is to leave a few **transition samples** unconstrained and let the optimizer or a window pick them.

| Design choice | Effect |
|---|---|
| More samples | Narrower transition, but more ripple |
| Transition samples optimized | Lower ripple |
| Window the resulting $h[n]$ | Smooths the between-sample behaviour |
| Increase $N$ | Always helps both |

### Why Use It

- Direct control of the response at chosen frequencies.
- Natural when the specification is already a set of frequency points.
- Efficient when only a few nonzero samples are needed (e.g. a comb filter).
- Easy to build **recursive** frequency-sampling structures for a small number of nonzero $H[k]$.

### Why Not Use It

- Poor control between samples.
- Window method and Parks–McClellan give better equiripple behaviour for the same length.
- The design is sensitive to the choice of transition samples.

### Frequency-Sampling vs Window vs Parks–McClellan

| Aspect | Frequency sampling | Window | Parks–McClellan |
|---|---|---|---|
| Specification | Frequency points | Ideal $h[n]$ + window | Pass/stop bands + ripple |
| Ripple control | Poor between samples | Fixed by window | **Equiripple, optimal** |
| Transition width | Set by sample spacing | Set by window length | Set by order and ripple |
| Design effort | Low | Low | Iterative (Remez) |
| Best for | Arbitrary sampled responses | Simple lowpass/highpass | Strict specifications |

---

## FIR Differentiators

The ideal differentiator has frequency response

$$H_d(e^{j\omega})=j\omega,\qquad -\pi\le\omega\le\pi$$

Magnitude increases linearly with frequency, phase is $+90^\circ$ for positive frequencies.

### Ideal Impulse Response

$$h_d[n]=\frac{1}{2\pi}\int_{-\pi}^{\pi}j\omega\,e^{j\omega n}\,d\omega=\begin{cases}\dfrac{\cos(\pi n)}{n}, & n\ne0\\[6pt]0, & n=0\end{cases}$$

which simplifies to

$$h_d[n]=\frac{(-1)^n}{n}\ \text{ for } n\ne0,\qquad h_d[0]=0$$

### Properties of the Ideal Differentiator

- **Antisymmetric:** $h_d[-n]=-h_d[n]$, so it is a Type III or Type IV linear-phase filter.
- **Zero at DC:** $H_d(e^{j0})=0$. A differentiator removes constants, as it must.
- **Noncausal and infinite:** must be truncated and shifted.

### Practical Design

1. Truncate $h_d[n]$ to $\pm M$ and apply a window.
2. Shift by $M$ to make it causal.
3. The result is a Type III (odd length) or Type IV (even length) filter.

**Example.** Length 5 ($M=2$), Hamming window:

$$h_d[n]=\left\{\frac{1}{2},0,-\frac{1}{2}\right\}\text{ (before windowing, centred)}$$

The frequency response approximates $j\omega$ at low frequencies and deviates near Nyquist, where the ideal slope cannot be matched by a short filter.

### The Low-Frequency Limitation

A short differentiator is accurate only at **low frequencies**. The error grows toward $\pi$ because the ideal response is unbounded in slope. For wideband differentiation you need a long filter, or you accept the error.

### The Noise Problem

Differentiation amplifies high frequencies, and noise is usually concentrated there. A practical differentiator is always preceded by a lowpass that limits the band before the derivative. That is exactly what a **Savitzky–Golay** filter does: it fits a low-order polynomial and differentiates the fit.

---

## FIR Hilbert Transformers

The ideal Hilbert transformer is an **all-pass with a $90^\circ$ phase shift**:

$$H_H(e^{j\omega})=\begin{cases}-j, & 0<\omega<\pi\\ +j, & -\pi<\omega<0\end{cases}$$

Equivalently,

$$\vert H_H(e^{j\omega})\vert=1,\qquad \angle H_H(e^{j\omega})=-\frac{\pi}{2}\operatorname{sgn}(\omega)$$

### Ideal Impulse Response

$$h_H[n]=\begin{cases}\dfrac{2}{\pi}\dfrac{\sin^2(\pi n/2)}{n}, & n\ne0\\[6pt]0, & n=0\end{cases}$$

which is

$$h_H[n]=\begin{cases}\dfrac{2}{\pi n}, & n \text{ odd}\\[6pt]0, & n \text{ even}\end{cases}$$

### Properties

- **Antisymmetric:** $h_H[-n]=-h_H[n]$.
- **Zero at DC and at Nyquist:** $H_H(e^{j0})=H_H(e^{j\pi})=0$.
- **Odd taps only:** every even-indexed coefficient is zero — the same halfband sparsity as the halfband filter.
- **Noncausal:** must be truncated, windowed, and shifted.

### What It Is Used For

The Hilbert transformer produces the **quadrature** component of a real signal, which lets you build the **analytic signal**:

$$x_a[n]=x[n]+j\hat x[n]$$

where $\hat x[n]$ is the Hilbert transform of $x[n]$. The analytic signal has no negative-frequency content, so it can be decimated by 2 without aliasing — the basis of **single-sideband (SSB) modulation**.

| Application | Role of the Hilbert transformer |
|---|---|
| **SSB modulation** | Generate the quadrature carrier component |
| **Envelope detection** | $\vert x_a[n]\vert$ is the instantaneous envelope |
| **Instantaneous frequency** | $\frac{d}{dn}\angle x_a[n]$ |
| **Quadrature downconversion** | I and Q channels without an analog $90^\circ$ hybrid |
| **Audio phasing effects** | Frequency-dependent phase shift |

### Design

1. Truncate the ideal $h_H[n]$ to length $N$ (odd).
2. Apply a window (Hamming is common).
3. Shift by $(N-1)/2$ to make it causal.

The approximation error is largest near DC and near Nyquist, because the ideal response has a discontinuity at $\omega=0$ and $\omega=\pi$. A practical Hilbert transformer is specified over a band $[\omega_L,\pi-\omega_L]$, not the whole Nyquist range.

### Hilbert Transformer vs Halfband

Both have zero even taps. The difference is the response:

| Filter | Even taps | Passband | Stopband |
|---|---|---|---|
| Halfband lowpass | zero | $[0,\pi/2]$ | $[\pi/2,\pi]$ |
| Hilbert | zero | none (all-pass magnitude) | none |

They share the sparsity but not the magnitude shape.

---

## Design Method Comparison

| Method | Best for | Ripple | Transition | Cost |
|---|---|---|---|---|
| **Window** | Simple lowpass/highpass/bandpass | Fixed by window | Moderate | Low, closed form |
| **Frequency sampling** | Arbitrary sampled response | Uncontrolled | Moderate | Low |
| **Parks–McClellan** | Strict equiripple specs | Optimal | Minimal for the ripple | Iterative |
| **Least squares** | Minimum integrated error | Controlled | Good | Linear solve |
| **Differentiator** | Derivative estimation | — | Low-frequency accurate | Window or LS |
| **Hilbert** | $90^\circ$ phase shift | — | Band-limited | Window or LS |

### Choosing in Practice

1. **Standard lowpass/highpass with a moderate spec:** window method. One line of code, predictable result.
2. **Tight ripple spec, minimum length:** Parks–McClellan (`firpm`/`remez`).
3. **Response given at specific frequencies:** frequency sampling.
4. **Minimum total squared error:** least squares (`firls`).
5. **Derivative or quadrature:** design the ideal response, window it, and accept the band-edge error.

### MATLAB / Python

```matlab
% Window method lowpass
h = fir1(64, 0.3, 'low', hamming(65));

% Parks-McClellan
h = firpm(64, [0 0.25 0.3 1], [1 1 0 0]);

% Frequency sampling
h = fir2(64, [0 0.25 0.3 1], [1 1 0 0]);

% Least squares
h = firls(64, [0 0.25 0.3 1], [1 1 0 0]);

% Differentiator
h = firpm(64, [0 0.4 0.5 1], [0 0.4*pi 0 0], 'differentiator');

% Hilbert transformer
h = firpm(64, [0.05 0.95], [1 1], 'hilbert');
```

```python
import numpy as np
from scipy.signal import firwin, remez, firwin2, firls

h_win  = firwin(65, 0.3)                                  # window
h_pm   = remez(65, [0, 0.25, 0.3, 0.5], [1, 0])          # Parks-McClellan
h_fs   = firwin2(65, [0, 0.25, 0.3, 0.5], [1, 1, 0, 0])  # frequency sampling
h_ls   = firls(65, [0, 0.25, 0.3, 0.5], [1, 1, 0, 0])    # least squares
```

---

## Worked Example: Differentiator Check

Design a 5-tap differentiator with a rectangular window and check the response at low frequency.

$$h_d[n]=\frac{(-1)^n}{n}\ \text{ for } n=\pm1,\pm2$$

$$h[-2]=\frac{1}{2},\quad h[-1]=-1,\quad h[0]=0,\quad h[1]=1,\quad h[2]=-\frac{1}{2}$$

Shift to causal ($n=0..4$): $h=\{1/2,-1,0,1,-1/2\}$ — wait, the shift by 2 gives

$$h=\{h[-2],h[-1],h[0],h[1],h[2]\}=\left\{\tfrac12,-1,0,1,-\tfrac12\right\}$$

which is antisymmetric about the centre tap, as required.

Frequency response:

$$H(e^{j\omega})=\sum_{n=0}^{4}h[n]e^{-j\omega n}$$

At low $\omega$, expand $e^{-j\omega n}\approx1-j\omega n$:

$$H\approx\sum h[n]-j\omega\sum n\,h[n]$$

The first sum is zero (antisymmetry), and the second gives the slope. Computing:

$$\sum n\,h[n]=0\cdot\tfrac12+1\cdot(-1)+2\cdot0+3\cdot1+4\cdot(-\tfrac12)=-1+3-2=0$$

Hmm — that gives zero slope at DC, which is wrong for a differentiator. The issue is the causal shift: the **centred** filter has the right slope, and the shift only adds a linear phase. Evaluate the centred version:

$$\sum n\,h_c[n]=(-2)(\tfrac12)+(-1)(-1)+0+1(1)+2(-\tfrac12)=-1+1+1-1=0$$

Still zero. The reason is that this 5-tap truncation is too short: the rectangular window of length 5 has a response whose derivative at DC is not exactly 1. A real design uses a window (Hamming) and a longer length, and the DC slope is close to 1 but not exact. This is the practical lesson: **short differentiators are inaccurate even at low frequency**, and the accuracy is checked numerically, not analytically by hand.

For the exam, the expected answer is the coefficient set and the statement that it is antisymmetric, Type III, and approximates $j\omega$.

---

## Summary

1. Frequency sampling designs an FIR from desired values at $N$ equally spaced frequencies; the between-sample response is uncontrolled.
2. The ideal differentiator is $H=j\omega$ with $h[n]=(-1)^n/n$ — antisymmetric and zero at DC.
3. The ideal Hilbert transformer is an all-pass with a $90^\circ$ phase shift and $h[n]=2/(\pi n)$ for odd $n$.
4. Both are noncausal and infinite; truncate, window, and shift.
5. Window method for simple specs, Parks–McClellan for optimal equiripple, least squares for minimum integrated error, frequency sampling for arbitrary response points.

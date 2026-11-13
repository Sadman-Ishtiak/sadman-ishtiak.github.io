---
title: "Signal Classifications in DSP"
date: 2026-01-02 00:00:00 +0600
categories: ['Academic', 'CSE-409 Digital Signal Processing']
tags: ['dsp', 'signals', 'fundamentals', 'academic', 'cse409', 'cse410', 'jkkniu']
description: 'The full taxonomy of signals: time, amplitude, dimensionality, channels, predictability and stationarity, with DSP examples.'
math: true
---
## Signal Classification: The Taxonomy of DSP

Before we can process signals, we must understand their nature. Signals fall into several fundamental categories:

| Classification | Description | Examples |
|---|---|---|
| **Continuous-Time vs Discrete-Time** | Defined for all time vs. only at discrete instants | Analog audio vs. sampled digital audio |
| **Continuous-Valued vs Discrete-Valued** | Any amplitude value vs. restricted to finite levels | Analog voltage vs. quantized digital values |
| **Deterministic vs Random** | Predictable by formula vs. requiring probability theory | Sine wave vs. speech/noise |
| **Stationary vs Non-Stationary** | Constant statistical properties vs. changing over time | Pure tone vs. speech/music |
| **1D vs Multidimensional** | Single independent variable vs. multiple | Audio (time) vs. Image (x,y) |
| **Single-Channel vs Multichannel** | One source vs. multiple simultaneous sources | Mono audio vs. 3-lead ECG |

---

## Multichannel and Multidimensional Signals

These two labels are often confused because both involve more than one number per sample.

A **multichannel** signal has several measurements of the same independent variable, one per channel. At each time index $n$ you get a vector:

$$\mathbf{x}[n]=\begin{bmatrix}x_1[n]\\x_2[n]\\\vdots\\x_M[n]\end{bmatrix}$$

Examples: a stereo recording (two channels), a 3-lead ECG, a 12-lead ECG, or the array output of a microphone array. The channels are processed jointly when the application needs spatial information: beamforming, source separation, or noise cancellation with a reference channel.

A **multidimensional** signal is a function of more than one independent variable:

$$f[m,n]\quad\text{(image)},\qquad f[m,n,t]\quad\text{(video)},\qquad f(x,y,z)\quad\text{(volume)}$$

Here the indices are coordinates, not channels. A grey image is one channel but two dimensions; a colour image is three channels (R, G, B) and two dimensions. That combination is why image processing talks about both "multispectral" (channels) and "2-D" (dimensions).

The distinction matters for implementation: multichannel data usually shares one time base, so the same filter can run on each channel or a coupled adaptive filter can exploit cross-channel correlation. Multidimensional data needs 2-D or 3-D filters whose impulse response is a surface or a volume, and whose stability conditions are different from the 1-D case.

---

## Continuous-Valued versus Discrete-Valued

The time axis and the amplitude axis are independent choices:

- **Continuous-time, continuous-valued:** the original analog signal $x_a(t)$.
- **Discrete-time, continuous-valued:** a sampled-data signal $x[n]=x_a(nT)$ before quantization.
- **Discrete-time, discrete-valued:** a digital signal, after quantization and coding.
- **Continuous-time, discrete-valued:** rare in practice, but possible (for example a switched level that can change at any instant).

A sequence $x[n]$ is called a **real sequence** if every sample is real and a **complex sequence** if the samples are complex. Complex sequences are written as $x[n]=x_{re}[n]+jx_{im}[n]$, and their conjugate is $x^{*}[n]=x_{re}[n]-jx_{im}[n]$. Complex notation is standard in the frequency domain even when the time-domain signal is real.

Read more: [Discrete-Time Signal Representations and Sequence Types](/posts/discrete-time-signal-representations-and-sequence-types/).

---

## Deterministic versus Random Signals

A **deterministic** signal is completely specified by a formula: $x[n]=A\cos(\omega_0 n+\phi)$, a unit step, or a known pulse. Its future values can be computed exactly.

A **random** signal is described statistically: thermal noise, speech, EEG, or market prices. We can specify its mean, variance, autocorrelation, and power spectral density, but not its exact next sample. Random signals are the reason the series has posts on [stationarity](/posts/stationary-vs-non-stationary-signals/), [statistics](/posts/statistical-description-of-signals-mean-and-variance/), and [spectrum estimation](/posts/nonparametric-spectrum-estimation-periodogram-bartlett-welch/).

---

## Stationarity in One Line

A **stationary** signal keeps its statistical description constant over time, so a mean or autocorrelation estimated from one segment applies to the next. A **non-stationary** signal changes its statistics: speech switches phonemes, music changes notes, and a machine changes speed. Most real signals are non-stationary over long windows, which is why practical analysis uses short frames and assumes local stationarity.

Read more: [Stationary vs Non-Stationary Signals](/posts/stationary-vs-non-stationary-signals/).

---

## Energy, Power and Symmetry

Two more classifications cut across all of the above:

- **Energy signal:** finite total energy, zero average power; example $x[n]=a^n u[n]$ with $\vert a\vert<1$.
- **Power signal:** finite nonzero average power, infinite energy; example a sinusoid or a periodic sequence.

- **Even (symmetric):** $x[-n]=x[n]$.
- **Odd (anti-symmetric):** $x[-n]=-x[n]$.

Every signal splits uniquely into an even and an odd part, $x[n]=x_e[n]+x_o[n]$. This symmetry classification is what makes the DTFT of a real signal have conjugate symmetry.

Read more: [Energy, Power and Signal Symmetries](/posts/energy-power-and-signal-symmetries/).
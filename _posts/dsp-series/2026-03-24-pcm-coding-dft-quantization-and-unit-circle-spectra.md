---
title: "PCM Coding, DFT Quantization Errors, and Unit-Circle Spectra"
date: 2026-03-24 00:00:00 +0600
categories: ['Academic', 'CSE-409 Digital Signal Processing']
tags: ['dsp', 'quantization', 'pcm', 'dft', 'sampling', 'cse409', 'jkkniu']
description: Proakis 1.4.5, 8.4, 4.2.8 and 6.2 - PCM and companding, quantization errors in DFT/FFT computation, DTFT of unit-circle poles, and discrete-time processing of continuous-time signals.
math: true
---

## Four Loose Ends

The series already covers quantization, the DFT, and reconstruction. Four details from Proakis are easy to skip and hard to reconstruct from memory:

1. How quantized samples become bits (PCM and companding).
2. How finite word length corrupts a DFT or FFT computation.
3. What a DTFT means when a pole sits exactly on the unit circle.
4. How a discrete-time system inserted between an ADC and a DAC behaves as a continuous-time filter.

---

## Coding of Quantized Samples (Proakis 1.4.5)

After sampling and quantization, each level must be represented by a binary word. The complete chain is **PCM: pulse code modulation**.

### Bit rate

With $B$ bits per sample and sampling rate $F_s$, the bit rate is

$$R=B F_s\ \text{bits/s}$$

Two reference numbers:

- Telephone PCM: $F_s=8$ kHz, $B=8$ bits, so $R=64$ kbit/s.
- Compact disc: $F_s=44.1$ kHz, $B=16$ bits, stereo, so $R=44{,}100\times16\times2=1.4112$ Mbit/s.

### Companding

A uniform quantizer gives the same absolute error at every amplitude, so the **relative** error is much worse for quiet passages than for loud ones. Speech has a wide dynamic range, so telephone systems compress the signal before quantization and expand it after reconstruction. The pair is called **companding**.

The two standard curves are:

**$\mu$-law** (North America, Japan):

$$y=\operatorname{sgn}(x)\frac{\ln(1+\mu\vert x\vert)}{\ln(1+\mu)},\qquad \mu=255$$

**A-law** (Europe):

$$y=\operatorname{sgn}(x)\begin{cases}\dfrac{A\vert x\vert}{1+\ln A},&\vert x\vert<\dfrac{1}{A}\\[6pt] \dfrac{1+\ln(A\vert x\vert)}{1+\ln A},&\dfrac{1}{A}\le\vert x\vert\le1\end{cases}$$

with $A=87.6$.

Both curves boost small amplitudes before quantization, so the step size in the original amplitude is small where the signal is quiet. The result is nearly constant SQNR over a 30–40 dB input range instead of the 6 dB per bit of a uniform quantizer.

### DPCM and ADPCM

PCM encodes each sample independently. **Differential PCM** encodes the prediction error

$$e[n]=x[n]-\hat{x}[n]$$

where $\hat{x}[n]$ is a prediction from past samples. Because neighbouring samples are correlated, $e[n]$ has a much smaller variance than $x[n]$, so fewer bits give the same quality. **Adaptive DPCM** also adapts the quantizer step to the local signal level; it is the basis of telephony codecs such as G.726.

---

## Quantization Effects in DFT and FFT Computation (Proakis 8.4)

The DFT is exact in real arithmetic. In fixed-point hardware, three separate errors appear: input quantization, coefficient (twiddle) quantization, and round-off in the arithmetic.

### Direct DFT

For

$$X[k]=\sum_{n=0}^{N-1}x[n]W_N^{nk}$$

model the input quantization error as white noise of variance $\sigma_e^2$. Each output is a sum of $N$ terms, so the output noise variance is

$$\sigma_X^2=N\sigma_e^2$$

For a real sinusoid of amplitude $A$ that falls exactly on bin $k_0$, the peak magnitude is approximately $AN/2$. The output signal power is $A^2N^2/4$, so

$$\text{SNR}_{\text{out}}=\frac{A^2N^2/4}{N\sigma_e^2}=\frac{NA^2}{4\sigma_e^2}$$

The time-domain SNR is $A^2/(2\sigma_e^2)$, so the DFT gives a **processing gain** of

$$10\log_{10}\frac{N}{2}\ \text{dB}$$

That is 3 dB per doubling of $N$: a longer transform pulls a coherent tone out of broadband noise.

### Twiddle-factor quantization

$W_N^{k}=e^{-j2\pi k/N}$ must be stored with finite precision. If the coefficients are quantized to $B_c$ bits, each butterfly multiplies by a slightly wrong phase and amplitude. The result is a noise floor plus a small frequency-dependent bias.

A practical rule is to keep the coefficient word length a few bits longer than the data word length, roughly

$$B_c\ge B+\log_2 N$$

so that coefficient noise stays below the input quantization noise. Below that, increasing the data word length stops improving the result, because the twiddle table becomes the limiting error source.

### Round-off in the FFT

The FFT performs $\log_2 N$ stages, each with $N/2$ butterflies. Every butterfly rounds a complex product and a complex sum, so the round-off noise accumulates. With a fixed scaling of $1/2$ per stage, the output noise-to-signal ratio grows roughly as

$$\frac{\sigma_{\text{out}}^2}{\sigma_x^2}\propto \log_2 N$$

so each doubling of the transform length costs a fraction of a bit of effective precision. Floating-point arithmetic hides this because the exponent absorbs the growth, but its mantissa still rounds.

### Overflow and scaling

In fixed point, the DFT can grow by a factor of $N$: a full-scale input can produce $N$ times full scale at DC. Two standard defences:

- **Scale by $1/2$ at every stage.** Guarantees no overflow, but throws away one bit of SNR per stage.
- **Block floating point.** Share one exponent per block and rescale only when needed; keeps most of the dynamic range without per-stage loss.

Overflow is worse than rounding: it wraps the sign and creates a large spurious component, whereas rounding only adds noise. Any fixed-point FFT needs an explicit scaling policy.

---

## DTFT of Signals with Poles on the Unit Circle (Proakis 4.2.8)

The Z-transform of $u[n]$ is

$$U(z)=\frac{1}{1-z^{-1}},\qquad\vert z\vert>1$$

The ROC does not include the unit circle, so the ordinary DTFT does not converge. It still exists as a **generalized function**:

$$U(e^{j\omega})=\frac{1}{1-e^{-j\omega}}+\pi\sum_{k=-\infty}^{\infty}\delta(\omega-2\pi k)$$

The first term is the ordinary algebraic value on the unit circle; the impulse train accounts for the nonzero average (DC) of the step. Similarly, a constant has a single impulse at $\omega=0$ (plus its periodic copies), and a sinusoid has impulses at $\pm\omega_0$:

$$\cos(\omega_0 n)\;\longleftrightarrow\;\pi\sum_{k=-\infty}^{\infty}\left[\delta(\omega-\omega_0-2\pi k)+\delta(\omega+\omega_0-2\pi k)\right]$$

### Why it matters

- A pole exactly on the unit circle means a **marginally stable** system: the impulse response neither decays nor grows, and the frequency response has an infinite peak (an impulse in the spectrum).
- Numerical evaluation of the DTFT near such a pole produces a very large but finite value; the true response is unbounded.
- This is the mathematical reason a resonator with poles on the unit circle oscillates forever, and why any practical oscillator needs poles just inside the circle or a nonlinear amplitude control.

Read more: [All-Pass Filters, Oscillators and Minimum/Maximum-Phase Systems](/posts/all-pass-filters-oscillators-and-minimum-maximum-phase-systems/).

---

## Discrete-Time Processing of Continuous-Time Signals (Proakis 6.2)

A digital filter placed between an ADC and a DAC is meant to filter the **continuous-time** signal. The equivalence is exact under two conditions: the input is band-limited, and the reconstruction is ideal.

### The chain

```
x_a(t) -> [C/D: sample at T] -> x[n] -> [H(e^{jω})] -> y[n] -> [D/C: ideal reconstruction] -> y_a(t)
```

**C/D** produces $x[n]=x_a(nT)$.

**D/C** produces

$$y_a(t)=\sum_{n=-\infty}^{\infty}y[n]h_r(t-nT)$$

where $h_r(t)=\sin(\pi t/T)/(\pi t/T)$ for ideal band-limited reconstruction.

### Equivalent continuous-time filter

If $x_a(t)$ is band-limited to $\vert\Omega\vert<\pi/T$, then

$$Y_a(j\Omega)=H(e^{j\Omega T})X_a(j\Omega)$$

so the discrete-time system behaves exactly like a continuous-time filter with

$$H_{\text{eff}}(j\Omega)=H(e^{j\Omega T}),\qquad\vert\Omega\vert<\frac{\pi}{T}$$

The digital frequency $\omega$ maps to the analog frequency $\Omega=\omega/T$. This is the bridge that makes digital filtering of analog signals meaningful.

### Practical consequences

- The ADC's anti-alias filter must remove content above $\pi/T$; otherwise the equivalence fails before the digital filter runs.
- A practical DAC is a zero-order hold, whose sinc response droops the high end and creates images at $\Omega_s\pm\Omega$. A reconstruction (anti-imaging) filter after the DAC removes them.
- The same mapping is why the bilinear transform pre-warps frequencies: it is approximating this ideal $\Omega=\omega/T$ relationship with a rational function.

Read more: [Reconstruction, Interpolation, DAC, Bandpass Sampling and Oversampling](/posts/reconstruction-interpolation-dac-bandpass-sampling-and-oversampling/).

---

## Digital versus Discrete-Time System Analysis (Proakis 1.4.7)

Discrete-time system theory assumes infinite-precision numbers. A real digital system adds:

- quantization of the input samples,
- finite word length in coefficients and arithmetic,
- rounding or truncation after every operation.

Those effects make the implemented system **nonlinear and often time-varying**, even when the underlying difference equation is linear and time-invariant. The standard engineering approach is to design in the discrete-time domain first, then analyse finite-word-length effects separately: coefficient sensitivity, round-off noise, limit cycles, and overflow. The post on [number representation and filter structures](/posts/number-representation-quantization-and-filter-structures/) covers those checks.

---

## Summary

| Topic | Key result |
|---|---|
| PCM | $R=BF_s$; 8 kHz × 8 bit = 64 kbit/s |
| Companding | $\mu$-law or A-law; roughly constant SQNR over the voice range |
| DPCM/ADPCM | encode the prediction error, not the sample |
| DFT processing gain | $10\log_{10}(N/2)$ dB for a bin-centred sinusoid |
| Twiddle bits | keep $B_c\ge B+\log_2 N$ |
| FFT round-off | grows with $\log_2 N$ stages |
| Unit-circle pole | DTFT exists only as a generalized function with impulses |
| C/D–D/C | $H_{\text{eff}}(j\Omega)=H(e^{j\Omega T})$ for $\vert\Omega\vert<\pi/T$ |

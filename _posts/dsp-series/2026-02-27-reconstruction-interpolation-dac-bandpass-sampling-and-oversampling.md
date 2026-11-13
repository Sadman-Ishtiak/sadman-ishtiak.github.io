---
title: "Signal Reconstruction, Interpolation, DAC, Bandpass Sampling, and Oversampling"
date: 2026-02-27 00:00:00 +0600
categories: ['Academic', 'CSE-409 Digital Signal Processing']
tags: ['dsp', 'sampling', 'reconstruction', 'adc', 'dac', 'academic', 'cse409', 'cse410', 'jkkniu']
description: Ideal interpolation and sinc reconstruction, zero-order hold and DAC effects, sampling bandpass signals, and how oversampling buys resolution.
math: true
---
## From Samples Back to a Continuous Signal

The sampling theorem promises exact reconstruction, but it does not say how. The answer is **ideal interpolation**: convolve the samples with a sinc kernel.

$$x_a(t)=\sum_{n=-\infty}^{\infty}x[n]\,\operatorname{sinc}\!\left(\frac{t-nT}{T}\right)$$

where

$$\operatorname{sinc}(u)=\frac{\sin(\pi u)}{\pi u}$$

Each sample contributes a sinc centred at $nT$ that is 1 at its own sample and 0 at every other sample. The sum is exact if $F_s>2F_{\max}$.

### Why sinc?

In the frequency domain, reconstruction multiplies the sampled spectrum by an ideal **lowpass** of cutoff $F_s/2$. The impulse response of that brick-wall filter is a sinc. Reconstruction and ideal lowpass filtering are the same operation.

```
Samples ──► Impulse train ──► Ideal LPF (Fc = Fs/2) ──► Continuous signal
```

A real filter cannot be brick-wall, so real reconstruction is approximate — the error is the filter's transition band and stopband.

### The Sinc Has Infinite Support

Exact reconstruction needs every sample, past and future. That is non-causal and impossible online. Practical interpolators use a windowed sinc, a polynomial, or a spline — trading exactness for finite latency.

---

## Zero-Order Hold and the DAC

A digital-to-analog converter cannot output impulses. It outputs a **staircase**: each sample is held for one period $T$. That is a **zero-order hold (ZOH)**.

The ZOH impulse response is a rectangle of width $T$:

$$h_{ZOH}(t)=\begin{cases}1, & 0\le t<T\\0, & \text{otherwise}\end{cases}$$

Its frequency response is

$$H_{ZOH}(f)=T\,e^{-j\pi fT}\operatorname{sinc}(fT)$$

$$=T\,e^{-j\pi fT}\frac{\sin(\pi fT)}{\pi fT}$$

### The sinc Droop

The magnitude $\vert\operatorname{sinc}(fT)\vert$ is **not flat**. At the band edge $f=F_s/2$:

$$\operatorname{sinc}(1/2)=\frac{\sin(\pi/2)}{\pi/2}=\frac{2}{\pi}\approx0.637$$

That is a **−3.92 dB droop** at Nyquist. The ZOH attenuates high frequencies inside the band, which is audible/visible as a dull top end.

### The Images

Sampling creates copies of the spectrum at $kF_s$. The ZOH does not remove them; it only shapes them. A real DAC therefore needs an **analog reconstruction filter** (a "smoothing" or "anti-imaging" filter) after the hold stage to suppress the images.

| Stage | Job |
|---|---|
| Digital interpolation | Raise the rate so images are far from the band |
| ZOH / DAC | Convert to a staircase |
| Analog lowpass | Remove the images and flatten the droop |

**Practical fix for the droop:** a **inverse-sinc** digital filter ahead of the DAC pre-emphasizes the high end so the ZOH droop cancels out.

---

## Bandpass Sampling

You do **not** always need $F_s>2F_{\max}$. If the signal occupies only a band $F_L\le F\le F_H$, you can sample at a much lower rate and let the band alias down to baseband — as long as the shifted copies do not overlap.

### The Condition

Let $B=F_H-F_L$ be the bandwidth. Sampling at $F_s$ is alias-free if

$$\frac{2F_H}{m}\le F_s\le\frac{2F_L}{m-1}$$

for some integer $m$ with

$$1\le m\le\left\lfloor\frac{F_H}{B}\right\rfloor$$

where $m$ is the number of the Nyquist zone the band is folded from.

**Example.** A radar band from 10 MHz to 12 MHz ($B=2$ MHz). Then

$$\left\lfloor\frac{12}{2}\right\rfloor=6$$

so $m$ can be 1 to 6. Choosing $m=6$:

$$\frac{24}{6}=4\le F_s\le\frac{20}{5}=4$$

So $F_s=4$ MHz works — one fifth of the naive $2F_H=24$ MHz.

### Why It Works

Folding by $F_s$ maps the band to

$$F_{\text{base}}=F\bmod F_s$$

and the negative-frequency copy mirrors it. If the band folds into $[0,F_s/2]$ without overlapping its own image, no information is lost. The band is translated, not distorted.

### The Catch

- The **anti-alias filter** must now be a bandpass filter, not a lowpass — often harder to build.
- Any noise or interference **outside** the band but inside a folding zone will alias **into** the band.
- You must know $F_L$ and $F_H$ precisely; a drifted band edge breaks the inequality.

---

## Oversampling

**Oversampling** means sampling well above the Nyquist rate: $F_s=L\cdot2F_{\max}$ with $L\gg1$.

### Oversampling in the ADC

Quantization noise power is spread uniformly over the whole band $[0,F_s/2]$. Its **density** is

$$S_q(f)=\frac{\Delta^2}{12}\cdot\frac{1}{F_s/2}$$

If you oversample and then digitally lowpass to the signal band $B$, you remove most of the noise:

$$P_{q,\text{in-band}}=S_q\cdot2B=\frac{\Delta^2}{12}\cdot\frac{2B}{F_s}$$

With $F_s=2BL$:

$$P_{q,\text{in-band}}=\frac{\Delta^2}{12}\cdot\frac1L$$

So oversampling by $L$ reduces in-band quantization noise power by a factor $L$ — a **$10\log_{10}L$ dB** improvement.

Combined with **noise shaping** (a sigma-delta modulator pushes noise to high frequencies), the improvement becomes much larger — first-order noise shaping gives roughly $9$ dB per doubling, and higher orders give more.

### Oversampling in the DAC

The reverse: interpolate to a high rate so the images land far above the band and a gentle analog filter can remove them. This is why CD players upsample $44.1$ kHz to $352.8$ kHz or higher before the DAC.

### The SNR Formula

For an ideal $B$-bit ADC with full-scale sine input, the classic result is

$$\text{SQNR}=6.02B+1.76\ \text{dB}$$

Oversampling by $L$ adds

$$10\log_{10}L\ \text{dB}$$

so the **effective number of bits** gained is

$$\Delta B=\frac{10\log_{10}L}{6.02}\approx\frac{L\text{ in dB}}{6.02}$$

Oversampling by 16 ($12$ dB) buys about 2 effective bits. That is why early sigma-delta converters used very high oversampling ratios to reach 16–20 bits from a 1-bit quantizer.

---

## Decimation and Interpolation in the Reconstruction Chain

The full path from analog to analog through digital processing:

```
Analog in
  → anti-alias LPF
  → ADC at Fs
  → digital processing (filter, decimate, interpolate)
  → interpolate to Fdac
  → DAC (ZOH)
  → anti-image LPF
Analog out
```

Every rate change needs a filter:

| Operation | Filter required | Purpose |
|---|---|---|
| Decimation by $M$ | Lowpass at $F_s/(2M)$ **before** downsampling | Prevent aliasing |
| Interpolation by $L$ | Lowpass at $F_s/(2L)$ **after** upsampling | Remove images |
| DAC | Analog lowpass | Remove spectral images |
| ADC | Analog lowpass | Prevent aliasing |

> **The golden rule:** filtering always happens at the **higher** rate. In decimation, filter first (still at the high rate) then throw samples away. In interpolation, insert zeros first then filter.

---

## Worked Example: Reconstruction of a Sampled Cosine

$x_a(t)=3\cos(100\pi t)$, so $F=50$ Hz and $F_s=200$ Hz (from the earlier post). Samples:

$$x[n]=3\cos\left(2\pi\frac{50}{200}n\right)=3\cos\left(\frac{\pi}{2}n\right)$$

$$=\{3,\ 0,\ -3,\ 0,\ 3,\ 0,\ -3,\dots\}$$

Reconstruct:

$$x_a(t)=\sum_n 3\cos\left(\frac{\pi}{2}n\right)\operatorname{sinc}\left(\frac{t-nT}{T}\right)$$

At $t=nT$ only the $n$-th sinc is 1, so the samples are reproduced exactly. Between samples, the sincs add up to the original cosine. Since $F_s=200>2(50)=100$, the reconstruction is exact.

### The Same Signal Undersampled

Sample at $F_s=75$ Hz:

$$x[n]=3\cos\left(2\pi\frac{50}{75}n\right)=3\cos\left(\frac{4\pi}{3}n\right)$$

$\frac{4\pi}{3}$ is above $\pi$, so alias it: $\frac{4\pi}{3}-2\pi=-\frac{2\pi}{3}$. The reconstructed analog frequency is

$$F_{\text{alias}}=\frac{2\pi/3}{2\pi}\cdot75=25\ \text{Hz}$$

The output is $3\cos(50\pi t)$ — **half the original frequency**. That is aliasing, visible as a slow beat in the reconstruction.

---

## Summary

1. Ideal reconstruction is sinc interpolation, equivalent to a brick-wall lowpass at $F_s/2$.
2. A ZOH DAC produces a sinc-shaped droop of −3.92 dB at Nyquist and leaves images that need analog filtering.
3. Bandpass sampling can drop the rate far below $2F_H$ if the folded band does not overlap its image.
4. Oversampling reduces in-band quantization noise by $10\log_{10}L$ dB, about $1.66$ effective bits per doubling.
5. Filter at the higher rate: before decimation, after interpolation.

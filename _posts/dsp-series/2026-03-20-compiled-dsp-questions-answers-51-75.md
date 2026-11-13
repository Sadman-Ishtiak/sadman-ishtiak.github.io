---
title: "Compiled DSP Questions: Answers 51–75 (ADC, Sampling, Z-Transform, DFT and FFT)"
date: 2026-03-20 00:00:00 +0600
categories: ['Academic', 'CSE-409 Digital Signal Processing']
tags: ['dsp', 'questions', 'answers', 'exam-prep', 'cse409', 'jkkniu']
description: Worked answers to questions 51-75 of the compiled CSE-409 DSP question list, with sampling numericals, inverse Z-transform and 8-point DFT.
math: true
---

## How This Post Fits the Series

Questions 51–75 are taken in order from the [Compiled DSP Questions for CSE-409](/posts/dsp-questions/) page. Full derivations live in the linked posts; this page is the revision sheet.

---

## Q51. What is a signal and how is it converted to digital?

A signal is a quantity that varies with time or space and carries information, described mathematically as $x(t)$ or $x[n]$. To digitize it: condition and anti-alias filter the analog voltage, sample it at $F_s\ge2F_{\max}$, quantize each sample to $2^B$ levels, then encode the levels as binary words. The output is a sequence of code words.

Read more: [The DSP Pipeline](/posts/the-dsp-pipeline-from-analog-to-digital/).

## Q52. DSP system block diagram

```
x_a(t) -> [Anti-alias LPF] -> [Sample & Hold] -> [ADC: quantize + encode]
       -> [Digital processor: filter, FFT, detect] -> [DAC]
       -> [Reconstruction LPF] -> y_a(t)
```

The anti-alias filter removes content above $F_s/2$ before sampling. The ADC makes the signal digital. The processor performs the actual DSP algorithm. The DAC and reconstruction filter return the result to continuous time.

Read more: [The DSP Pipeline](/posts/the-dsp-pipeline-from-analog-to-digital/).

## Q53. State the sampling theorem and define the Nyquist rate

**Sampling theorem:** a band-limited signal with highest frequency $F_{\max}$ can be reconstructed exactly from its samples if the sampling frequency satisfies

$$F_s>2F_{\max}$$

The **Nyquist rate** is $2F_{\max}$, the minimum sampling rate that avoids aliasing. The **Nyquist frequency** is $F_s/2$, the highest frequency the sampler can represent at a given $F_s$.

Read more: [Sampling Theorem and Nyquist Rate](/posts/sampling-theorem-and-nyquist-rate/).

## Q54. Graphical representations of $\delta[n]$ and $u[n]$

The unit impulse has a single stem of height 1 at $n=0$ and zero elsewhere:

| $n$ | $-2$ | $-1$ | $0$ | $1$ | $2$ |
|---|---|---|---|---|---|
| $\delta[n]$ | $0$ | $0$ | $1$ | $0$ | $0$ |

The unit step has stems of height 1 for every $n\ge0$:

| $n$ | $-2$ | $-1$ | $0$ | $1$ | $2$ |
|---|---|---|---|---|---|
| $u[n]$ | $0$ | $0$ | $1$ | $1$ | $1$ |

Graphically these are stem plots, not continuous curves. Note $\delta[n]=u[n]-u[n-1]$.

Read more: [Elementary Discrete-Time Sequences](/posts/elementary-discrete-time-sequences/).

## Q55. Continuous-time versus discrete-time signals

Continuous-time signals are defined for every real $t$ and are described by $x(t)$; their amplitude may take any value. Discrete-time signals are defined only at integer indices $n$ and are described by $x[n]$. A discrete-time signal may still have continuous amplitude, as after sampling but before quantization. Discrete-time signals are usually obtained by sampling, $x[n]=x_a(nT_s)$, and are the natural input to a computer.

Read more: [Signal Classifications](/posts/signal-classifications-in-dsp/).

## Q56. A 6 Hz sinusoid for 0–2 s then a 4 Hz sinusoid for 2–4 s: is it stationary?

The signal is

$$x(t)=\begin{cases}\sin(12\pi t),&0\le t<2\\ \sin(8\pi t),&2\le t<4\end{cases}$$

Sketch: two full 6 Hz cycles in the first two seconds are followed by two full 4 Hz cycles in the next two seconds. The waveform changes frequency abruptly at $t=2$ s.

It is **not stationary**. A stationary signal has statistical properties, including frequency content, that do not change with time. Here the spectrum and the zero-crossing rate change at $t=2$ s, so the signal is non-stationary (piecewise stationary at best).

Read more: [Stationary vs Non-Stationary Signals](/posts/stationary-vs-non-stationary-signals/).

## Q57. Procedure to transform a continuous signal to digital

Transduce the physical quantity to a voltage, amplify and condition it, low-pass filter it to prevent aliasing, sample and hold at $F_s$, quantize to $2^B$ levels, and encode each level into a binary word. Optionally compress or packetize the resulting bit stream.

Read more: [The DSP Pipeline](/posts/the-dsp-pipeline-from-analog-to-digital/).

## Q58. Define aliasing and how to avoid it

**Aliasing** is the overlap of spectral replicas that occurs when $F_s<2F_{\max}$. A frequency $F>F_s/2$ appears at the lower frequency $F_s-F$, so the reconstructed signal is wrong and the error is irreversible.

Avoid it by (1) choosing $F_s\ge2F_{\max}$, (2) placing an anti-alias low-pass filter before the sampler, and (3) oversampling so the analog filter has a wide transition band.

Read more: [Aliasing: The Spectral Impostor](/posts/aliasing-the-spectral-impostor/) and [How to Avoid Aliasing](/posts/how-to-avoid-aliasing-anti-aliasing-filters-and-daq/).

## Q59. $x_a(t)=3\cos 2000\pi t+5\sin 6000\pi t+10\cos 12000\pi t$

The frequencies are $F=1000$, $3000$, and $6000$ Hz. The maximum is $6000$ Hz.

**a) Nyquist rate.**

$$F_s^{\min}=2F_{\max}=12000\ \text{Hz}$$

**b) $F_s=5000$ samples/s.**

$$x[n]=3\cos\left(\frac{2\pi\cdot1000}{5000}n\right)+5\sin\left(\frac{2\pi\cdot3000}{5000}n\right)+10\cos\left(\frac{2\pi\cdot6000}{5000}n\right)$$

$$x[n]=3\cos(0.4\pi n)+5\sin(1.2\pi n)+10\cos(2.4\pi n)$$

Folding with $\sin(1.2\pi n)=-\sin(0.8\pi n)$ and $\cos(2.4\pi n)=\cos(0.4\pi n)$:

$$x[n]=13\cos(0.4\pi n)-5\sin(0.8\pi n)$$

The 3000 Hz component aliases to 2000 Hz and the 6000 Hz component aliases to 1000 Hz, adding to the original 1000 Hz term.

Read more: [Finding Minimum Sampling Rate](/posts/finding-minimum-sampling-rate-worked-examples/).

## Q60. Define skewness and kurtosis

**Skewness** is the normalized third central moment:

$$\text{skew}=\frac{1}{N}\sum\left(\frac{x_i-\mu}{\sigma}\right)^3$$

It measures asymmetry: zero for a symmetric distribution, positive for a long right tail, negative for a long left tail.

**Kurtosis** is the normalized fourth central moment:

$$\text{kurt}=\frac{1}{N}\sum\left(\frac{x_i-\mu}{\sigma}\right)^4$$

It measures tail heaviness and peakedness. A normal distribution has kurtosis 3; values above 3 are heavy-tailed (leptokurtic), below 3 are light-tailed (platykurtic). Excess kurtosis is kurtosis minus 3.

Read more: [Skewness and Kurtosis](/posts/skewness-and-kurtosis-shape-of-distribution/).

## Q61. Why quantization is the "opposite" of sampling

Sampling discretizes the **time axis** but leaves the amplitude continuous. Quantization discretizes the **amplitude axis** but leaves time continuous. Each acts on the axis the other leaves alone; together they turn an analog signal into a digital one. Sampling error is aliasing (removable only by filtering before sampling), while quantization error is irreversible rounding noise added after sampling.

Read more: [Worked Solutions: 2022 Q4b](/posts/cse-409-past-exams-and-cse-410-lab-worked-solutions/).

## Q62. Time shifting and finding $x(n-3)$, $x(n+2)$

Time shifting replaces the index: $x[n-k]$ delays the signal by $k$ samples (moves it right), and $x[n+k]$ advances it by $k$ samples (moves it left). If the original non-zero support is $n_1\le n\le n_2$, then $x[n-3]$ has support $n_1+3\le n\le n_2+3$ and $x[n+2]$ has support $n_1-2\le n\le n_2-2$. For a sketch, copy every stem and move it three places right for $x[n-3]$, two places left for $x[n+2]$.

Read more: [Time Shifting: Delay and Advance](/posts/time-shifting-delay-and-advance/).

## Q63. Differences between the Z-transform and the Fourier transform

| Property | Z-transform | Fourier transform |
|---|---|---|
| Variable | complex $z=re^{j\omega}$ | real frequency $\omega$ or $F$ |
| Scope | wider; handles growing and decaying signals through $r$ | bounded, steady-state signals |
| Relation | Fourier transform is $X(z)$ on the unit circle $z=e^{j\omega}$ | special case of the Z-transform |
| ROC | explicitly required | convergence implied by integrability |
| Use | difference equations, stability, transients | spectral content, frequency response |

Read more: [Z-Transform Definition and ROC](/posts/z-transform-definition-roc-and-transform-pairs/).

## Q64. Z-transform and ROC of $x[n]=a^n u[n]$

$$X(z)=\sum_{n=0}^{\infty}a^n z^{-n}=\sum_{n=0}^{\infty}(az^{-1})^n=\frac{1}{1-az^{-1}}=\frac{z}{z-a}$$

The geometric series converges when $\vert az^{-1}\vert<1$, i.e.

$$\text{ROC: }\vert z\vert>\vert a\vert$$

The pole is at $z=a$ and the ROC is outside it, as expected for a right-sided sequence.

Read more: [Z-Transform Definition and ROC](/posts/z-transform-definition-roc-and-transform-pairs/).

## Q65. Inverse Z-transform of $X(z)=\dfrac{z+0.2}{(z+0.5)(z-1)}$, $\vert z\vert>1$

The ROC is outside the unit circle, so the sequence is causal. Expanding $X(z)/z$ and using the residues already computed in Q41:

$$X(z)=-0.4-\frac{0.4z}{z+0.5}+\frac{0.8z}{z-1}$$

$$x[n]=-0.4\delta[n]-0.4(-0.5)^n u[n]+0.8u[n]$$

Equivalently $x[n]=\left(0.8-0.4(-0.5)^n\right)u[n]-0.4\delta[n]$.

Read more: [Inverse Z by Long Division and Inspection](/posts/inverse-z-long-division-and-inspection-worked-examples/).

## Q66. What is FFT?

The fast Fourier transform is a family of algorithms that computes the DFT with far fewer operations than the direct sum. Radix-2 FFT reduces the cost from $N^2$ to $(N/2)\log_2 N$ complex multiplications by recursively splitting the sequence into even and odd halves. The output is exactly the DFT; only the computation changes.

Read more: [DTFT, DFT and FFT](/posts/dtft-dft-and-fft-the-frequency-domain-trinity/).

## Q67. Fourier transform of $x(t)=e^{-a\vert t\vert}$, $a>0$

Split the integral at zero:

$$X(\omega)=\int_{-\infty}^{0}e^{at}e^{-j\omega t}\,dt+\int_{0}^{\infty}e^{-at}e^{-j\omega t}\,dt$$

$$X(\omega)=\frac{1}{a-j\omega}+\frac{1}{a+j\omega}=\frac{2a}{a^2+\omega^2}$$

This is a real, even, positive spectrum with a peak of $2/a$ at $\omega=0$; the signal is a two-sided exponential, so its transform is a Lorentzian.

Read more: [Fourier Series, Spectral Density and DTFT Symmetry](/posts/fourier-series-spectral-density-bandwidth-and-dtft-symmetry/).

## Q68. DFT of $\{1,1,0,0\}$ and IDFT of $\{1,0,1,0\}$

These are the same pair as Q44.

DFT: $X=\{2,\,1-j,\,0,\,1+j\}$.

IDFT: $x=\{0.5,\,0,\,0.5,\,0\}$.

Read more: [Computing DFT by Hand](/posts/computing-dft-by-hand-and-dft-properties/).

## Q69. Explaining the FFT speed factor of 21.33

For $N=64$, the direct DFT needs $64^2=4096$ complex multiplications. The radix-2 FFT needs

$$\frac{N}{2}\log_2 N=32\times6=192$$

multiplications. The ratio is $4096/192=21.33$. In general the ratio is $2N/\log_2 N$, so the advantage grows with transform length. This is why FFT-based spectrum analysis, OFDM, and image processing are practical.

Read more: [DIT vs DIF FFT](/posts/dit-vs-dif-fft-bit-reversal-and-radix-4/).

## Q70. Radix-2 DIT-FFT algorithm

1. Reorder the input in bit-reversed order.
2. For each stage $s=1,2,\dots,\log_2 N$, with half-size $m=2^{s-1}$:
   - for each block of length $2m$, and each $k=0,\dots,m-1$:
     - $W=W_{2m}^{k}=e^{-j2\pi k/(2m)}$
     - $t=W\cdot a[k+m]$
     - $a[k+m]=a[k]-t$
     - $a[k]=a[k]+t$
3. The array now holds $X[k]$ in natural order.

Each butterfly is one complex multiply and two adds; there are $(N/2)\log_2 N$ butterflies.

Read more: [Radix-2 FFT](/posts/radix-2-fft-windowing-and-spectral-leakage/).

## Q71. 8-point DFT of $\{1,1,1,1,1,1,0,0\}$

For $k\ne0$, sum the geometric series with $W_8=e^{-j\pi/4}$:

$$X[k]=\sum_{n=0}^{5}W_8^{nk}=\frac{1-W_8^{6k}}{1-W_8^{k}}=e^{-j5\pi k/8}\frac{\sin(3\pi k/4)}{\sin(\pi k/8)}$$

and $X[0]=6$. Evaluating:

| $k$ | $X[k]$ |
|---|---|
| 0 | $6$ |
| 1 | $-0.707-1.707j$ |
| 2 | $1-j$ |
| 3 | $0.707+0.293j$ |
| 4 | $0$ |
| 5 | $0.707-0.293j$ |
| 6 | $1+j$ |
| 7 | $-0.707+1.707j$ |

The symmetry $X[8-k]=X^{*}[k]$ for real input is visible across the table.

Read more: [Worked Solutions: 2022 Q7c](/posts/cse-409-past-exams-and-cse-410-lab-worked-solutions/).

## Q72. Define an impulse signal

The discrete unit impulse is $\delta[n]=1$ at $n=0$ and $0$ elsewhere. It has unit energy and acts as the identity of convolution. The continuous Dirac impulse $\delta(t)$ is a unit-area spike with $\int\delta(t)\,dt=1$ and the sifting property $\int x(t)\delta(t-t_0)\,dt=x(t_0)$. The impulse response $h[n]$ of a system is its response to $\delta[n]$ and completely characterizes an LTI system.

Read more: [Elementary Discrete-Time Sequences](/posts/elementary-discrete-time-sequences/).

## Q73. Compare FIR and IIR filters

FIR filters have a finite impulse response, no feedback, guaranteed stability, and can have exact linear phase. They need a high order for sharp transitions and therefore more computation and memory. IIR filters have an infinite impulse response, use feedback, need stability checks, and generally cannot achieve exact linear phase. They meet sharp specifications with a much lower order, so they are cheaper to compute.

Read more: [Digital Filters: FIR vs IIR](/posts/digital-filters-fir-vs-iir-comparison/).

## Q74. Direct Form I for $y[n]=0.5y[n-1]-0.76y[n-2]+0.63y[n-3]+x[n]+0.875x[n-1]$

$$H(z)=\frac{1+0.875z^{-1}}{1-0.5z^{-1}+0.76z^{-2}-0.63z^{-3}}$$

Direct Form I has a forward chain and a feedback chain:

- Forward taps: $b_0=1$, $b_1=0.875$.
- Feedback taps: $a_1=-0.5$, $a_2=0.76$, $a_3=-0.63$ in the rearranged equation, i.e. the output is the sum of $x[n]$, $0.875x[n-1]$, $0.5y[n-1]$, $-0.76y[n-2]$, and $0.63y[n-3]$.
- Six delay elements total (three for $x$, three for $y$); Direct Form II would use three.

Read more: [Special IIR Filters, Structures and Finite Word Length](/posts/special-iir-filters-structures-and-finite-word-length/).

## Q75. What is signal processing? Analog versus digital signals

**Signal processing** is the deliberate modification or analysis of a signal to extract information, remove noise, enhance a feature, compress it, or prepare it for transmission.

| Property | Analog signal | Digital signal |
|---|---|---|
| Time | continuous | discrete |
| Amplitude | continuous | quantized |
| Representation | voltage, current | binary numbers |
| Processing | analog circuits | processor and software |
| Noise | accumulates, drifts | can be regenerated exactly |
| Storage | tape, analog media | memory, disks |
| Flexibility | fixed by hardware | programmable |

Read more: [Digital vs Analog Signal Processing](/posts/digital-vs-analog-signal-processing-advantages/).

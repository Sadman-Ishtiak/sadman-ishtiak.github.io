---
title: "Compiled DSP Questions: Answers 76–99 and CSE-410 Lab Answers"
date: 2026-03-21 00:00:00 +0600
categories: ['Academic', 'CSE-409 Digital Signal Processing']
tags: ['dsp', 'questions', 'answers', 'exam-prep', 'cse409', 'cse410', 'matlab', 'jkkniu']
description: Worked answers to questions 76-99 of the compiled CSE-409 DSP question list plus the nine CSE-410 MATLAB lab questions.
math: true
---

## How This Post Fits the Series

Questions 76–99 and the lab list are taken in order from the [Compiled DSP Questions for CSE-409](/posts/dsp-questions/) page. This closes the answer set that starts in [Answers 1–25](/posts/compiled-dsp-questions-answers-1-25/), [Answers 26–50](/posts/compiled-dsp-questions-answers-26-50/), and [Answers 51–75](/posts/compiled-dsp-questions-answers-51-75/). The longer MATLAB treatments are in [CSE 409 Past Exams and CSE 410 Lab: Worked Solutions](/posts/cse-409-past-exams-and-cse-410-lab-worked-solutions/).

---

## Q76. Converting analog to digital, and where the error enters

The chain is: sensor, amplifier and conditioning, anti-alias low-pass filter, sample-and-hold, quantizer, encoder.

**Error enters at quantization.** The true sample generally falls between two levels, so it is rounded to the nearest one. The error is bounded by $\pm\Delta/2$ and is modelled as uniform noise with power $\Delta^2/12$. It cannot be removed later because the original amplitude is lost.

Minimize it by using more bits $B$ (each extra bit gives about 6 dB better SQNR), by oversampling and then decimating (which spreads the noise and filters part of it), by dithering to decorrelate the error from the signal, and by matching the input range to the full-scale range so the quantizer is fully used.

Read more: [ADC Errors and SQNR](/posts/adc-errors-and-signal-to-quantization-noise-ratio/).

## Q77. Applications of DSP

Audio and speech processing (noise suppression, echo cancellation, coding, recognition), image and video processing (denoising, enhancement, compression), medical imaging (CT, MRI, ultrasound), radar and sonar (matched filtering, pulse compression), digital communications (modulation, equalization, channel coding), biometrics, seismology, vibration monitoring, control systems, and brain-computer interfaces.

Read more: [DSP Applications](/posts/dsp-applications-audio-radar-biometrics-and-bci/).

## Q78. Types of discrete-time signal representations

- **Functional:** a formula such as $x[n]=a^n u[n]$.
- **Tabular:** a table of index and value pairs.
- **Graphical:** a stem plot with stems at integer $n$.
- **Sequence notation:** $x[n]=\{2,1,\mathbf{0},-1,-2\}$ with a bold origin marker.
- **Block diagram:** delays, multipliers, and adders implementing a difference equation.
- **Transform domain:** $X(z)$ or $X(e^{j\omega})$ describing the same signal.

Read more: [Discrete-Time Signal Representations](/posts/discrete-time-signal-representations-and-sequence-types/).

## Q79. Data acquisition and its block diagram

Data acquisition is the process of measuring a physical quantity and converting it into digital data a computer can store and process.

```
Sensor -> Signal conditioning (amplify, filter) -> Anti-alias LPF
       -> Sample & Hold -> ADC -> Digital processor / storage
```

The sensor converts the physical variable to a voltage. Conditioning makes the voltage compatible with the ADC. The anti-alias filter protects the sampled spectrum, the sample-and-hold freezes the value during conversion, and the ADC produces the code words.

Read more: [How to Avoid Aliasing: Anti-Aliasing Filters and DAQ](/posts/how-to-avoid-aliasing-anti-aliasing-filters-and-daq/).

## Q80. Graph of $x[n]=0$ for $n<0$, $x[n]=1$ for $n\ge0$

This is exactly the unit step $u[n]$. The stem plot is zero for every negative index and one for $n=0,1,2,\dots$, continuing forever to the right.

| $n$ | $-2$ | $-1$ | $0$ | $1$ | $2$ | $3$ |
|---|---|---|---|---|---|---|
| $x[n]$ | $0$ | $0$ | $1$ | $1$ | $1$ | $1$ |

Read more: [Elementary Discrete-Time Sequences](/posts/elementary-discrete-time-sequences/).

## Q81. Why sample, and what the sampling theorem says

Sampling is needed because digital processors and storage work on discrete numbers; a continuous waveform has uncountably many values and cannot be stored directly. Sampling captures the signal at intervals, and the sampling theorem guarantees that the samples contain all the information if

$$F_s>2F_{\max}$$

Under that condition, an ideal low-pass reconstruction filter recovers the original waveform exactly. Below it, spectral replicas overlap and aliasing destroys information.

Read more: [Sampling Theorem and Nyquist Rate](/posts/sampling-theorem-and-nyquist-rate/).

## Q82. What is aliasing and how to avoid it

Aliasing is the folding of frequencies above $F_s/2$ onto lower frequencies because the spectral replicas produced by sampling overlap. A tone at $F>F_s/2$ appears at $F_s-F$ and cannot be distinguished from a genuine tone there.

Avoid it with $F_s\ge2F_{\max}$, an analog anti-alias low-pass filter before the sampler, and oversampling to relax that filter's transition band.

Read more: [Aliasing: The Spectral Impostor](/posts/aliasing-the-spectral-impostor/).

## Q83. $x_a(t)=3\cos 50\pi t+10\sin 300\pi t-\cos 100\pi t$

Frequencies: $25$ Hz, $150$ Hz, and $50$ Hz. The maximum is $150$ Hz.

**a) Minimum sampling rate.**

$$F_s^{\min}=2(150)=300\ \text{Hz}$$

**b) $F_s=200$ Hz.**

$$x[n]=3\cos\left(\frac{\pi}{4}n\right)+10\sin\left(\frac{3\pi}{2}n\right)-\cos\left(\frac{\pi}{2}n\right)$$

The 150 Hz term exceeds $F_s/2=100$ Hz and folds to 50 Hz; $\sin(3\pi n/2)=-\sin(\pi n/2)$ shows that fold.

**c) $F_s=75$ Hz.**

$$25\ \text{Hz}\to\frac{2\pi}{3},\qquad 150\ \text{Hz}\to4\pi\equiv0,\qquad 50\ \text{Hz}\to\frac{4\pi}{3}$$

$$x[n]=3\cos\left(\frac{2\pi}{3}n\right)-\cos\left(\frac{4\pi}{3}n\right)$$

The 150 Hz tone falls exactly on a multiple of $F_s$ and samples to zero.

Read more: [Worked Solutions: 2021 Q3c](/posts/cse-409-past-exams-and-cse-410-lab-worked-solutions/).

## Q84. Standard deviation and variance

Variance is the average squared deviation from the mean:

$$\sigma^2=\frac{1}{N}\sum_{i=1}^{N}(x_i-\mu)^2$$

Standard deviation is its square root, $\sigma$, and has the same units as the data. For a sample, use $N-1$ in the denominator to get an unbiased estimate. Variance measures spread and AC power; standard deviation is the more interpretable "typical distance from the mean".

Read more: [Statistical Description of Signals](/posts/statistical-description-of-signals-mean-and-variance/).

## Q85. Explain the DFT

For a length-$N$ sequence,

$$X[k]=\sum_{n=0}^{N-1}x[n]e^{-j2\pi kn/N},\qquad k=0,1,\dots,N-1$$

It evaluates the DTFT at the $N$ frequencies $\omega_k=2\pi k/N$, giving a finite, computable spectrum. The inverse is

$$x[n]=\frac{1}{N}\sum_{k=0}^{N-1}X[k]e^{j2\pi kn/N}$$

The DFT is periodic with period $N$ and is the basis of FFT-based spectral analysis.

Read more: [DFT as a Linear Transformation](/posts/dft-as-a-linear-transformation-and-matrix-form/).

## Q86. DFT of $x[n]=\{1,1,1,0\}$ for $N=4$

$$X[k]=1+W_4^{k}+W_4^{2k},\qquad W_4=-j$$

- $X[0]=3$
- $X[1]=1-j-1=-j$
- $X[2]=1-1+1=1$
- $X[3]=1+j-1=j$

So $X=\{3,-j,1,j\}$.

Read more: [Computing DFT by Hand](/posts/computing-dft-by-hand-and-dft-properties/).

## Q87. Relation between the Fourier and Z-transforms

The Z-transform generalizes the DTFT. If the ROC includes the unit circle, then

$$X(e^{j\omega})=X(z)\big\vert_{z=e^{j\omega}}$$

so the DTFT is the Z-transform evaluated on $\vert z\vert=1$. The Z-transform also describes signals that grow or decay (radius $r\ne1$) and carries the ROC, which the DTFT does not. For causal stable systems, the frequency response is exactly the unit-circle slice of $H(z)$.

Read more: [Z-Transform Definition and ROC](/posts/z-transform-definition-roc-and-transform-pairs/).

## Q88. Region of convergence and its properties

The ROC is the set of $z$ for which $\sum_n x[n]z^{-n}$ converges absolutely.

Properties:

- It is an annulus $r_1<\vert z\vert<r_2$ centred at the origin (possibly including $0$ or $\infty$).
- It contains no poles.
- A right-sided sequence has an ROC outside its outermost pole; a left-sided sequence has an ROC inside its innermost pole.
- A two-sided sequence has an annular ROC between two poles.
- A finite-length sequence has the whole plane as ROC, except possibly $z=0$ or $z=\infty$.
- The ROC plus the algebraic expression uniquely determines the sequence.

Read more: [Z-Transform Definition, ROC and Transform Pairs](/posts/z-transform-definition-roc-and-transform-pairs/).

## Q89. Convolution property of the Z-transform

If $y[n]=x[n]*h[n]$, then

$$Y(z)=X(z)H(z)$$

with an ROC that contains the intersection of the individual ROCs (and may be larger if poles cancel). This turns time-domain convolution into polynomial multiplication, which is why the Z-transform is the natural tool for cascaded systems. For LTI systems $H(z)$ is the transfer function.

Read more: [Z-Transform Properties and Convolution](/posts/z-transform-properties-and-convolution/).

## Q90. Why transform a time-domain signal to the frequency domain

The frequency domain shows which sinusoidal components are present and with what amplitude and phase. That makes filtering, modulation, spectral analysis, compression, and system identification direct: convolution becomes multiplication, differentiation becomes multiplication by $j\omega$, and narrow-band interference is easy to locate and remove. The FFT makes the transformation cheap enough for real-time use.

Read more: [DTFT, DFT and FFT](/posts/dtft-dft-and-fft-the-frequency-domain-trinity/).

## Q91. $X(k)$ for $x(n)=1/4$ for $0\le n\le2$, zero otherwise ($N=4$)

$$X[k]=\frac14\left(1+W_4^{k}+W_4^{2k}\right)$$

Using the bracket already computed in Q86:

$$X=\{0.75,\,-0.25j,\,0.25,\,0.25j\}$$

Read more: [Worked Solutions: 2021 Q6b](/posts/cse-409-past-exams-and-cse-410-lab-worked-solutions/).

## Q92. Z-transform of $x(n)=\{1,0,\mathbf{3},-1,2\}$

With the bold 3 at $n=0$ and the sequence spanning $n=-2,\dots,2$:

$$X(z)=z^{2}+3-z^{-1}+2z^{-2}$$

The ROC is the whole plane except $z=0$ and $z=\infty$. For the causal reading $n=0,\dots,4$, $X(z)=1+3z^{-2}-z^{-3}+2z^{-4}$ with $\vert z\vert>0$.

Read more: [Inverse Z by Long Division and Inspection](/posts/inverse-z-long-division-and-inspection-worked-examples/).

## Q93. Define continuous-time sinusoidal signals

A continuous-time sinusoid is

$$x(t)=A\cos(\Omega t+\phi)=A\cos(2\pi Ft+\phi)$$

where $A$ is amplitude, $\Omega=2\pi F$ is angular frequency in rad/s, $F$ is frequency in Hz, and $\phi$ is phase. It is periodic with period $T=1/F$, has mean zero, and power $A^2/2$. Unlike discrete-time sinusoids, distinct continuous frequencies always produce distinct waveforms; there is no aliasing until sampling.

Read more: [Signal Classifications](/posts/signal-classifications-in-dsp/).

## Q94. Deterministic versus random signals

A **deterministic** signal is fully described by a mathematical expression, so its future values can be predicted exactly: a sinusoid, a step, a known pulse. A **random** signal cannot be predicted exactly; only its statistics (mean, variance, autocorrelation, power spectral density) are known: thermal noise, speech, EEG, market data. Random signals are analysed with probability models and estimated spectra, which is why the statistics posts in this series matter.

Read more: [Stationary vs Non-Stationary Signals](/posts/stationary-vs-non-stationary-signals/).

## Q95. Nyquist theorem and $x_a(t)=3\cos 400\pi t$

The Nyquist theorem states that a signal band-limited to $F_{\max}$ can be reconstructed from its samples if $F_s>2F_{\max}$, and $2F_{\max}$ is the Nyquist rate.

Here $400\pi=2\pi F$, so $F=200$ Hz. Therefore

$$F_s^{\min}=2(200)=400\ \text{Hz}$$

Sampling at 400 Hz gives $x[n]=3\cos(2\pi\cdot200\cdot n/400)=3\cos(\pi n)=3(-1)^n$.

Read more: [Sampling Theorem and Nyquist Rate](/posts/sampling-theorem-and-nyquist-rate/).

## Q96. Define energy and power signals

**Energy signal:** finite total energy and zero average power,

$$E=\sum_{n=-\infty}^{\infty}\vert x[n]\vert^2<\infty,\qquad P=\lim_{N\to\infty}\frac{1}{2N+1}\sum_{n=-N}^{N}\vert x[n]\vert^2=0$$

Examples: a finite-length pulse, $a^n u[n]$ with $\vert a\vert<1$.

**Power signal:** infinite energy but finite nonzero average power. Examples: a sinusoid, a periodic sequence, a step.

A signal cannot be both; some signals (e.g. $n u[n]$) are neither.

Read more: [Energy, Power and Signal Symmetries](/posts/energy-power-and-signal-symmetries/).

## Q97. Advantages of FIR filters

Exact linear phase with symmetric coefficients, guaranteed stability with no feedback, finite memory, no limit cycles, low sensitivity to coefficient quantization, and straightforward design by windows, frequency sampling, or equiripple optimization. The cost is a higher order and more arithmetic for a given transition width.

Read more: [Digital Filters: FIR vs IIR](/posts/digital-filters-fir-vs-iir-comparison/).

## Q98. Steps to design an analog Butterworth filter

1. State passband edge $\Omega_p$, stopband edge $\Omega_s$, passband ripple $A_p$ (dB), and stopband attenuation $A_s$ (dB).
2. Compute the order:

$$N\ge\frac{\log_{10}\left(\dfrac{10^{A_s/10}-1}{10^{A_p/10}-1}\right)}{2\log_{10}\left(\dfrac{\Omega_s}{\Omega_p}\right)}$$

and round up.
3. Compute the cutoff from the passband (or stopband) requirement, for example

$$\Omega_c=\frac{\Omega_p}{\left(10^{A_p/10}-1\right)^{1/(2N)}}$$

4. Place the poles on a circle of radius $\Omega_c$ in the left half-plane at angles $\pi(2k+N+1)/(2N)$.
5. Form $H(s)=\dfrac{\Omega_c^N}{\prod_{k}(s-s_k)}$.
6. Verify the response, then map to digital with the bilinear transform if needed.

Read more: [IIR Filter Design: Bilinear Transform and Analog Prototypes](/posts/iir-filter-design-bilinear-transform-and-analog-prototypes/).

## Q99. Principle of FIR design by windows

Start from the ideal (infinite) impulse response, for example the ideal low-pass

$$h_d[n]=\frac{\sin(\omega_c n)}{\pi n}$$

Truncate it to $N$ samples by multiplying with a window $w[n]$:

$$h[n]=h_d[n]w[n]$$

Truncation spreads the ideal brick-wall response into a main lobe plus sidelobes. The window type controls the trade-off: a rectangular window has the narrowest main lobe but high sidelobes (about $-13$ dB); Hamming and Hanning reduce sidelobes at the cost of a wider transition; Blackman and Kaiser give still lower sidelobes. Increasing $N$ narrows the transition band but does not change the peak sidelobe level. Choose the window and length to meet the passband ripple and stopband attenuation specifications.

Read more: [FIR Filter Design: Window Method and Parks-McClellan](/posts/fir-filter-design-window-method-and-parks-mcclellan/).

---

## CSE 410 Lab Answers

The lab questions are numbered 1–9 on the [questions page](/posts/dsp-questions/). Full code and output discussion are in [CSE 409 Past Exams and CSE 410 Lab: Worked Solutions](/posts/cse-409-past-exams-and-cse-410-lab-worked-solutions/); the key commands are:

1. **Elementary signals with `subplot`:** build `t` or `n`, then `subplot(2,2,k); stem(...)` for impulse, `plot(...)` for sine, cosine, and square (`square(2*pi*f*t)`).
2. **Up-sampling and interpolation:** `upsample(x,L)` shows spectral images; `interp(x,L)` adds the low-pass filter and removes them.
3. **FFT of a sequence:** `X = fft(x); stem(abs(X))` and plot the phase.
4. **N-point DFT and IDFT:** `X = fft(x,N)` and `x = ifft(X,N)`.
5. **Covariance:** $\operatorname{cov}(x,y)=\frac{1}{N-1}\sum(x_i-\bar{x})(y_i-\bar{y})$, compared with `cov(x,y)`.
6. **Logical indexing:** `q(q>4)`, `q(ismember(q,x))`, `x(x<=7)`.
7. **FFT:** same as lab 3, with `fft(x)`.
8. **Identity matrix:** `eye(4)`.
9. **Row operations and reshape:** `x(1,:) = mean(x(1,:))` then `x = reshape(x,1,[])`.

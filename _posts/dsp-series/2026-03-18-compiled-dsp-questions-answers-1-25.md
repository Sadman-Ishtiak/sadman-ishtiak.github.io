---
title: "Compiled DSP Questions: Answers 1–25 (Signals, Sampling, Quantization, Statistics)"
date: 2026-03-18 00:00:00 +0600
categories: ['Academic', 'CSE-409 Digital Signal Processing']
tags: ['dsp', 'questions', 'answers', 'exam-prep', 'cse409', 'jkkniu']
description: Worked answers to questions 1-25 of the compiled CSE-409 DSP question list, with links to the full theory posts.
math: true
---

## How This Post Fits the Series

The question list this post answers is the [Compiled DSP Questions for CSE-409](/posts/dsp-questions/) page. The numbering below matches that page exactly. Every answer is short enough to revise from, and the "Read more" links point to the post that derives the same idea in full. Numerical answers from the past exams are also worked in [CSE 409 Past Exams and CSE 410 Lab: Worked Solutions](/posts/cse-409-past-exams-and-cse-410-lab-worked-solutions/).

---

## Q1. Define and classify signals with examples

A **signal** is a function that carries information about the state of a physical system, usually as amplitude varying with time or space. A signal is classified by:

- **Time axis:** continuous-time $x(t)$ (defined for every $t$) versus discrete-time $x[n]$ (defined only at integer $n$).
- **Amplitude axis:** analog (continuous values) versus digital (quantized values).
- **Predictability:** deterministic (exact formula) versus random (statistical description).
- **Repetition:** periodic versus aperiodic.
- **Energy:** energy signal ($0<E<\infty$) versus power signal ($0<P<\infty$).
- **Symmetry:** even, odd, or neither.
- **Causality:** causal ($x[n]=0$ for $n<0$) versus non-causal.

Examples: a microphone voltage is analog continuous-time; a sampled audio track is digital discrete-time; a sinusoid is deterministic and periodic; thermal noise is random.

Read more: [What Is a Signal?](/posts/what-is-a-signal-the-foundation-of-dsp/) and [Signal Classifications](/posts/signal-classifications-in-dsp/).

## Q2. Continuous-time versus discrete-time signals

| Property | Continuous-time $x(t)$ | Discrete-time $x[n]$ |
|---|---|---|
| Independent variable | real $t$ | integer $n$ |
| Defined | every instant | only at sample instants |
| Amplitude | continuous | can be continuous or quantized |
| Notation | parentheses | square brackets |
| Typical source | sensor output | sampler / computer |

Diagram: a smooth curve through all points versus stems only at $n=0,\pm1,\pm2,\dots$ A discrete-time signal can come from sampling, $x[n]=x_a(nT_s)$, or be defined directly by a formula such as $x[n]=a^n u[n]$.

Read more: [Digital vs Analog Signal Processing](/posts/digital-vs-analog-signal-processing-advantages/) and [The DSP Pipeline](/posts/the-dsp-pipeline-from-analog-to-digital/).

## Q3. Sketch $x(t)=\sin(\pi t)$ for $-5\le t\le 5$

$\sin(\pi t)$ has angular frequency $\pi$ rad/s, so $F=1/2$ Hz and period $T=2$ s. It is zero at every integer $t$, reaches $+1$ at $t=0.5,2.5$ and $-1$ at $t=-0.5,-3.5$. Between $t=-5$ and $t=5$ there are five full periods. The sketch is a sine wave crossing the axis at $-5,-4,\dots,5$ and peaking halfway between crossings.

## Q4. Three major real-world applications of DSP

1. **Audio and speech:** noise reduction, echo cancellation, speech recognition, MP3/AAC compression.
2. **Medical imaging:** CT/MRI reconstruction, ultrasound beamforming, image denoising and enhancement.
3. **Radar, sonar and wireless communication:** matched filtering, pulse compression, modulation and channel equalization.

Read more: [DSP Applications: Audio, Radar, Biometrics and BCI](/posts/dsp-applications-audio-radar-biometrics-and-bci/).

## Q5. DSP in speech recognition

The microphone signal is pre-emphasized, split into short frames (20–30 ms), windowed, and transformed with the FFT. The spectrum is converted to mel-scale filter-bank energies and then to MFCCs (or fed directly to a neural network). Voice activity detection, feature normalization and decoding follow. DSP supplies the front end; the acoustic model maps features to phonemes or words.

## Q6. DSP in medical image enhancement

DSP removes noise (median and Gaussian filtering), improves contrast (histogram equalization, CLAHE), sharpens edges (unsharp masking, high-pass filtering), interpolates to a finer grid, and compresses for storage. In CT and MRI, the reconstruction itself is an inverse Fourier / filtered back-projection operation, which is pure DSP.

## Q7. Why digital filters are preferred over analog in communication

- Programmable: change the response by changing coefficients, no hardware redesign.
- Reproducible: no component tolerance, drift, or ageing.
- Exact linear phase is possible (FIR), so no phase distortion.
- Arbitrary specifications and adaptive filtering are practical.
- Coefficients can be stored, versioned and copied exactly.
- Lower cost for complex, high-order responses.

Read more: [Digital vs Analog Signal Processing](/posts/digital-vs-analog-signal-processing-advantages/).

## Q8. $x_a(t)=3\sin 300\pi t$

The angular frequency is $300\pi$, so $F=150$ Hz.

**a) Minimum sampling rate.** $F_s^{\min}=2F=300$ Hz.

**b) $F_s=250$ Hz.** Substitute $t=nT_s=n/250$:

$$x[n]=3\sin\left(2\pi\frac{150}{250}n\right)=3\sin\left(\frac{6\pi}{5}n\right)$$

Since $150>F_s/2=125$ Hz, this is an aliased tone. Using $\sin(6\pi n/5)=\sin(6\pi n/5-2\pi n)=\sin(-4\pi n/5)$:

$$x[n]=-3\sin\left(\frac{4\pi}{5}n\right)$$

which behaves like a $100$ Hz tone after folding, because $250-150=100$ Hz.

## Q9. Symmetric and anti-symmetric signals

A signal is **even (symmetric)** if $x[-n]=x[n]$ for all $n$: examples $\delta[n]$, $\cos\omega n$, $u[n]+u[-n]$ (apart from the origin convention).

A signal is **odd (anti-symmetric)** if $x[-n]=-x[n]$: examples $\sin\omega n$, $n$, and any signal with $x[0]=0$ built from odd parts.

Every signal decomposes as $x[n]=x_e[n]+x_o[n]$ with

$$x_e[n]=\frac{x[n]+x[-n]}{2},\qquad x_o[n]=\frac{x[n]-x[-n]}{2}$$

Read more: [Energy, Power and Signal Symmetries](/posts/energy-power-and-signal-symmetries/).

## Q10. Aliasing in the frequency domain

Sampling multiplies the spectrum by an impulse train, producing copies of $X_a(F)$ centred at $kF_s$. If $F_s<2F_{\max}$, neighbouring copies overlap. A component above $F_s/2$ then appears at $F_s-F$, an image at a lower frequency that cannot be separated from a genuine low-frequency component. Larger overlap means more irreversible distortion.

Read more: [Aliasing: The Spectral Impostor](/posts/aliasing-the-spectral-impostor/).

## Q11. Quantization and its significance

**Quantization** maps a continuous-amplitude sample to one of $L=2^B$ discrete levels. It is significant because digital hardware can only store and process finite-precision numbers; quantization makes the signal digital, at the cost of a quantization error that behaves like additive noise.

## Q12. Quantization error of a uniform quantizer

For a uniform quantizer with step

$$\Delta=\frac{x_{\max}-x_{\min}}{L},\qquad L=2^B$$

the output is $\hat{x}=Q(x)$. The error is $e=\hat{x}-x$. With rounding, $e$ lies in $[-\Delta/2,\Delta/2]$. Assuming $e$ is uniform in that interval,

$$E[e]=\frac{1}{\Delta}\int_{-\Delta/2}^{\Delta/2}e\,de=0$$

$$E[e^2]=\frac{1}{\Delta}\int_{-\Delta/2}^{\Delta/2}e^2\,de=\frac{\Delta^2}{12}$$

So the quantization noise power is $\sigma_e^2=\Delta^2/12$. For a full-scale sinusoid the signal power is $A^2/2$ with $A=x_{\max}$, giving $\text{SQNR}\approx 6.02B+1.76$ dB.

Read more: [Quantization Error Derivation](/posts/quantization-error-derivation-and-numerical-example/).

## Q13. Step size and quantized value for a 16-level quantizer

Range $-10$ V to $+10$ V, so $x_{\max}-x_{\min}=20$ V and $L=16$:

$$\Delta=\frac{20}{16}=1.25\ \text{V}$$

For $x=3.8$ V, the code index measured from $-10$ V is

$$k=\frac{3.8-(-10)}{1.25}=11.04\approx 11$$

$$\hat{x}=-10+11(1.25)=3.75\ \text{V}$$

The error is $3.75-3.8=-0.05$ V, well inside the $\pm0.625$ V bound.

Read more: [Quantization Error Derivation](/posts/quantization-error-derivation-and-numerical-example/).

## Q14. Time scaling and its effects

Time scaling replaces $t$ by $at$: $x(at)$.

- $a>1$ compresses the signal in time (it plays faster), so its spectrum expands in frequency.
- $0<a<1$ expands the signal in time, so its spectrum compresses.
- For discrete-time signals only rational factors are meaningful: $x[2n]$ is decimation (keep every second sample), $x[n/2]$ is interpolation (insert zeros then filter).

Read more: [Time Scaling: Compression and Expansion](/posts/time-scaling-compression-and-expansion/).

## Q15. Signal shifting

Replacing $t$ by $t-t_0$ with $t_0>0$ shifts the waveform **right** (delay); replacing $t$ by $t+t_0$ shifts it **left** (advance). In discrete time, $x[n-k]$ is delayed by $k$ samples and $x[n+k]$ is advanced by $k$. A shift changes only the time origin, never the shape or the amplitude.

Read more: [Time Shifting: Delay and Advance](/posts/time-shifting-delay-and-advance/).

## Q16. For $x[n]=\{2,1,\mathbf{0},-1,-2\}$, plot $x[2n]$ and $x[n/2]$

The bold $0$ is at $n=0$, so the sequence occupies $n=-2,-1,0,1,2$.

**$x[2n]$** keeps only even-indexed samples:

| $n$ | $-1$ | $0$ | $1$ |
|---|---|---|---|
| $x[2n]$ | $2$ | $0$ | $-2$ |

All other values are zero. This is down-sampling by 2.

**$x[n/2]$** is nonzero only when $n/2$ is an integer, i.e. $n$ even:

| $n$ | $-4$ | $-3$ | $-2$ | $-1$ | $0$ | $1$ | $2$ | $3$ | $4$ |
|---|---|---|---|---|---|---|---|---|---|
| $x[n/2]$ | $2$ | $0$ | $1$ | $0$ | $0$ | $0$ | $-1$ | $0$ | $-2$ |

This is up-sampling by 2 with zero insertion.

Read more: [Time Scaling: Compression and Expansion](/posts/time-scaling-compression-and-expansion/).

## Q17. Difference between DFT and DTFT

| Property | DTFT | DFT |
|---|---|---|
| Frequency variable | continuous $\omega$ | discrete $k$ |
| Length of input | any, often infinite | finite $N$ |
| Output | continuous function, periodic with $2\pi$ | $N$ samples, periodic with $N$ |
| Computation | integral/sum over all $n$ | finite sum, computable exactly |
| Relation | reference transform | samples DTFT at $\omega=2\pi k/N$ |

The DFT is the computable, finite version of the DTFT: $X[k]=X(e^{j\omega})$ at $\omega=2\pi k/N$.

Read more: [DTFT, DFT and FFT: The Frequency-Domain Trinity](/posts/dtft-dft-and-fft-the-frequency-domain-trinity/).

## Q18. Compute the 4-point DFT of $\{0,1,2,3\}$

With $W_4=e^{-j2\pi/4}=-j$,

$$X[k]=\sum_{n=0}^{3}x[n]W_4^{nk}$$

- $X[0]=0+1+2+3=6$
- $X[1]=0+1(-j)+2(-1)+3(j)=-2+2j$
- $X[2]=0+1(-1)+2(1)+3(-1)=-2$
- $X[3]=0+1(j)+2(-1)+3(-j)=-2-2j$

So $X=\{6,\,-2+2j,\,-2,\,-2-2j\}$.

Read more: [Computing DFT by Hand](/posts/computing-dft-by-hand-and-dft-properties/).

## Q19. Advantages of FFT over DFT

The DFT costs $N^2$ complex multiplications; the radix-2 FFT costs $(N/2)\log_2 N$. For $N=64$ this is $4096$ versus $192$, a factor of $21.33$. Fewer operations mean faster execution, real-time feasibility, lower power, and less rounding noise from repeated arithmetic. The result is mathematically identical to the DFT.

Read more: [DIT vs DIF FFT](/posts/dit-vs-dif-fft-bit-reversal-and-radix-4/).

## Q20. Mean and median of $\{1,3,5,7,9\}$

$$\mu=\frac{1+3+5+7+9}{5}=5$$

Sorted order is already $1,3,5,7,9$, so the median is the third value, $5$. The set is symmetric, hence mean equals median.

## Q21. Variance and standard deviation for $\{2,4,6,8\}$

$$\mu=\frac{2+4+6+8}{4}=5$$

$$\sigma^2=\frac{1}{N}\sum (x_i-\mu)^2=\frac{9+1+1+9}{4}=5$$

$$\sigma=\sqrt{5}\approx2.236$$

If the four values are treated as a **sample**, use $N-1$:

$$s^2=\frac{20}{3}\approx6.667,\qquad s\approx2.582$$

Read more: [Statistical Description of Signals](/posts/statistical-description-of-signals-mean-and-variance/).

## Q22. Skewness and kurtosis for $\{1,2,3,4,9\}$

Mean is $3.8$. Deviations are $-2.8,-1.8,-0.8,0.2,5.2$; sum of squares is $38.8$, so the population variance is $7.76$ and $\sigma\approx2.786$.

Standardized third moment:

$$\text{skewness}=\frac{1}{N}\sum\left(\frac{x_i-\mu}{\sigma}\right)^3\approx1.04$$

Positive skew: the large value $9$ pulls the right tail out. The median, $3$, is below the mean, $3.8$, which is the usual signature of right skew.

Standardized fourth moment minus 3:

$$\text{excess kurtosis}=\frac{1}{N}\sum\left(\frac{x_i-\mu}{\sigma}\right)^4-3\approx-0.33$$

That is close to a normal distribution (mesokurtic); the single outlier does not make the peak heavy enough for a positive excess.

Read more: [Skewness and Kurtosis](/posts/skewness-and-kurtosis-shape-of-distribution/).

## Q23. Analog versus digital filters

| Property | Analog filter | Digital filter |
|---|---|---|
| Hardware | resistors, capacitors, op-amps | processor plus program |
| Response change | redesign components | change coefficients |
| Drift and tolerance | yes | no |
| Precision | limited by components | set by word length |
| Linear phase | hard | straightforward with FIR |
| Frequency range | can reach RF | limited by sampling rate |
| Adaptive | difficult | natural |

Read more: [Digital vs Analog Signal Processing](/posts/digital-vs-analog-signal-processing-advantages/).

## Q24. IIR design by the bilinear transform

1. State the digital specifications: passband edge $\omega_p$, stopband edge $\omega_s$, and ripples.
2. Pre-warp each edge with $\Omega=(2/T)\tan(\omega/2)$, which compensates the frequency compression of the mapping.
3. Design an analog prototype $H_a(s)$ (Butterworth, Chebyshev, elliptic) to the pre-warped specifications.
4. Substitute

$$s=\frac{2}{T}\frac{1-z^{-1}}{1+z^{-1}}$$

to obtain $H(z)$.
5. Verify the digital response. The left half $s$-plane maps inside the unit circle, so a stable analog filter yields a stable digital filter.

Read more: [IIR Design: Impulse Invariance, Derivative Approximation and Frequency Transformations](/posts/iir-impulse-invariance-derivative-approximation-and-frequency-transformations/).

## Q25. FIR versus IIR filters

| Property | FIR | IIR |
|---|---|---|
| Impulse response | finite | infinite |
| Feedback | none | yes |
| Stability | always stable | must check poles |
| Linear phase | easy (symmetric coefficients) | generally not exact |
| Order for a sharp response | high | low |
| Computation and memory | more | less |
| Design | windows, frequency sampling, Parks-McClellan | analog prototype plus mapping |

Read more: [Digital Filters: FIR vs IIR](/posts/digital-filters-fir-vs-iir-comparison/).

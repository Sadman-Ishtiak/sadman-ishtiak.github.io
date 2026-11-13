---
title: "Compiled DSP Questions: Answers 26–50 (Signal Operations, Systems, Z-Transform, FFT)"
date: 2026-03-19 00:00:00 +0600
categories: ['Academic', 'CSE-409 Digital Signal Processing']
tags: ['dsp', 'questions', 'answers', 'exam-prep', 'cse409', 'jkkniu']
description: Worked answers to questions 26-50 of the compiled CSE-409 DSP question list, including convolution, system classification, inverse Z-transform and block diagrams.
math: true
---

## How This Post Fits the Series

Questions 26–50 below are copied in order from the [Compiled DSP Questions for CSE-409](/posts/dsp-questions/) page. The answers are worked, and the "Read more" links go to the full treatment in this series.

---

## Q26. Explain "signal" in a way that satisfies a teacher

A signal is a **physical quantity that carries information and varies as a function of one or more independent variables**, usually time. Mathematically it is a function $x(t)$ or a sequence $x[n]$. The word matters because DSP is the science of extracting, modifying, or transmitting that information. A voltage from a microphone, the pixels of an image, and the readings of a temperature sensor are all signals because each is a measurable quantity whose variation encodes something useful.

## Q27. Is a digital photo of Einstein a signal? Explain

Yes. A photograph is a **two-dimensional spatial signal**. The scene's brightness is sampled on a grid of pixels (sampling in space) and each brightness is stored as a finite set of integer levels (quantization). The result is a 2-D discrete signal $f[m,n]$ that can be filtered, compressed, enhanced, or analysed exactly like a 1-D signal. Image processing is therefore a direct branch of DSP.

## Q28. Share your understanding of "digital signal"

A digital signal is a sequence of numbers in which **both axes are discrete**: time is sampled at fixed intervals and amplitude is quantized to a finite set of levels. It is represented by $x[n]$, where $n$ is an integer index and each $x[n]$ is a code word of $B$ bits. Because it is discrete in both dimensions, it can be stored, transmitted without further quality loss, and processed by a computer.

Read more: [Discrete-Time Signal Representations](/posts/discrete-time-signal-representations-and-sequence-types/).

## Q29. Is biometrics an application of DSP? List other applications

Yes. Fingerprint, face, iris, voice, and ECG biometrics all start with a sensor signal that must be enhanced, segmented, and converted into features; that is DSP. Matching and classification come after the DSP front end.

Other applications: speech coding and recognition, audio effects and noise cancellation, radar and sonar, medical imaging, digital communication (equalization, channel coding), seismology, vibration monitoring, and brain-computer interfaces.

Read more: [DSP Applications](/posts/dsp-applications-audio-radar-biometrics-and-bci/).

## Q30. Properties of auto-correlation and cross-correlation

**Auto-correlation** $R_{xx}[k]=\sum_n x[n]x[n+k]$:

- $R_{xx}[0]=\sum_n x^2[n]$ is the energy (or power for power signals).
- It is even: $R_{xx}[-k]=R_{xx}[k]$.
- It is maximum at lag zero: $R_{xx}[0]\ge \vert R_{xx}[k]\vert$ for all $k$.
- A periodic signal has a periodic auto-correlation with the same period.

**Cross-correlation** $R_{xy}[k]=\sum_n x[n]y[n+k]$:

- It is not even in general.
- $R_{xy}[k]=R_{yx}[-k]$.
- It is bounded by $\vert R_{xy}[k]\vert\le\sqrt{R_{xx}[0]R_{yy}[0]}$.
- The lag of its peak measures the time delay between the two signals.

Read more: [LTI Systems, Impulse Response, Convolution and Correlation](/posts/lti-systems-impulse-response-convolution-and-correlation/).

## Q31. System responses for $x[n]=\vert n\vert$, $-3\le n\le 3$

The input is $\{3,2,1,0,1,2,3\}$ at $n=-3,\dots,3$.

- **Identity:** $y[n]=x[n]$, same sequence.
- **Delay by 1:** $y[n]=x[n-1]$, the sequence moves one sample right.
- **Advance by 1:** $y[n]=x[n+1]$, the sequence moves one sample left.
- **3-point moving average:** $y[n]=\tfrac13(x[n-1]+x[n]+x[n+1])$. With zero-padding at the edges:

| $n$ | $-3$ | $-2$ | $-1$ | $0$ | $1$ | $2$ | $3$ |
|---|---|---|---|---|---|---|---|
| $y[n]$ | $5/3$ | $2$ | $1$ | $2/3$ | $1$ | $2$ | $5/3$ |

The middle values follow $\tfrac13(\vert n-1\vert+\vert n\vert+\vert n+1\vert)$; the edges are smaller because the missing neighbour is zero.

Read more: [Discrete-Time Systems and Classification](/posts/discrete-time-systems-and-classification/).

## Q32. Convolution of $h[n]=\{1,2,1,-1\}$ and $x[n]=\{1,2,3,1\}$

Use $y[n]=\sum_k x[k]h[n-k]$. The result has length $4+4-1=7$:

$$y=\{1,\ 4,\ 8,\ 8,\ 3,\ -2,\ -1\}$$

Step by step:

- $y[0]=1\cdot1=1$
- $y[1]=1\cdot2+2\cdot1=4$
- $y[2]=1\cdot3+2\cdot2+1\cdot1=8$
- $y[3]=1\cdot1+2\cdot3+1\cdot2+(-1)\cdot1=8$
- $y[4]=2\cdot1+1\cdot3+(-1)\cdot2=3$
- $y[5]=1\cdot1+(-1)\cdot3=-2$
- $y[6]=-1\cdot1=-1$

Read more: [LTI Systems, Impulse Response, Convolution and Correlation](/posts/lti-systems-impulse-response-convolution-and-correlation/).

## Q33. What is a discrete-time system?

A discrete-time system is an operator $T\{\cdot\}$ that maps an input sequence $x[n]$ to an output sequence $y[n]=T\{x[n]\}$. It is described by a difference equation, an impulse response $h[n]$, a block diagram, or a transfer function $H(z)$. Systems are classified as linear or nonlinear, time-invariant or time-varying, causal or non-causal, stable or unstable, and static or dynamic.

Read more: [Discrete-Time Systems and Classification](/posts/discrete-time-systems-and-classification/).

## Q34. Block diagram for $y[n]=0.25y[n-1]+0.5x[n]+0.5x[n-1]$

The structure needs one delay for the input and one for the output, two adders, and three multipliers.

```
x[n] --+-->[0.5]--+--------------->(+)---> y[n]
       |          |                 ^
       +->[z^-1]--+-->[0.5]--+      |
                             |      |
y[n] --+---------------------+------+
       |
       +->[z^-1]-->[0.25]----+
```

In words: the input branch forms $0.5x[n]+0.5x[n-1]$; the feedback branch forms $0.25y[n-1]$; these two sums are added to produce $y[n]$. This is a first-order IIR filter with one pole at $z=0.25$.

Read more: [Difference Equations and Interconnections](/posts/difference-equations-interconnections-and-periodic-correlation/).

## Q35. Static vs dynamic, time-invariant vs time-variant, linear vs nonlinear

| Pair | First kind | Second kind |
|---|---|---|
| Static vs dynamic | output depends only on the present input, e.g. $y[n]=2x[n]$ | output depends on past or future inputs, e.g. $y[n]=y[n-1]+x[n]$ |
| Time-invariant vs time-variant | a shift of the input shifts the output by the same amount | the rule itself changes with time, e.g. $y[n]=nx[n]$ |
| Linear vs nonlinear | superposition holds: $T\{ax_1+bx_2\}=aT\{x_1\}+bT\{x_2\}$ | superposition fails, e.g. $y[n]=x^2[n]$ |

Read more: [Linearity, Causality and BIBO Stability](/posts/linearity-causality-and-bibo-stability/).

## Q36. Define quantization error

Quantization error is the difference between the quantized value and the true sample:

$$e[n]=Q(x[n])-x[n]$$

For a uniform quantizer with step $\Delta$ and rounding, $\vert e[n]\vert\le\Delta/2$. It is modelled as zero-mean uniform noise with power $\Delta^2/12$.

Read more: [Quantization: Discretizing the Amplitude Axis](/posts/quantization-discretizing-the-amplitude-axis/).

## Q37. Role of the number of bits $B$ in a quantizer

The number of bits sets the number of levels $L=2^B$ and therefore the step size $\Delta=R/2^B$ for a full-scale range $R$. Each extra bit halves $\Delta$, reducing quantization noise power by a factor of four, i.e. about $6.02$ dB better SQNR. More bits mean better fidelity but larger memory, more bandwidth, and more processing per sample. For a full-scale sinusoid,

$$\text{SQNR}\approx6.02B+1.76\ \text{dB}$$

Read more: [Bits, Levels and Dynamic Range](/posts/bits-levels-and-dynamic-range-relationships/).

## Q38. How to convert an analog signal to digital

1. **Transduce and condition** the physical quantity into a voltage.
2. **Anti-alias filter** it to below $F_s/2$.
3. **Sample** at $F_s\ge2F_{\max}$ to get $x[n]$.
4. **Quantize** each sample to $2^B$ levels.
5. **Encode** each level as a binary word.

The result is a digital signal ready for storage or processing.

Read more: [The DSP Pipeline: From Analog to Digital](/posts/the-dsp-pipeline-from-analog-to-digital/).

## Q39. Applications of the Z-transform and definition of ROC

Applications: solving linear constant-coefficient difference equations, finding the system function $H(z)$, testing stability from pole locations, converting convolution into multiplication, analysing transient and steady-state response, and designing filters.

The **region of convergence** is the set of complex $z$ for which

$$X(z)=\sum_{n=-\infty}^{\infty}x[n]z^{-n}$$

converges absolutely. It is an annulus centred at the origin, contains no poles, and is determined by the signal's support (right-sided, left-sided, or two-sided).

Read more: [Z-Transform: Definition, ROC and Transform Pairs](/posts/z-transform-definition-roc-and-transform-pairs/).

## Q40. Z-transform and ROC of $\{1,0,\mathbf{3},-1,2\}$

With the bold $3$ at $n=0$ and the sequence running $n=-2,\dots,2$:

$$X(z)=z^{2}+3-z^{-1}+2z^{-2}$$

Because the sequence is finite and includes samples on both sides of the origin, the ROC is the whole $z$-plane except $z=0$ and $z=\infty$.

If instead the sequence is taken as causal with $n=0,\dots,4$, then

$$X(z)=1+3z^{-2}-z^{-3}+2z^{-4},\qquad \vert z\vert>0$$

Read more: [Inverse Z by Long Division and Inspection](/posts/inverse-z-long-division-and-inspection-worked-examples/).

## Q41. Inverse Z-transform of $X(z)=\dfrac{z+0.2}{(z+0.5)(z-1)}$, $\vert z\vert>1$

The ROC is outside the outermost pole, so the sequence is right-sided (causal). Expand $X(z)/z$:

$$\frac{X(z)}{z}=\frac{z+0.2}{z(z+0.5)(z-1)}$$

Residues:

- at $z=0$: $\dfrac{0.2}{(0.5)(-1)}=-0.4$
- at $z=-0.5$: $\dfrac{-0.3}{(-0.5)(-1.5)}=-0.4$
- at $z=1$: $\dfrac{1.2}{(1.5)(1)}=0.8$

So

$$X(z)=-0.4-\frac{0.4z}{z+0.5}+\frac{0.8z}{z-1}$$

and therefore

$$x[n]=-0.4\delta[n]-0.4(-0.5)^n u[n]+0.8u[n]$$

Check: $x[0]=-0.4-0.4+0.8=0$, $x[1]=0.2+0.8=1$, and $x[\infty]=0.8$.

Read more: [Worked Solutions: 2022 Q5c](/posts/cse-409-past-exams-and-cse-410-lab-worked-solutions/) and [Inverse Z by Long Division and Inspection](/posts/inverse-z-long-division-and-inspection-worked-examples/).

## Q42. The FFT speed increase factor of 21.33

The direct DFT needs $N^2$ complex multiplications. The radix-2 FFT needs $\frac{N}{2}\log_2 N$. Their ratio is

$$\frac{N^2}{(N/2)\log_2 N}=\frac{2N}{\log_2 N}$$

For $N=64$:

$$\frac{2(64)}{6}=\frac{128}{6}\approx21.33$$

So the FFT is about $21.33$ times faster for a 64-point transform. The factor grows with $N$, which is why FFT made real-time spectral processing practical.

Read more: [DIT vs DIF FFT](/posts/dit-vs-dif-fft-bit-reversal-and-radix-4/).

## Q43. How the decimation-in-time FFT works

1. Split $x[n]$ into even-indexed and odd-indexed subsequences.
2. Each half-length sequence is transformed recursively.
3. Combine the two $N/2$-point results with butterflies:

$$X[k]=E[k]+W_N^k O[k],\qquad X[k+N/2]=E[k]-W_N^k O[k]$$

4. Repeat until only 2-point transforms remain, giving $\log_2 N$ stages.
5. The input must be in bit-reversed order; the output ends in natural order.

Each butterfly uses one complex multiplication and two additions, so the total cost is $(N/2)\log_2 N$ multiplications.

Read more: [Radix-2 FFT](/posts/radix-2-fft-windowing-and-spectral-leakage/) and [DIT vs DIF FFT](/posts/dit-vs-dif-fft-bit-reversal-and-radix-4/).

## Q44. DFT of $\{1,1,0,0\}$ and IDFT of $\{1,0,1,0\}$

**DFT** with $W_4=-j$: $X[k]=1+W_4^k$.

- $X[0]=2$
- $X[1]=1-j$
- $X[2]=1-1=0$
- $X[3]=1+j$

So $X=\{2,1-j,0,1+j\}$.

**IDFT** of $X=\{1,0,1,0\}$:

$$x[n]=\frac14\sum_{k=0}^{3}X[k]W_4^{-nk}=\frac14\left(1+(-1)^n\right)$$

giving $x=\{0.5,0,0.5,0\}$.

Read more: [Computing DFT by Hand](/posts/computing-dft-by-hand-and-dft-properties/).

## Q45. Delay and advance on the time axis

$x[n-k]$ with $k>0$ is a **delay**: every sample occurs $k$ steps later, so the waveform moves right. $x[n+k]$ is an **advance**: the waveform moves left. Delay is physically realizable with memory; advance is non-causal and needs future samples.

For $x[n]=\{2,1,\mathbf{0},-1,-2\}$: $x[2n]=\{2,0,-2\}$ at $n=-1,0,1$ and $x[n/2]=\{2,0,1,0,0,0,-1,0,-2\}$ for $n=-4,\dots,4$ (see Q16).

Read more: [Time Shifting: Delay and Advance](/posts/time-shifting-delay-and-advance/).

## Q46. Role of variance in signal study

Variance measures the **spread of a signal around its mean**, i.e. the power of its fluctuating (AC) part. It quantifies uncertainty, noise level, and signal activity. It appears directly in SNR, in estimator quality (low variance means a reliable estimate), in feature extraction for classification, and in the design of detectors and adaptive filters.

Read more: [Statistical Description of Signals](/posts/statistical-description-of-signals-mean-and-variance/).

## Q47. Define and calculate skewness and kurtosis

For a data set with mean $\mu$ and standard deviation $\sigma$:

$$\text{skewness}=\frac{1}{N}\sum_{i=1}^{N}\left(\frac{x_i-\mu}{\sigma}\right)^3$$

$$\text{kurtosis}=\frac{1}{N}\sum_{i=1}^{N}\left(\frac{x_i-\mu}{\sigma}\right)^4$$

Skewness measures asymmetry: zero is symmetric, positive means a longer right tail, negative a longer left tail. Kurtosis measures tail heaviness and peakedness; the normal distribution has kurtosis $3$, so excess kurtosis is kurtosis minus $3$.

For $\{1,2,3,4,9\}$: mean $3.8$, $\sigma\approx2.786$, skewness $\approx1.04$ (right-skewed), excess kurtosis $\approx-0.33$.

Read more: [Skewness and Kurtosis](/posts/skewness-and-kurtosis-shape-of-distribution/).

## Q48. Define impulse

In discrete time the **unit impulse** is

$$\delta[n]=\begin{cases}1,&n=0\\0,&n\ne0\end{cases}$$

It is the identity element of convolution: $x[n]*\delta[n]=x[n]$, and any sequence can be written as $x[n]=\sum_k x[k]\delta[n-k]$.

In continuous time the **Dirac delta** $\delta(t)$ is a unit-area spike with the sifting property $\int x(t)\delta(t-t_0)\,dt=x(t_0)$.

Read more: [Elementary Discrete-Time Sequences](/posts/elementary-discrete-time-sequences/).

## Q49. Advantages of FIR over IIR filters

- Can have **exactly linear phase** when coefficients are symmetric, so no phase distortion.
- **Always stable**, because there is no feedback.
- Finite impulse response means finite memory and no limit cycles.
- Less sensitive to coefficient quantization.
- Easy to design by windows, frequency sampling, or Parks-McClellan.
- Simple to implement in hardware and to pipeline.

The price is a higher order and more computation for a sharp magnitude response.

Read more: [Digital Filters: FIR vs IIR](/posts/digital-filters-fir-vs-iir-comparison/).

## Q50. Direct Form I for $y[n]=0.5y[n-1]-0.76y[n-2]+0.63y[n-3]+x[n]+0.875x[n-1]$

Rearrange into the transfer function:

$$H(z)=\frac{1+0.875z^{-1}}{1-0.5z^{-1}+0.76z^{-2}-0.63z^{-3}}$$

Direct Form I uses a chain of delays on the input and a separate chain on the output:

- Input branch coefficients: $b_0=1$, $b_1=0.875$, and zeros for $b_2,b_3$.
- Feedback branch coefficients: $a_1=-0.5$, $a_2=0.76$, $a_3=-0.63$ (the signs are already in the rearranged equation).

In block-diagram form: $x[n]$ feeds three series delays; the taps $1$ and $0.875$ are summed into the central adder. $y[n]$ feeds three series delays; the taps $0.5$, $-0.76$, $0.63$ are summed into the same adder. The adder output is $y[n]$. Three delays in each chain make six delays total for Direct Form I; Direct Form II would need only three.

Read more: [Special IIR Filters, Structures and Finite Word Length](/posts/special-iir-filters-structures-and-finite-word-length/).

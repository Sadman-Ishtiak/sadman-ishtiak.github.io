---
title: "CSE 409 Past Exams and CSE 410 Lab: Worked Solutions"
date: 2026-03-08 00:00:00 +0600
categories: ['Academic', 'CSE-409 Digital Signal Processing']
tags: ['dsp', 'exam', 'questions', 'solutions', 'matlab', 'academic', 'cse409', 'cse410', 'jkkniu']
description: Every numerical question from the 2021-2024 CSE 409 finals and the CSE 410 lab list, solved step by step.
math: true
---
## How to Use This Post

The questions below are the numerical and short-answer items from the compiled CSE 409 finals (2021–2024, sessions 2017–2021) and the CSE 410 lab list, which is published as [Compiled DSP Questions for CSE-409](/posts/dsp-questions/). The full 99-question list is answered in [Answers 1–25](/posts/compiled-dsp-questions-answers-1-25/), [Answers 26–50](/posts/compiled-dsp-questions-answers-26-50/), [Answers 51–75](/posts/compiled-dsp-questions-answers-51-75/), and [Answers 76–99 plus the CSE 410 lab](/posts/compiled-dsp-questions-answers-76-99-and-lab/). Each answer shows the full working, not just the result, because the marks are in the steps. Theory questions are cross-referenced to the post that covers them.

---

## Sampling and Nyquist

### 2021 Q3c: $x_a(t)=3\cos 50\pi t+10\sin 300\pi t-\cos 100\pi t$

**Frequencies.** Use $\Omega=2\pi F$:

$$50\pi\Rightarrow F=25\ \text{Hz},\qquad 300\pi\Rightarrow F=150\ \text{Hz},\qquad 100\pi\Rightarrow F=50\ \text{Hz}$$

**i) Minimum sampling rate.** $F_{\max}=150$ Hz, so

$$F_s^{\min}=2F_{\max}=300\ \text{Hz}$$

**ii) $F_s=200$ Hz.**

$$x[n]=3\cos\left(2\pi\frac{25}{200}n\right)+10\sin\left(2\pi\frac{150}{200}n\right)-\cos\left(2\pi\frac{50}{200}n\right)$$

$$x[n]=3\cos\left(\frac{\pi}{4}n\right)+10\sin\left(\frac{3\pi}{2}n\right)-\cos\left(\frac{\pi}{2}n\right)$$

Note $150>F_s/2=100$, so the 150 Hz tone aliases to $200-150=50$ Hz. The sampled expression above already contains that fold through $\sin(3\pi n/2)=-\sin(\pi n/2)$.

**iii) $F_s=75$ Hz.**

$$25\ \text{Hz}\to\frac{2\pi\cdot25}{75}=\frac{2\pi}{3},\qquad 150\ \text{Hz}\to\frac{2\pi\cdot150}{75}=4\pi\equiv0,\qquad 50\ \text{Hz}\to\frac{4\pi}{3}\equiv-\frac{2\pi}{3}$$

The 150 Hz term samples to $\sin(4\pi n)=0$ and disappears; the 50 Hz term folds:

$$x[n]=3\cos\left(\frac{2\pi}{3}n\right)-0-\cos\left(\frac{4\pi}{3}n\right)=3\cos\left(\frac{2\pi}{3}n\right)-\cos\left(\frac{2\pi}{3}n\right)$$

$$\boxed{x[n]=2\cos\left(\frac{2\pi}{3}n\right)}$$

Three tones collapse into one. This is aliasing in its most dramatic form.

---

### 2022 Q3c: $x_a(t)=3\cos 2000\pi t+5\sin 6000\pi t+10\cos 12000\pi t$

**i) Nyquist rate.** Frequencies 1000, 3000, 6000 Hz. $F_{\max}=6000$ Hz, so

$$F_s^{\min}=12000\ \text{Hz}$$

**ii) $F_s=5000$ Hz.**

$$x[n]=3\cos\left(\frac{2\pi\cdot1000}{5000}n\right)+5\sin\left(\frac{2\pi\cdot3000}{5000}n\right)+10\cos\left(\frac{2\pi\cdot6000}{5000}n\right)$$

$$=3\cos\left(\frac{2\pi}{5}n\right)+5\sin\left(\frac{6\pi}{5}n\right)+10\cos\left(\frac{12\pi}{5}n\right)$$

Fold the last term: $\frac{12\pi}{5}-2\pi=\frac{2\pi}{5}$, and $\cos$ is even, so it becomes $10\cos(2\pi n/5)$.

$$\boxed{x[n]=13\cos\left(\frac{2\pi}{5}n\right)+5\sin\left(\frac{6\pi}{5}n\right)}$$

The 1 kHz and 6 kHz tones land on the **same** digital frequency and add.

---

### 2021 Q7c: $x_a(t)=3\cos 400\pi t$

$$400\pi=2\pi F\Rightarrow F=200\ \text{Hz}\qquad F_s^{\min}=400\ \text{Hz}$$

---

### 2024 Q3a: $x_a(t)=3\sin 300\pi t$, $F_s=250$ Hz

$$F=150\ \text{Hz},\qquad F_s^{\min}=300\ \text{Hz}$$

$$x[n]=3\sin\left(\frac{2\pi\cdot150}{250}n\right)=3\sin\left(\frac{6\pi}{5}n\right)$$

Since $\frac{6\pi}{5}>\pi$, the apparent frequency is $\frac{6\pi}{5}-2\pi=-\frac{4\pi}{5}$, and $\sin$ is odd:

$$\boxed{x[n]=-3\sin\left(\frac{4\pi}{5}n\right)}$$

The output appears at 100 Hz instead of 150 Hz — aliasing.

---

## DFT and IDFT

### 2021 Q4c: DFT of $x=\{1,1,1,0\}$, $N=4$

$$X[k]=\sum_{n=0}^{3}x[n]W_4^{kn},\qquad W_4=e^{-j\pi/2}=-j$$

$$X[0]=1+1+1=3$$
$$X[1]=1+1(-j)+1(-1)=1-j-1=-j$$
$$X[2]=1+1(-1)+1(1)=1$$
$$X[3]=1+1(j)+1(-1)=j$$

$$\boxed{X=\{3,\ -j,\ 1,\ j\}}$$

Check: $X[3]=X^*[1]$ ✓ and $X[2]$ real ✓ for a real input.

---

### 2021 Q6b: $x[n]=1/4$ for $0\le n\le 2$, zero otherwise (take $N=4$)

$$x=\{0.25,\ 0.25,\ 0.25,\ 0\}$$

$$X[0]=0.75,\qquad X[1]=0.25(1-j-1)=-0.25j,\qquad X[2]=0.25(1-1+1)=0.25,\qquad X[3]=0.25(1+j-1)=0.25j$$

$$\boxed{X=\{0.75,\ -0.25j,\ 0.25,\ 0.25j\}}$$

---

### 2022/2023 Q6c: DFT of $\{1,1,0,0\}$ and IDFT of $\{1,0,1,0\}$

**DFT of $\{1,1,0,0\}$:**

$$X[0]=2,\qquad X[1]=1-j,\qquad X[2]=1-1=0,\qquad X[3]=1+j$$

$$\boxed{X=\{2,\ 1-j,\ 0,\ 1+j\}}$$

**IDFT of $\{1,0,1,0\}$:**

$$x[n]=\frac{1}{4}\sum_{k=0}^{3}X[k]e^{j\pi kn/2}=\frac{1}{4}\left(1+e^{j\pi n}\right)=\frac{1}{4}\left(1+(-1)^n\right)$$

$$\boxed{x=\{0.5,\ 0,\ 0.5,\ 0\}}$$

---

### 2024 Q6b: 4-point DFT of $\{0,1,2,3\}$

$$X[0]=6$$
$$X[1]=0-j+2(-1)+3(j)=-2+2j$$
$$X[2]=0-1+2-3=-2$$
$$X[3]=0+j+2(-1)+3(-j)=-2-2j$$

$$\boxed{X=\{6,\ -2+2j,\ -2,\ -2-2j\}}$$

Parseval check: $\sum\vert x\vert^2=14$ and $\frac14\sum\vert X\vert^2=\frac14(36+8+4+8)=14$ ✓.

---

### 2022 Q7c: 8-point DFT of $\{1,1,1,1,1,1,0,0\}$

$$X[k]=\sum_{n=0}^{5}W_8^{kn},\qquad X[0]=6$$

For $k\ne0$, sum the geometric series:

$$X[k]=\frac{1-W_8^{6k}}{1-W_8^k}$$

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

Check: $X[4]=1-1+1-1+1-1=0$ ✓, and $X[8-k]=X^*[k]$ ✓.

---

## Z-Transform

### 2021 Q6c / 2023 Q5b: $X(z)$ of $x=\{1,0,3,-1,2\}$

With the arrow at $n=0$ under the 3, i.e. $x[-2]=1$, $x[-1]=0$, $x[0]=3$, $x[1]=-1$, $x[2]=2$:

$$X(z)=z^2+0\cdot z+3-1\cdot z^{-1}+2z^{-2}$$

$$\boxed{X(z)=z^2+3-z^{-1}+2z^{-2}}$$

ROC: the whole $z$-plane except $z=0$ and $z=\infty$ (finite-length sequence).

If instead the sequence is read left-to-right from $n=0$ (arrow under the 1), then

$$X(z)=1+3z^{-2}-z^{-3}+2z^{-4},\qquad \text{ROC: }\vert z\vert>0$$

State your convention in the exam. The arrow position is the deciding factor.

---

### 2022 Q5b: Z-transform and ROC of $x[n]=a^nu[n]$

$$X(z)=\sum_{n=0}^{\infty}a^nz^{-n}=\sum_{n=0}^{\infty}(az^{-1})^n=\frac{1}{1-az^{-1}},\qquad \vert az^{-1}\vert<1$$

$$\boxed{X(z)=\frac{z}{z-a},\qquad \text{ROC: }\vert z\vert>\vert a\vert}$$

Pole at $z=a$, zero at $z=0$. If $\vert a\vert<1$ the ROC includes the unit circle, so the DTFT exists and the system is stable.

---

### 2022 Q5c / 2023 Q5c: inverse Z of $\dfrac{z+0.2}{(z+0.5)(z-1)}$, $\vert z\vert>1$

Expand $X(z)/z$:

$$\frac{X(z)}{z}=\frac{z+0.2}{z(z+0.5)(z-1)}=\frac{A}{z}+\frac{B}{z+0.5}+\frac{C}{z-1}$$

$$A=\frac{0.2}{(0.5)(-1)}=-0.4,\qquad B=\frac{-0.3}{(-0.5)(-1.5)}=-0.4,\qquad C=\frac{1.2}{(1)(1.5)}=0.8$$

$$X(z)=-0.4-0.4\frac{z}{z+0.5}+0.8\frac{z}{z-1}$$

For $\vert z\vert>1$ all terms are causal:

$$\boxed{x[n]=-0.4\,\delta[n]-0.4(-0.5)^n u[n]+0.8u[n]}$$

Equivalently

$$x[n]=\begin{cases}0, & n=0\\ 0.8+0.2(-0.5)^{n-1}, & n\ge1\end{cases}$$

Check: $x[1]=1$, $x[2]=0.7$, $x[3]=0.85$. These match the long-division coefficients from the inverse-Z post.

---

### 2021 Q5b: ROC properties

1. The ROC is a ring or disc centred at the origin.
2. The ROC cannot contain any pole.
3. The ROC is a connected region.
4. If $x[n]$ is right-sided, the ROC is the exterior of a circle: $\vert z\vert>r_{\max}$.
5. If $x[n]$ is left-sided, the ROC is the interior: $\vert z\vert<r_{\min}$.
6. If $x[n]$ is two-sided, the ROC is an annulus $r_1<\vert z\vert<r_2$.
7. A finite-length sequence has an ROC equal to the whole plane except possibly $z=0$ or $z=\infty$.
8. The DTFT exists iff the ROC includes the unit circle.
9. The ROC of a sum is at least the intersection of the individual ROCs (it can be larger if poles cancel).

---

### 2021 Q5a: Relation between Fourier and Z transforms

$$X(e^{j\omega})=X(z)\big\vert_{z=e^{j\omega}}$$

The DTFT is the Z-transform evaluated on the unit circle. The Z-transform exists whenever the DTFT does, and also for many signals whose DTFT does not converge (e.g. growing exponentials), because the ROC can be chosen off the unit circle. The DFT is the Z-transform sampled at $N$ equally spaced points on the unit circle.

---

### 2022 Q5a: Differences between Z and Fourier transforms

| Aspect | Fourier (DTFT) | Z-transform |
|---|---|---|
| Variable | $\omega$ (real, $[-\pi,\pi]$) | $z=re^{j\omega}$ (complex) |
| Domain | Unit circle only | Whole $z$-plane |
| Convergence | Absolute summability required | ROC can be off the unit circle |
| Signal class | Stable/energy signals | Broader, including unstable |
| Use | Spectrum | Poles, zeros, stability, difference equations |

---

## Convolution and Correlation

### 2023 Q2c: $h=\{1,2,1,-1\}$, $x=\{1,2,3,1\}$

$$y[n]=\sum_k h[k]x[n-k]$$

| $n$ | Computation | $y[n]$ |
|---|---|---|
| 0 | $1\cdot1$ | 1 |
| 1 | $2\cdot1+1\cdot2$ | 4 |
| 2 | $1\cdot1+2\cdot2+1\cdot3$ | 8 |
| 3 | $-1\cdot1+1\cdot2+2\cdot3+1\cdot1$ | 8 |
| 4 | $-1\cdot2+1\cdot3+2\cdot1$ | 3 |
| 5 | $-1\cdot3+1\cdot1$ | $-2$ |
| 6 | $-1\cdot1$ | $-1$ |

$$\boxed{y=\{1,\ 4,\ 8,\ 8,\ 3,\ -2,\ -1\}}$$

Length $4+4-1=7$ ✓.

---

### 2023 Q2a: Properties of autocorrelation and cross-correlation

**Autocorrelation $r_{xx}[l]$:**

1. $r_{xx}[0]=\sum x^2[n]=E$ (energy) or average power for a power signal.
2. $r_{xx}[-l]=r_{xx}[l]$ — even for a real signal.
3. $\vert r_{xx}[l]\vert\le r_{xx}[0]$ — maximum at zero lag.
4. The DTFT of $r_{xx}[l]$ is $\vert X(e^{j\omega})\vert^2$, the energy/power density spectrum (Wiener–Khinchine).

**Cross-correlation $r_{xy}[l]$:**

1. $r_{xy}[-l]=r_{yx}[l]$ — not symmetric in general.
2. $\vert r_{xy}[l]\vert\le\sqrt{r_{xx}[0]r_{yy}[0]}$ (Cauchy–Schwarz).
3. Not equal to convolution: $r_{xy}[l]=x[l]*y[-l]$.
4. Measures similarity and lag; the peak lag gives the delay between the signals.

**For periodic sequences:** average over one period, $r_{xy}[l]=\frac1N\sum_{n=0}^{N-1}x[n]y[n-l]$, and both $r_{xx}$ and $r_{xy}$ are periodic with period $N$.

---

### 2023 Q2b: System responses for $x[n]=\vert n\vert$, $-3\le n\le 3$

$$x=\{\,3,\ 2,\ 1,\ \underset{\uparrow}{0},\ 1,\ 2,\ 3\,\}$$

| System | Rule | Output |
|---|---|---|
| Identity | $y[n]=x[n]$ | $\{3,2,1,0,1,2,3\}$ |
| Delay by 2 | $y[n]=x[n-2]$ | $\{0,0,3,2,1,0,1,2,3\}$ |
| Advance by 1 | $y[n]=x[n+1]$ | $\{2,1,0,1,2,3\}$ |
| 3-point moving average | $y[n]=\frac13(x[n]+x[n-1]+x[n-2])$ | $\{\dots,1.67,1,0.33,0.33,1,\dots\}$ |

The moving average smooths the V-shape at the origin into a ramp — that is the lowpass action.

---

## Statistics

### 2024 Q7a: Mean and median of $\{1,3,5,7,9\}$

$$\text{Mean}=\frac{1+3+5+7+9}{5}=\frac{25}{5}=5,\qquad \text{Median}=5$$

---

### 2024 Q7b: Variance and SD of $\{2,4,6,8\}$

$$\bar x=5,\qquad \text{deviations}=-3,-1,1,3,\qquad \sum(x-\bar x)^2=9+1+1+9=20$$

$$\text{Population variance}=\frac{20}{4}=5,\qquad \sigma=2.236$$

$$\text{Sample variance}=\frac{20}{3}=6.67,\qquad s=2.582$$

Use $n$ for a population, $n-1$ for a sample. State which one you are computing.

---

### 2024 Q7c: Skewness and kurtosis of $\{1,2,3,4,9\}$

$$\bar x=\frac{19}{5}=3.8$$

$$\sum(x-\bar x)^2=(-2.8)^2+(-1.8)^2+(-0.8)^2+(0.2)^2+(5.2)^2=7.84+3.24+0.64+0.04+27.04=38.8$$

$$\sum(x-\bar x)^3=-21.952-5.832-0.512+0.008+140.608=112.32$$

$$\sum(x-\bar x)^4=61.466+10.498+0.410+0.000+731.161=803.535$$

$$\text{Skewness}=\frac{\frac15\sum(x-\bar x)^3}{\left(\frac15\sum(x-\bar x)^2\right)^{3/2}}=\frac{22.464}{(7.76)^{3/2}}=\frac{22.464}{21.61}=1.04$$

**Positive skew** (right tail) — the 9 stretches the right side, as expected.

$$\text{Kurtosis}=\frac{\frac15\sum(x-\bar x)^4}{\left(\frac15\sum(x-\bar x)^2\right)^{2}}=\frac{160.707}{60.218}=2.67$$

Excess kurtosis $=2.67-3=-0.33$: slightly **platykurtic** (flatter than Gaussian), because four points cluster and one is an outlier rather than a heavy two-sided tail.

---

### 2021 Q4a: Standard deviation and variance

$$\sigma^2=\frac{1}{N}\sum(x_i-\bar x)^2,\qquad \sigma=\sqrt{\sigma^2}$$

For a sample, divide by $n-1$ (Bessel correction) to get an unbiased estimate. Variance measures spread in squared units; SD is in the original units and is easier to interpret.

---

## Quantization

### 2024 Q4c: 16-level quantizer, range $-10$ to $+10$ V, value 3.8 V

$$R=20\ \text{V},\qquad L=16,\qquad \Delta=\frac{R}{L-1}=\frac{20}{15}=1.333\ \text{V}$$

If your course defines $\Delta=R/L$, then

$$\Delta=\frac{20}{16}=1.25\ \text{V}$$

Using $\Delta=1.25$ V, the levels are $-10+k(1.25)$. The index for 3.8 V:

$$k=\frac{3.8-(-10)}{1.25}=\frac{13.8}{1.25}=11.04$$

Nearest level: $k=11$,

$$x_q=-10+11(1.25)=3.75\ \text{V}$$

$$\boxed{x_q=3.75\ \text{V},\qquad e=3.75-3.8=-0.05\ \text{V}}$$

The error is within $\pm\Delta/2=\pm0.625$ V ✓.

---

### 2022 Q4b: Why quantization is the "opposite" of sampling

Sampling discretizes the **x-axis (time)**; quantization discretizes the **y-axis (amplitude)**. They are independent operations performed in either order, and they produce different errors: sampling causes aliasing, quantization causes quantization noise. A signal becomes **digital** only after both.

---

## Filters

### 2022/2023 Q8c: Direct Form I for $y[n]=0.5y[n-1]-0.76y[n-2]+0.63y[n-3]+x[n]+0.875x[n-1]$

Rewrite with all outputs on the left:

$$y[n]-0.5y[n-1]+0.76y[n-2]-0.63y[n-3]=x[n]+0.875x[n-1]$$

The transfer function is

$$H(z)=\frac{1+0.875z^{-1}}{1-0.5z^{-1}+0.76z^{-2}-0.63z^{-3}}$$

**Direct Form I** has two separate delay lines: one for the $x$ taps, one for the $y$ taps.

```
x[n] ──► + ──► z⁻¹ ──► z⁻¹ ──► z⁻¹
         │      │        │        │
         │    0.875      —        —
         │      │        │        │
         └──────┴────────┴────────┴──► + ──► y[n]
                                        ▲
y[n] ◄── z⁻¹ ──► z⁻¹ ──► z⁻¹ ──────────┘
          │        │        │
        -0.5     0.76     -0.63
```

Concretely: a feed-forward chain of 2 taps ($b_0=1$, $b_1=0.875$) and a feedback chain of 4 taps ($a_0=1$, $a_1=-0.5$, $a_2=0.76$, $a_3=-0.63$). Direct Form I needs $2+3=5$ delay elements.

**Direct Form II** (canonical) shares one delay line of length 3, halving the storage:

```
x[n] ──► + ──► z⁻¹ ──► z⁻¹ ──► z⁻¹ ──► 0.875 ─┐
         │      │        │        │             │
         │    0.76     -0.63    -0.5            │
         │      │        │        │             │
         └──────┴────────┴────────┴─────────────┴──► + ──► y[n]
```

---

### 2024 Q8b: IIR design by the bilinear transform

1. **Specify** $\omega_p$, $\omega_s$, passband ripple, stopband attenuation.
2. **Pre-warp** the digital edges:

$$\Omega_p=\frac{2}{T}\tan\left(\frac{\omega_p}{2}\right),\qquad \Omega_s=\frac{2}{T}\tan\left(\frac{\omega_s}{2}\right)$$

3. **Find the order** from the analog prototype formula (Butterworth example):

$$N\ge\frac{\log_{10}\left(\frac{10^{A_s/10}-1}{10^{A_p/10}-1}\right)}{2\log_{10}\left(\Omega_s/\Omega_p\right)}$$

4. **Design** the analog prototype $H_a(s)$ with cutoff $\Omega_p$.
5. **Substitute** the bilinear mapping:

$$s=\frac{2}{T}\frac{1-z^{-1}}{1+z^{-1}}$$

6. **Simplify** to $H(z)$ and check the response.

The mapping compresses the infinite analog $j\Omega$ axis onto the finite unit circle, so there is **no aliasing**. The price is **frequency warping**, corrected by the pre-warp in step 2.

---

### 2021 Q8a / 2023 Q8b: Advantages of FIR over IIR

1. **Exact linear phase** possible (symmetric coefficients).
2. **Always stable** — no feedback, no poles.
3. **No limit cycles** — quantization errors do not circulate.
4. **Lower coefficient sensitivity** — zeros move less than poles.
5. **Easier to pipeline** and parallelize in hardware.
6. **Robust to round-off** and simpler to analyze.

Disadvantages: more multiplies for the same magnitude spec, more memory, and a longer delay for the same transition width.

---

### 2021 Q8b: Steps to design an analog Butterworth filter

1. From the spec, compute the order

$$N=\frac{\log_{10}\left(\frac{10^{A_s/10}-1}{10^{A_p/10}-1}\right)}{2\log_{10}\left(\Omega_s/\Omega_p\right)}$$

2. Compute the cutoff

$$\Omega_c=\frac{\Omega_p}{\left(10^{A_p/10}-1\right)^{1/(2N)}}$$

3. Place the poles on a circle of radius $\Omega_c$ in the left half-plane:

$$p_k=\Omega_c\,e^{j\pi(2k+N+1)/(2N)},\qquad k=0,\dots,N-1$$

4. Form

$$H_a(s)=\frac{\Omega_c^N}{\prod_{k=1}^{N}(s-p_k)}$$

5. Realize as a cascade of second-order sections and map to digital if needed.

---

### 2021 Q8c: Principle of FIR design by windows

1. Start from the ideal (infinite, noncausal) impulse response $h_d[n]$.
2. Truncate to $\pm M$ and shift by $M$ to make it causal.
3. Multiply by a window $w[n]$ to control the Gibbs ripple.
4. The result is $h[n]=h_d[n-M]w[n]$, with a linear phase from the symmetry.

The window sets the trade-off: wider main lobe means a slower transition; lower sidelobes mean less ripple and leakage.

---

## Lab (CSE 410)

### Q1: Elementary signals with `subplot`

```matlab
n = -20:20;
fs = 100; t = n/fs;

subplot(2,2,1); stem(n, cos(2*pi*5*t)); title('Cosine');
subplot(2,2,2); stem(n, (n==0));          title('Unit impulse');
subplot(2,2,3); stem(n, sin(2*pi*5*t));  title('Sine');
subplot(2,2,4); stem(n, square(2*pi*5*t)); title('Square');
```

For a discrete square wave, `square` works because the time vector is dense; for a true discrete version use `sign(sin(2*pi*5*t))`.

---

### Q3/Q7: FFT of a sequence

```matlab
x = [1 1 1 1 0 0 0 0];
X = fft(x);
N = length(x);
k = 0:N-1;
stem(k, abs(X)); title('Magnitude spectrum');
```

---

### Q4: N-point DFT and IDFT

```matlab
x = [1 2 3 4];
N = 4;
n = 0:N-1; k = 0:N-1;
W = exp(-1j*2*pi/N);
X = x * (W .^ (k'*n));    % DFT matrix product
xr = (1/N) * X * (W .^ (-(k'*n)));   % inverse
```

Equivalently `X = fft(x)` and `xr = ifft(X)`.

---

### Q2: Up-sampling and interpolation

```matlab
x = [1 2 3 4];
L = 2;
xu = upsample(x, L);          % insert zeros
h = fir1(20, 1/L);            % interpolation lowpass
xi = filter(h, 1, xu*L);      % scale to preserve amplitude

subplot(2,1,1); stem(0:length(xu)-1, xu); title('Up-sampled');
subplot(2,1,2); stem(0:length(xi)-1, xi); title('Interpolated');
```

**What to observe:** up-sampling creates spectral **images** at multiples of $F_s/L$; the interpolation filter removes them and fills in the intermediate samples.

---

### Q5: Covariance of sample data

$$\text{cov}(X,Y)=\frac{1}{n-1}\sum_{i=1}^{n}(X_i-\bar X)(Y_i-\bar Y)$$

```matlab
X = [1 2 3 4 5];
Y = [2 4 6 8 10];
n = length(X);
cov_manual = sum((X-mean(X)).*(Y-mean(Y)))/(n-1);
cov_builtin = cov(X, Y);
disp([cov_manual, cov_builtin(1,2)]);
```

Both give the same number. `cov` returns the $2\times2$ matrix; the off-diagonal element is the covariance.

---

### Q6: Logical indexing

```matlab
q = [1 5 6 8 3 2 4 5 9 10];
x = [3 5 7 8 3 1 2 4 11 5 9];

a = q(q > 4);                 % q elements greater than 4
b = intersect(q, x);          % elements common to both
c = x(x <= 7);                % x elements <= 7
```

- `a = [5 6 8 5 9 10]`
- `b = [1 2 3 4 5 8 9]` (the common values, sorted)
- `c = [3 5 7 3 1 2 4 5]`

---

### Q8: $4\times4$ identity matrix

```matlab
I = eye(4);
```

---

### Q9: $x=[2,6,12,15,6,3,10,11]$

```matlab
x = [2 6 12 15 6 3 10 11];

% (a) replace first row with its average --- for a row vector, replace all
%     elements that belong to "the first row" of the reshaped matrix.
%     Interpretation: the vector is one row, so set every element to the mean.
xA = mean(x) * ones(size(x));

% (b) reshape into a row vector (identity if already a row)
xRow = reshape(x, 1, []);
```

If the intent is a $2\times4$ matrix, reshape first, then average the first row:

```matlab
M = reshape(x, 2, 4);      % 2x4
M(1,:) = mean(M(1,:));     % first row -> its average
v = reshape(M, 1, []);     % back to a row vector
```

---

## Quick Answer Table

| Year | Question | Answer |
|---|---|---|
| 2021 | 3c Nyquist | 300 Hz |
| 2021 | 4c DFT $\{1,1,1,0\}$ | $\{3,-j,1,j\}$ |
| 2021 | 6c $X(z)$ | $z^2+3-z^{-1}+2z^{-2}$ |
| 2022 | 3c Nyquist | 12000 Hz |
| 2022 | 5c inverse Z | $-0.4\delta[n]-0.4(-0.5)^nu[n]+0.8u[n]$ |
| 2022 | 6c DFT/IDFT | $\{2,1-j,0,1+j\}$ / $\{0.5,0,0.5,0\}$ |
| 2022 | 7c 8-pt DFT | $X[0]=6$, $X[4]=0$, conjugate pairs |
| 2023 | 2c convolution | $\{1,4,8,8,3,-2,-1\}$ |
| 2023 | 5b $X(z)$ | $z^2+3-z^{-1}+2z^{-2}$ |
| 2023 | 5c inverse Z | same as 2022 |
| 2024 | 3a $F_s=250$ | $-3\sin(4\pi n/5)$ |
| 2024 | 4c quantizer | $3.75$ V, error $-0.05$ V |
| 2024 | 6b DFT $\{0,1,2,3\}$ | $\{6,-2+2j,-2,-2-2j\}$ |
| 2024 | 7a mean/median | 5 / 5 |
| 2024 | 7b variance | population 5, sample 6.67 |

---

## Exam Strategy

1. **Read the ROC.** Every inverse-Z answer depends on it.
2. **State the convention** when a sequence's arrow position is ambiguous.
3. **Show the frequency computation** for every sampling question — the marks are there.
4. **Check conjugate symmetry** on every DFT of a real sequence; it catches sign errors.
5. **Verify with Parseval** when time permits.
6. **Draw the block diagram** for structure questions; labels earn marks.
7. **Give both $n$ and $n-1$** in statistics when the question does not specify population vs sample.

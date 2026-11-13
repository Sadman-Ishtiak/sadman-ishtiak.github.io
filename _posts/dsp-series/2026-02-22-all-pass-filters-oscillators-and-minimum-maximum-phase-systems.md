---
title: "All-Pass Filters, Digital Oscillators, and Minimum/Maximum-Phase Systems"
date: 2026-02-22 00:00:00 +0600
categories: ['Academic', 'CSE-409 Digital Signal Processing']
tags: ['dsp', 'filters', 'all-pass', 'phase', 'deconvolution', 'academic', 'cse409', 'cse410', 'jkkniu']
description: Constant-magnitude all-pass systems, sinusoidal oscillator structures, inverse systems, and homomorphic deconvolution.
math: true
---
## All-Pass Filters

An **all-pass filter** passes every frequency with the same magnitude but changes the phase:

$$\vert H(e^{j\omega})\vert=1 \quad \forall\omega$$

### The Trivial Case: Pure Delay

$$H(z)=z^{-k}$$

Magnitude 1 at every frequency, linear phase $-\omega k$. It only delays.

### The General First-Order All-Pass

$$H(z)=\frac{a+z^{-1}}{1+az^{-1}},\qquad \vert a\vert<1$$

Check the magnitude on the unit circle:

$$\vert H(e^{j\omega})\vert^2=H(e^{j\omega})H(e^{-j\omega})=\frac{a+e^{-j\omega}}{1+ae^{-j\omega}}\cdot\frac{a+e^{j\omega}}{1+ae^{j\omega}}$$

Numerator: $a^2+ae^{j\omega}+ae^{-j\omega}+1=a^2+1+2a\cos\omega$.

Denominator: $1+ae^{j\omega}+ae^{-j\omega}+a^2=a^2+1+2a\cos\omega$.

They are identical, so $\vert H\vert^2=1$ for all $\omega$. The filter is all-pass.

**Pole-zero geometry:** a pole at $z=-a$ and a zero at $z=-1/a$. They are **reciprocal reflections** through the unit circle. For stability $\vert a\vert<1$, the pole is inside and the zero is outside.

### The Nth-Order All-Pass

$$H(z)=\frac{a_N+a_{N-1}z^{-1}+\dots+a_1z^{-N+1}+z^{-N}}{1+a_1z^{-1}+\dots+a_Nz^{-N}}$$

In polynomial notation with $A(z)=1+a_1z^{-1}+\dots+a_Nz^{-N}$:

$$H(z)=z^{-N}\frac{A(z^{-1})}{A(z)}$$

Every pole $p_k$ is paired with a zero at $1/p_k^*$ (reciprocal conjugate). The magnitude is exactly 1 because

$$\vert H(e^{j\omega})\vert^2=H(z)H(z^{-1})\big\vert_{z=e^{j\omega}}=1$$

### Phase and Group Delay

For the first-order section:

$$\theta_{ap}(\omega)=-\omega-2\tan^{-1}\frac{a\sin\omega}{1+a\cos\omega}$$

$$\tau_g(\omega)=-\frac{d\theta_{ap}}{d\omega}=\frac{1-a^2}{1+a^2-2a\cos\omega}$$

For $\vert a\vert<1$ the numerator is positive and the denominator is positive, so **the group delay is always non-negative**. A causal, stable all-pass can only add delay, never advance.

At $\omega=0$: $\tau_g=\dfrac{1-a^2}{(1-a)^2}=\dfrac{1+a}{1-a}$, which grows large as $a\to1$. That is the resonance effect of a pole near the unit circle.

### What All-Pass Filters Are For

| Use | Why |
|---|---|
| **Phase equalizer** | Cascade with a system whose phase is nonlinear; the all-pass cancels the excess delay so the total is linear phase |
| **Notch / resonator tuning** | Change the phase without touching the magnitude |
| **Minimum-phase decomposition** | Any system = minimum-phase system × all-pass |
| **Reverb / decorrelation** | All-pass sections scatter energy in time while preserving the spectrum |

---

## Digital Sinusoidal Oscillators

A sinusoid generator is a **two-pole resonator with the poles exactly on the unit circle**. From the standard second-order form:

$$H(z)=\frac{b_0}{1+a_1z^{-1}+a_2z^{-2}}$$

with

$$a_1=-2r\cos\omega_0,\qquad a_2=r^2$$

Set $r=1$ (no damping) and $b_0=A\sin\omega_0$. Then the impulse response is

$$h[n]=\frac{b_0}{\sin\omega_0}\sin\big((n+1)\omega_0\big)u[n]=A\sin\big((n+1)\omega_0\big)u[n]$$

The difference equation is

$$y[n]=-a_1y[n-1]-y[n-2]+b_0\delta[n]$$

$$y[n]=2\cos\omega_0\,y[n-1]-y[n-2]+A\sin\omega_0\,\delta[n]$$

with $y[-1]=y[-2]=0$.

**Iterating:**

$$y[0]=A\sin\omega_0$$
$$y[1]=2\cos\omega_0\,y[0]=2A\sin\omega_0\cos\omega_0=A\sin2\omega_0$$
$$y[2]=2\cos\omega_0\,y[1]-y[0]=A\sin3\omega_0$$

using the identity $\sin\alpha+\sin\beta=2\sin\frac{\alpha+\beta}{2}\cos\frac{\alpha-\beta}{2}$.

The impulse at $n=0$ only **starts** the oscillation. After that it is self-sustaining because there is no damping ($r=1$). This is a **recursive oscillator**: two multiplies and two adds per sample, no sine lookup table.

### Zero-Input Form

The same sinusoid comes from the homogeneous equation

$$y[n]=2\cos\omega_0\,y[n-1]-y[n-2]$$

with initial conditions $y[-1]=0$, $y[-2]=-A\sin\omega_0$. No input at all — the initial state stores the energy.

### Coupled-Form Oscillator (Sine and Cosine Together)

When you need both quadrature outputs, use the coupled form:

$$y_c[n]=\cos\omega_0\,y_c[n-1]-\sin\omega_0\,y_s[n-1]$$
$$y_s[n]=\sin\omega_0\,y_c[n-1]+\cos\omega_0\,y_s[n-1]$$

or in matrix form

$$\begin{bmatrix}y_c[n]\\ y_s[n]\end{bmatrix}=\begin{bmatrix}\cos\omega_0 & -\sin\omega_0\\ \sin\omega_0 & \cos\omega_0\end{bmatrix}\begin{bmatrix}y_c[n-1]\\ y_s[n-1]\end{bmatrix}$$

Initial conditions $y_c[-1]=A\cos\omega_0$, $y_s[-1]=-A\sin\omega_0$. This is a rotation by $\omega_0$ each sample — numerically the most robust oscillator form because both outputs have equal and bounded amplitude.

> **Practical caveat:** with finite word length, the poles of the recursive oscillator drift off the unit circle, causing the amplitude to grow or decay. Production code usually uses the coupled form, periodic renormalization, or a lookup table.

---

## Inverse Systems

Given a system $H(z)$, its **inverse** $H^{-1}(z)=1/H(z)$ recovers the input:

$$x[n]\;\xrightarrow{\;H\;}\;y[n]\;\xrightarrow{\;H^{-1}\;}\;x[n]$$

In the Z-domain, $H(z)H^{-1}(z)=1$, so the cascade is a perfect identity. The inverse has poles where $H$ has zeros and zeros where $H$ has poles.

**The catch:** for the inverse to be **causal and stable**, its ROC must be outside its outermost pole and include the unit circle. That requires all zeros of $H(z)$ to lie **inside** the unit circle.

---

## Minimum-Phase, Maximum-Phase, Mixed-Phase

Classify a system by where its zeros sit:

| Type | Zeros | Poles (stable, causal) | Inverse |
|---|---|---|---|
| **Minimum-phase** | all inside $\vert z\vert<1$ | all inside | Causal and stable |
| **Maximum-phase** | all outside $\vert z\vert>1$ | all inside | Anti-causal / unstable |
| **Mixed-phase** | some inside, some outside | all inside | Neither |

**Why "minimum phase"?** Among all systems with the same magnitude response, the minimum-phase system has the **minimum group delay** and the energy of its impulse response is concentrated closest to $n=0$. It is the "fastest" system with that magnitude.

**Maximum phase** is the time-reverse of minimum phase: maximum delay, energy concentrated at the end.

### Decomposition of Any System

Any stable system can be written as

$$H(z)=H_{\min}(z)\,H_{ap}(z)$$

where $H_{\min}$ has all zeros inside the unit circle and $H_{ap}$ is all-pass. The construction: for every zero $z_k$ outside the circle, replace it with $1/z_k^*$ inside and multiply by an all-pass factor

$$\frac{z^{-1}-z_k^*}{1-z_kz^{-1}}$$

which has magnitude 1. The magnitude response is unchanged; only the phase is redistributed.

**Group delay relation:**

$$\tau_g(\omega)=\tau_{g,\min}(\omega)+\tau_{g,ap}(\omega)$$

Since $\tau_{g,ap}\ge0$, the non-minimum-phase system always has **more** delay than its minimum-phase equivalent.

---

## Deconvolution

Deconvolution is the problem of undoing a convolution: given $y[n]=x[n]*h[n]$, recover $x[n]$.

$$X(z)=\frac{Y(z)}{H(z)}=Y(z)H^{-1}(z)$$

### Three Cases

**1. $H(z)$ minimum-phase (all zeros inside).** The inverse is causal and stable. A simple IIR filter recovers $x[n]$. This is the easy case.

**2. $H(z)$ has zeros outside.** The exact inverse is unstable. Options: use a delayed approximation, a least-squares inverse, or a homomorphic method.

**3. $H(z)$ unknown.** You must estimate it first — this is **blind deconvolution** (system identification).

### Homomorphic (Cepstral) Deconvolution

Turn convolution into addition by taking logs:

$$y[n]=x[n]*h[n] \;\Rightarrow\; Y(z)=X(z)H(z)$$

$$\ln Y(z)=\ln X(z)+\ln H(z)$$

Inverse-transform:

$$\hat y[n]=\hat x[n]+\hat h[n]$$

where $\hat y$ is the **complex cepstrum**. The two components are now **added**, so they can be separated by a linear filter (a "lifter") in the quefrency domain. This is how speech pitch is separated from the vocal-tract response, and how seismic wavelets are removed from reflections.

> **Why it works:** the vocal tract varies slowly with quefrency; the pitch appears at a high quefrency. A low-pass lifter keeps the tract, a high-pass lifter keeps the pitch.

---

## Summary Table

| Concept | Defining property | Key formula |
|---|---|---|
| All-pass | $\vert H(e^{j\omega})\vert=1$ | $H=z^{-N}A(z^{-1})/A(z)$ |
| All-pass pole-zero | Reciprocal pairs | pole $p$, zero $1/p^*$ |
| All-pass delay | Non-negative group delay | $\tau_g=\frac{1-a^2}{1+a^2-2a\cos\omega}$ |
| Oscillator | Poles on the unit circle | $y[n]=2\cos\omega_0y[n-1]-y[n-2]$ |
| Minimum phase | All zeros inside | Stable causal inverse |
| Maximum phase | All zeros outside | Time-reverse of minimum phase |
| Decomposition | $H=H_{\min}H_{ap}$ | Magnitude preserved, phase split |
| Deconvolution | Invert the convolution | $X=Y/H$ |
| Cepstrum | Log turns $*$ into $+$ | $\hat y=\hat x+\hat h$ |

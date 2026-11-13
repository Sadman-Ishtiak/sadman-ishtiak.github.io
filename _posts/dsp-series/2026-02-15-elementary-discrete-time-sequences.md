---
title: "Elementary Discrete-Time Sequences"
date: 2026-02-15 00:00:00 +0600
categories: ['Academic', 'CSE-409 Digital Signal Processing']
tags: ['dsp', 'signals', 'fundamentals', 'time-domain', 'academic', 'cse409', 'cse410', 'jkkniu']
description: Impulse, step, ramp, sinusoid and exponential sequences, and when a discrete sinusoid is periodic.
math: true
---
## The Building Blocks

Every discrete-time signal can be built from a small set of elementary sequences. These are the discrete cousins of the impulse, step, sine, and exponential functions from continuous-time calculus.

---

## 1. Unit Sample (Unit Impulse)

$$\delta[n] = \begin{cases} 1, & n=0 \\ 0, & n \ne 0 \end{cases}$$

```
δ[n]
 1 |  *
   |
 0 +--+--+--+--+--+-- n
   -2 -1  0  1  2
```

The **shifted** impulse $\delta[n-k]$ is 1 only at $n=k$.

### The Sifting Property

Any sequence can be written as a sum of scaled impulses:

$$x[n] = \sum_{k=-\infty}^{\infty} x[k]\,\delta[n-k]$$

This identity is the foundation of convolution: feed a system impulses, scale, and add.

---

## 2. Unit Step

$$u[n] = \begin{cases} 1, & n \ge 0 \\ 0, & n < 0 \end{cases}$$

```
u[n]
 1 |  *  *  *  *  *
   |
 0 +--+--+--+--+--+-- n
   -2 -1  0  1  2
```

### Relationships

$$\delta[n] = u[n] - u[n-1] \qquad u[n] = \sum_{k=-\infty}^{n} \delta[k]$$

A **shifted** step $u[n-k]$ turns on at $n=k$.

---

## 3. Unit Ramp

$$r[n] = n\,u[n] = \begin{cases} n, & n \ge 0 \\ 0, & n < 0 \end{cases}$$

```
r[n]
   |        *
 2 |     *
 1 |  *
 0 +--+--+--+--+-- n
   0  1  2  3  4
```

The ramp is the running sum of the step: $r[n] = \sum_{k=-\infty}^{n} u[k]$.

---

## 4. Real Sinusoidal Sequence

$$x[n] = A\cos(\omega_0 n + \phi)$$

- $A$ = amplitude
- $\omega_0$ = angular frequency in **radians/sample**
- $\phi$ = phase in radians

When obtained by sampling $A\cos(2\pi F t + \phi)$ at $F_s$, the digital frequency is

$$\omega_0 = 2\pi \frac{F}{F_s}$$

so $\omega_0$ is dimensionless (rad/sample), unlike the analog $\Omega = 2\pi F$ (rad/s).

### Periodicity: The Discrete Difference

A discrete sinusoid is periodic only if there exists an integer $N>0$ such that

$$\omega_0 N = 2\pi m \quad \text{for some integer } m$$

Equivalently, $x[n]=A\cos(\omega_0 n)$ is periodic iff

$$\frac{\omega_0}{2\pi} = \frac{m}{N} \text{ is rational}$$

Then the fundamental period is $N = \frac{2\pi}{\gcd(\omega_0,2\pi)}$ in integer form.

| Sequence | $\omega_0/2\pi$ | Periodic? | Period |
|---|---|---|---|
| $\cos(\pi n/4)$ | $1/8$ | Yes | 8 |
| $\cos(0.1\pi n)$ | $1/20$ | Yes | 20 |
| $\cos(0.3n)$ | irrational | **No** | — |
| $\cos(n)$ | irrational | **No** | — |

> **Exam trap:** every continuous sinusoid is periodic, but not every discrete sinusoid is. Irrational digital frequency gives a non-periodic sequence.

### Aliasing of Discrete Frequencies

Discrete frequencies are unique only over an interval of $2\pi$. In fact

$$\cos[(\omega_0 + 2\pi k)n] = \cos(\omega_0 n)$$

so $\omega_0$ and $\omega_0 + 2\pi$ are **the same** discrete sinusoid. Frequencies also fold: $\omega$ and $2\pi - \omega$ have the same cosine samples.

---

## 5. Complex Exponential Sequence

$$x[n] = A e^{j(\omega_0 n + \phi)} = A\cos(\omega_0 n+\phi) + jA\sin(\omega_0 n+\phi)$$

Euler's relation is the bridge between the two forms. Complex exponentials are the **eigenfunctions of LTI systems**:

$$e^{j\omega n} \;\longrightarrow\; H(e^{j\omega})\,e^{j\omega n}$$

That single fact is why the DTFT exists.

### Harmonically Related Complex Exponentials

For a period-$N$ sequence, the set

$$e^{j2\pi k n/N}, \quad k = 0, 1, \dots, N-1$$

contains exactly $N$ distinct sequences and forms an orthogonal basis for all period-$N$ sequences. This is the discrete Fourier series, and it is the reason the DFT has length $N$.

---

## 6. Real Exponential Sequence

$$x[n] = A\alpha^n, \quad -\infty < n < \infty$$

| $\alpha$ | Behaviour |
|---|---|
| $\alpha > 1$ | Growing exponential |
| $0 < \alpha < 1$ | Decaying exponential |
| $\alpha = 1$ | Constant |
| $\alpha = -1$ | Alternating $\pm A$ |
| $-1 < \alpha < 0$ | Decaying alternating |
| $\alpha < -1$ | Growing alternating |

A common case is $\alpha = e^{\sigma_0}$:

$$x[n]=A e^{(\sigma_0+j\omega_0)n} = A e^{\sigma_0 n}\cos(\omega_0 n) + jA e^{\sigma_0 n}\sin(\omega_0 n)$$

The real part is a **damped sinusoid** — the impulse response of a stable resonator.

---

## Summary Table

| Sequence | Definition | Z-transform | ROC |
|---|---|---|---|
| $\delta[n]$ | $1$ at $n=0$ | $1$ | all $z$ |
| $u[n]$ | $1$ for $n\ge 0$ | $\frac{1}{1-z^{-1}}$ | $\vert z\vert>1$ |
| $a^n u[n]$ | exponential | $\frac{1}{1-az^{-1}}$ | $\vert z\vert>\vert a\vert$ |
| $n a^n u[n]$ | ramp-like | $\frac{az^{-1}}{(1-az^{-1})^2}$ | $\vert z\vert>\vert a\vert$ |
| $\cos(\omega_0 n)u[n]$ | sinusoid | $\frac{1-\cos\omega_0 z^{-1}}{1-2\cos\omega_0 z^{-1}+z^{-2}}$ | $\vert z\vert>1$ |

---

## Operations on Sequences

The seven basic operations split into two groups:

**Amplitude (y-axis):** addition, subtraction, multiplication (windowing/modulation), amplitude scaling.

**Time (x-axis):** shifting (delay/advance), reversal (folding), scaling (down/up-sampling).

Sequences of different lengths can be added or multiplied after **zero-padding** the shorter one to the same index range.

**Example:** $a[n]=\{3,4,6,-9,0\}$ and $b[n]=\{2,-1,4,5,-3\}$ for $0\le n\le 4$.

| Operation | Result |
|---|---|
| $a[n]+b[n]$ | $\{5,3,10,-4,-3\}$ |
| $a[n]b[n]$ | $\{6,-4,24,-45,0\}$ |
| $1.5a[n]$ | $\{4.5,6,9,-13.5,0\}$ |

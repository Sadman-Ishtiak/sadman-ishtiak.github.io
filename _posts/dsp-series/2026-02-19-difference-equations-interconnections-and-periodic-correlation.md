---
title: "Difference Equations, System Interconnections, and Correlation of Periodic Sequences"
date: 2026-02-19 00:00:00 +0600
categories: ['Academic', 'CSE-409 Digital Signal Processing']
tags: ['dsp', 'difference-equations', 'lti-systems', 'correlation', 'academic', 'cse409', 'cse410', 'jkkniu']
description: Recursive vs closed-form solutions, cascade/parallel/feedback interconnection rules, and the correlation of periodic sequences.
math: true
---
## What a Difference Equation Is

A **difference equation** expresses the output of a discrete-time system in terms of past outputs and present/past inputs:

$$y[n] = -\sum_{k=1}^{N}a_k\,y[n-k] + \sum_{k=0}^{M}b_k\,x[n-k]$$

The standard normalized form (with $a_0=1$) is

$$\sum_{k=0}^{N}a_k\,y[n-k] = \sum_{k=0}^{M}b_k\,x[n-k]$$

Taking the Z-transform and using the shift property:

$$\sum_{k=0}^{N}a_k z^{-k}Y(z) = \sum_{k=0}^{M}b_k z^{-k}X(z)$$

$$H(z) = \frac{Y(z)}{X(z)} = \frac{\sum_{k=0}^{M}b_k z^{-k}}{\sum_{k=0}^{N}a_k z^{-k}}$$

- The $b_k$ (feed-forward) coefficients create **zeros**.
- The $a_k$ (feedback) coefficients create **poles**.
- If any $a_k \ne 0$ for $k\ge1$, the equation is **recursive** — the output feeds back.

**Example (2022/2023 exam).**

$$y[n] = 0.5y[n-1] - 0.76y[n-2] + 0.63y[n-3] + x[n] + 0.875x[n-1]$$

Here $a_1=-0.5$, $a_2=0.76$, $a_3=-0.63$; $b_0=1$, $b_1=0.875$, and $H(z) = \dfrac{1+0.875z^{-1}}{1-0.5z^{-1}+0.76z^{-2}-0.63z^{-3}}$.

---

## Solving a Difference Equation

### Method 1: Recursive (Iterative) Solution

Start from known initial conditions and step forward.

**Example.** $y[n]=0.5y[n-1]+x[n]$, $y[-1]=0$, $x[n]=u[n]$.

$$y[0] = 0.5(0)+1 = 1$$
$$y[1] = 0.5(1)+1 = 1.5$$
$$y[2] = 0.5(1.5)+1 = 1.75$$
$$y[3] = 0.5(1.75)+1 = 1.875$$

The sequence approaches $2$. Recursion is simple but gives no closed form and accumulates round-off error.

### Method 2: Closed-Form (Classical) Solution

The total response is the sum of a **natural (homogeneous)** response and a **forced (particular)** response:

$$y[n] = y_h[n] + y_p[n]$$

**Homogeneous part.** Set the input to zero:

$$\sum_{k=0}^{N}a_k\,y_h[n-k]=0$$

Assume $y_h[n]=r^n$. Substituting gives the **characteristic equation**

$$\sum_{k=0}^{N}a_k r^{N-k}=0$$

whose roots $r_1,\dots,r_N$ give

$$y_h[n] = C_1r_1^n + C_2r_2^n + \dots + C_Nr_N^n$$

Repeated roots multiply by $n$; complex roots appear as conjugate pairs and become damped sinusoids.

**Particular part.** Guess a form matching the input:

| Input $x[n]$ | Guess for $y_p[n]$ |
|---|---|
| Constant $K$ | $A$ |
| $K a^n$ | $A a^n$ (if $a$ is not a characteristic root) |
| $\cos(\omega_0 n)$ | $A\cos(\omega_0 n)+B\sin(\omega_0 n)$ |
| Polynomial of degree $m$ | polynomial of degree $m$ |

**Constants** $C_i$ are fixed by the initial conditions.

**Worked example.** $y[n]-0.5y[n-1]=1$, $y[-1]=0$.

Characteristic equation: $r-0.5=0 \Rightarrow r=0.5$, so $y_h[n]=C(0.5)^n$.

Particular: guess $y_p=A$. Then $A-0.5A=1 \Rightarrow A=2$.

Total: $y[n]=C(0.5)^n+2$. At $n=0$: $y[0]=0.5y[-1]+1=1$, so $C+2=1 \Rightarrow C=-1$.

$$\boxed{y[n]=2-(0.5)^n,\quad n\ge 0}$$

This matches the recursion values above: $y[1]=2-0.5=1.5$, $y[2]=1.75$. The natural part $-(0.5)^n$ is the transient; the constant 2 is the steady state.

### Method 3: Z-Transform (the fast route)

$$Y(z) = H(z)X(z), \qquad y[n]=\mathcal{Z}^{-1}\{H(z)X(z)\}$$

For the same example: $H(z)=\dfrac{1}{1-0.5z^{-1}}$, $X(z)=\dfrac{1}{1-z^{-1}}$.

$$Y(z)=\frac{1}{(1-0.5z^{-1})(1-z^{-1})} = \frac{2}{1-z^{-1}}-\frac{1}{1-0.5z^{-1}}$$

$$y[n]=\left(2-(0.5)^n\right)u[n]$$

The Z-transform method automatically handles the initial conditions for a causal system and is the standard exam route.

---

## System Interconnections

### 1. Cascade (Series)

```
x[n] → H₁(z) → H₂(z) → y[n]
```

$$H(z)=H_1(z)H_2(z), \qquad h[n]=h_1[n]*h_2[n]$$

Cascade is commutative for LTI systems: order does not matter.

### 2. Parallel

```
        ┌→ H₁(z) ─┐
x[n] →  ┤         ├→ + → y[n]
        └→ H₂(z) ─┘
```

$$H(z)=H_1(z)+H_2(z), \qquad h[n]=h_1[n]+h_2[n]$$

### 3. Feedback (Cascade with a Loop)

```
        ┌───────────────┐
x[n] → + → H₁(z) → y[n]
        ↑          │
        └── H₂(z) ←┘
```

$$H(z)=\frac{H_1(z)}{1+H_1(z)H_2(z)}$$

Negative feedback in the loop is what turns a feed-forward FIR into a recursive IIR and moves poles into the denominator.

### Interconnection Summary

| Connection | Transfer function | Impulse response |
|---|---|---|
| Cascade | $H_1H_2$ | $h_1*h_2$ |
| Parallel | $H_1+H_2$ | $h_1+h_2$ |
| Feedback | $\dfrac{H_1}{1+H_1H_2}$ | — |

**Stability rule:** a cascade is stable iff every block is stable; a feedback system must be checked pole by pole, since the loop can move poles outside the unit circle.

---

## Correlation of Periodic Sequences

For two **power signals**, correlation is defined with a time average instead of a finite energy sum:

$$r_{xy}[l]=\lim_{M\to\infty}\frac{1}{2M+1}\sum_{n=-M}^{M}x[n]\,y[n-l]$$

For **periodic** sequences of period $N$, the infinite average equals the average over one period:

$$r_{xy}[l]=\frac{1}{N}\sum_{n=0}^{N-1}x[n]\,y[n-l]$$

$$r_{xx}[l]=\frac{1}{N}\sum_{n=0}^{N-1}x[n]\,x[n-l]$$

The index is taken modulo $N$: $x[n-l]=x[(n-l)\bmod N]$.

### Properties

| Property | Autocorrelation | Cross-correlation |
|---|---|---|
| Symmetry | $r_{xx}[-l]=r_{xx}[l]$ (real) | $r_{xy}[-l]=r_{yx}[l]$ |
| Peak | $r_{xx}[0]=\frac{1}{N}\sum x^2[n]=P$ (average power) | $\vert r_{xy}[l]\vert\le\sqrt{P_xP_y}$ |
| Periodicity | $r_{xx}[l+N]=r_{xx}[l]$ | $r_{xy}[l+N]=r_{xy}[l]$ |
| Scaling | Bounded by $r_{xx}[0]$ | Bounded by the geometric mean of powers |

**Worked example.** $x[n]=\{1,-1,1,-1\}$, period $N=4$. Average power:

$$r_{xx}[0]=\frac{1}{4}(1+1+1+1)=1$$

For $l=1$:

$$r_{xx}[1]=\frac{1}{4}\sum_{n=0}^{3}x[n]x[n-1]=\frac{1}{4}\left[x[0]x[3]+x[1]x[0]+x[2]x[1]+x[3]x[2]\right]$$

$$=\frac{1}{4}\left[(1)(-1)+(-1)(1)+(1)(-1)+(-1)(1)\right]=\frac{1}{4}(-4)=-1$$

For $l=2$: every product is $x[n]x[n-2]=1$, so $r_{xx}[2]=1$. The sequence alternates $1,-1,1,-1$ — it is periodic with period 2, exactly the square-wave autocorrelation you would expect.

### Why Periodic Correlation Matters

- **Periodic extension of the DFT:** circular convolution is built from periodic correlation.
- **OFDM / CDMA:** spreading codes are chosen for sharp autocorrelation peaks and low cross-correlation.
- **Pitch detection:** the autocorrelation of a periodic frame peaks again at the period.
- **Radar:** the matched filter output is the cross-correlation of the received and transmitted pulses.

> **Convolution vs correlation:** correlation does **not** time-reverse the second signal. Convolution uses $h[n-k]$; correlation uses $y[n-l]$ directly. That single sign is the whole difference, and it is the most common exam mistake.

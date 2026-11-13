---
title: "Energy, Power, Periodicity, and Signal Symmetries"
date: 2026-02-18 00:00:00 +0600
categories: ['Academic', 'CSE-409 Digital Signal Processing']
tags: ['dsp', 'signals', 'energy', 'power', 'periodicity', 'academic', 'cse409', 'cse410', 'jkkniu']
description: Energy and power signals, even and odd decomposition, periodic sequences, and symmetric vs antisymmetric signals with worked checks.
math: true
---
## Energy and Power Signals

A signal can be classified by whether it carries **finite energy**, **finite average power**, or neither.

### Energy

For a discrete-time signal:

$$E = \sum_{n=-\infty}^{\infty}\vert x[n]\vert^2$$

For a continuous-time signal:

$$E = \int_{-\infty}^{\infty}\vert x(t)\vert^2\,dt$$

Energy is measured in joules (or volts-squared-seconds). It is the total "content" of the signal over all time.

### Average Power

$$P = \lim_{N\to\infty}\frac{1}{2N+1}\sum_{n=-N}^{N}\vert x[n]\vert^2$$

$$P = \lim_{T\to\infty}\frac{1}{2T}\int_{-T}^{T}\vert x(t)\vert^2\,dt$$

Power is energy per unit time, measured in watts (or volts-squared).

### The Three Classes

| Class | Energy $E$ | Power $P$ | Examples |
|---|---|---|---|
| **Energy signal** | $0 < E < \infty$ | $P=0$ | Finite-duration pulses, $a^n u[n]$ for $\vert a\vert<1$, windowed signals |
| **Power signal** | $E=\infty$ | $0 < P < \infty$ | $u[n]$, $\cos(\omega_0 n)$, periodic sequences, random noise |
| **Neither** | $E=\infty$ | $P=\infty$ | $x[n]=n\,u[n]$, growing exponentials |

A signal cannot be both an energy signal and a power signal: a finite-energy signal spread over infinite time has zero average power.

### Worked Examples

**1. Finite pulse.** $x[n]=1$ for $0\le n\le 4$, zero otherwise.

$$E = \sum_{n=0}^{4}1^2 = 5 < \infty, \qquad P = 0$$

Energy signal.

**2. Unit step.** $x[n]=u[n]$.

$$E = \sum_{n=0}^{\infty}1 = \infty$$

$$P = \lim_{N\to\infty}\frac{N+1}{2N+1} = \frac{1}{2}$$

Power signal with average power $1/2$.

**3. Decaying exponential.** $x[n]=a^n u[n]$ with $\vert a\vert<1$.

$$E = \sum_{n=0}^{\infty}a^{2n} = \frac{1}{1-a^2} < \infty$$

Energy signal. Its average power over infinite time is zero.

**4. Sinusoid.** $x[n]=A\cos(\omega_0 n)$ with $\omega_0 = 2\pi m/N$.

$$P = \frac{A^2}{2}$$

Power signal with $E=\infty$. This is why sinusoids have a **power spectral density** rather than an energy spectral density.

**5. Ramp.** $x[n]=n\,u[n]$.

$$E = \sum n^2 = \infty, \qquad P = \lim_{N\to\infty}\frac{1}{2N+1}\sum_{n=0}^{N}n^2 = \infty$$

Neither.

> **Exam rule of thumb:** finite-duration or decaying → energy signal. Infinite-duration with constant amplitude → power signal. Growing without bound → neither.

---

## Periodic Signals

A discrete-time signal is **periodic** with period $N$ if

$$x[n+N]=x[n] \quad \forall n$$

for some positive integer $N$. The **fundamental period** $N_0$ is the smallest such $N$.

A continuous-time signal is periodic with period $T$ if $x(t+T)=x(t)$; the fundamental period is the smallest positive $T$.

### Periodicity of Discrete Sinusoids

A discrete sinusoid $A\cos(\omega_0 n+\phi)$ is periodic **only if**

$$\frac{\omega_0}{2\pi}=\frac{m}{N}$$

is rational. Then $N$ is the fundamental period.

| Signal | $\omega_0/2\pi$ | Periodic? |
|---|---|---|
| $\cos(\pi n/4)$ | $1/8$ | Yes, $N=8$ |
| $\cos(0.1\pi n)$ | $1/20$ | Yes, $N=20$ |
| $\cos(0.3n)$ | irrational | No |
| $\cos(n)$ | irrational | No |

This is a **discrete-only trap**. Every continuous sinusoid is periodic; a discrete sinusoid sampled from one may not be.

### Sum of Periodic Signals

If $x_1[n]$ has period $N_1$ and $x_2[n]$ has period $N_2$, their sum is periodic only when $N_1/N_2$ is rational, with period

$$N = \operatorname{lcm}(N_1,N_2)$$

**Example.** $x[n]=\cos(\pi n/4)+\cos(\pi n/6)$ has $N_1=8$, $N_2=12$, so the sum repeats every $\operatorname{lcm}(8,12)=24$ samples.

If the ratio is irrational — e.g. $\cos(n)+\cos(\sqrt{2}n)$ — the sum is **not periodic**, even though both parts individually are not periodic either. A sum of two non-periodic sinusoids with commensurate frequencies can still be non-periodic.

---

## Even and Odd Signals

### Definitions

$$\text{Even: } x[-n]=x[n]$$

$$\text{Odd: } x[-n]=-x[n]$$

Graphically, an even signal is **mirror-symmetric about the vertical axis**; an odd signal is **antisymmetric** and must pass through the origin ($x[0]=0$ for a finite-valued odd sequence).

### Even/Odd Decomposition

**Every** signal is the sum of an even part and an odd part:

$$x[n] = x_e[n]+x_o[n]$$

where

$$x_e[n]=\frac{x[n]+x[-n]}{2}, \qquad x_o[n]=\frac{x[n]-x[-n]}{2}$$

**Proof.** Compute $x_e[-n]$ and $x_o[-n]$; the definitions swap sign, so $x_e[-n]=x_e[n]$ and $x_o[-n]=-x_o[n]$. Adding them recovers $x[n]$. $\blacksquare$

**Worked example.** $x[n]=\{2,\ 1,\ 4,\ -1,\ 3\}$ with the arrow at $n=0$ (so $x[0]=4$).

- $x[-n]$ reverses the sequence: $\{3,\ -1,\ 4,\ 1,\ 2\}$
- $x_e[n]=\frac{1}{2}(x[n]+x[-n])=\{2.5,\ 0,\ 4,\ 0,\ 2.5\}$
- $x_o[n]=\frac{1}{2}(x[n]-x[-n])=\{-0.5,\ 1,\ 0,\ -1,\ 0.5\}$

Check: $x_e+x_o=\{2,1,4,-1,3\}$. Correct.

### Cross-Checks

| Property | Even | Odd |
|---|---|---|
| $x[-n]$ | $x[n]$ | $-x[n]$ |
| $x[0]$ | any value | must be 0 |
| Product of two even | even | — |
| Product of two odd | even | — |
| Product of even and odd | — | odd |
| Sum of two even | even | — |
| Sum of two odd | odd | — |

A periodic signal that is also even needs only a **cosine** series; a periodic signal that is odd needs only a **sine** series. This is the origin of the cosine/sine split in the Fourier series.

---

## Symmetric and Antisymmetric Signals

The 2024 exam asks for these directly. For continuous time:

$$\text{Symmetric: } x(t)=x(-t)$$

$$\text{Antisymmetric: } x(t)=-x(-t)$$

They are the continuous-time names for even and odd. The same decomposition applies:

$$x(t)=x_e(t)+x_o(t), \qquad x_e(t)=\frac{x(t)+x(-t)}{2}, \qquad x_o(t)=\frac{x(t)-x(-t)}{2}$$

**Example.** $x(t)=e^{-2t}u(t)$.

- $x(-t)=e^{2t}u(-t)$
- $x_e(t)=\frac{1}{2}\left(e^{-2t}u(t)+e^{2t}u(-t)\right)$ — a two-sided decaying exponential, symmetric
- $x_o(t)=\frac{1}{2}\left(e^{-2t}u(t)-e^{2t}u(-t)\right)$ — antisymmetric

Note $x_e(0)=\frac{1}{2}$ while $x(0)=1$. For a signal with a jump at the origin, the even part takes the average of the two one-sided limits.

### Why Symmetry Matters

| Operation | Result |
|---|---|
| Fourier transform of a real even signal | Real and even |
| Fourier transform of a real odd signal | Imaginary and odd |
| Autocorrelation $r_{xx}[k]$ | Always even |
| Convolution of even with even | Even |
| Energy of $x_e$ plus energy of $x_o$ | Equals energy of $x$ (they are orthogonal) |

The last row is a useful shortcut: for a real signal the even and odd parts are orthogonal, so

$$E_x = E_{x_e}+E_{x_o}$$

---

## Quick Reference

| Concept | Formula | Test |
|---|---|---|
| Energy | $\sum \vert x[n]\vert^2$ | Finite and non-zero? |
| Power | $\lim \frac{1}{2N+1}\sum \vert x[n]\vert^2$ | Finite and non-zero? |
| Periodicity | $x[n+N]=x[n]$ | Is $\omega_0/2\pi$ rational? |
| Even | $x[-n]=x[n]$ | Mirror about $y$-axis |
| Odd | $x[-n]=-x[n]$ | Mirror plus sign flip, $x[0]=0$ |
| Decomposition | $x_e+x_o$ | Always possible |

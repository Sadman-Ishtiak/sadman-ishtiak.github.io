---
title: "Discrete-Time Signal Representations and Sequence Types"
date: 2026-02-14 00:00:00 +0600
categories: ['Academic', 'CSE-409 Digital Signal Processing']
tags: ['dsp', 'signals', 'fundamentals', 'time-domain', 'academic', 'cse409', 'cse410', 'jkkniu']
description: Four ways to write a sequence, plus finite, infinite, causal and anti-causal sequences.
math: true
---
## What a Discrete-Time Signal Is

A discrete-time signal is defined **only at discrete instants**. The independent variable takes a discrete set of values and is written $n$ (integer). The sample value is $x[n]$.

$$x[n] \text{ is defined for } n \in \mathbb{Z}, \quad \text{undefined for non-integer } n$$

A sequence is written with braces: $\{x[n]\}$. The braces are often dropped when there is no ambiguity.

---

## Four Representations

Every discrete-time signal can be written four ways. Take the sequence with values $x(-3)=-2$, $x(-2)=3$, $x(-1)=0$, $x(0)=-1$, $x(1)=2$, $x(2)=3$, $x(3)=1$.

### 1. Graphical

Stems at each integer $n$, height equal to the sample value. The $x$-axis is the sample index, the $y$-axis the amplitude.

### 2. Functional

$$x[n] = \begin{cases} -2, & n=-3 \\ 3, & n=-2 \\ 0, & n=-1 \\ -1, & n=0 \\ 2, & n=1 \\ 3, & n=2 \\ 1, & n=3 \\ 0, & \text{otherwise} \end{cases}$$

Or as a closed-form rule, e.g. $x[n]=n^2$ for $-3 \le n \le 4$.

### 3. Tabular

| $n$ | -3 | -2 | -1 | 0 | 1 | 2 | 3 |
|---|---|---|---|---|---|---|---|
| $x[n]$ | -2 | 3 | 0 | -1 | 2 | 3 | 1 |

### 4. Sequence (vector)

$$x[n] = \{-2, 3, 0, \underset{\uparrow}{-1}, 2, 3, 1\}$$

The arrow marks the sample at $n=0$. **If no arrow is shown, the first term is assumed to be at $n=0$.** This convention matters: $\{1,2,3\}$ and $\{1,2,\underset{\uparrow}{3}\}$ are different signals.

---

## Real and Complex Sequences

A sequence is **real** if every $x[n]$ is real, otherwise **complex**.

A complex sequence splits into real and imaginary parts:

$$\{x[n]\} = \{x_{re}[n]\} + j\{x_{im}[n]\}$$

and its complex conjugate is $\{x^*[n]\} = \{x_{re}[n]\} - j\{x_{im}[n]\}$.

**Example:** $\{y[n]\}=\{e^{j0.3n}\}=\{\cos 0.3n\}+j\{\sin 0.3n\}$, so $y_{re}[n]=\cos 0.3n$ and $y_{im}[n]=\sin 0.3n$. Its conjugate is $\{e^{-j0.3n}\}$.

---

## Sampled-Data vs Digital Signals

| Type | Time | Amplitude |
|---|---|---|
| Continuous-time | Continuous | Continuous |
| **Sampled-data** | Discrete | Continuous |
| **Digital** | Discrete | Discrete (quantized) |

A practical DSP system works on **digital** signals: sampling makes time discrete, then quantization (rounding or truncation) makes amplitude discrete.

---

## Finite-Length and Infinite-Length Sequences

A **finite-length** (finite-duration) sequence is nonzero only for $N_1 \le n \le N_2$, with $-\infty < N_1 \le N_2 < \infty$. Its length is

$$N = N_2 - N_1 + 1$$

**Example:** $x[n]=n^2$ for $-3 \le n \le 4$ has length $4-(-3)+1=8$. In contrast $y[n]=\cos 0.4n$ is infinite-length.

A length-$N$ sequence is called an **$N$-point sequence**.

### Zero-Padding

Appending zeros increases the length without changing the information:

$$x[n]=n^2,\ -3\le n\le 4 \quad \xrightarrow{\text{pad with 4 zeros}} \quad x_e[n]=\begin{cases} n^2, & -3\le n\le 4 \\ 0, & 5\le n\le 8 \end{cases}$$

The padded sequence has length $8+4=12$. Zero-padding is used everywhere in DFT/FFT work to avoid circular aliasing and to interpolate the spectrum.

---

## Right-Sided, Left-Sided, Causal, Anti-Causal

| Type | Definition | Special case |
|---|---|---|
| **Right-sided** | $x[n]=0$ for $n<N_1$ | If $N_1 \ge 0$ it is **causal** |
| **Left-sided** | $x[n]=0$ for $n>N_2$ | If $N_2 \le 0$ it is **anti-causal** |
| **Two-sided** | Infinite in both directions | Neither |
| **Finite-duration** | Nonzero only on $N_1 \le n \le N_2$ | Both right- and left-sided |

```
Right-sided:  ... 0 0 0 | 1 2 3 4 ...     (nothing before N1)
Left-sided:   ... 4 3 2 1 | 0 0 0 ...     (nothing after N2)
Causal:       n = 0,1,2,... only
Anti-causal:  n = 0,-1,-2,... only
```

> A causal sequence is exactly a sequence that a real-time system can produce: it never needs future input.

---

## Why These Classifications Matter

- **Causality** decides whether a filter is realizable in real time.
- **Finite vs infinite length** decides whether convolution is a finite sum or an infinite series.
- **Right/left/two-sided** decides the shape of the Z-transform ROC (exterior, interior, or annulus).
- **Zero-padding** decides whether DFT convolution equals linear convolution.

---

## Quick Check

For $x[n]=\{3, -1, \underset{\uparrow}{4}, 2\}$:

1. Length? → 4
2. Causal? → No, it starts at $n=-1$
3. Right-sided? → Yes
4. $x[1]$? → 2
5. Padded to 6 points? → $\{3,-1,4,2,0,0\}$

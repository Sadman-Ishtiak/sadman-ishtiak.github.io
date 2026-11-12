---
title: 'Z-Transform: Definition, ROC, and Transform Pairs'
date: 2026-01-23 00:00:00 +0600
categories:
- Academic
- Digital Signal Processing
tags:
- dsp
- z-transform
- poles-zeros
- academic
- cse409
- cse410
- jkkniu
description: The **Z-transform** is to discrete-time signals what the **Laplace transform**
  is
to continuous-time signals. It converts: ''
math: true
---
## Why Do We Need Another Transform?

The **Z-transform** is to discrete-time signals what the **Laplace transform** is to continuous-time signals. It converts:
- **Convolution** → **Multiplication** (algebraic)
- **Difference equations** → **Algebraic equations**
- **Time-domain analysis** → **Complex frequency-domain analysis**

It's the **primary tool** for analyzing, designing, and implementing discrete-time systems.

---

## Definition

For a discrete-time signal $x[n]$, the **bilateral Z-transform** is:

$$X(z) = \mathcal{Z}\{x[n]\} = \sum_{n=-\infty}^{\infty} x[n] z^{-n}$$

where $z = re^{j\omega}$ is a complex variable.

### Region of Convergence (ROC)

The sum converges only for certain $z$. The **ROC** is the set of $z$ where $|X(z)| < \infty$.

> **The Z-transform is NOT complete without its ROC.** Two different signals can have the same $X(z)$ formula but different ROCs.

---

## ROC Properties: The "Must-Know" Rules

| Signal Type | ROC |
|---|---|
| **Right-sided** ($x[n]=0$ for $n<N$) | $|z| > r_{\text{max}}$ (exterior of circle) |
| **Left-sided** ($x[n]=0$ for $n>N$) | $|z| < r_{\text{min}}$ (interior of circle) |
| **Two-sided** (infinite both ways) | $r_{\text{min}} < |z| < r_{\text{max}}$ (annulus) |
| **Finite-duration** (nonzero only for $N_1 \le n \le N_2$) | Entire $z$-plane except $z=0$ or $z=\infty$ |

**Key ROC Rules:**
1. ROC cannot contain poles
2. ROC is a connected region (annulus, disc, or exterior)
3. If $x[n]$ is causal → ROC is $|z| > r_{\text{max}}$
4. If $x[n]$ is anti-causal → ROC is $|z| < r_{\text{min}}$
5. For stability: ROC must include **unit circle** $|z|=1$

---

## Common Z-Transform Pairs

| Signal $x[n]$ | $X(z)$ | ROC |
|---|---|---|
| $\delta[n]$ | $1$ | All $z$ |
| $\delta[n-k]$ | $z^{-k}$ | $z \ne 0$ ($k>0$) or $z \ne \infty$ ($k<0$) |
| $u[n]$ | $\frac{1}{1-z^{-1}} = \frac{z}{z-1}$ | $|z| > 1$ |
| $-u[-n-1]$ | $\frac{1}{1-z^{-1}}$ | $|z| < 1$ |
| $a^n u[n]$ | $\frac{1}{1-az^{-1}} = \frac{z}{z-a}$ | $|z| > |a|$ |
| $-a^n u[-n-1]$ | $\frac{1}{1-az^{-1}}$ | $|z| < |a|$ |
| $n a^n u[n]$ | $\frac{az^{-1}}{(1-az^{-1})^2}$ | $|z| > |a|$ |
| $\cos(\omega_0 n) u[n]$ | $\frac{1-\cos(\omega_0)z^{-1}}{1-2\cos(\omega_0)z^{-1}+z^{-2}}$ | $|z| > 1$ |

> **Notice:** $a^n u[n]$ and $-a^n u[-n-1]$ have **identical $X(z)$ but different ROCs**. The ROC tells you which signal you have!

---
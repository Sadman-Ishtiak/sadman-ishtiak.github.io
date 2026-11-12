---
title: Linearity, Causality, and BIBO Stability
date: 2026-01-21 00:00:00 +0600
categories:
- Academic
- Digital Signal Processing
tags:
- dsp
- lti-systems
- convolution
- academic
- cse409
- cse410
- jkkniu
description: '**Test:** If $y[n] = \mathcal{T}\{x[n]\}$, then for any delay $k$:'
math: true
---
## 2. Time-Invariance (Shift-Invariance)

**Test:** If $y[n] = \mathcal{T}\{x[n]\}$, then for any delay $k$:
$$\mathcal{T}\{x[n-k]\} \stackrel{?}{=} y[n-k]$$

| System | Test | Result |
|---|---|---|
| $y[n] = x[n] \cos(\omega_0 n)$ | $y_1[n] = x[n-k]\cos(\omega_0 n) \ne y[n-k]$ | **Time-Variant** |
| $y[n] = \cos[x(n)]$ | $y_1[n] = \cos[x(n-k)] = y[n-k]$ | **Time-Invariant** |

**Key insight:** Explicit $n$-dependence (like $\cos(\omega_0 n)$) breaks time-invariance. Implicit $n$ through $x[n]$ is fine.

---

## 3. Linearity (Superposition)

**Test:** For inputs $x_1[n], x_2[n]$ and constants $a, b$:
$$\mathcal{T}\{a x_1[n] + b x_2[n]\} \stackrel{?}{=} a\mathcal{T}\{x_1[n]\} + b\mathcal{T}\{x_2[n]\}$$

Equivalently: **Additivity** + **Homogeneity (Scaling)**

| System | Test | Result |
|---|---|---|
| $y[n] = 3x[n] + 2$ | $3(ax_1+bx_2)+2 \ne a(3x_1+2)+b(3x_2+2)$ | **Nonlinear** (affine) |
| $y[n] = \text{Re}\{x[n]\}$ | $\text{Re}\{ax_1+bx_2\} = a\text{Re}\{x_1\}+b\text{Re}\{x_2\}$ | **Linear** |
| $y[n] = x^2[n]$ | $(ax_1+bx_2)^2 \ne a x_1^2 + b x_2^2$ | **Nonlinear** |

---

## 4. Causality

**Causal:** Output at $n$ depends only on $x[n], x[n-1], x[n-2], \dots$ (present and past).

**Non-Causal:** Output depends on future inputs $x[n+1], x[n+2], \dots$

| System | Causal? |
|---|---|
| $y[n] = x[n] + 2x[n-1]$ | ✓ Yes |
| $y[n] = x[n+1]$ | ✗ No (advance) |
| $y[n] = x[-n]$ | ✗ No (reversal) |

> **Real-time systems MUST be causal.** Non-causal systems are only realizable offline (stored signals) or with added delay.

---

## 5. BIBO Stability

**Bounded Input → Bounded Output (BIBO):**
If $|x[n]| \le B_x < \infty$ for all $n$, then $|y[n]| \le B_y < \infty$ for all $n$.

### For LTI Systems: Impulse Response Condition

An LTI system is BIBO stable **iff** its impulse response $h[n]$ is absolutely summable:

$$\sum_{n=-\infty}^{\infty} |h[n]| < \infty$$

### In the Z-Domain

LTI system with transfer function $H(z)$:
- **Stable** $\iff$ all poles of $H(z)$ lie **inside** the unit circle ($|z| < 1$)
- ROC must include the unit circle

| $h[n]$ | $\sum |h[n]|$ | Stable? | Pole Location |
|---|---|---|---|
| $a^n u[n], |a|<1$ | $\frac{1}{1-|a|}$ | ✓ | $z=a$ (inside) |
| $a^n u[n], |a|>1$ | $\infty$ | ✗ | $z=a$ (outside) |
| $u[n]$ | $\infty$ | ✗ | $z=1$ (on circle) |
| $\delta[n]$ | 1 | ✓ | None (FIR) |

---
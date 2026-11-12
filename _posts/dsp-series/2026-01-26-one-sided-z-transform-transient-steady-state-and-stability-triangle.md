---
title: "One-Sided Z-Transform, Transient/Steady-State, and Stability Triangle"
date: 2026-01-26 00:00:00 +0600
categories: ['Academic', 'Digital Signal Processing']
tags: ['dsp', 'z-transform', 'poles-zeros', 'academic', 'cse409', 'cse410', 'jkkniu']
description: '## Inverse Z-Transform Methods'
math: true
---
## Inverse Z-Transform Methods

### 1. Partial Fraction Expansion

For rational $X(z) = \frac{N(z)}{D(z)}$, factor denominator and expand:

$$\frac{X(z)}{z} = \frac{A_1}{z-p_1} + \frac{A_2}{z-p_2} + \dots$$

Then use pairs: $\frac{1}{1-az^{-1}} \leftrightarrow a^n u[n]$ (for $|z| > |a|$)

**Critical:** ROC determines causal vs anti-causal terms!

### 2. Power Series (Long Division)

Divide $N(z)$ by $D(z)$ to get series in $z^{-1}$:

$$X(z) = \sum_{n} x[n] z^{-n}$$

Coefficients of $z^{-n}$ are $x[n]$. Works for any ROC by choosing division direction.

### 3. Contour Integration (Cauchy)

$$x[n] = \frac{1}{2\pi j} \oint_C X(z) z^{n-1} dz$$

Where $C$ is counterclockwise contour in ROC. Theoretical; rarely used by hand.

---

## Relationship to Fourier Transform

$$X(e^{j\omega}) = X(z)\big|_{z=e^{j\omega}} = \sum_{n} x[n] e^{-j\omega n}$$

This is the **DTFT** (Discrete-Time Fourier Transform).

| Condition | Result |
|---|---|
| ROC includes $|z|=1$ | DTFT exists = $X(e^{j\omega})$ |
| ROC excludes $|z|=1$ | DTFT does not exist (or is periodic impulse train) |

**DFT** is the sampled DTFT: $X[k] = X(e^{j\omega})\big|_{\omega=2\pi k/N}$

---

## Why Transform to Frequency Domain?

| Time Domain | Frequency Domain |
|---|---|
| Convolution (hard) | Multiplication (easy) |
| Difference equations (recursive) | Algebraic equations |
| Signal "shape" | Spectral content (what frequencies?) |
| Filter design (trial & error) | Pole/zero placement (systematic) |
| Stability (check all $n$) | Check pole locations |

---

## Worked Example: System Analysis

**System:** $y[n] - 0.5 y[n-1] = x[n] + x[n-1]$

**Find:** $H(z)$, poles/zeros, stability, impulse response

**Solution:**
1. Z-transform: $Y(z) - 0.5 z^{-1} Y(z) = X(z) + z^{-1} X(z)$
2. $H(z) = \frac{Y(z)}{X(z)} = \frac{1 + z^{-1}}{1 - 0.5 z^{-1}} = \frac{z+1}{z-0.5}$
3. **Zero:** $z = -1$ (on unit circle → notch at $\omega=\pi$)
4. **Pole:** $z = 0.5$ (inside unit circle → **stable**)
5. ROC: $|z| > 0.5$ (causal)
6. Inverse: $H(z) = \frac{z}{z-0.5} + \frac{1}{z-0.5} = \frac{z}{z-0.5} + 0.5\frac{1}{1-0.5z^{-1}}$
   - $h[n] = (0.5)^n u[n] + 0.5 (0.5)^{n-1} u[n-1]$
   - $h[0] = 1$, $h[n] = 1.5(0.5)^n$ for $n \ge 1$

---

## Solving Difference Equations with Initial Conditions

For $y[n] - a y[n-1] = x[n]$ with $y[-1] = y_0$:

Using **unilateral Z-transform** (sums from $n=0$):
$$\mathcal{Z}\{y[n-1]\} = z^{-1}Y(z) + y[-1]$$

$$Y(z) - a(z^{-1}Y(z) + y_0) = X(z)$$
$$Y(z) = \frac{X(z) + a y_0}{1 - a z^{-1}}$$

The initial condition appears as an **additional input term**!

---

## One-Sided Z-Transform (Proakis 3.6)

For signals with initial conditions, use the **one-sided (unilateral) Z-transform**:

$$X_+(z) = \sum_{n=0}^{\infty} x[n] z^{-n}$$

**Key Properties:**

| Property | Time Domain | Z-Domain |
|---|---|---|
| **Time Advance** | $x[n+1]$ | $z X_+(z) - z x[0]$ |
| **Time Delay** | $x[n-1]$ | $z^{-1} X_+(z) + x[-1]$ |
| **Second-Order Delay** | $x[n-2]$ | $z^{-2} X_+(z) + z^{-1}x[-1] + x[-2]$ |

This directly incorporates initial conditions into the algebraic equation.

### Worked Example: Second-Order System with Initial Conditions

**System:** $y[n] - 0.5y[n-1] - 0.25y[n-2] = x[n]$ with $y[-1]=1, y[-2]=2$

Using one-sided Z-transform:
$$Y_+(z) - 0.5(z^{-1}Y_+(z) + 1) - 0.25(z^{-2}Y_+(z) + z^{-1} + 2) = X_+(z)$$

$$Y_+(z)(1 - 0.5z^{-1} - 0.25z^{-2}) = X_+(z) + 0.5 + 0.25z^{-1} + 0.5$$

Initial conditions contribute **additional terms** to the numerator.

---

## Pole-Zero Cancellations (Proakis 3.5.4)

When a pole and zero coincide, they **cancel**:
- In $H(z)$: System order reduces
- In $Y(z) = H(z)X(z)$: Input zero suppresses system mode (or vice versa)

**Critical:** Never rely on pole-zero cancellation to stabilize an unstable system. Finite precision makes exact cancellation impossible → instability in practice.

### Example
$$H(z) = \frac{1 - 5z^{-1} + 6z^{-2}}{1 - 2.5z^{-1} + z^{-2}} = \frac{(1-2z^{-1})(1-3z^{-1})}{(1-0.5z^{-1})(1-2z^{-1})}$$

Pole at $z=2$ cancels with zero at $z=2$. Reduced system:
$$H_{\text{reduced}}(z) = \frac{1-3z^{-1}}{1-0.5z^{-1}}$$

Original: unstable (pole at 2). Reduced: stable. **But quantization makes exact cancellation impossible.**

---

## Transient vs Steady-State Response (Proakis 3.5.2)

For $Y(z) = H(z)X(z)$, partial fraction expansion gives:

$$Y(z) = \sum \frac{A_k}{1-p_k z^{-1}} + \text{(forced response terms)}$$

| Component | Time Domain | Behavior |
|---|---|---|
| **Natural/Transient** | $\sum A_k p_k^n u[n]$ | Decays if $|p_k|<1$ |
| **Forced/Steady-State** | Matches input form | Persists as long as input |

### Example
System: $H(z) = \frac{1}{1-0.5z^{-1}}$, Input: $x[n] = 10\cos(\pi n/4)u[n]$

**Transient:** $(0.5)^n u[n]$ (decays)
**Steady-State:** $13.56\cos(\pi n/4 - 28.7^\circ)u[n]$ (persists)

---

## Stability Triangle for Second-Order Systems (Proakis 3.5.6)

For $y[n] = -a_1 y[n-1] - a_2 y[n-2] + b_0 x[n]$, poles are roots of:
$$z^2 + a_1 z + a_2 = 0$$

**Stability Conditions (all poles inside unit circle):**
$$|a_2| < 1 \quad \text{and} \quad |a_1| < 1 + a_2$$

These define a **triangle in the $(a_1, a_2)$ plane**:

```
a2 = 1
  |
  |   Stable Region
  |  /     \
  | /       \
  |/_________\
a1=-2        a1=2
  a2 = -1
```

**Pole types by region:**
- Below parabola $a_2 = a_1^2/4$: Real & distinct
- On parabola: Real & equal (double pole)
- Above parabola: Complex conjugate

---

## Multiple-Order Poles and Stability (Proakis 3.5.5)

If input has poles coinciding with system poles → **multiple-order poles** in $Y(z)$.

Output contains terms: $A n^b p^n u[n]$ where $b$ = pole multiplicity - 1

| Pole Location | Behavior |
|---|---|
| $|p| < 1$ | Decays to 0 (exponential dominates polynomial) |
| $|p| = 1$ | **Unbounded** (e.g., step input to integrator $H(z)=1/(1-z^{-1})$ → ramp) |
| $|p| > 1$ | Grows unbounded |

**BIBO stability requires ALL system poles strictly inside unit circle.** Poles on unit circle = marginally stable (only useful for digital oscillators).

---
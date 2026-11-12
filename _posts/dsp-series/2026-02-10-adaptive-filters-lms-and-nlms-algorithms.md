---
title: "Adaptive Filters: LMS and NLMS Algorithms"
date: 2026-02-10 00:00:00 +0600
categories: ['Academic', 'Digital Signal Processing']
tags: ['dsp', 'adaptive-filters', 'lms', 'rls', 'echo-cancellation', 'academic', 'cse409', 'cse410', 'jkkniu']
description: '## Why Adaptive Filters?'
math: true
---
## Why Adaptive Filters?

**Fixed filters** need known signal/noise statistics. **Adaptive filters** adjust coefficients in real-time when:
- Statistics are **unknown** a priori
- Statistics **change over time** (non-stationary)
- Real-time tracking required

Applications: Channel equalization, echo cancellation, noise cancellation, system identification, beamforming.

---

## Adaptive Filter Structure

```
              x[n] ──►─────────────►─────────────►
                      │              │
                      ▼              │
                   [Adaptive      [Fixed/Reference]
                    Filter]           │
                      │              │
                      ▼              ▼
                   y[n] ◄───[−]──► e[n] = d[n] - y[n]
                      │
                      ▼
                 [Coefficient
                  Update Algorithm]
                      │
                      ▼
              w[n+1] = f(w[n], x[n], e[n])
```

- **Input**: $x[n]$ (reference/noise)
- **Desired**: $d[n]$ (target signal + noise, or training sequence)
- **Output**: $y[n] = \mathbf{w}^T[n] \mathbf{x}[n]$
- **Error**: $e[n] = d[n] - y[n]$
- **Goal**: Minimize $E[e^2[n]]$ or $|e[n]|$

---

## Wiener Filter (Optimal Fixed Solution)

For known statistics, the **Wiener-Hopf equation** gives optimal $\mathbf{w}_{\text{opt}}$:

$$\mathbf{R}_{xx} \mathbf{w}_{\text{opt}} = \mathbf{p}_{dx}$$

Where:
- $\mathbf{R}_{xx} = E[\mathbf{x}[n]\mathbf{x}^T[n]]$ (autocorrelation matrix)
- $\mathbf{p}_{dx} = E[d[n]\mathbf{x}[n]]$ (cross-correlation vector)

**Solution:** $\mathbf{w}_{\text{opt}} = \mathbf{R}_{xx}^{-1} \mathbf{p}_{dx}$

**Minimum MSE:** $\xi_{\min} = \sigma_d^2 - \mathbf{p}_{dx}^T \mathbf{R}_{xx}^{-1} \mathbf{p}_{dx}$

---

## LMS Algorithm (Least Mean Squares)

**Widrow-Hoff (1960)** — stochastic gradient descent on $J = E[e^2[n]]$.

### Update Rule:
$$\mathbf{w}[n+1] = \mathbf{w}[n] + \mu e[n] \mathbf{x}[n]$$

Where:
- $\mu$ = step size (convergence rate vs. stability trade-off)
- $e[n] = d[n] - \mathbf{w}^T[n]\mathbf{x}[n]$

### Derivation (Instantaneous Gradient):
$$\nabla J \approx -2 e[n] \mathbf{x}[n] \quad \text{(stochastic approx)}$$
$$\mathbf{w}[n+1] = \mathbf{w}[n] - \frac{\mu}{2} \nabla J = \mathbf{w}[n] + \mu e[n] \mathbf{x}[n]$$

### LMS Properties

| Property | Detail |
|---|---|
| **Complexity** | $O(M)$ per sample ($M$ = filter length) |
| **Memory** | $O(M)$ |
| **Convergence** | Mean: $0 < \mu < 2/\lambda_{\max}$ |
| **Excess MSE** | $\xi_{\text{excess}} \approx \frac{\mu}{2} \text{Tr}(\mathbf{R}_{xx}) \xi_{\min}$ |
| **Misadjustment** | $M = \frac{\mu}{2} \text{Tr}(\mathbf{R}_{xx})$ |

### Step Size $\mu$ Trade-off

| $\mu$ Value | Convergence Speed | Steady-State Error | Stability |
|---|---|---|---|
| **Large** | Fast | High (misadjustment) | Risk of divergence |
| **Small** | Slow | Low (close to Wiener) | Stable |

**Rule of thumb:** $\mu \approx \frac{1}{10 \cdot \text{Tr}(\mathbf{R}_{xx})}$ or $\mu \approx \frac{1}{3M \sigma_x^2}$

### Normalized LMS (NLMS)

Fixes $\mu$ sensitivity to input power:

$$\mathbf{w}[n+1] = \mathbf{w}[n] + \frac{\mu}{\mathbf{x}^T[n]\mathbf{x}[n] + \delta} e[n] \mathbf{x}[n]$$

- $\delta$ prevents division by zero
- Typical $\mu \in (0, 2)$
- Convergence independent of input scaling

---
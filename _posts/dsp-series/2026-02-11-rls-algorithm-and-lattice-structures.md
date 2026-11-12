---
title: "RLS Algorithm and Lattice Structures"
date: 2026-02-11 00:00:00 +0600
categories: ['Academic', 'Digital Signal Processing']
tags: ['dsp', 'adaptive-filters', 'lms', 'rls', 'echo-cancellation', 'academic', 'cse409', 'cse410', 'jkkniu']
description: '## RLS Algorithm (Recursive Least Squares)'
math: true
---
## RLS Algorithm (Recursive Least Squares)

**Minimizes weighted sum of squared errors:**
$$J[n] = \sum_{k=0}^{n} \lambda^{n-k} e^2[k]$$

$\lambda$ = forgetting factor ($0 < \lambda \le 1$, typically $0.98-0.999$)

### Update Equations:

| Variable | Update |
|---|---|
| **Gain vector** | $\mathbf{k}[n] = \frac{\lambda^{-1} \mathbf{P}[n-1] \mathbf{x}[n]}{1 + \lambda^{-1} \mathbf{x}^T[n] \mathbf{P}[n-1] \mathbf{x}[n]}$ |
| **Error** | $e[n] = d[n] - \mathbf{w}^T[n-1] \mathbf{x}[n]$ |
| **Weights** | $\mathbf{w}[n] = \mathbf{w}[n-1] + \mathbf{k}[n] e[n]$ |
| **Inverse correlation** | $\mathbf{P}[n] = \lambda^{-1} \mathbf{P}[n-1] - \lambda^{-1} \mathbf{k}[n] \mathbf{x}^T[n] \mathbf{P}[n-1]$ |

**Initialization:** $\mathbf{P}[0] = \delta^{-1} \mathbf{I}$ ($\delta \approx 0.01$)

### RLS vs LMS Comparison

| Aspect | LMS | RLS |
|---|---|---|
| **Complexity** | $O(M)$ | $O(M^2)$ |
| **Convergence** | Slow (~$200M$ samples) | **Fast** (~$2M$ samples) |
| **Steady-state MSE** | Higher (misadjustment) | **Optimal** (matches Wiener) |
| **Tracking** | Moderate | Excellent |
| **Numerical issues** | Robust | Needs stabilization |
| **Memory** | $O(M)$ | $O(M^2)$ |

---

## Lattice-Ladder RLS (Proakis 13.4)

**Numerically stable** RLS using lattice structure:
- Orthogonalizes input → better conditioning
- Modular structure
- Lower complexity than direct-form RLS for large $M$

### Key Advantages:
- No matrix inversion
- Natural parameter constraints
- Good for fixed-point implementation

---
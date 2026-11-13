---
title: "Statistical Description of Signals: Mean and Variance"
date: 2026-01-17 00:00:00 +0600
categories: ['Academic', 'CSE-409 Digital Signal Processing']
tags: ['dsp', 'statistics', 'signal-analysis', 'academic', 'cse409', 'cse410', 'jkkniu']
description: '## Why Statistics in DSP?'
math: true
---
## Why Statistics in DSP?

Most real-world signals—speech, EEG, seismic, radar—are **random** (non-deterministic). They cannot be described by exact formulas. Instead, we characterize them using **statistical parameters** that reveal their nature and guide processing choices.

---

## First-Order Statistics: Central Tendency

### Mean (Average / DC Component)

For a discrete-time signal $x[n]$ of length $N$:

$$\mu_x = \frac{1}{N} \sum_{n=0}^{N-1} x[n]$$

**Continuous-time**: $\mu_x = \lim_{T \to \infty} \frac{1}{2T} \int_{-T}^{T} x(t) dt$

**Physical meaning**: The DC offset. For zero-mean signals, the mean is zero.

### Median

The middle value when samples are sorted. **Robust to outliers** unlike the mean.

| Signal | Mean | Median | Best For |
|---|---|---|---|
| Gaussian noise | 0 | 0 | Symmetric distributions |
| Speech with silence | > 0 | ≈ 0 | Heavy-tailed, outliers |
| ECG baseline wander | Drifts | Stable | Non-stationary |

---

## Second-Order Statistics: Spread and Shape

### Variance

$$\sigma_x^2 = \frac{1}{N} \sum_{n=0}^{N-1} (x[n] - \mu_x)^2 = \frac{1}{N} \sum_{n=0}^{N-1} x^2[n] - \mu_x^2$$

**Physical meaning**: Average power (for zero-mean signals). Units: $x^2$.

### Standard Deviation

$$\sigma_x = \sqrt{\sigma_x^2}$$

**Physical meaning**: RMS amplitude. Same units as signal.

### Comparative Example: Same Mean, Different Standard Deviations

```
Signal A: {9, 10, 11}    μ = 10, σ = 0.82  (tight cluster)
Signal B: {0, 10, 20}    μ = 10, σ = 8.16  (wide spread)
```

Same center, vastly different "energy" and variability.

---
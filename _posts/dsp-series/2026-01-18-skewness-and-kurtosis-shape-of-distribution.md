---
title: 'Skewness and Kurtosis: Shape of Distribution'
date: 2026-01-18 00:00:00 +0600
categories:
- Academic
- Digital Signal Processing
tags:
- dsp
- statistics
- signal-analysis
- academic
- cse409
- cse410
- jkkniu
description: $$\text{Skewness} = \frac{1}{N \sigma_x^3} \sum_{n=0}^{N-1} (x[n] - \mu_x)^3$$
math: true
---
## Third and Fourth Order: Shape of Distribution

### Skewness (Third Moment)

$$\text{Skewness} = \frac{1}{N \sigma_x^3} \sum_{n=0}^{N-1} (x[n] - \mu_x)^3$$

| Skewness | Distribution Shape | Example |
|---|---|---|
| **0** | Symmetric (Gaussian) | Thermal noise |
| **> 0** | Right-skewed (tail to +∞) | Speech envelopes, seismic impulses |
| **< 0** | Left-skewed (tail to -∞) | Clipped signals |

### Kurtosis (Fourth Moment)

$$\text{Kurtosis} = \frac{1}{N \sigma_x^4} \sum_{n=0}^{N-1} (x[n] - \mu_x)^4$$

| Kurtosis | Distribution Shape | Example |
|---|---|---|
| **3** | Gaussian (mesokurtic) | Thermal noise |
| **> 3** | Heavy tails, sharp peak (leptokurtic) | Speech, impulsive noise, radar clutter |
| **< 3** | Light tails, flat peak (platykurtic) | Uniform noise, oversampled signals |

**Excess Kurtosis** = Kurtosis - 3 (Gaussian = 0)

---
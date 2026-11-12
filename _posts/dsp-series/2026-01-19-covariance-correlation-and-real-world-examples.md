---
title: Covariance, Correlation, and Real-World Examples
date: 2026-01-19 00:00:00 +0600
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
description: $$\text{Cov}(x, y) = \frac{1}{N} \sum_{n=0}^{N-1} (x[n] - \mu_x)(y[n]
  - \mu_y)$$
math: true
---
## Cross-Signal Statistics: Relationships

### Sample Covariance

$$\text{Cov}(x, y) = \frac{1}{N} \sum_{n=0}^{N-1} (x[n] - \mu_x)(y[n] - \mu_y)$$

### Correlation Coefficient (Normalized)

$$\rho_{xy} = \frac{\text{Cov}(x, y)}{\sigma_x \sigma_y} \in [-1, 1]$$

| $\rho_{xy}$ | Relationship |
|---|---|
| **1** | Perfect positive linear relationship |
| **0** | Uncorrelated (no linear relationship) |
| **-1** | Perfect negative linear relationship |

### Autocorrelation (Signal with Itself)

$$R_{xx}[k] = \sum_{n} x[n] x[n-k]$$

- $R_{xx}[0]$ = signal energy (or power)
- Peak at $k=0$; width indicates "memory" or correlation time

---

## Why These Statistics Matter

| Statistic | Processing Decision |
|---|---|
| **Mean** | DC blocking? Highpass filter needed? |
| **Variance/Std** | Dynamic range? Gain setting? Quantization bits? |
| **Skewness** | Nonlinear processing? Compression? Log transform? |
| **Kurtosis** | Impulsive noise? Robust statistics needed? Gaussian assumption valid? |
| **Covariance** | Multi-channel processing? Beamforming? MIMO? |
| **Autocorrelation** | Filter design? Prediction? Spectral estimation? |

---

## Real-World Examples

### Speech Signal
- **Mean**: ≈ 0 (AC-coupled microphone)
- **Variance**: Varies with phonemes (vowels > consonants)
- **Skewness**: Positive (impulsive glottal pulses)
- **Kurtosis**: High (> 10) — heavy-tailed, non-Gaussian

### EEG (Brain Waves)
- **Mean**: Near zero
- **Variance**: Changes with state (eyes open/closed, seizure)
- **Skewness**: Near zero (approximately Gaussian)
- **Kurtosis**: ≈ 3 (Gaussian-like) for background; spikes increase it

### Thermal Noise (Resistor)
- **Mean**: 0
- **Variance**: $k_B T R B$ (Johnson-Nyquist)
- **Skewness**: 0
- **Kurtosis**: 3
- **Perfectly Gaussian** — benchmark for testing

### Radar Clutter
- **Mean**: Non-zero (DC from stationary objects)
- **Skewness**: Highly positive
- **Kurtosis**: Very high (spiky, impulsive)
- **Non-Gaussian** — requires CFAR detectors, not matched filters

---

## MATLAB / Python Quick Reference

```matlab
% MATLAB
x = randn(1, 1000);           % Gaussian noise
mu = mean(x);
sigma2 = var(x);
skew = skewness(x);
kurt = kurtosis(x);           % Excess kurtosis (Gaussian = 0)
```

```python
# Python (NumPy/SciPy)
import numpy as np
from scipy.stats import skew, kurtosis

x = np.random.randn(1000)
mu = np.mean(x)
sigma2 = np.var(x)
skew_val = skew(x)
kurt_val = kurtosis(x)        # Excess kurtosis (Gaussian = 0)
```

---
---
title: "ADC Errors and Signal-to-Quantization-Noise Ratio"
date: 2026-01-12 00:00:00 +0600
categories: ['Academic', 'CSE-409 Digital Signal Processing']
tags: ['dsp', 'quantization', 'adc', 'academic', 'cse409', 'cse410', 'jkkniu']
description: '## Quantization vs. Sampling: "Opposite" Operations'
math: true
---
## Quantization vs. Sampling: "Opposite" Operations

| Aspect | Sampling | Quantization |
|---|---|---|
| **Axis discretized** | Time ($x$-axis) | Amplitude ($y$-axis) |
| **Continuous →** | Discrete-time | Discrete-valued |
| **Information loss** | Aliasing (if undersampled) | Quantization noise |
| **Control parameter** | Sampling frequency $F_s$ | Number of bits $B$ |
| **Reversibility** | Perfect if Nyquist met | **Never perfectly reversible** |

> **Key insight**: Sampling can be lossless (Nyquist); quantization is **always lossy**. The lost information becomes quantization noise.

---

## ADC Stage Errors

An Analog-to-Digital Converter introduces errors at multiple stages:

```
Analog Input → Sample & Hold → Quantizer → Encoder → Digital Output
                 │               │          │
            Aperture      Quantization  Encoding
            Jitter        Noise        Errors
```

| Error Source | Description | Mitigation |
|---|---|---|
| **Quantization error** | Fundamental, unavoidable | Increase bits $B$ |
| **Aperture jitter** | Uncertainty in sampling instant | Better clock, lower jitter |
| **Integral non-linearity (INL)** | Deviation from ideal transfer curve | Calibration, better ADC |
| **Differential non-linearity (DNL)** | Uneven step sizes | Laser trimming, calibration |
| **Offset/Gain error** | Systematic shift/scale error | Calibration |

**The quantization stage is the only one that fundamentally cannot be eliminated**—only reduced by using more bits.

---

## Signal-to-Quantization-Noise Ratio (SQNR)

For a full-scale sinusoidal input with $B$ bits:

$$\text{SQNR} \approx 6.02B + 1.76 \text{ dB}$$

| Bits | SQNR (dB) | Typical Application |
|---|---|---|
| 8 | 49.9 | Basic audio, sensors |
| 12 | 74.0 | Instrumentation, audio |
| 16 | 98.1 | CD audio, precision DAQ |
| 24 | 146.2 | Professional audio, scientific |

---

## Non-Uniform Quantization (Advanced)

For signals with non-uniform amplitude distributions (e.g., speech—mostly small amplitudes, occasional large peaks), **non-uniform quantization** allocates more levels where the signal spends more time.

- **$\mu$-law** (North America/Japan): $\mu = 255$
- **A-law** (Europe): $A = 87.6$

These provide ~24 dB improvement for speech at 8 bits vs. uniform quantization.

---
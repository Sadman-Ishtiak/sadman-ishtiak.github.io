---
title: "How to Avoid Aliasing: Anti-Aliasing Filters and DAQ"
date: 2026-01-08 00:00:00 +0600
categories: ['Academic', 'Digital Signal Processing']
tags: ['dsp', 'sampling', 'aliasing', 'nyquist', 'academic', 'cse409', 'cse410', 'jkkniu']
description: '## How to Avoid Aliasing'
math: true
---
## How to Avoid Aliasing

### 1. Sample Above the Nyquist Rate
$$F_s > 2 F_{\text{max}}$$

### 2. Use an Anti-Aliasing Filter (Pre-Filter)
An **analog lowpass filter** before the ADC removes frequencies above $F_s/2$.

```
Analog Signal → Anti-Aliasing LPF → ADC (Sampling + Quantization) → Digital Signal
     x(t)           H(f) cutoff=Fs/2         Fs                          x[n]
```

### 3. Practical Design Margin
In practice, sample at **2.5× to 4×** the highest frequency of interest to relax filter requirements.

---

## Same Sampling Rate, Different Reconstruction Outcomes

| Signal | $F_{\text{max}}$ | $F_s$ | Result |
|---|---|---|---|
| $\cos(2\pi \cdot 100 t)$ | 100 Hz | 250 Hz | ✓ Perfect reconstruction |
| $\cos(2\pi \cdot 100 t)$ | 100 Hz | 150 Hz | ✗ Aliasing (appears as 50 Hz) |

---

## Data Acquisition System (DAQ)

A complete analog-to-digital conversion chain:

```
Sensor → Signal Conditioning → Anti-Aliasing Filter → Sample & Hold → ADC → Digital Processor
         (amplify, filter)      (analog LPF)           (S/H)           (quantize)
```

**Steps to Convert Continuous-Time to Digital:**
1. **Sample** — capture $x(nT)$
2. **Quantize** — map to discrete levels
3. **Encode** — represent as binary words

---

## Quick Reference: Nyquist Rate Cheat Sheet

| Signal Type | Highest Frequency | Minimum $F_s$ |
|---|---|---|
| Speech (telephone) | 3.4 kHz | 8 kHz |
| Audio (CD quality) | 20 kHz | 44.1 kHz |
| ECG | 100–150 Hz | 250–300 Hz |
| EEG | 100 Hz | 250 Hz |
| Radar/Ultrasound | MHz–GHz | Application-specific |

---
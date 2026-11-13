---
title: "Applications: Echo Cancellation, Noise Cancellation, Beamforming"
date: 2026-02-12 00:00:00 +0600
categories: ['Academic', 'CSE-409 Digital Signal Processing']
tags: ['dsp', 'adaptive-filters', 'lms', 'rls', 'echo-cancellation', 'academic', 'cse409', 'cse410', 'jkkniu']
description: '## Applications'
math: true
---
## Applications

### 1. System Identification
```
Unknown System
    x[n] ──►──────► d[n]
            │
            ▼
       [Adaptive]
            │
            ▼
           y[n] ──►[−]──► e[n]
                       │
                       ▼
                 [Update w]
```
- Train with known $x[n]$, measure $d[n]$
- Adaptive filter models unknown system
- Used in: Channel estimation, room acoustics

### 2. Adaptive Channel Equalization
```
Channel
    s[n] ──►──────► x[n] ──► [Adaptive Equalizer] ──► ŝ[n]
                        │
                        ▼
                   Training/
                   Decision-directed
```
- Equalizer inverts channel distortion
- **Training mode**: Known sequence
- **Decision-directed**: Decisions as $d[n]$
- Used in: Modems, wireless, wireline

### 3. Echo Cancellation
```
Far-end ──► Hybrid ──► Echo path ──► Mic
signal       (2-wire/4-wire)           ▲
                           Near-end    │
                          speech ──────┘
                                       │
                              [Adaptive Filter]
                                   │
                                   ▼
                              Cancelled echo
```
- Model echo path with adaptive filter
- Subtract estimate from microphone signal
- **Double-talk detection** needed to avoid divergence

### 4. Adaptive Noise Cancellation
```
Primary: s[n] + n1[n] ──►[−]──► e[n] (clean speech)
                        ▲
Reference: n2[n] ──► [Adaptive] ──┘
(correlated with n1)
```
- Reference noise $n_2[n]$ correlated with primary noise $n_1[n]$
- Adaptive filter estimates $n_1[n]$ from $n_2[n]$
- Subtract from primary
- Used in: Noise-canceling headphones, ECG fetal monitoring

### 5. Adaptive Line Enhancer (ALE)
```
x[n] = s[n] + n[n] ──►[Delay Δ]──►[Adaptive]──►[−]──► e[n] (enhanced)
```
- Delay $\Delta$ decorrelates noise, preserves periodic signal
- Enhances narrowband signals in broadband noise
- Used in: Sonar, vibration analysis, sinusoid extraction

**Suppression of narrowband interference (Proakis 13.1.4).** The same structure works in reverse when the wanted signal is wideband and the disturbance is narrowband. A reference path containing only the interferer (or a delayed copy) drives an adaptive filter whose output is subtracted from the primary path. The filter converges to the interferer's frequency response and removes it while leaving the wideband signal almost untouched. Typical uses: removing a 50/60 Hz power-line hum from an ECG, or a strong jammer from a spread-spectrum receiver. The adaptation must be slow enough not to track and cancel the wanted signal.

### 6. Linear Predictive Coding (LPC) of Speech
```
Speech ──►[Adaptive Predictor]──►[−]──► Residual (error)
                 (short-term)           (whitened)
```
- Predictor models vocal tract
- Residual = excitation (pitch pulses/noise)
- **Compression**: Transmit predictor coefficients + residual
- Used in: GSM, CDMA, VoIP codecs

### 7. Adaptive Beamforming and Adaptive Arrays
```
Sensors: x_1[n], x_2[n], ..., x_M[n] ──► [Adaptive Weights] ──► y[n]
                    │                        │
                    ▼                        ▼
              Beam pattern              Interference
              steering/nulling          suppression
```
- An **adaptive array** is a set of $M$ sensors whose outputs are combined with weights $w_1,\dots,w_M$ that are updated from the data.
- The weights apply a phase (and possibly amplitude) shift per sensor, so signals arriving from the look direction add coherently while signals from other directions cancel.
- Maximize SINR: $\max \frac{\vert \mathbf{w}^H \mathbf{d}\vert ^2}{\mathbf{w}^H \mathbf{R}_{ii} \mathbf{w}}$
- **LMS adaptation:** $w_m[n+1]=w_m[n]+\mu e[n]x_m^{*}[n]$, where $e[n]$ is the beamformer output error. This is spatial filtering with the same LMS rule used in time-domain adaptive filters.
- **MVDR (Capon):** $\mathbf{w} = \frac{\mathbf{R}^{-1} \mathbf{d}}{\mathbf{d}^H \mathbf{R}^{-1} \mathbf{d}}$
- Used in: Radar, sonar, 5G massive MIMO, smart antennas, microphone arrays for speech enhancement

---

## Practical Considerations

### Convergence Diagnostics
```matlab
% Learning curve
mse = zeros(1, N);
for i = 1:N
    e = d(i) - w' * x(:,i);
    w = w + mu * e * x(:,i);
    mse(i) = e^2;
end
plot(10*log10(movmean(mse, 100)));  % dB learning curve
```

### Stability Checks
- Monitor $\Vert \mathbf{w}[n]\Vert $ for divergence
- Clip coefficients if needed
- Use **leaky LMS**: $\mathbf{w}[n+1] = (1-\gamma)\mathbf{w}[n] + \mu e[n]\mathbf{x}[n]$

### Double-Talk Detection (Echo Canc.)
```matlab
% Geigel algorithm
if (near_end_power > threshold * far_end_power)
    freeze_adaptation = true;
end
```

---

## MATLAB / Python Implementation

```matlab
% LMS
function [w, e] = lms(x, d, mu, M)
    w = zeros(M, 1);
    N = length(d);
    e = zeros(N, 1);
    for n = M:N
        xn = x(n:-1:n-M+1);
        y = w' * xn;
        e(n) = d(n) - y;
        w = w + mu * e(n) * xn;
    end
end

% NLMS
w = w + (mu / (xn'*xn + eps)) * e(n) * xn;

% RLS
function [w, e] = rls(x, d, lambda, M)
    w = zeros(M, 1);
    P = eye(M) / 0.01;
    N = length(d);
    e = zeros(N, 1);
    for n = M:N
        xn = x(n:-1:n-M+1);
        k = (P * xn) / (lambda + xn' * P * xn);
        y = w' * xn;
        e(n) = d(n) - y;
        w = w + k * e(n);
        P = (P - k * xn' * P) / lambda;
    end
end
```

```python
# Python LMS
def lms(x, d, mu, M):
    w = np.zeros(M)
    e = np.zeros_like(d)
    for n in range(M, len(d)):
        xn = x[n:n-M:-1]  # x[n], x[n-1], ..., x[n-M+1]
        y = np.dot(w, xn)
        e[n] = d[n] - y
        w += mu * e[n] * xn
    return w, e
```

---
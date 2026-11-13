---
title: "Special IIR Filters, Structures, and Finite Word-Length"
date: 2026-02-03 00:00:00 +0600
categories: ['Academic', 'CSE-409 Digital Signal Processing']
tags: ['dsp', 'filter-design', 'fir', 'iir', 'academic', 'cse409', 'cse410', 'jkkniu']
description: '## Special IIR Filter Types (Proakis 5.4)'
math: true
---
## Special IIR Filter Types (Proakis 5.4)

### Digital Resonator
Narrowband bandpass with pole near unit circle at $z = re^{\pm j\omega_0}$:
$$H(z) = \frac{1 - r}{1 - 2r\cos\omega_0 z^{-1} + r^2 z^{-2}}$$

- $r \approx 1$: Very sharp resonance
- Used for: Tone generation, frequency detection, equalizers

### Notch Filter
Zero on unit circle at $z = e^{\pm j\omega_0}$ to reject specific frequency:
$$H(z) = \frac{1 - 2\cos\omega_0 z^{-1} + z^{-2}}{1 - 2r\cos\omega_0 z^{-1} + r^2 z^{-2}}$$

- $r < 1$: Controls notch bandwidth
- Used for: 60 Hz hum removal, interference rejection

### Comb Filter
Periodic notches/peaks at harmonics:
$$H(z) = \frac{1 - z^{-N}}{1 - r z^{-N}} \quad \text{(comb with peaks)}$$

- Periodic in frequency with spacing $2\pi/N$
- Used for: Harmonic rejection, pitch detection, reverberation

---

## Group Delay & Phase Considerations

| Filter Type | Phase Response | Group Delay $\tau_g(\omega) = -\frac{d\phi}{d\omega}$ |
|---|---|---|
| **FIR (symmetric)** | Linear: $\phi(\omega) = -\alpha\omega$ | **Constant** = $(M-1)/2$ |
| **IIR** | Nonlinear | Frequency-dependent |

**Why group delay matters:**
- Constant group delay = all frequencies delayed equally = no waveform distortion
- IIR filters cause **phase distortion** (different frequencies delayed differently)
- For audio/comms: Use FIR or **zero-phase filtering** (`filtfilt`)

### Zero-Phase Filtering
```matlab
% MATLAB: filtfilt applies filter forward then backward
y = filtfilt(b, a, x);  % Zero phase, magnitude squared
```
- Magnitude response: $\vert H(\omega)\vert ^2$
- Phase response: 0
- **Non-causal** (offline only)

---

## Filter Realization Structures

### Direct Form I (from difference equation)

```
x[n] ──►[b0]──►[+]──►[b1]──►[+]──►[b2]──►[+]──► y[n]
         │     ▲      │     ▲      │     ▲
         │    z⁻¹     │    z⁻¹     │    z⁻¹
         ▼     │      ▼     │      ▼     │
        [-a1]──┘     [-a2]──┘     [-a3]──┘
```

$$y[n] = b_0 x[n] + b_1 x[n-1] + \dots - a_1 y[n-1] - a_2 y[n-2] - \dots$$

**Pros:** Direct from coefficients. **Cons:** High sensitivity for high order; $2N$ delays.

### Direct Form II (Canonical)

```
x[n] ──►[+]──►[z⁻¹]──►[+]──►[z⁻¹]──►[+]──► ...
         ▲     │      ▲     │      ▲
         │    [b0]     │    [b1]   │
         │      │      │      │      │
        [-a1]  [b1]   [-a2]  [b2]   ...
```

**Pros:** Minimum delays ($N$). **Cons:** Large internal signal swings (overflow risk).

### Cascade Form (Second-Order Sections - SOS)

```
H(z) = H_1(z) · H_2(z) · ... · H_K(z)
```

Each $H_k(z)$ is a **biquad** (2nd order):
$$H_k(z) = \frac{b_{0k} + b_{1k}z^{-1} + b_{2k}z^{-2}}{1 + a_{1k}z^{-1} + a_{2k}z^{-2}}$$

**Pros:** Best numerical stability; standard for IIR implementation. **Always use SOS for IIR!**

### Parallel Form

```
H(z) = H_1(z) + H_2(z) + ... + C
```

Partial fraction expansion. Less common.

### FIR Structures

| Structure | Description |
|---|---|
| **Direct Form (Transversal)** | $M$ taps, $M-1$ delays, $M$ multipliers |
| **Cascade** | Factor polynomial into 2nd-order sections |
| **Linear Phase (Symmetric)** | Fold symmetric taps → $\lceil M/2 \rceil$ multipliers |

---

## Finite Word-Length Effects (Proakis Ch. 9)

| Effect | Description | Mitigation |
|---|---|---|
| **Coefficient quantization** | Poles/zeros shift from ideal locations | Use SOS, increase precision |
| **Roundoff noise** | Accumulation of quantization errors | Scaling, noise shaping, higher precision |
| **Limit cycles** | Periodic oscillations in IIR due to rounding | Dithering, saturation arithmetic |
| **Overflow** | Sum exceeds representable range | Scaling, saturation, guard bits |

### Coefficient Quantization Sensitivity
- **Direct Form I/II**: High sensitivity for high-order filters (poles move significantly)
- **SOS (Cascade)**: Low sensitivity — each biquad has low-order denominator
- **Pole locations**: Sensitivity $\propto 1/\vert z - p_k\vert $ near poles

### Scaling Rules (for fixed-point)
1. **L2-norm scaling**: $\sum \vert h[n]\vert ^2 \le 1$ (prevents overflow for any input)
2. **L1-norm scaling**: $\sum \vert h[n]\vert \le 1$ (strict, for peak inputs)
3. **L∞-norm scaling**: $\max \vert H(\omega)\vert \le 1$ (frequency domain)

**Always use SOS with proper scaling for fixed-point IIR implementation.**

---

## Frequency Sampling Method (FIR)

Alternative to window method:
1. Sample desired $H_d(\omega)$ at $N$ equally spaced frequencies
2. Compute $h[n]$ via IDFT of samples
3. Adjust transition band samples for better control

**Advantage**: Exact match at sampled frequencies
**Disadvantage**: Large ripples between samples; rarely used vs. Parks-McClellan

---

## Filter Design Specifications Template

```
Passband edge:      ωp = 0.2π rad/sample
Stopband edge:      ωs = 0.3π rad/sample
Passband ripple:    Ap = 1 dB
Stopband attenuation: As = 50 dB
Sampling rate:      Fs = 8000 Hz
```

### FIR Design Checklist
- [ ] Choose window (Kaiser for specs-driven)
- [ ] Compute $M$ from transition width
- [ ] Ensure linear phase (odd $M$ for Type I)
- [ ] Verify frequency response meets specs

### IIR Design Checklist
- [ ] Select prototype (Butterworth/Chebyshev/Elliptic)
- [ ] Pre-warp critical frequencies
- [ ] Compute order $N$
- [ ] Design analog $H(s)$
- [ ] Apply bilinear transform
- [ ] **Convert to SOS** for implementation
- [ ] Verify stability (all poles inside unit circle)
- [ ] Check frequency response

---

## MATLAB / Python Design Commands

```matlab
% FIR via Window
N = 50; fc = 0.25;
b = fir1(N, fc, hamming(N+1));

% FIR via Parks-McClellan (optimal equiripple)
N = 50; f = [0 0.2 0.3 1]; a = [1 1 0 0]; w = [1 10];
b = firpm(N, f, a, w);

% IIR Butterworth
[N, Wn] = buttord(0.2, 0.3, 1, 50);
[b, a] = butter(N, Wn);
sos = tf2sos(b, a);  % Convert to SOS!

% IIR Chebyshev I
[N, Wn] = cheb1ord(0.2, 0.3, 1, 50);
[b, a] = cheby1(N, 1, Wn);
sos = tf2sos(b, a);

% IIR Elliptic
[N, Wn] = ellipord(0.2, 0.3, 1, 50);
[b, a] = ellip(N, 1, 50, Wn);
sos = tf2sos(b, a);
```

```python
# Python (SciPy)
from scipy.signal import firwin, firpm, butter, cheby1, ellip, tf2sos

# FIR Window
b = firwin(51, 0.25, window='hamming')

# FIR Parks-McClellan
b = firpm(50, [0, 0.2, 0.3, 1], [1, 1, 0, 0], weight=[1, 10])

# IIR Butterworth
b, a = butter(4, 0.25, output='ba')
sos = tf2sos(b, a)

# IIR Chebyshev I
b, a = cheby1(4, 1, 0.25, output='ba')
sos = tf2sos(b, a)

# IIR Elliptic
b, a = ellip(4, 1, 50, 0.25, output='ba')
sos = tf2sos(b, a)
```

---
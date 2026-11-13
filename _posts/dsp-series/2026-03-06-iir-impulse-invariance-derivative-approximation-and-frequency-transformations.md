---
title: "IIR Design by Impulse Invariance, Derivative Approximation, and Frequency Transformations"
date: 2026-03-06 00:00:00 +0600
categories: ['Academic', 'CSE-409 Digital Signal Processing']
tags: ['dsp', 'iir-filters', 'filter-design', 'bilinear-transform', 'academic', 'cse409', 'cse410', 'jkkniu']
description: Mapping analog prototypes to digital filters by sampling the impulse response or the derivative, transforming lowpass prototypes to other bands, and choosing between Chebyshev II and Bessel.
math: true
---
## The Design Philosophy

IIR design reuses decades of analog filter theory:

1. Design an analog prototype $H_a(s)$ with the desired magnitude shape.
2. Map $s$ to $z$ so the digital filter inherits that shape.

The mapping must preserve **stability**: the left half of the $s$-plane must map inside the unit circle of the $z$-plane.

Two classical mappings besides the bilinear transform are **impulse invariance** and **derivative approximation**.

---

## Impulse Invariance

**Goal:** the digital impulse response is a sampled version of the analog impulse response:

$$h[n]=T\,h_a(nT)$$

where $T=1/F_s$.

### The Mapping

Partial-fraction expand the analog prototype:

$$H_a(s)=\sum_{k=1}^{N}\frac{A_k}{s-p_k}$$

Each analog pole $p_k$ corresponds to $e^{p_kT}$ in the digital domain:

$$H(z)=\sum_{k=1}^{N}\frac{T\,A_k}{1-e^{p_kT}z^{-1}}$$

So the pole mapping is

$$z_k=e^{p_kT}$$

### Properties

**Stability is preserved:** if $\operatorname{Re}\{p_k\}<0$, then $\vert z_k\vert=e^{\operatorname{Re}\{p_k\}T}<1$.

**Frequency aliasing:** the digital spectrum is the sum of shifted analog spectra:

$$H(e^{j\omega})=\frac{1}{T}\sum_{k=-\infty}^{\infty}H_a\left(j\frac{\omega-2\pi k}{T}\right)$$

Every analog response above $F_s/2$ aliases into the digital band. This is the fundamental limitation of impulse invariance.

### When It Works

- The analog prototype is **bandlimited**, so aliasing is small: lowpass and bandpass designs with $F_s\gg F_{\text{cutoff}}$.
- Highpass and bandstop designs are **inappropriate** — their responses extend to infinity and alias badly.

### When It Fails

| Filter type | Verdict |
|---|---|
| Lowpass | Good if $F_s\gg F_c$ |
| Bandpass | Good if the band is well inside Nyquist |
| Highpass | **Bad** — aliasing from the infinite tail |
| Bandstop | **Bad** — same reason |

### Impulse Invariance vs Bilinear

| Aspect | Impulse invariance | Bilinear transform |
|---|---|---|
| Mapping | $z=e^{sT}$ | $s=\frac{2}{T}\frac{1-z^{-1}}{1+z^{-1}}$ |
| Aliasing | **Yes** | No |
| Frequency warping | None | Yes ($\omega=2\arctan(\Omega T/2)$) |
| Preserves impulse response | Yes (sampled) | No |
| Highpass design | Fails | Works |
| Phase | Closer to analog at low frequency | Warped |

Impulse invariance keeps the time-domain shape; the bilinear transform keeps the magnitude shape without aliasing. For most designs, the bilinear transform wins because it handles all filter types.

---

## Derivative Approximation

**Idea:** approximate the analog derivative by a finite difference.

The analog integrator is $1/s$. Replace the derivative with a **backward difference**:

$$s\approx\frac{1-z^{-1}}{T}$$

or a **forward difference**:

$$s\approx\frac{z-1}{T}$$

### Backward Difference Mapping

$$H(z)=H_a(s)\Big\vert_{s=(1-z^{-1})/T}$$

The $j\Omega$ axis maps to

$$z=\frac{1}{1-j\Omega T}$$

which traces a circle of radius $1/2$ centred at $z=1/2$. Every point is **inside** the unit circle, so stability is preserved, but the entire analog axis collapses into a small circle — the frequency mapping is very nonlinear and the usable band is tiny.

### Forward Difference Mapping

$$s\approx\frac{z-1}{T}\;\Rightarrow\;z=1+j\Omega T$$

The $j\Omega$ axis maps to a vertical line at $\operatorname{Re}\{z\}=1$, which lies **outside** the unit circle. A stable analog filter can map to an **unstable** digital filter. Forward difference is therefore not used for design.

### The Verdict

Derivative approximation is historically important and simple, but its frequency mapping is poor compared with the bilinear transform. It survives mainly as the **backward Euler** integrator in control systems, not as a filter design method.

---

## Frequency Transformations

Once you have a **normalized lowpass prototype** (cutoff at $\Omega_p=1$), you can transform it to any other band without redesigning from scratch.

### Analog-Domain Transformations

Start from $H_{LP}(s)$ with cutoff 1.

**Lowpass to lowpass** (new cutoff $\Omega_c$):

$$s\;\to\;\frac{s}{\Omega_c}$$

**Lowpass to highpass** (new cutoff $\Omega_c$):

$$s\;\to\;\frac{\Omega_c}{s}$$

**Lowpass to bandpass** (centre $\Omega_0$, bandwidth $B$):

$$s\;\to\;\frac{s^2+\Omega_0^2}{Bs}$$

**Lowpass to bandstop:**

$$s\;\to\;\frac{Bs}{s^2+\Omega_0^2}$$

Each transformation is a substitution into $H_{LP}(s)$; the order changes accordingly (bandpass and bandstop double the order).

### Digital-Domain Transformations

When the prototype is already digital with cutoff $\omega_p$, use an all-pass substitution:

$$z^{-1}\;\to\;\frac{z^{-1}-a}{1-az^{-1}}$$

For lowpass to lowpass with new cutoff $\omega_c$:

$$a=\frac{\sin\left(\frac{\omega_p-\omega_c}{2}\right)}{\sin\left(\frac{\omega_p+\omega_c}{2}\right)}$$

For lowpass to highpass:

$$a=-\frac{\cos\left(\frac{\omega_p+\omega_c}{2}\right)}{\cos\left(\frac{\omega_p-\omega_c}{2}\right)}$$

The all-pass substitution maps the unit circle to itself, so stability and the magnitude shape are preserved.

### Why Transform Instead of Redesign

- One prototype design serves all bands.
- The transformation is exact algebra — no numerical optimization.
- Standard practice: design the lowpass prototype once, then transform.

### MATLAB

```matlab
% Design a normalized lowpass prototype
[z,p,k] = butter(6, 1, 's');

% Transform to bandpass, centre 2 rad/s, bandwidth 1 rad/s
[num, den] = lp2bp(butter(6, 1, 's'), 2, 1);

% Or directly specify the digital band
[b, a] = butter(6, [0.2 0.4]);   % normalized digital bandpass
```

`lp2lp`, `lp2hp`, `lp2bp`, `lp2bs` perform the analog transformations. The digital versions are built into `butter`, `cheby1`, `ellip` by giving a band vector.

---

## Chebyshev Type II

Chebyshev I has ripple in the **passband** and a monotonic stopband. Chebyshev II is the mirror image: **monotonic passband** and **equiripple stopband**.

### Magnitude Squared

$$\vert H(j\Omega)\vert^2=\frac{1}{1+\dfrac{1}{\epsilon^2T_N^2(\Omega_s/\Omega)}}$$

where $\Omega_s$ is the stopband edge and $T_N$ is the Chebyshev polynomial.

### Properties

| Feature | Chebyshev I | Chebyshev II |
|---|---|---|
| Passband | Equiripple | **Maximally flat** |
| Stopband | Monotonic | **Equiripple** |
| Ripple location | Passband | Stopband |
| Phase | Worse | Better (flatter passband) |
| Poles | Ellipse in left half-plane | Reciprocal ellipse |
| Zeros | None (all-pole) | **Finite zeros** on the $j\Omega$ axis |

The finite zeros in Chebyshev II are what create the stopband nulls. They also make the digital version easier to implement as a cascade of biquads with zeros on the unit circle.

### When to Prefer Chebyshev II

- You care about **stopband attenuation** more than passband flatness.
- You want a **flat passband** for phase-sensitive applications.
- You can tolerate a slower rolloff near the passband edge.

---

## Bessel (Thompson) Filters

The Bessel filter is optimized for **maximally flat group delay**, not magnitude.

### Transfer Function

$$H(s)=\frac{\theta_N(0)}{\theta_N(s/\Omega_c)}$$

where $\theta_N$ is the **reverse Bessel polynomial**.

### Properties

| Feature | Bessel | Butterworth | Chebyshev |
|---|---|---|---|
| Magnitude | Gentle rolloff | Maximally flat | Ripple |
| Group delay | **Maximally flat** | Moderate | Poor near cutoff |
| Phase | Closest to linear | Nonlinear | Very nonlinear |
| Step response | Minimal overshoot | Some overshoot | Ringing |
| Order needed | Higher | Medium | Lowest |

### When to Use Bessel

- **Pulse shaping** where the waveform must be preserved.
- **Anti-alias filters** ahead of an ADC when the transient response matters.
- **Audio** where phase linearity is audible.
- Anywhere the **time-domain** response matters more than the sharpness of the magnitude cutoff.

The price is a much slower magnitude rolloff: a Bessel filter needs a higher order than a Butterworth for the same stopband attenuation.

---

## Comparison of Analog Prototypes

| Prototype | Passband | Stopband | Group delay | Order for 60 dB at $2\Omega_c$ |
|---|---|---|---|---|
| Butterworth | Maximally flat | Monotonic | Moderate | $\approx10$ |
| Chebyshev I | Equiripple | Monotonic | Poor | $\approx6$ |
| Chebyshev II | Flat | Equiripple | Better | $\approx6$ |
| Elliptic | Equiripple | Equiripple | Worst | $\approx4$ |
| Bessel | Flat | Gentle | **Best** | $\approx15$ |

The elliptic filter is the most efficient in magnitude and the worst in phase. Bessel is the opposite. Butterworth and Chebyshev sit in between.

### Design Decision Tree

```
Need sharpest magnitude cutoff?
  → Elliptic
Need flat passband and reasonable phase?
  → Chebyshev II or Butterworth
Need linear phase / minimal overshoot?
  → Bessel
Need the classic all-purpose filter?
  → Butterworth
```

---

## Worked Example: Impulse-Invariant First-Order Lowpass

Analog prototype:

$$H_a(s)=\frac{1}{s+1}$$

Pole at $p=-1$, $A=1$. With $T=0.1$:

$$z_p=e^{-0.1}=0.9048$$

$$H(z)=\frac{T}{1-0.9048z^{-1}}=\frac{0.1}{1-0.9048z^{-1}}$$

DC gain: $H(1)=0.1/(1-0.9048)=1.05\approx1$. The slight excess is the impulse-invariance scaling.

Compare with the bilinear transform at the same $T$:

$$H(z)=H_a(s)\Big\vert_{s=\frac{2}{T}\frac{1-z^{-1}}{1+z^{-1}}}=\frac{1}{\frac{20(1-z^{-1})}{1+z^{-1}}+1}=\frac{1+z^{-1}}{21-19z^{-1}}$$

DC gain $=2/2=1$ exactly. The bilinear transform preserves the DC gain; impulse invariance approximately preserves it only at low frequency.

---

## Summary

1. Impulse invariance samples the analog impulse response: poles map as $z_k=e^{p_kT}$; it aliases and fails for highpass/bandstop.
2. Derivative approximation replaces $s$ with a finite difference; the backward version is stable but badly warped, the forward version can be unstable.
3. Frequency transformations convert a normalized lowpass prototype to any band using simple substitutions, in the analog or digital domain.
4. Chebyshev II trades passband ripple for stopband equiripple and finite zeros.
5. Bessel gives the best group delay and pulse response at the cost of a gentle magnitude rolloff.
6. The bilinear transform remains the default mapping because it has no aliasing and handles every filter type.

---
title: "Number Representation, Quantization Effects, and Filter Structures"
date: 2026-03-07 00:00:00 +0600
categories: ['Academic', 'CSE-409 Digital Signal Processing']
tags: ['dsp', 'finite-word-length', 'quantization', 'filter-structures', 'fixed-point', 'academic', 'cse409', 'cse410', 'jkkniu']
description: Fixed-point and floating-point formats, rounding vs truncation, coefficient quantization, transposed and lattice structures, and scaling to prevent overflow.
math: true
---
## Why Word Length Matters

Every DSP algorithm is implemented with finite-precision numbers. The three consequences are:

1. **Quantization error** in the signal samples.
2. **Coefficient quantization** — the filter you implement is not the filter you designed.
3. **Overflow and round-off noise** inside recursive structures.

An ideal design that ignores these effects can fail completely in hardware.

---

## Number Representation

### Fixed-Point

A **fixed-point** number has a fixed binary point. The common DSP notation is **Q-format**: $Q_{m.n}$ means $m$ integer bits (including sign) and $n$ fractional bits.

$$Q_{1.15}\text{ in 16 bits: } \underbrace{1}_{\text{sign}}\underbrace{.}_{}\underbrace{15\text{ fractional bits}}$$

Value range: $[-1,\ 1-2^{-15}]$, resolution $2^{-15}$.

| Format | Bits | Range | Resolution |
|---|---|---|---|
| $Q_{1.7}$ | 8 | $[-1,1)$ | $2^{-7}\approx0.0078$ |
| $Q_{1.15}$ | 16 | $[-1,1)$ | $2^{-15}\approx3.05\times10^{-5}$ |
| $Q_{1.31}$ | 32 | $[-1,1)$ | $2^{-31}\approx4.66\times10^{-10}$ |

**Advantages:** simple hardware, fast, predictable, low power.
**Disadvantages:** limited dynamic range, overflow, scaling required.

### Two's Complement

The standard signed representation:

$$-b_{N-1}2^{N-1}+\sum_{i=0}^{N-2}b_i2^i$$

For $N=8$: range $-128$ to $127$. Negation is `~x + 1`, and addition/subtraction need no special cases. Overflow wraps around, which is why saturation logic is often added.

### Sign-Magnitude

One sign bit plus magnitude. Symmetric range $[-127,127]$ for 8 bits, but two representations of zero and awkward arithmetic. Rare in DSP datapaths.

### Floating-Point

$$x=(-1)^s\cdot M\cdot2^{E}$$

IEEE 754 single precision: 1 sign + 8 exponent + 23 mantissa = 32 bits, about 7 decimal digits, range $\approx10^{\pm38}$. Double: 1 + 11 + 52 = 64 bits, about 16 digits.

| Aspect | Fixed-point | Floating-point |
|---|---|---|
| Dynamic range | Narrow | Huge |
| Precision | Uniform | Relative |
| Speed | Fast | Slower |
| Power | Low | High |
| Cost | Low | High |
| Overflow | Possible | Rare (saturates to $\pm\infty$) |
| Best for | Embedded, high volume | Prototyping, wide dynamic range |

Most DSP chips have a fixed-point datapath with a wide accumulator (often 40 bits) to hold intermediate sums.

---

## Rounding and Truncation

When a product needs more bits than the datapath, it must be reduced.

**Truncation:** discard the low bits. The error is always in one direction (toward $-\infty$ for two's complement), so it is **biased**. Mean error $-\Delta/2$ for positive numbers, where $\Delta$ is the quantization step.

**Rounding (round to nearest):** add half an LSB then truncate. The error is symmetric and **unbiased**, with mean zero.

| Method | Error range | Mean | Variance |
|---|---|---|---|
| Truncation | $[-\Delta,0]$ | $-\Delta/2$ (biased) | $\Delta^2/12$ |
| Rounding | $[-\Delta/2,\Delta/2]$ | $0$ (unbiased) | $\Delta^2/12$ |

Rounding costs one extra adder; truncation is cheaper but accumulates a DC offset in recursive filters. **Always round in feedback loops.**

### Quantization Noise Power

For a step $\Delta$, the error is modelled as uniform on $[-\Delta/2,\Delta/2]$:

$$\sigma_e^2=\frac{\Delta^2}{12}$$

For a $B$-bit quantizer over a full-scale range $2A$:

$$\Delta=\frac{2A}{2^B},\qquad \sigma_e^2=\frac{A^2}{3\cdot2^{2B}}$$

This is the same result used in the ADC SQNR derivation.

---

## Coefficient Quantization

A designed filter has real coefficients. Stored in $B$ bits, each coefficient moves by up to $\Delta/2$. The implemented transfer function is

$$\hat H(z)=\frac{\sum(\hat b_k)z^{-k}}{1+\sum(\hat a_k)z^{-k}}$$

The **poles move**. A pole near the unit circle can move outside it and the filter becomes unstable.

### Sensitivity of Pole Location

For a denominator $1+\sum a_kz^{-k}$, the pole sensitivity to a coefficient perturbation is

$$\frac{\partial p_i}{\partial a_k}=-\frac{p_i^{N-k}}{\prod_{j\ne i}(p_i-p_j)}$$

The denominator is the product of **pole separations**. When poles are close together (narrowband filter), the sensitivity explodes.

**Rule:** narrowband filters need more coefficient bits. A rule of thumb is

$$B\ge\log_2\left(\frac{1}{\text{fractional bandwidth}}\right)+3$$

### The Fix: Cascade Second-Order Sections

A high-order polynomial with clustered roots is ill-conditioned. Factor into **biquads**:

$$H(z)=\prod_{k=1}^{K}\frac{b_{0k}+b_{1k}z^{-1}+b_{2k}z^{-2}}{1+a_{1k}z^{-1}+a_{2k}z^{-2}}$$

Each biquad has only two poles, so the sensitivity is local. Pair poles and zeros to minimize the peak gain in each section. This is why every real IIR implementation uses **SOS (second-order sections)**, never a high-order direct form.

| Structure | Coefficient sensitivity | Round-off noise | Stability check |
|---|---|---|---|
| Direct Form I/II (high order) | **Very high** | High | Fragile |
| Cascade SOS | Low | Low | Per section |
| Parallel SOS | Low | Low | Per section |
| Lattice | **Lowest** | Low | Structural ($\vert k\vert<1$) |

---

## Transposed Structures

Transposing a signal-flow graph (reverse every arrow, swap input and output, keep the gains) preserves the transfer function but changes the numerical behaviour.

### Transposed Direct Form II

```
x[n] ──► + ──► b0 ──► + ──► y[n]
         ↑            ↑
        z⁻¹          z⁻¹
         ↑            ↑
         +── b1 ──────+
         ↑            ↑
        z⁻¹          z⁻¹
         ↑            ↑
         +── b2 ── -a2+
         ↑            ↑
         +───── -a1 ──+
```

### Why Transpose?

- **Lower round-off noise** in some configurations, because the accumulation order changes.
- **Better pipelining** for hardware: the critical path can be shortened.
- **Same transfer function**, so the design is unchanged.

The transposed direct form II has a scaling advantage: the state variables are bounded by the output, which helps prevent overflow.

---

## Frequency-Sampling Structures

When the desired response is specified at $N$ frequency samples, the filter can be implemented as a **comb filter in cascade with a bank of resonators**:

$$H(z)=\frac{1-z^{-N}}{N}\sum_{k=0}^{N-1}\frac{H[k]}{1-e^{j2\pi k/N}z^{-1}}$$

### The Two Parts

- $1-z^{-N}$ — a **comb filter** with $N$ zeros equally spaced on the unit circle. Cheap: one delay line of length $N$ and one subtractor.
- The resonator bank — one complex pole per specified frequency.

If many $H[k]$ are zero (a narrowband design), most resonators disappear and the structure is very efficient. If all $H[k]$ are nonzero, the structure is more expensive than a direct form.

### Recursive Frequency Sampling

For a filter with only $M$ nonzero frequency samples, the cost is $O(M)$ per sample instead of $O(N)$ for a direct FIR of length $N$. This is the main reason to use the structure.

**Drawback:** the comb and resonator poles are **marginally stable** (on the unit circle), so coefficient quantization can make the filter unstable. The poles must be pulled slightly inside the circle, which introduces a small error.

---

## Lattice Structures

The lattice from the linear-prediction post is also a filter structure.

### All-Pole Lattice

$$H(z)=\frac{1}{1+\sum a_kz^{-k}}$$

realized as a cascade of lattice stages driven from the output side. The reflection coefficients $k_m$ are the design parameters.

### All-Zero Lattice (FIR)

$$H(z)=\sum b_kz^{-k}$$

realized with the same lattice stages but tapped differently.

### Why Lattice

| Property | Benefit |
|---|---|
| $\vert k_m\vert<1$ guarantees stability | No post-quantization stability check needed |
| Modular | Add/remove order without redesign |
| Low sensitivity | Coefficient quantization degrades gracefully |
| Orthogonalizing | Successive stages decorrelate |
| Used in adaptive filters | Gradient lattice, RLS lattice |

**Drawback:** more multiplies per output than a direct form (roughly double for the same order).

---

## Scaling to Prevent Overflow

In a fixed-point recursive filter, the internal state can exceed the range even when the input and output are bounded. Scaling inserts gains to keep every node inside $[-1,1)$.

### $L_1$ Scaling (Worst Case)

For a node with impulse response $f[n]$ from the input, the worst-case bound is

$$\vert y\vert\le\Vert f\Vert_1\sum\vert x\vert=\left(\sum_n\vert f[n]\vert\right)x_{\max}$$

Scale by $1/\Vert f\Vert_1$ to guarantee no overflow for any bounded input.

### $L_2$ Scaling (Statistical)

For a random input of power $\sigma_x^2$, the output power is

$$\sigma_y^2=\sigma_x^2\Vert f\Vert_2^2=\sigma_x^2\sum_n f^2[n]$$

Scale by $1/\Vert f\Vert_2$ so the output RMS equals the input RMS. This allows occasional overflow but preserves the signal-to-noise ratio.

| Scaling | Guarantee | Cost |
|---|---|---|
| $L_1$ | No overflow ever | Conservative, loses headroom |
| $L_2$ | No overflow in RMS | Occasional clipping |

### Where to Scale

- At the input of each biquad.
- Before the accumulator if it is narrow.
- Use **guard bits** in the accumulator (typically 4–8 extra bits).

### Saturation vs Wrap-Around

On overflow, two's-complement arithmetic **wraps** from $+1$ to $-1$, producing a huge sign error and often a loud click or instability. **Saturation** clamps to the maximum value, which is far gentler. Always enable saturation on the output of a recursive filter.

---

## Practical Design Checklist

| Step | Action |
|---|---|
| 1 | Choose the structure: SOS for IIR, direct/transposed for FIR |
| 2 | Decide the word length from the dynamic range and SNR spec |
| 3 | Check pole movement under coefficient quantization |
| 4 | Use rounding, not truncation, in feedback paths |
| 5 | Scale every node with $L_1$ or $L_2$ |
| 6 | Add guard bits to accumulators |
| 7 | Enable saturation on outputs |
| 8 | Simulate with the quantized coefficients before building hardware |

### Word-Length Rules of Thumb

| Signal | Minimum bits |
|---|---|
| Audio (16-bit source) | 24-bit datapath, 32-bit accumulator |
| Speech (8 kHz) | 16-bit datapath |
| Narrowband filter (1% bandwidth) | $\ge16$ coefficient bits |
| High-Q resonator | 24+ coefficient bits, SOS mandatory |
| Control loop | 32-bit float or 24-bit fixed |

---

## Summary

1. Fixed-point is fast and cheap but needs scaling; floating-point is easy but costly.
2. Truncation is biased; rounding is unbiased and should be used in feedback loops.
3. Coefficients quantize, poles move, and high-order direct forms are dangerously sensitive.
4. Cascade second-order sections are mandatory for any high-order IIR.
5. Transposed structures change the numerics, not the transfer function.
6. Frequency-sampling structures are efficient for sparse spectra but marginally stable.
7. Lattice structures guarantee stability through $\vert k_m\vert<1$.
8. Scale with $L_1$ for guaranteed no overflow or $L_2$ for statistical headroom; saturate on overflow.

---
title: "Multistage Rate Conversion, CIC Filters, Halfband Filters, and Farrow Structures"
date: 2026-02-28 00:00:00 +0600
categories: ['Academic', 'CSE-409 Digital Signal Processing']
tags: ['dsp', 'multirate', 'decimation', 'interpolation', 'filter-design', 'academic', 'cse409', 'cse410', 'jkkniu']
description: Why one big decimation stage is wasteful, how CIC and halfband filters make multistage conversion cheap, and how Farrow structures resample at arbitrary fractional rates.
math: true
---
## Why Multistage?

Decimating by $M=100$ in one step needs a lowpass with a transition band of width $(F_s/2-F_s/200)$, i.e. an extremely sharp filter with thousands of taps. The cost scales with the **number of taps × the input rate**, so a single-stage design is prohibitive.

Split the job:

$$M=M_1M_2\cdots M_K$$

Each stage filters at a **lower rate** than the last, so the total work falls dramatically.

**Example.** $M=100$ as $10\times10$.

- Single stage: filter at $F_s$, order $N\approx$ thousands.
- Two stages: filter at $F_s$ by 10, then at $F_s/10$ by 10. The second filter is 10× cheaper per tap and can be much shorter.

The optimum number of stages comes from the **Crochiere–Rabiner** formula: for a given total decimation and passband/stopband spec,

$$K_{\text{opt}}\approx\frac{\log_{10}\left(\frac{\text{total work}}{\text{per-stage work}}\right)}{\log_{10}\text{stage ratio}}$$

In practice, halving the rate at each stage (powers of 2) gives near-optimal cost.

---

## CIC Filters

A **cascaded integrator-comb (CIC)** filter is the cheapest possible decimation/interpolation filter. It needs **no multipliers** — only adders and delays.

### Structure

For decimation by $R$:

```
x[n] → Integrator(s) → ↓R → Comb(s) → y[m]
```

- **Integrator:** $y[n]=y[n-1]+x[n]$ — a running sum, one adder.
- **Comb:** $y[n]=x[n]-x[n-RM]$ — a difference, one subtractor.
- A cascade of $N$ integrators and $N$ combs gives a sharper response.

### Transfer Function

$$H(z)=\left(\frac{1-z^{-RM}}{1-z^{-1}}\right)^{N}$$

For $R=1$ this reduces to

$$H(z)=\left(1+z^{-1}+z^{-2}+\dots+z^{-(M-1)}\right)^{N}$$

— a moving-average (boxcar) filter of length $M$, raised to the $N$-th power.

### Frequency Response

$$\vert H(e^{j\omega})\vert=\left\vert\frac{\sin(\omega RM/2)}{\sin(\omega/2)}\right\vert^{N}$$

This is a **sinc-like** response with nulls at multiples of $F_s/(RM)$. The passband droop and the wide transition band are the price of using zero multipliers.

### Properties

| Property | Value |
|---|---|
| Multipliers | **None** |
| Storage | $N$ integrators + $N\cdot RM$ delay cells |
| Passband droop | $\operatorname{sinc}^N$ shape; needs compensation |
| Stopband attenuation | Set by $N$ and the ratio $M/R$ |
| Overflow | Integrators can overflow; two's-complement wrap-around is actually harmless if the comb stage uses the same word length |
| Best use | Large rate changes at the **front end** (e.g. 100× decimation in a radio) |

CIC filters are the workhorse of digital down-converters in software-defined radio. A typical chain is CIC → halfband → polyphase FIR.

### CIC Compensation

The passband droop is corrected by a short **inverse-sinc FIR** after the CIC:

$$\vert H_{\text{comp}}(e^{j\omega})\vert\approx\left\vert\frac{\sin(\omega/2)}{\sin(\omega RM/2)}\right\vert^{N}$$

usually implemented as a low-order FIR (3–7 taps) with a slight high-frequency boost.

---

## Halfband Filters

A **halfband filter** has its transition band centred at $F_s/4$ (half of Nyquist). It is used for **factor-2** rate changes, the most common operation in multistage chains.

### The Key Property

For a linear-phase FIR halfband filter of odd length,

$$h[n]=0\quad\text{for all even }n\ne0$$

except the centre tap, which equals $1/2$. Half the coefficients are zero.

**Consequence:** the number of multiplies is **halved**, and the storage is halved. A 64-tap halfband filter costs like a 32-tap general filter.

### Frequency Response

$$H(e^{j\omega})+H(e^{j(\pi-\omega)})=1$$

The response is **symmetric about $F_s/4$**: the passband and stopband are mirror images, and the transition band straddles $F_s/4$ exactly. Ripple in the passband equals ripple in the stopband.

### Why Factor 2 Is Special

A factor-2 decimator only needs to protect the band $[0,F_s/4]$. The halfband filter does exactly that with minimal work. Chaining $K$ halfbands gives $2^K$ decimation with a cost that grows only linearly in $K$:

$$2,4,8,16,\dots$$

This is why almost every practical rate converter is built from a CIC followed by a chain of halfbands.

---

## Arbitrary Resampling and the Farrow Structure

Sometimes the ratio is **irrational** — audio 44.1 kHz ↔ 48 kHz is $160/147$, and symbol timing recovery needs a continuously adjustable fractional delay. You cannot build an integer up/down chain for every ratio.

The **Farrow structure** implements a **fractional delay** with a fixed set of filters and a variable parameter $\mu\in[0,1)$.

### Idea

A fractional delay of $D=\lfloor D\rfloor+\mu$ is approximated by a polynomial in $\mu$:

$$y[n]=\sum_{k=0}^{K}c_k(\mu)\,x[n-k]$$

Each coefficient is itself a polynomial in $\mu$:

$$c_k(\mu)=\sum_{m=0}^{P}a_{k,m}\,\mu^m$$

Rearranged, the structure is a **bank of fixed FIR filters** $A_m(z)$ whose outputs are combined by powers of $\mu$:

```
x[n] ──► A₀(z) ──► ×1 ──┐
      ├► A₁(z) ──► ×μ ──┤
      ├► A₂(z) ──► ×μ² ─┼──► + ──► y[n]
      └► A₃(z) ──► ×μ³ ──┘
```

### Why It Is Efficient

- The filters $A_m(z)$ are **fixed** — designed once.
- Changing the resampling ratio only changes $\mu$, a single scalar updated per sample.
- No filter redesign, no coefficient reload.
- The same structure does interpolation and decimation by simply changing how $\mu$ advances.

### Design

The coefficients come from a **polynomial fit to a windowed-sinc fractional delay**:

$$h_D[n]=\operatorname{sinc}(n-D)\,w[n]$$

Fit each tap's dependence on $D$ with a degree-$P$ polynomial. Typical: $P=3$ to $5$, filter length 4–8 per phase. The error is largest near $\mu=0.5$, where the fractional delay is hardest.

### Applications

| Application | Why Farrow |
|---|---|
| Audio sample-rate conversion (44.1 ↔ 48 kHz) | Irrational ratio, high quality |
| Symbol timing recovery (QAM/PSK) | Timing offset drifts continuously |
| Software-defined radio | Arbitrary channel rates |
| Fractional delay beamforming | Per-element steering delays |

---

## Transmultiplexers

A **transmultiplexer** is the dual of a filter bank: it combines $M$ low-rate signals into one high-rate signal (or splits one into $M$).

### The Two Directions

**Synthesis (combine):**

```
x₀[n] → ↑M → H₀(z) ─┐
x₁[n] → ↑M → H₁(z) ─┼→ + → y[n]
...                  │
x_{M-1}[n] → ↑M → H_{M-1}(z) ┘
```

**Analysis (split):**

```
y[n] → H₀(z) → ↓M → x̂₀[n]
     → H₁(z) → ↓M → x̂₁[n]
     ...
```

In a **perfect-reconstruction (PR)** transmultiplexer, the analysis filters invert the synthesis filters exactly, so $\hat x_k[n]=x_k[n]$ up to a delay.

### Where It Is Used

- **OFDM:** each subcarrier is a low-rate stream; the transmit filter bank is an inverse FFT.
- **DSL and multi-carrier modulation:** the same structure.
- **Digital audio broadcasting:** subband multiplexing.
- **Telephony channel banks:** historically the first use — 12 voice channels combined into one line.

---

## M-Channel QMF Banks

A **quadrature mirror filter (QMF)** bank splits a signal into $M$ subbands with aliasing that cancels on reconstruction.

### The Two-Channel Case

$$H_0(z)=H(z),\qquad H_1(z)=H(-z)$$

(mirror image about $F_s/4$). The reconstruction filters are

$$G_0(z)=2H(z),\qquad G_1(z)=-2H(-z)$$

The aliasing term cancels if

$$H(z)H(-z)+H(-z)H(z)=0$$

which is automatic with the mirror choice. The distortion term is

$$T(z)=H^2(z)-H^2(-z)$$

For **perfect reconstruction** we need $T(z)=cz^{-d}$, a pure delay. That requires

$$H^2(z)-H^2(-z)=cz^{-d}$$

which is satisfied by **halfband filters** — the same ones from the previous section. This is not a coincidence: halfband and QMF are two views of the same factor-2 structure.

### The M-Channel Generalization

For $M$ channels, the aliasing terms from all $M$ decimators must cancel. The **polyphase** formulation is the standard tool:

$$\mathbf{H}(z)=\sum_{k=0}^{M-1}z^{-k}\mathbf{E}_k(z^M)$$

where $\mathbf{E}_k$ are the polyphase component matrices. Perfect reconstruction requires the polyphase matrix to be **paraunitary**:

$$\mathbf{E}(z)\mathbf{E}^T(z^{-1})=\mathbf{I}$$

This is the discrete-time analogue of an orthogonal transform, and it is exactly the structure of the **MDCT** used in MP3 and AAC.

### Design Trade-offs

| Bank type | Aliasing | Reconstruction | Cost |
|---|---|---|---|
| QMF (2-channel) | Cancels | Near-perfect | Low |
| CQF / power-complementary | Cancels | Perfect (magnitude) | Low |
| Paraunitary (M-channel) | Cancels | Perfect | Moderate |
| Cosine-modulated | Cancels | Perfect | Very low (one prototype) |
| Wavelet (dyadic) | Cancels | Perfect | Low |

**Cosine-modulated** banks are the practical favourite: design **one** prototype lowpass and modulate it to $M$ bands with cosines. The whole bank costs one prototype plus an FFT.

---

## Putting It All Together: A Practical Rate-Conversion Chain

```
RF/IF in (say 100 MS/s)
  → CIC decimate by 64           (no multipliers, huge rate drop)
  → halfband decimate by 2       (half the taps are zero)
  → halfband decimate by 2
  → polyphase FIR decimate by 25/16 (exact rational ratio)
  → baseband processing
```

Each stage does what it is cheapest at:

| Stage | Strength |
|---|---|
| CIC | Handles the enormous ratio with adders only |
| Halfband | Factor-2 with halved multiplier count |
| Polyphase FIR | Exact rational ratio and sharp transition |
| Farrow | Arbitrary fractional timing |

---

## Summary

1. Split a large rate change into stages; filtering at lower rates is far cheaper.
2. CIC filters use only adders and delays — ideal for large front-end decimation, with sinc droop to compensate.
3. Halfband filters have every other tap zero and are symmetric about $F_s/4$ — the natural factor-2 block.
4. The Farrow structure resamples at arbitrary fractional rates by evaluating fixed filters at a polynomial in $\mu$.
5. Transmultiplexers combine $M$ streams into one; QMF banks split one into $M$ with cancelling aliasing.
6. Perfect reconstruction requires a paraunitary polyphase matrix — the discrete-time orthogonal transform.

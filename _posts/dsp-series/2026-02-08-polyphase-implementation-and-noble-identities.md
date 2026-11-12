---
title: Polyphase Implementation and Noble Identities
date: 2026-02-08 00:00:00 +0600
categories:
- Academic
- Digital Signal Processing
tags:
- dsp
- multirate
- decimation
- interpolation
- polyphase
- academic
- cse409
- cse410
- jkkniu
description: '**Cascade:** Interpolate by $L$ \u2192 Decimate by $M$'
math: true
---
## Sample Rate Conversion by Rational Factor $L/M$

**Cascade:** Interpolate by $L$ → Decimate by $M$
```
x[n] ──► [↑L] ──► [LPF: cutoff = min(π/L, π/M)] ──► [↓M] ──► y[n]
```

**Single filter** combines anti-imaging and anti-aliasing. Cutoff = $\min(\pi/L, \pi/M)$.

### Example: Convert 44.1 kHz → 48 kHz
Ratio: $48000/44100 = 160/147$ → $L=160, M=147$
- Up-sample by 160
- Filter at $\pi/160$
- Down-sample by 147

---

## Polyphase Implementation (Efficient)

Instead of filtering then decimating (wasting computations), **filter in polyphase branches**:

### Decimation Polyphase
Decompose filter $H(z) = \sum_{k=0}^{M-1} z^{-k} E_k(z^M)$

```
x[n] ──► E_0(z^M) ──► ↓M ──► y[n]
       E_1(z^M) ──► ↓M ──►
       ...
       E_{M-1}(z^M) ──► ↓M ──►
```

**Only compute outputs that are kept!** $M$-fold reduction in multiplies.

### Interpolation Polyphase
Decompose $H(z) = \sum_{k=0}^{L-1} z^{-k} R_k(z^L)$

```
        R_0(z^L) ──►
        R_1(z^L) ──►     → y[n]
        ...          ↑L
        R_{L-1}(z^L) ──►
```

Filter branches run at **lower rate** → efficient!

---

## Noble Identities

| Identity | Description |
|---|---|
| **Noble 1** | Filter → Decimate = Decimate → Polyphase filter |
| **Noble 2** | Interpolate → Filter = Polyphase filter → Interpolate |

These allow moving rate changes **across filters** for efficiency.

---
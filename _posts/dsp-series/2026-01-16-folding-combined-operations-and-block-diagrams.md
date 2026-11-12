---
title: Folding, Combined Operations, and Block Diagrams
date: 2026-01-16 00:00:00 +0600
categories:
- Academic
- Digital Signal Processing
tags:
- dsp
- time-domain
- signal-operations
- academic
- cse409
- cse410
- jkkniu
description: $$y[n] = x[-n]$$
math: true
---
## Folding / Time Reversal

$$y[n] = x[-n]$$

Reflects the signal about $n=0$. The signal plays **backwards**.

```
x[n]:   [•] [•] [•] [•] [•]       (n = -2, -1, 0, 1, 2)
         ↑       ↑       ↑       ↑
       n=-2    n=-1    n=0     n=1

x[-n]:  [•] [•] [•] [•] [•]       (n = 2, 1, 0, -1, -2)
         ↑       ↑       ↑       ↑
       n=2     n=1     n=0    n=-1
```

**Practical use**: Matched filtering, correlation, linear-phase FIR filter design.

---

## Block Diagram Representations

### Time Delay (Unit Delay Element)
```
x[n] ──► [ z⁻¹ ] ──► y[n] = x[n-1]
```

### General Delay ($k$ samples)
```
x[n] ──► [ z⁻¹ ] ──► [ z⁻¹ ] ──► ... ──► [ z⁻¹ ] ──► y[n] = x[n-k]
              │         │                   │
              k times
```

### Moving Average (FIR Filter)
```
x[n] ──► [+] ──► [z⁻¹] ──► [+] ──► [z⁻¹] ──► ... ──► [+] ──► y[n]
    │     │       │       │               │
    └─────┴───────┴───────┴───────────────┘
         (sum of M delayed versions) / M
```

$$y[n] = \frac{1}{M} \sum_{k=0}^{M-1} x[n-k]$$

---

## Combined Operations: Order Matters!

For $y[n] = x[an + b]$, the order of operations changes the result:

| Order | Sequence | Result |
|---|---|---|
| **Shift then Scale** | $x[n] \xrightarrow{\text{shift } b} x[n+b] \xrightarrow{\text{scale } a} x[an+b]$ | $y[n] = x[an+b]$ |
| **Scale then Shift** | $x[n] \xrightarrow{\text{scale } a} x[an] \xrightarrow{\text{shift } b/a} x[a(n+b/a)] = x[an+b]$ | Same! |

**But for $y[n] = x[(n-b)/a]$:**
| Order | Sequence | Result |
|---|---|---|
| **Shift then Scale** | $x[n] \xrightarrow{\text{shift } b} x[n-b] \xrightarrow{\text{scale } 1/a} x[(n-b)/a]$ | $y[n] = x[(n-b)/a]$ ✓ |
| **Scale then Shift** | $x[n] \xrightarrow{\text{scale } 1/a} x[n/a] \xrightarrow{\text{shift } b} x[(n-b)/a]$ ✗ |

> **Rule**: To get $y[n] = x[(n-b)/a]$, **shift first, then scale**.

---

## Practice Sketching Checklist

Given $x[n]$, sketch:
1. $x[n-3]$ — delay by 3
2. $x[n+2]$ — advance by 2
3. $x[-n]$ — fold about origin
4. $x[-n+2]$ — fold, then shift right by 2
5. $x[2n]$ — down-sample by 2
6. $x[n/3]$ — up-sample by 3 (insert zeros)
7. $x[2n-4] = x[2(n-2)]$ — shift right 2, then down-sample by 2

---
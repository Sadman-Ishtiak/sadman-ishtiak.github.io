---
title: "Time Scaling: Compression and Expansion"
date: 2026-01-15 00:00:00 +0600
categories: ['Academic', 'Digital Signal Processing']
tags: ['dsp', 'time-domain', 'signal-operations', 'academic', 'cse409', 'cse410', 'jkkniu']
description: '## Time Scaling: Compression and Expansion'
math: true
---
## Time Scaling: Compression and Expansion

Time scaling changes the **rate** at which samples are taken.

### Compression / Down-Sampling: $y[n] = x[Mn]$, $M > 1$ (integer)

Keep every $M$-th sample, discard the rest. The signal **speeds up** (compressed in time).

```
x[n]:   [0] [1] [2] [3] [4] [5] [6] [7]
          ↑           ↑           ↑
        n=0         n=3         n=6

y[n] = x[3n]:  [0]      [3]      [6]
              ↑        ↑        ↑
             n=0      n=1      n=2
```

### Expansion / Up-Sampling: $y[n] = x[n/M]$, $M > 1$ (integer)

Insert $M-1$ zeros between samples. The signal **slows down** (expanded in time).

```
x[n]:  [0] [1] [2]
        ↑   ↑   ↑
       n=0 n=1 n=2

y[n] = x[n/3]:  [0] [0] [0] [1] [0] [0] [2] [0] [0]
                  ↑       ↑       ↑
                 n=0     n=3     n=6
```

> **Note**: After up-sampling, **interpolation** (lowpass filtering) fills in the zeros with meaningful values.

---

## Worked Example: Multiple Operations on $x[n] = \{2, 1, 0, -1, -2\}$

Let $x[n] = \{2, 1, 0, -1, -2\}$ with $n = 0, 1, 2, 3, 4$ (arrow under 2 at $n=0$).

| Operation | Result | Description |
|---|---|---|
| $y_1[n] = x[n-2]$ | $\{0, 0, 2, 1, 0, -1, -2\}$ | Delay by 2 |
| $y_2[n] = x[n+1]$ | $\{1, 0, -1, -2, 0\}$ | Advance by 1 |
| $y_3[n] = x[2n]$ | $\{2, 0, -2\}$ | Down-sample by 2 (keep $n=0,2,4$) |
| $y_4[n] = x[n/2]$ | $\{2, 0, 1, 0, 0, 0, -1, 0, -2\}$ | Up-sample by 2 (insert zeros) |
| $y_5[n] = x[-n]$ | $\{-2, -1, 0, 1, 2\}$ | Time reversal (folding) |

---
---
title: 'Time Shifting: Delay and Advance'
date: 2026-01-14 00:00:00 +0600
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
description: $$y[n] = x[n - k], \quad k > 0$$
math: true
---
## Time Shifting: Delay and Advance

### Delay (Right Shift)
$$y[n] = x[n - k], \quad k > 0$$

The signal moves **right** by $k$ samples. The output at time $n$ depends on the input at earlier time $n-k$.

```
x[n]:     [•] [•] [•] [•] [•]       (indices: -1, 0, 1, 2, 3)
              ↑              ↑
             n=0            n=2

x[n-2]:            [•] [•] [•] [•] [•]   (shifted right by 2)
                       ↑              ↑
                      n=2            n=4
```

### Advance (Left Shift)
$$y[n] = x[n + k], \quad k > 0$$

The signal moves **left** by $k$ samples. The output at time $n$ depends on the input at future time $n+k$.

> **Causality note**: $x[n+k]$ requires future input values. **Non-causal** systems (not realizable in real-time). Causal systems only use $x[n-k]$ for $k \ge 0$.

---
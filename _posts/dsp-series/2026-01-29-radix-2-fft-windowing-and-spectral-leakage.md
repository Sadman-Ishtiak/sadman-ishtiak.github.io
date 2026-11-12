---
title: "Radix-2 FFT, Windowing, and Spectral Leakage"
date: 2026-01-29 00:00:00 +0600
categories: ['Academic', 'Digital Signal Processing']
tags: ['dsp', 'dft', 'fft', 'frequency-analysis', 'academic', 'cse409', 'cse410', 'jkkniu']
description: '## The FFT: Why It''s Revolutionary'
math: true
---
## The FFT: Why It's Revolutionary

### Direct DFT Complexity
- $N$ outputs × $N$ multiplications each = **$O(N^2)$ operations**

### FFT (Radix-2 Decimation-in-Time)
- Decomposes $N$-point DFT into smaller DFTs recursively
- **$O(N \log_2 N)$ operations**

### Speedup Factor for $N=64$

| Method | Operations | Speedup |
|---|---|---|
| Direct DFT | $64^2 = 4096$ | 1× |
| Radix-2 FFT | $64 \cdot \log_2 64 / 2 = 192$ | **21.33×** |

**Formula:** $\text{Speedup} \approx \frac{N^2}{(N/2)\log_2 N} = \frac{2N}{\log_2 N}$

For $N=1024$: $\frac{2048}{10} = 204.8\times$ faster!

---

## Radix-2 DIT FFT Structure

For $N = 2^m$, recursively split into even/odd indices:

$$X[k] = \sum_{n \text{ even}} x[n] W_N^{kn} + \sum_{n \text{ odd}} x[n] W_N^{kn}$$

Let $n = 2r$ (even) and $n = 2r+1$ (odd):

$$X[k] = \sum_{r=0}^{N/2-1} x[2r] (W_N^2)^{kr} + W_N^k \sum_{r=0}^{N/2-1} x[2r+1] (W_N^2)^{kr}$$

Since $W_N^2 = W_{N/2}$, this is **two $N/2$-point DFTs** combined with **twiddle factors** $W_N^k$.

### Butterfly Operation

```
Input:     x[0] ──►──────────► X[0]
                  ╱
x[1] ──►────────╱
                  ╲
x[2] ──►────────╲
                  ╲
x[3] ──►──────────► X[3]
```

Each stage has $N/2$ butterflies. Total: $(N/2) \log_2 N$ butterflies.

---
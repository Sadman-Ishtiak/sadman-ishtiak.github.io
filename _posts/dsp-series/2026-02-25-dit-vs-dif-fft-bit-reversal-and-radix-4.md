---
title: "DIT vs DIF FFT, Bit Reversal, In-Place Computation, and Radix-4"
date: 2026-02-25 00:00:00 +0600
categories: ['Academic', 'CSE-409 Digital Signal Processing']
tags: ['dsp', 'fft', 'dft', 'algorithms', 'academic', 'cse409', 'cse410', 'jkkniu']
description: How decimation-in-time and decimation-in-frequency differ, why bit reversal appears, what in-place means, and how radix-4 and split-radix reduce the count further.
math: true
---
## Two Ways to Split the DFT

Both DIT and DIF start from the same N-point DFT

$$X[k]=\sum_{n=0}^{N-1}x[n]W_N^{kn},\qquad W_N=e^{-j2\pi/N}$$

and both produce the same $X[k]$. They differ in **what gets split**.

### Decimation in Time (DIT): split the input

Split $x[n]$ into even-indexed and odd-indexed samples:

$$X[k]=\sum_{r=0}^{N/2-1}x[2r]W_N^{2rk}+W_N^k\sum_{r=0}^{N/2-1}x[2r+1]W_N^{2rk}$$

Using $W_N^2=W_{N/2}$:

$$X[k]=X_e[k]+W_N^kX_o[k],\qquad k=0,\dots,N-1$$

with $X_e$ and $X_o$ the $N/2$-point DFTs of the even and odd subsequences. Since they are periodic with $N/2$:

$$X[k]=X_e[k]+W_N^kX_o[k]$$
$$X[k+N/2]=X_e[k]-W_N^kX_o[k]$$

That pair is the **butterfly**: one complex multiply plus two adds.

```
       Xe[k] ──────●──────── + ────── X[k]
                   │
             W_N^k │
                   │
       Xo[k] ──────●──────── − ────── X[k+N/2]
```

The input must be **decimated before** the butterflies, so the input is recursively split down to length 2. That reordering is **bit reversal**.

### Decimation in Frequency (DIF): split the output

Keep the input in natural order and split the output:

$$X[2k]=\sum_{n=0}^{N/2-1}\left(x[n]+x[n+N/2]\right)W_{N/2}^{kn}$$

$$X[2k+1]=\sum_{n=0}^{N/2-1}\left(x[n]-x[n+N/2]\right)W_N^nW_{N/2}^{kn}$$

The butterfly comes **first**, then the two half-length DFTs:

```
       x[n] ──────●──────── + ────── W_{N/2}^{kn} ── X[2k]
                   │
                   │
       x[n+N/2] ──●──────── − ────── ×W_N^n ────── X[2k+1]
```

The decimation happens in the **frequency** index, hence the name. The output ends up in bit-reversed order.

---

## DIT vs DIF: The Comparison Table

| Aspect | DIT | DIF |
|---|---|---|
| Split | Input sequence (even/odd) | Output sequence (even/odd bins) |
| Butterfly position | After two half-DFTs | Before two half-DFTs |
| Input order | **Bit-reversed** | Natural |
| Output order | Natural | **Bit-reversed** |
| Twiddle placement | After the sub-DFTs, on $X_o$ | Before the sub-DFTs, on the difference |
| Number of operations | $\frac{N}{2}\log_2N$ butterflies | Same |
| In-place possible? | Yes | Yes |
| Bit reversal needed? | Yes, at the input | Yes, at the output |

> The lecture slide has a typo: it says "for DIF, the input is bit reversal… whereas for DIF…". The correct statement is **DIT: bit-reversed input, natural output; DIF: natural input, bit-reversed output.**

Both algorithms require identical arithmetic. Neither is faster. The choice is about data flow: DIF is convenient when the input arrives in natural order and you can reorder only the output; DIT is convenient when you can pre-permute the input once.

---

## Bit Reversal

For $N=2^m$, write the index in $m$ bits and reverse them.

| Natural $n$ | Binary | Reversed | Bit-reversed index |
|---|---|---|---|
| 0 | 000 | 000 | 0 |
| 1 | 001 | 100 | 4 |
| 2 | 010 | 010 | 2 |
| 3 | 011 | 110 | 6 |
| 4 | 100 | 001 | 1 |
| 5 | 101 | 101 | 5 |
| 6 | 110 | 011 | 3 |
| 7 | 111 | 111 | 7 |

The permutation for $N=8$ is

$$[0,4,2,6,1,5,3,7]$$

**Why reversal?** Each decimation step moves the low-order bit of the index into the high-order position. After $m$ steps, every bit has moved to the opposite end. The address is literally reversed.

### Flipping In Place

```python
def bit_reverse_indices(n_bits):
    n = 1 << n_bits
    out = [0] * n
    for i in range(n):
        out[i] = int(format(i, f'0{n_bits}b')[::-1], 2)
    return out

def bit_reverse_inplace(a):
    n = len(a)
    j = 0
    for i in range(1, n):
        bit = n >> 1
        while j & bit:
            j ^= bit
            bit >>= 1
        j |= bit
        if i < j:
            a[i], a[j] = a[j], a[i]
    return a
```

`bit_reverse_inplace` is the standard $O(N)$ swap loop — no extra array, no string formatting.

---

## In-Place Computation

"In-place" means the butterfly writes its two outputs into the **same two memory locations** as its inputs. Because each butterfly only reads its own two values and nothing else in that stage reads them, the whole stage can run without a temporary array.

```python
# One DIT stage, in place, N length
def dit_stage(a, half, twiddles):
    n = len(a)
    step = half * 2
    for start in range(0, n, step):
        for k in range(half):
            t = twiddles[k * (n // step)] * a[start + k + half]
            u = a[start + k]
            a[start + k]        = u + t
            a[start + k + half] = u - t
```

The only extra memory is the twiddle table of length $N/2$ (or $N$), which is computed once.

**Why it matters:** an $N=2^{20}$ FFT needs 1M complex values. A non-in-place algorithm would need a second 16 MB buffer. In-place keeps it inside cache and halves the memory traffic.

**Caveat:** the twiddle factors must be applied to a **copy** of the second input before overwriting, or you lose the original. The code above saves $u$ before writing, which is the standard fix.

---

## Operation Counts

| Algorithm | Complex multiplies | Complex adds |
|---|---|---|
| Direct DFT | $N^2$ | $N(N-1)$ |
| Radix-2 FFT | $\frac{N}{2}\log_2N$ | $N\log_2N$ |
| Radix-4 FFT | $\frac{3N}{8}\log_2N-\frac{N}{4}$ (approx) | $\frac{3N}{2}\log_2N$ |
| Split-radix FFT | $\approx\frac{4N}{3}\log_2N$ real ops | — |

For $N=64$:

$$\text{Direct}=64^2=4096$$
$$\text{Radix-2}=\frac{64}{2}\log_2 64=32\cdot6=192$$
$$\text{Speedup}=\frac{4096}{192}=21.33$$

That 21.33 is the number the exam asks for, and it is exact for $N=64$.

### Real Operation Counts for Radix-2

One radix-2 butterfly is 1 complex multiply (4 real multiplies, 2 real adds) and 2 complex adds (4 real adds). The total is roughly

$$4\cdot\frac{N}{2}\log_2N \text{ real multiplies},\qquad 6\cdot\frac{N}{2}\log_2N \text{ real adds}$$

Modern FFT libraries exploit the trivial twiddles $W^0=1$, $W^{N/4}=-j$ to shave a few percent more.

---

## Radix-4

Instead of splitting into 2, split into 4:

$$X[k]=\sum_{r=0}^{N/4-1}x[4r]W_{N/4}^{rk}+W_N^kW_{N/4}^{rk}x[4r+1]+\dots$$

A radix-4 butterfly combines 4 inputs with twiddles $\{1,-j,-1,j\}$ — all **trivial multiplies** (just sign changes and swaps of real/imaginary parts). That is why radix-4 is more efficient per butterfly: more work is done with adds and no multiplications.

| $N$ | Radix-2 mults | Radix-4 mults | Reduction |
|---|---|---|---|
| 16 | 32 | 24 | 25% |
| 64 | 192 | 144 | 25% |
| 256 | 1024 | 768 | 25% |

Radix-4 needs $N=4^m$. Mixed-radix implementations use radix-4 stages and one radix-2 stage when $\log_2N$ is odd.

## Split-Radix

Split-radix uses radix-2 for the even part and radix-4 for the odd part. It has the **lowest known multiplication count** among practical power-of-two algorithms:

$$\approx\frac{4N}{3}\log_2N \text{ real multiplications}$$

That is about 20% fewer than radix-2 and roughly 6% fewer than radix-4. It was the record holder for decades (until the 2004 Johnson–Frigo modification).

---

## Practical Implementation Notes

| Issue | Advice |
|---|---|
| Bit reversal cost | $O(N)$ pointer swaps; negligible compared with $O(N\log N)$ butterflies for large $N$ |
| Twiddle storage | Precompute $N/2$ values; use a lookup table, not `cos`/`sin` in the inner loop |
| Numerical accuracy | FFT round-off grows like $O(\sqrt{\log N})$; use double precision for long transforms |
| Real input | Use `rfft`, which exploits conjugate symmetry and costs about half |
| Many transforms of the same length | Precompute the twiddle table and bit-reversal permutation once |
| Largest practical $N$ | Memory-bound beyond about $2^{24}$ on a typical machine |

---

## Summary

1. DIT splits the input and needs bit-reversed input; DIF splits the output and produces bit-reversed output.
2. Both need the same $\frac N2\log_2N$ butterflies — the speedup is identical.
3. Bit reversal is the natural address permutation created by repeated decimation.
4. In-place butterflies reuse the same memory; save the first input before overwriting.
5. Radix-4 cuts multiplies by 25%; split-radix is the cheapest practical scheme.
6. For $N=64$ the exact speedup over the direct DFT is 21.33.

---
title: "The DFT as a Linear Transformation and Its Matrix Form"
date: 2026-02-24 00:00:00 +0600
categories: ['Academic', 'CSE-409 Digital Signal Processing']
tags: ['dsp', 'dft', 'linear-algebra', 'frequency-analysis', 'academic', 'cse409', 'cse410', 'jkkniu']
description: The DFT matrix, its orthogonality and inverse, the full property table, and the symmetry structure of real-sequence DFTs.
math: true
---
## The DFT Is a Matrix Multiplication

Write the DFT definition with the twiddle factor

$$W_N=e^{-j2\pi/N}$$

Then

$$X[k]=\sum_{n=0}^{N-1}x[n]W_N^{kn},\qquad k=0,1,\dots,N-1$$

Stack $x[n]$ into a column vector $\mathbf{x}$ and $X[k]$ into $\mathbf{X}$. The DFT is a linear map:

$$\mathbf{X}=\mathbf{W}\mathbf{x}$$

where $\mathbf{W}$ is the $N\times N$ **DFT matrix** with entries

$$W_{kn}=W_N^{kn}=e^{-j2\pi kn/N}$$

### Example: $N=4$

$$W_4=e^{-j\pi/2}=-j$$

$$\mathbf{W}_4=\begin{bmatrix}1&1&1&1\\1&-j&-1&j\\1&-1&1&-1\\1&j&-1&-j\end{bmatrix}$$

Apply it to $x=\{1,1,0,0\}$:

$$\mathbf{X}=\begin{bmatrix}1&1&1&1\\1&-j&-1&j\\1&-1&1&-1\\1&j&-1&-j\end{bmatrix}\begin{bmatrix}1\\1\\0\\0\end{bmatrix}=\begin{bmatrix}2\\1-j\\0\\1+j\end{bmatrix}$$

Check by the direct sum:

$$X[0]=1+1=2,\quad X[1]=1-j,\quad X[2]=1-1=0,\quad X[3]=1+j$$

Correct. The matrix view turns every DFT into a matrix–vector product you can do on paper for $N=4$ or $N=8$.

---

## Orthogonality of the Basis

The columns of $\mathbf{W}$ are orthogonal:

$$\sum_{n=0}^{N-1}W_N^{kn}\,W_N^{-ln}=\sum_{n=0}^{N-1}W_N^{(k-l)n}=\begin{cases}N,&k=l\\0,&k\ne l\end{cases}$$

using the geometric series $\sum_{n=0}^{N-1}r^n=\frac{1-r^N}{1-r}$ with $r^N=1$.

In matrix form:

$$\mathbf{W}\mathbf{W}^H=N\mathbf{I}$$

where $\mathbf{W}^H$ is the conjugate transpose. Therefore

$$\mathbf{W}^{-1}=\frac{1}{N}\mathbf{W}^H$$

and the inverse DFT is

$$\mathbf{x}=\frac{1}{N}\mathbf{W}^H\mathbf{X},\qquad x[n]=\frac{1}{N}\sum_{k=0}^{N-1}X[k]W_N^{-kn}$$

The factor $1/N$ belongs to the inverse transform (with the symmetric-convention alternative of $1/\sqrt N$ on both).

**Consequence:** the DFT is a **unitary transform** up to the scale factor. It preserves energy (Parseval) and preserves inner products. It is a rotation in $\mathbb{C}^N$, not a lossy operation.

---

## The DFT Property Table

Let $x[n]\leftrightarrow X[k]$ and $y[n]\leftrightarrow Y[k]$, both length $N$.

| Property | Time domain | Frequency domain |
|---|---|---|
| Linearity | $ax[n]+by[n]$ | $aX[k]+bY[k]$ |
| Circular shift | $x[(n-n_0)\bmod N]$ | $W_N^{kn_0}X[k]$ |
| Frequency shift | $W_N^{-k_0n}x[n]$ | $X[(k-k_0)\bmod N]$ |
| Duality | $X[n]$ | $Nx[(-k)\bmod N]$ |
| Circular convolution | $\sum_m x[m]y[(n-m)\bmod N]$ | $X[k]Y[k]$ |
| Multiplication | $x[n]y[n]$ | $\frac{1}{N}\sum_m X[m]Y[(k-m)\bmod N]$ |
| Parseval | $\sum_n\vert x[n]\vert^2$ | $\frac{1}{N}\sum_k\vert X[k]\vert^2$ |
| Conjugation | $x^*[n]$ | $X^*[(-k)\bmod N]$ |
| Reversal | $x[(-n)\bmod N]$ | $X[(-k)\bmod N]$ |

### Circular Shift Is Not a Delay

A "shift" in the DFT world wraps around:

$$x[(n-n_0)\bmod N]$$

If you shift right by 1, the last sample jumps to the front. This wrap is the source of **circular convolution artifacts**: multiplying two DFTs gives circular convolution, not linear convolution. Zero-pad both sequences to length $\ge N_1+N_2-1$ to make the circular result equal the linear one.

---

## Symmetry for Real Sequences

If $x[n]$ is real, then

$$X[N-k]=X^*[k],\qquad k=0,1,\dots,N-1$$

Split into real and imaginary parts:

$$X_R[N-k]=X_R[k]\quad\text{(even)}$$
$$X_I[N-k]=-X_I[k]\quad\text{(odd)}$$
$$\vert X[N-k]\vert=\vert X[k]\vert\quad\text{(even magnitude)}$$
$$\angle X[N-k]=-\angle X[k]\quad\text{(odd phase)}$$

### How Many Independent Values?

| $N$ | Full bins | Independent bins (real input) |
|---|---|---|
| 8 | 8 | 5 ($k=0,1,2,3,4$) |
| 16 | 16 | 9 |
| $N$ | $N$ | $N/2+1$ |

Bins $k=0$ and $k=N/2$ (when $N$ is even) are **purely real** for a real input, because their conjugate partner is themselves.

**Consequences:**

- Store only $N/2+1$ complex values for a real signal.
- A real-input FFT costs about half a complex FFT.
- $X[0]=N\bar x$ is the DC component and is always real.
- $X[N/2]=\sum_n x[n]\\,(-1)^n$ is the Nyquist bin and is always real.

### Example: 8-Point Real DFT

$x=\{1,0,1,0,1,0,1,0\}$.

$$X[0]=4,\qquad X[4]=\sum_n x[n](-1)^n=0$$

The remaining bins come in conjugate pairs: $X[7]=X^*[1]$, $X[6]=X^*[2]$, $X[5]=X^*[3]$. Only $X[0],X[1],X[2],X[3],X[4]$ carry new information.

---

## Why the Matrix View Matters

### 1. Complexity

A naive matrix multiply is $O(N^2)$ complex multiplies. The FFT is $O(N\log N)$. The matrix view makes the speedup obvious: the FFT factorizes $\mathbf{W}$ into sparse matrices.

### 2. Filtering as Matrix Operation

Circular convolution by $\mathbf{h}$ is the matrix

$$\mathbf{Y}=\mathbf{C}\mathbf{x},\qquad \mathbf{C}=\begin{bmatrix}h_0&h_{N-1}&\dots&h_1\\h_1&h_0&\dots&h_2\\\vdots&&\ddots&\vdots\\h_{N-1}&h_{N-2}&\dots&h_0\end{bmatrix}$$

$\mathbf{C}$ is **circulant**, and every circulant matrix is **diagonalized by the DFT matrix**:

$$\mathbf{C}=\mathbf{W}^{-1}\boldsymbol{\Lambda}\mathbf{W}$$

where $\boldsymbol{\Lambda}=\operatorname{diag}(H[0],\dots,H[N-1])$. This is the deep reason convolution becomes multiplication under the DFT — the DFT is the eigenbasis of every circulant matrix.

### 3. Transform Coding

The DFT matrix is one choice of orthogonal basis. The DCT matrix is another; the KLT is the optimal one for a given covariance. The matrix formulation lets you compare them on equal footing.

---

## Computing a Small DFT by Matrix — Full Worked Example

**Find the 4-point DFT of $x=\{0,1,2,3\}$** (2024 exam).

$$W_4^0=1,\quad W_4^1=-j,\quad W_4^2=-1,\quad W_4^3=j$$

$$X[0]=0+1+2+3=6$$

$$X[1]=0+1(-j)+2(-1)+3(j)=-2+2j$$

$$X[2]=0+1(-1)+2(1)+3(-1)=-2$$

$$X[3]=0+1(j)+2(-1)+3(-j)=-2-2j$$

$$\boxed{X=\{6,\ -2+2j,\ -2,\ -2-2j\}}$$

Check conjugate symmetry: $X[3]=X^*[1]$ ✓ and $X[2]$ is real ✓.

Check Parseval:

$$\sum\vert x[n]\vert^2=0+1+4+9=14$$
$$\frac{1}{4}\sum\vert X[k]\vert^2=\frac{1}{4}\left(36+8+4+8\right)=\frac{56}{4}=14 \;\checkmark$$

---

## Summary

1. The DFT is the matrix product $\mathbf{X}=\mathbf{W}\mathbf{x}$ with $W_{kn}=e^{-j2\pi kn/N}$.
2. $\mathbf{W}\mathbf{W}^H=N\mathbf{I}$, so $\mathbf{W}^{-1}=\frac{1}{N}\mathbf{W}^H$ — the DFT is orthogonal up to scale.
3. Shifts are **circular**; linear convolution needs zero-padding.
4. Real inputs have $N/2+1$ independent bins with conjugate symmetry.
5. The DFT diagonalizes circulant matrices, which is why convolution becomes multiplication.

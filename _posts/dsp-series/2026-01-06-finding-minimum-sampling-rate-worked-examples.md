---
title: "Finding Minimum Sampling Rate: Worked Examples"
date: 2026-01-06 00:00:00 +0600
categories: ['Academic', 'CSE-409 Digital Signal Processing']
tags: ['dsp', 'sampling', 'aliasing', 'nyquist', 'academic', 'cse409', 'cse410', 'jkkniu']
description: '## Finding the Minimum Sampling Rate: Worked Examples'
math: true
---
## Finding the Minimum Sampling Rate: Worked Examples

### Example 1: Single Sinusoid
$$x(t) = 5\cos(2\pi \cdot 1000 t)$$
- Maximum frequency: $F_{\text{max}} = 1000$ Hz
- Nyquist rate: $F_s \ge 2000$ Hz

### Example 2: Sum of Sinusoids
$$x(t) = 3\cos(2\pi \cdot 500 t) + 2\sin(2\pi \cdot 1200 t)$$
- Frequencies: 500 Hz and 1200 Hz
- $F_{\text{max}} = 1200$ Hz
- Nyquist rate: $F_s \ge 2400$ Hz

### Example 3: Product of Sinusoids (Modulation)
$$x(t) = \cos(2\pi \cdot 1000 t) \cdot \cos(2\pi \cdot 10000 t)$$
Using $\cos A \cos B = \frac{1}{2}[\cos(A+B) + \cos(A-B)]$:
- Frequencies: 9000 Hz and 11000 Hz
- $F_{\text{max}} = 11000$ Hz
- Nyquist rate: $F_s \ge 22000$ Hz

---
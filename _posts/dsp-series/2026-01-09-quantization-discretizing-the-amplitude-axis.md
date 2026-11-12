---
title: "Quantization: Discretizing the Amplitude Axis"
date: 2026-01-09 00:00:00 +0600
categories: ['Academic', 'Digital Signal Processing']
tags: ['dsp', 'quantization', 'adc', 'academic', 'cse409', 'cse410', 'jkkniu']
description: '## The Second Half of Digitization'
math: true
---
## The Second Half of Digitization

After **sampling** discretizes the time axis, **quantization** discretizes the amplitude axis. A sampled signal $x[n]$ still takes continuous amplitude values—infinite precision that digital systems cannot represent. Quantization maps these to a finite set of levels.

---

## What Is Quantization?

> **Quantization** is the process of mapping a continuous (or high-resolution) range of amplitude values to a finite set of discrete levels.

A quantizer with $L$ levels divides the input range $[-V_{\text{max}}, V_{\text{max}}]$ into $L$ intervals, each of width $\Delta$ (step size):

$$\Delta = \frac{2V_{\text{max}}}{L} = \frac{\text{Full-Scale Range}}{L}$$

Each input value $x$ is mapped to the nearest quantization level (midpoint of its interval).

---
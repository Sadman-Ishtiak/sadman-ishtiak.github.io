---
title: 'The DSP Pipeline: From Analog to Digital'
date: 2026-01-04 00:00:00 +0600
categories:
- Academic
- Digital Signal Processing
tags:
- dsp
- signals
- fundamentals
- academic
- cse409
- cse410
- jkkniu
description: '```'
math: true
---
## The DSP Pipeline

```
Analog Signal → Sampling → Quantization → Digital Processing → D/A Conversion → Analog Output
     x(t)           x[n]           x[n]_q         y[n]                y(t)
```

**Sampling** discretizes the time axis: $x[n] = x_a(nT)$ where $T$ is the sampling period.
**Quantization** discretizes the amplitude axis: maps continuous values to finite levels.

---
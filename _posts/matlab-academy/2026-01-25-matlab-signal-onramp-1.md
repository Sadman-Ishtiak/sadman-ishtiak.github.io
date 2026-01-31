---
title: "Matlab Signal Onramp course notes - Part 1: Generating Signals"
date: 2026-01-25 00:00:00 +0600
categories: [Matlab Academy, Matlab Signal Processing]
tags: [matlab, signal-processing, learning]
description: "Introduction to Signal Processing and generating synthetic signals in MATLAB."
math: true
---

## Matlab Academy Signal Processing Onramp
Signal processing is a crucial part of many engineering and scientific fields. MATLAB provides powerful tools for analyzing and manipulating signals. As part of my MATLAB learning journey, I'm taking the **Signal Onramp** course to build a foundation in signal processing concepts.

## Course Overview
We live in a world of signals—from radio waves and Bluetooth to GPS and automotive sensors. Signal processing is a set of techniques used to **preprocess, analyze, and extract information** from these signals.

In this course, we use MATLAB and the **Signal Processing Toolbox** to compare vibration signals from seismic stations, identify earthquake patterns, and separate signals from local noise.

---

## Generating Signals
When working with real-world data, you might not know the expected result at each step. To verify algorithms, we often start by creating a **known signal** (like a sine wave) and verifying the output.

### 1. Specifying Sample Times
To generate a signal, you must choose the sample times. Key attributes:
- **Sample rate ($f_s$):** Measured in Hertz (Hz).
- **Start time ($a$):** In seconds.
- **End time ($b$):** In seconds.

The distance between two samples is $1/f_s$. In MATLAB, we can use the colon operator: `a:1/fs:b`.

```matlab
% Specify a sample rate of 100 Hz
fs = 100;

% Create a time vector from 0 to 1 second
t = (0:1/fs:1);
```

### 2. Creating a Sine Wave
We can generate a sine wave using the formula: $s = \sin(2\pi f t)$, where $f$ is the frequency.

```matlab
% Create a 5 Hz sine signal
sig = sin(2*pi*5*t);

% Plot the signal
plot(t, sig)
title('5 Hz Sine Wave')
xlabel('Time (s)')
ylabel('Amplitude')
```

### 3. Adding Noise
Adding noise makes signals more realistic and tests the robustness of signal processing techniques. Normally distributed random numbers can be generated using `randn`.

```matlab
% Create scaled white noise
noise = randn(size(sig)) * 0.1;

% Add noise to the original signal
sigNoisy = sig + noise;

% Plot the noisy signal
plot(t, sigNoisy)
title('Noisy 5 Hz Sine Wave')
```

### 4. Specialized Waveforms
The Signal Processing Toolbox contains functions for common waveforms like `square` and `sawtooth`.

```matlab
% Create a 5 Hz square wave
sq = square(2*pi*5*t);

% Plot the square wave with added noise
plot(t, sq + noise)
title('Noisy 5 Hz Square Wave')
```

In the next part, we will look into importing real earthquake data and using the **Signal Analyzer** app.

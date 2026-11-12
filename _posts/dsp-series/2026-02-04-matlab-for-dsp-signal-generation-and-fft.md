---
title: "MATLAB for DSP: Signal Generation and FFT"
date: 2026-02-04 00:00:00 +0600
categories: ['Academic', 'Digital Signal Processing']
tags: ['dsp', 'matlab', 'lab', 'fft', 'filter-design', 'academic', 'cse409', 'cse410', 'jkkniu']
description: '## Why MATLAB for DSP?'
math: true
---
## Why MATLAB for DSP?

MATLAB (and Octave/Python) is the **lingua franca** of DSP prototyping. The lab exercises bridge theory and implementation—every concept from sampling to filter design has a direct MATLAB counterpart.

---

## Core Signal Generation

```matlab
% Basic signals
fs = 1000;           % Sampling frequency (Hz)
t = 0:1/fs:1-1/fs;   % 1 second time vector

% Sine wave
f = 50;              % 50 Hz
x_sine = sin(2*pi*f*t);

% Cosine wave
x_cos = cos(2*pi*f*t);

% Unit impulse
x_impulse = [1, zeros(1, 99)];

% Square wave
x_square = square(2*pi*f*t);

% Plot all four with subplot
figure;
subplot(2,2,1); plot(t, x_sine); title('Sine');
subplot(2,2,2); plot(t, x_cos); title('Cosine');
subplot(2,2,3); stem(x_impulse); title('Impulse');
subplot(2,2,4); plot(t, x_square); title('Square');
```

---

## Sampling & Aliasing Demo

```matlab
% Effect of up-sampling on spectrum
fs = 1000;
t = 0:1/fs:0.1;
x = cos(2*pi*100*t);  % 100 Hz tone

% Original spectrum
X = fft(x);
f = (0:length(X)-1)*fs/length(X);
figure; plot(f, abs(X)); title('Original Spectrum (fs=1000Hz)');

% Up-sample by 3 (insert zeros)
L = 3;
x_up = zeros(1, length(x)*L);
x_up(1:L:end) = x;

% Spectrum after up-sampling (replicas appear)
X_up = fft(x_up, 1024);
f_up = (0:1023)*fs*L/1024;
figure; plot(f_up, abs(X_up)); title('After Up-sampling by 3');

% Interpolation: Lowpass filter to remove replicas
h = fir1(30, 1/L);   % Anti-imaging filter
x_interp = filter(h, 1, x_up) * L;  % Gain compensation
figure; plot(fft(x_interp, 1024)); title('After Interpolation');
```

---

## FFT Computation & Analysis

```matlab
% Compute FFT
fs = 8000;
N = 1024;
t = (0:N-1)/fs;
x = cos(2*pi*1000*t) + 0.5*cos(2*pi*2500*t);  % Two tones

X = fft(x);
f = (0:N-1)*fs/N;

% Single-sided spectrum
X_mag = abs(X)/N;
X_mag(2:end-1) = 2*X_mag(2:end-1);  % Double except DC & Nyquist
f_half = f(1:N/2+1);

figure; plot(f_half, X_mag(1:N/2+1));
xlabel('Frequency (Hz)'); ylabel('Magnitude');
title('Single-Sided Magnitude Spectrum');
```

#
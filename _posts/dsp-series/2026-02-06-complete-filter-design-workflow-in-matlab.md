---
title: Complete Filter Design Workflow in MATLAB
date: 2026-02-06 00:00:00 +0600
categories:
- Academic
- Digital Signal Processing
tags:
- dsp
- matlab
- lab
- fft
- filter-design
- academic
- cse409
- cse410
- jkkniu
description: '```matlab'
math: true
---
## Complete Filter Design & Analysis Workflow

```matlab
% Specs
fs = 8000; fp = 1000; fs_stop = 1500;  % Hz
Ap = 1; As = 50;  % dB

% Normalize
wp = 2*fp/fs; ws = 2*fs_stop/fs;

% FIR Design (Kaiser window)
[N, beta] = kaiserord([fp fs_stop]/(fs/2), [1 0], [10^(-Ap/20) 10^(-As/20)]);
b_fir = fir1(N, wp, kaiser(N+1, beta));
fvtool(b_fir, 1, 'Fs', fs);

% IIR Design (Elliptic - minimum order)
[N, Wn] = ellipord(wp, ws, Ap, As);
[b_iir, a_iir] = ellip(N, Ap, As, Wn);
sos = tf2sos(b_iir, a_iir);  % Critical for implementation!
fvtool(sos, 'Fs', fs);

% Compare orders
fprintf('FIR order: %d, IIR order: %d\n', N, N);

% Apply filter
x = randn(1, 10000);
y_fir = filter(b_fir, 1, x);
y_iir = filter(sos, x);  % Use SOS form

% Verify frequency response
[h_fir, f] = freqz(b_fir, 1, 1024, fs);
[h_iir, f] = freqz(sos, 1024, fs);
figure; plot(f, 20*log10(abs(h_fir)), f, 20*log10(abs(h_iir)));
legend('FIR', 'IIR'); ylabel('Magnitude (dB)');
```

---

## Pole-Zero Analysis

```matlab
% Given difference equation: y[n] - 0.5y[n-1] = x[n] + 0.25x[n-1]
b = [1, 0.25];
a = [1, -0.5];

% Pole-zero plot
zplane(b, a);

% Stability check
poles = roots(a);
fprintf('Poles: %s\n', mat2str(poles));
fprintf('Stable? %s\n', mat2str(all(abs(poles) < 1)));

% Frequency response
freqz(b, a, 1024, fs);

% Impulse response
impz(b, a, 50);
```

---

## Spectrogram (Time-Frequency Analysis)

```matlab
% Non-stationary signal: chirp
fs = 1000;
t = 0:1/fs:2;
x = chirp(t, 0, 2, 400);  % 0 to 400 Hz over 2 seconds

% Spectrogram
figure;
spectrogram(x, 256, 128, 256, fs, 'yaxis');
title('Chirp Signal Spectrogram');
colorbar;
```

---

## Complete Lab Template

```matlab
% =============================================
% DSP LAB: [Experiment Name]
% Course: CSE 410
% =============================================

clear; clc; close all;

%% Parameters
fs = 8000;        % Sampling frequency
N = 1024;         % FFT size / signal length

%% 1. Signal Generation
% [Generate test signals here]

%% 2. Time-Domain Analysis
% [Plot signals, compute statistics]

%% 3. Frequency-Domain Analysis
% [FFT, manual DFT verification]

%% 4. Filter Design
% [Design FIR/IIR per specs]

%% 5. Filter Application
% [Filter signals, compare input/output]

%% 6. Verification
% [Check specs met, stability, etc.]

%% 7. Results & Discussion
% [Plots, observations, conclusions]
```

---

## Key MATLAB Functions Cheat Sheet

| Category | Functions |
|---|---|
| **Signal Gen** | `sin`, `cos`, `square`, `sawtooth`, `chirp`, `randn`, `zeros`, `ones` |
| **Time Ops** | `shift`, `flip`, `upsample`, `downsample`, `interp`, `decimate` |
| **Statistics** | `mean`, `std`, `var`, `cov`, `corrcoef`, `skewness`, `kurtosis` |
| **Transforms** | `fft`, `ifft`, `fftshift`, `dftmtx` |
| **Filter Design** | `fir1`, `fir2`, `firpm`, `kaiserord`, `butter`, `cheby1`, `cheby2`, `ellip`, `buttord`, `cheb1ord`, `ellipord` |
| **Filter Analysis** | `freqz`, `zplane`, `impz`, `grpdelay`, `tf2sos`, `sos2tf` |
| **Filtering** | `filter`, `filtfilt` (zero-phase), `filter2` |
| **Spectral** | `pwelch`, `periodogram`, `spectrogram`, `cpsd` |
| **Matrix** | `eye`, `zeros`, `ones`, `reshape`, `toeplitz`, `find`, `mean` |

---
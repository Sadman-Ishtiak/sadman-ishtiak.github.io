---
title: "Manual DFT/IDFT, Covariance, and Logical Indexing"
date: 2026-02-05 00:00:00 +0600
categories: ['Academic', 'Digital Signal Processing']
tags: ['dsp', 'matlab', 'lab', 'fft', 'filter-design', 'academic', 'cse409', 'cse410', 'jkkniu']
description: '## Manual N-Point DFT/IDFT (Verification)'
math: true
---
## Manual N-Point DFT/IDFT (Verification)

```matlab
% Manual DFT (for comparison)
N = 8;
x = [1, 2, 3, 4, 3, 2, 1, 0];
X_manual = zeros(1, N);

for k = 0:N-1
    sum = 0;
    for n = 0:N-1
        sum = sum + x(n+1) * exp(-1j*2*pi*k*n/N);
    end
    X_manual(k+1) = sum;
end

% Compare with fft
X_fft = fft(x);
disp('Match? '); disp(norm(X_manual - X_fft) < 1e-10);

% Manual IDFT
x_recon = zeros(1, N);
for n = 0:N-1
    sum = 0;
    for k = 0:N-1
        sum = sum + X_fft(k+1) * exp(1j*2*pi*k*n/N);
    end
    x_recon(n+1) = sum / N;
end
```

---

## Sample Covariance (Manual vs Built-in)

```matlab
% Generate two correlated signals
N = 1000;
x = randn(1, N);
y = 0.7*x + 0.3*randn(1, N);  % Correlated with x

% Manual covariance
mu_x = mean(x); mu_y = mean(y);
cov_manual = sum((x - mu_x) .* (y - mu_y)) / N;

% Built-in
cov_builtin = cov(x', y');  % Note: transpose for row vectors
cov_builtin = cov_builtin(1,2);

fprintf('Manual: %.6f, Built-in: %.6f\n', cov_manual, cov_builtin);
```

---

## Logical Indexing (Essential for Signal Processing)

```matlab
x = -5:5;  % Vector [-5 -4 -3 -2 -1 0 1 2 3 4 5]

% Comparison operations (return logical arrays)
gt_zero = x > 0;      % [0 0 0 0 0 0 1 1 1 1 1]
eq_two = x == 2;      % [0 0 0 0 0 0 0 0 1 0 0]
le_three = x <= 3;    % [1 1 1 1 1 1 1 1 1 0 0]

% Logical indexing - POWERFUL
positive_vals = x(x > 0);        % [1 2 3 4 5]
x(x < 0) = 0;                    % Replace negatives with 0
indices = find(x > 2);           % Indices where x > 2

% Practical: Rectify a signal
signal = sin(2*pi*0.1*(0:99));
rectified = signal;
rectified(rectified < 0) = 0;   % Half-wave rectification
```

---

## Matrix Operations for DSP

```matlab
% Identity matrix
I = eye(4);  % 4x4 identity

% Replace row with its mean
A = rand(5, 4);
row_idx = 3;
A(row_idx, :) = mean(A, 2);  % Mean of each row (column-wise)

% Reshape matrix to vector
B = reshape(A, [], 1);  % Column vector (5*4 x 1)
C = reshape(A, 1, []);  % Row vector (1 x 20)

% Convolution via matrix (Toeplitz)
x = [1, 2, 3];
h = [1, 1];  % Moving average
% Create convolution matrix
H = toeplitz([h, zeros(1, length(x)-1)], [h(1), zeros(1, length(x)-1)]);
y = H * x';  % Same as conv(x, h)
```

---
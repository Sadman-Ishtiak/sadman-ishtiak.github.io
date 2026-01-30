---
title: Matlab Onramp course notes - Part 4: Programming & Projects
date: 2026-01-29 03:00:00 +0600
categories: [Matlab Academy, Matlab]
tags: [matlab, learning]
description: "Studying the self paced course in matlab academy for academic work - Part 4"
math: true
---
## Logical Arrays
### Rational Operators

- Relational operators: `>`, `<`, `==`, `~=`. Comparisons yield `1` (true) or `0` (false).

Task
Test if π is less than 4 by using the relational operator `<`. Assign the output to a variable named x.
```m
x = (pi < 4)
```

- Comparing an array to a scalar returns a logical array of the same size.

```m
y = [5 10 15] > 12
y = 
    0    0    1
```

Task
Test the vector `v1` for elements that are less than 4. Assign the output to a variable named `y`.
```m
y = (v1 < 4)
```

- Use `=` to assign and `==` to test equality.

```m
y = [5 10 15] == 10
y = 
    0    1    0
```

Task
Test the vector `sample` for elements that are equal to 18. Assign the output to a variable named `z`.
```m
z = (sample == 18)
```

- Combine comparisons with logical AND `&` and OR `|`:
  - Both conditions: `v1 < 6 & v1 > 5`
  - Either condition: `v1 < 6 | v1 > 2`

Try finding the values in `sample` that are between 10 and 20.
```m
v1;
v1 < 6 & v1 > 5
sample .* (sample >= 10 & sample <= 20)
```
### Logical Indexing

- Extract elements using a logical array as an index.  
- Logical index must match the indexed vector's size.  
- MATLAB returns elements where the index is 1 (true).

Task — use isGreater to extract v1 > 6:
```matlab
load datafile
sample = data(:,1);
v1 = data(:,3)
isGreater = v1 > 6
x = v1(isGreater)
```

One-line extraction example:
```matlab
v = v1(v1 > 6)
v =
    6.6678
    9.0698
```

Task — one-line: elements of v1 < 4:
```matlab
y = v1(v1 < 4)
```

Use logical indexing across arrays:
```matlab
v = sample(v1 > 6)
v =
    18
    23
```

Task — sample elements where v1 < 4:
```matlab
z = sample(v1 < 4)
```

Reassign via logical indexing (example):
```matlab
x(x==999) = 1
```

Task — set v1 values < 4 to 0:
```matlab
v1(v1 < 4) = 0
```

Logical indexing with matrices — change all data < 4 to 0:
```matlab
data(data < 4) = 0
```

## Programming

### Conditional Statements
- Scripts run top-to-bottom; use if to run code only when a condition is true.
- Use else to run alternate code when the condition is false.
- Use == for equality checks.
- End an if/else block with end.

```matlab
% example: check nonnegative
if x >= 0
    % runs when x is nonnegative
end
```

### Decision Branching
- Goal: run plotting code only when doPlot == 1.
- Add if on line 4 and end on line 9.

```matlab
doPlot = randi([0 1])
load datafile
density = data(:,2);
if doPlot == 1
    plot(density)
    title("Sample Densities")
    xticklabels(element)
    ylabel("Density (g/cm^3)")
end
```

- To run alternate code when the condition is false, add else before end and put the disp command there.

```matlab
doPlot = randi([0 1])
load datafile
density = data(:,2);
if doPlot == 1
    plot(density)
    title("Sample Densities")
    xticklabels(element)
    ylabel("Density (g/cm^3)")
else
    disp("The density of " + element + " is " + density)
end
```

### Repeat code with loop
- Use for loops to repeat a block over index values.
- MATLAB arrays often eliminate the need for loops, but use loops when required.
- Loop syntax: for <var> = <values> ... end. The loop variable takes each value in turn.

```matlab
% example: loop over 1:5
for x = 1:5
    % body runs 5 times
end
```

### Write a for loop
- Task: iterate over density (7 elements).
- Create idx = 1:7 then loop to display/plot each point.

```matlab
load datafile
density = data(:,2)
hold on
idx = (1:7)
plot(idx,density(idx),"*")
pause(0.3)
hold off
```

- To animate points one at a time, wrap plotting in a for loop and end after pause.

```matlab
load datafile
density = data(:,2)
hold on
for c = (1:7)
    idx = c
    plot(idx,density(idx),"*")
    pause(3)
end
hold off
```

- Use length(density) to loop over a vector of unknown length:

```matlab
for idx = 1:length(density)
    % process density(idx)
end
```
- Note: pause(0.3) updates the plot between iterations.
- Use hold on/off to overlay and clear plots as needed.

## Final Project
### Steller Moon

- Given: spectra sampled at evenly spaced wavelengths: lambdaStart, lambdaDelta, nObs.
- Compute last wavelength lambdaEnd = lambdaStart + (nObs - 1) * lambdaDelta and vector lambda from start to end (nObs points).

```matlab
load starData
nObs = size(spectra,1)
lambdaStart = 630.02
lambdaDelta = 0.14
lambdaEnd = lambdaStart + (nObs - 1) * lambdaDelta
lambda = linspace(lambdaStart, lambdaEnd, nObs)
```

- Each column is a star spectrum. Column 6 is HD 94028.
- Extract column 6 to s.

```matlab
load starData
nObs = size(spectra,1)
lambdaStart = 630.02
lambdaDelta = 0.14

lambdaEnd = lambdaStart + (nObs - 1) * lambdaDelta
lambda = linspace(lambdaStart, lambdaEnd, nObs)

s = spectra(:,6)
```

- Plot s vs lambda with point markers and solid line; label axes.

```matlab
load starData
nObs = size(spectra,1)
lambdaStart = 630.02
lambdaDelta = 0.14

lambdaEnd = lambdaStart + (nObs - 1) * lambdaDelta
lambda = linspace(lambdaStart, lambdaEnd, nObs)

s = spectra(:,6)

plot(lambda, s, ".-")
xlabel("Wavelength")
ylabel("Intensity")
```

- Use min to find hydrogen-alpha line: sHa (min value) and idx (index). Get lambdaHa = lambda(idx).

```matlab
load starData
nObs = size(spectra,1)
lambdaStart = 630.02
lambdaDelta = 0.14

lambdaEnd = lambdaStart + (nObs - 1) * lambdaDelta
lambda = linspace(lambdaStart, lambdaEnd, nObs)

s = spectra(:,6)

plot(lambda, s, ".-")
xlabel("Wavelength")
ylabel("Intensity")

[sHa, idx] = min(s)
lambdaHa = lambda(idx)
```

- Mark the hydrogen-alpha point on the plot as a red square, MarkerSize 8.

```matlab
load starData
nObs = size(spectra,1)
lambdaStart = 630.02
lambdaDelta = 0.14

lambdaEnd = lambdaStart + (nObs - 1) * lambdaDelta
lambda = linspace(lambdaStart, lambdaEnd, nObs)

s = spectra(:,6)

plot(lambda, s, ".-")
xlabel("Wavelength")
ylabel("Intensity")

[sHa, idx] = min(s)
lambdaHa = lambda(idx)

hold on
plot(lambdaHa, sHa, "rs", MarkerSize=8)
```

- Observed lambdaHa ≈ 656.62 nm (vs lab 656.28 nm).  
- Compute redshift z = (lambdaHa/656.28) - 1 and speed = z * 299792.458 km/s.

```matlab
load starData
nObs = size(spectra,1)
lambdaStart = 630.02
lambdaDelta = 0.14

lambdaEnd = lambdaStart + (nObs - 1) * lambdaDelta
lambda = linspace(lambdaStart, lambdaEnd, nObs)

s = spectra(:,6)

plot(lambda, s, ".-")
xlabel("Wavelength")
ylabel("Intensity")

[sHa, idx] = min(s)
lambdaHa = lambda(idx)

hold on
plot(lambdaHa, sHa, "rs", MarkerSize=8)

z = (lambdaHa / 656.28 - 1)
speed = z * 299792.458
```

- To run the calculation for star 2 instead of star 6: change the column index to 2.

```matlab
load starData
nObs = size(spectra,1)
lambdaStart = 630.02
lambdaDelta = 0.14

lambdaEnd = lambdaStart + (nObs - 1) * lambdaDelta
lambda = linspace(lambdaStart, lambdaEnd, nObs)

s = spectra(:,2)

plot(lambda, s, ".-")
xlabel("Wavelength")
ylabel("Intensity")

[sHa, idx] = min(s)
lambdaHa = lambda(idx)

hold on
plot(lambdaHa, sHa, "rs", MarkerSize=8)

z = (lambdaHa / 656.28 - 1)
speed = z * 299792.458
```
### Compare Stellar Spectra

- Background
    - Line 2 extracts star 2; lines 3–5 compute its speed.
    - To compute speed for all stars, delete (:,2) on line 2.

```matlab
load starData

[sHa,idx] = min(spectra(:,:));
lambdaHa = lambda(idx);
z = lambdaHa/656.28 - 1;
speed = z*299792.458
```

- Note: speed is now a vector. Positive → away (redshift). Negative → toward (blueshift).

- Compute and plot each spectrum (loop over columns)
    - Loop skeleton: extract vth column to s.

```matlab
load starData

[sHa,idx] = min(spectra(:,:));
lambdaHa = lambda(idx);
z = lambdaHa/656.28 - 1;
speed = z*299792.458


for v = 1:7
        s = spectra(:, v)
end
```

- Plot blueshifted spectra with dashed lines (hold on to overlay)
```matlab
load starData

[sHa,idx] = min(spectra(:,:));
lambdaHa = lambda(idx);
z = lambdaHa/656.28 - 1;
speed = z*299792.458


for v = 1:7
        s = spectra(:, v)
        if speed(v) <= 0
                plot(lambda, s, "--")
                hold on
        end
end
```

- Plot redshifted spectra with thick lines; then hold off
```matlab
load starData

[sHa,idx] = min(spectra(:,:));
lambdaHa = lambda(idx);
z = lambdaHa/656.28 - 1;
speed = z*299792.458


for v = 1:7
        s = spectra(:, v)
        if speed(v) <= 0
                plot(lambda, s, "--")
                hold on
        else 
                plot(lambda, s, LineWidth=3)
        end
end
hold off
```

- Add legend using starnames
```matlab
load starData

[sHa,idx] = min(spectra(:,:));
lambdaHa = lambda(idx);
z = lambdaHa/656.28 - 1;
speed = z*299792.458


for v = 1:7
        s = spectra(:, v)
        if speed(v) <= 0
                plot(lambda, s, "--")
                hold on
        else 
                plot(lambda, s, LineWidth=3)
        end
end
hold off

legend(starnames)
```

- Find redshifted star names without a loop (logical indexing)
```matlab
load starData

[sHa,idx] = min(spectra(:,:));
lambdaHa = lambda(idx);
z = lambdaHa/656.28 - 1;
speed = z*299792.458


for v = 1:7
        s = spectra(:, v)
        if speed(v) <= 0
                plot(lambda, s, "--")
                hold on
        else 
                plot(lambda, s, LineWidth=3)
        end
end
hold off

legend(starnames)

moveaway = starnames(speed > 0)
```

- Plot all spectra at once (no loop)
```matlab
plot(lambda,spectra)
legend(starnames)
```

## Conclusion

### Summary

Basic Syntax
- Example — Description
```matlab
x = pi      % Create variables; left = name, right = value.
y = sin(-5) % Call functions with parentheses.
```

Desktop Management
- Function — Example — Description
```matlab
save        % save data.mat       % Save workspace to a MAT-file.
load        % load data.mat       % Load variables from a MAT-file.
clear       % clear               % Clear all variables.
clc         % clc                 % Clear Command Window text.
format      % format long         % Change numeric display precision.
```

Array Types
- Example — Description
```matlab
4                 % scalar
[3 5]             % row vector
[1;3]             % column vector
[3 4 5; 6 7 8]    % matrix
```

Evenly Spaced Vectors
- Example — Description
```matlab
1:4               % vector 1 to 4 step 1
1:0.5:4           % vector 1 to 4 step 0.5
linspace(1,10,5)  % 5 evenly spaced elements from 1 to 10
```

Matrix Creation
- Example — Description
```matlab
rand(2)        % 2×2 random matrix
zeros(2,3)     % 2×3 zeros
ones(2,3)      % 2×3 ones
```

Array Indexing
- Example — Description
```matlab
A(end,2)   % element in 2nd column of last row
A(2,:)     % entire 2nd row
A(1:3,:)   % all cols of first 3 rows
A(2) = 11  % set 2nd element to 11
```

Array Operations
- Example — Description
```matlab
[1 2;3 4] + 1
% ans =
%      2     3
%      4     5
                % array addition

[1 1;1 1]*[2 2;2 2]
% ans =
%      4     4
%      4     4
                % matrix multiplication

[1 1;1 1].*[2 2;2 2]
% ans =
%      2     2
%      2     2
                % element-wise multiplication
```

Multiple Outputs
- Example — Description
```matlab
[xrow,xcol] = size(x)   % rows and cols to two variables
[xMax,idx] = max(x)     % max value and its index
```

Documentation
- Example — Description
```matlab
doc randi    % Open randi documentation
```

Plots
- Example — Description
```matlab
plot(x,y,"ro--",LineWidth=5) % red dashed line, circle markers, thick line
hold on                       % overlay next plot
hold off                      % reset axes for next plot
title("My Title")             % add title
xlabel("x")                   % x label
ylabel("y")                   % y label
legend("a","b","c")           % add legend
```

Tables
- Example — Description
```matlab
data.HeightYards                      % extract table variable
data.HeightMeters = data.HeightYards*0.9144 % derive new table variable
```

Logical Indexing
- Example — Description
```matlab
[5 10 15] > 12    % compare vector elements to 12
v1(v1 > 6)        % extract v1 elements > 6
x(x==999) = 1     % replace 999 with 1 in x
```

Programming
- Example — Description
```matlab
if x > 0.5
    y = 3
else
    y = 4
end
% If x > 0.5 set y=3; else y=4.

for c = 1:3
    disp(c)
end
% Loop c over 1,2,3 and display each.
```

### next step
- Congrats — you learned MATLAB basics.
- Print/share certificate via My Courses.
- Submit course survey for 100% completion.
<!-- Embedded MATLAB Academy certificate -->
<!-- <iframe src="https://matlabacademy.mathworks.com/progress/share/certificate.html?id=36379dd5-8709-408b-bf98-3b0ba78be71f" title="MATLAB Academy Certificate" style="width:100%;border:0;" loading="lazy"></iframe> -->

<p>If the certificate does not display, <a href="https://matlabacademy.mathworks.com/progress/share/certificate.html?id=36379dd5-8709-408b-bf98-3b0ba78be71f" target="_blank" rel="noopener">open the certificate in a new tab</a>.</p>

or just go to <a href="/assets/pdf/Matlab01.pdf"> for the certificate hosted here </a>
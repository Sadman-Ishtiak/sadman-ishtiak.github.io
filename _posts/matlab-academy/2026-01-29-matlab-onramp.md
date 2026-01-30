---
title: Matlab Onramp course notes
date: 2026-01-29 00:00:00 +0600
categories: [Matlab Academy, Matlab]
tags: [matlab, learning]     # TAG names should always be lowercase
description: "Studing the self paced cource in matlab academy for academic work"
math: true
---
# Matlab
We as students are somewhat forced to work with matlab especially for academic works. Mostly it became popular with its easy to use interface and behaviour properties. Since I have to use it anyway, might as well learn it and share the notes on it. By the way, matlab and octave is almost equivalant, so I will use Octave in most cases for this blog. feel free to contact me if you find any wrong. 
## Cource Overview
Contains Almost nothing to note other than the fact we will learn how to calculate if the sun/moon is moving away from the earth or not.
## Commands
Mathlab command pannel is basically python commands. But when we just put a math expression the calculated expression value goes to the variable `ans`
```m
3*5
>>> ans = 15
```
we can assign variable like other programming languages. But matlab does not have any increment or decrement operator.
```m
val = 5
val = val + 10
```

In matlab workspace we can see the variable values in real time.

![Matlab workspace](/assets/images/matlab_workspace.png)

Standart operator such as `+`, `-`, `*`, `/` etc are available in matlab. And it is recomended to use a semicolon at the end of each expression in matlab.

```m
a = b + 5 + x * y;
```

### Variable naming convention
Matlab has some rules for naming the variables. they are generally similar to ANSI C.
- Start with a letter, then use letters, digits or underscores; names are case-sensitive.
- No spaces or punctuation; avoid MATLAB keywords and built-in function names.
- Length limited by namelengthmax (usually 63).
- Use descriptive names; prefer camelCase or snake_case; reserve single letters for indices.

### Workspace saving and loading
Matlab workspace is basically the ram storage which stores the variable names and values. so when we want to save/load to persist the workspace to .mat files. Examples:

```m
% save entire workspace as myWorkspace.mat
save myWorkspace

% or from script mode
save('myWorkspac.mat')

% save specific variables
save('data.mat','A','B')

% or from console mode
save data A

% clear command window
clc

% clear workspace
clear

% load entire saved workspace
load myWorkspace

% lead a variable in saved
load myWorkspace A

```

Notes and alternatives
- Binary .mat (default) is fast and preserves types; use -v7.3 for very large variables.
- For human-readable export, use writematrix/writetable/readmatrix/readtable (CSV) or save(...,'-ascii') for plain text.
- For very large files or partial I/O, use matfile:
```m
m = matfile('big.mat','Writable',true);
m.var(1:1000) = someData;   % avoids loading whole variable into memory
```
- The GUI Workspace browser also provides Save/Load and Import/Export options for interactive use.
- To clear before loading: clearvars; then load('file.mat') to avoid name clashes.
- Use who/whos to list workspace variables and memory usage.
- Back up configuration: save('startup_workspace.mat') and restore with load in a session.

### Built in functions
MATLAB has built‑in constants (pi, i) and functions (sin, sqrt). Example tasks:

```m
% create x = π/2
x = pi/2

% sine of x
y = sin(x)

% square root of -9 (produces imaginary result)
z = sqrt(-9)
```

Default Command Window shows limited precision (e.g., x = 1.5708, y = 1, z = 0 + 3.0000i). Use format long / format short to change displayed precision:
```m
format long
x
format short
x
```

## MATLAB Desktop and Editor
### MATLAB Desktop and Editor Introduction
- Default layout: Command Window (enter commands, run on Enter), Workspace (shows variables), and Files panels.
- Use New Live Script to combine code and text; edit in code/text modes and run all with Run.
- Output appears on the right or inline; clicking an output highlights the creating command and can make results interactive.
- Break scripts into sections and run a single section with Run Section.
- Save live scripts to preserve code, output, and descriptions; share with MATLAB users or export for others.
- Panels are movable/minimizable; use Layout to restore the default.
- For this course, use live scripts (Command Window and Workspace are minimized but available).

### Editor
The editor is basically the scripting and writing IDE for matlab. All the standard flagging error checking of IDE for other language is still here and we can run the program with this as well. Editor gives two error flags, error and warning. errors are there for where compile will not happen and warnings are for where something redundent is in the code.
## Vectors and Matrices
What's an Array?
All MATLAB variables are arrays — a scalar is a 1×1 array. Arrays store related values in a single variable and come in several common shapes:

- Scalar: 1×1
- Row vector: 1×n
- Column vector: n×1
- Matrix: m×n
- N‑D array: dimensions >2

Examples
```m
% scalar
s = 5;          % size(s) -> [1 1]

% row and column vectors
r = [1 2 3];    % 1x3
c = [1; 2; 3];  % 3x1

% matrix (2 rows, 3 cols)
A = [1 2 3; 4 5 6];  % 2x3

% 3-D array
B = rand(2,3,4);     % size(B) -> [2 3 4]
```

Common factories
```m
zeros(3,4)   % 3x4 zeros
ones(1,5)    % 1x5 ones
eye(4)       % 4x4 identity
linspace(0,1,11)
1:2:9        % start:step:end
```

Indexing and operations
- A(i,j) accesses row i, column j; A(:,2) is whole column 2.
- Linear indexing: A(4) treats A as a column-major vector.
- Use .' or ' for transpose ( .' real transpose, ' conjugate transpose).
- Matrix multiply: A*B; elementwise: A .* B, A ./ B, A .^ 2.

Useful queries
- size(A), numel(A), ndims(A), isa(A,'double')
- reshape, permute, squeeze for changing shapes
- cat/horzcat/vertcat for concatenation
### Manually entering arrays
In MATLAB a single number (scalar) is a 1×1 array.
Task
Create a variable named x with a value of 4.
```m
x = 4;
```

Create arrays with square brackets:
```m
x = [3 5]
% -> 3    5
```
Task
Create an array named y with two elements: 7 and 9
```m
y = [7 9];
```

Space → row vector, semicolon → column vector:
```m
x = [1; 3]
% -> 1
%    3
```
Task
Create a column array z with 7 and 9:
```m
z = [7; 9];
```

Row and column vector examples:
Task
Create row vector a = [3 10 5]
```m
a = [3 10 5];
```
Task
Create column vector b = [8; 2; -4]
```m
b = [8; 2; -4];
```

Matrices (rows separated by semicolons):
```m
x = [3 4 5; 6 7 8]
% -> 3 4 5
%    6 7 8
```
Task
Create matrix c:
```m
c = [5 6 7; 8 9 10];
```

You can compute inside brackets:
```m
x = [abs(-4) 4^2]
% -> 4 16
```
Task
Create row vector d with sqrt(10) and pi^2:
```m
d = [sqrt(10) pi^2];
```

Equivalent ways to write the same row vector:
```m
x = [7 9]
x = [7,9]
x = [7, 9]
```

Create the shown 9×1 column vector (use semicolons or newlines):
```m
v = [7; 4; 10; 1; 5; 4; 8; 8; 2];
```

### Create evenly spaced vactors
It is common to create vectors containing evenly spaced numbers.

Example (explicit):
```m
y = [5 6 7 8]
% y =
%    5    6    7    8
```
Task: Create a row vector named x with values 1, 2, 3:
```m
x = [1 2 3];
```

For long vectors, use the colon operator (:) which creates sequences without square brackets:

Basic start:end (default step = 1)
```m
y = 5:8
% y =
%    5    6    7    8
```
Task: Create a row vector y with integers 1 to 10:
```m
y = 1:10
% (square brackets are not needed)
```

Specify a custom step start:step:end:
```m
x = 20:2:26
% x =
%    20    22    24    26
```
Task: Create z from 1 to 5 with step 0.5:
```m
z = 1:0.5:5
```
Task: Create a from 3 to 13 with step 2:
```m
a = 3:2:13
```

If you know the number of elements instead of the step, use linspace:
```m
linspace(first, last, number_of_elements)
```
Example:
```m
x = linspace(0,1,5)
% x =
%    0    0.250    0.500    0.750    1.000
```
Task: Create b starting at 1, ending at 10, with 5 elements:
```m
b = linspace(1,10,5)
```

Both linspace and : produce row vectors. Use transpose (') to convert to a column vector:

Example:
```m
x = 1:3
% x =
%    1    2    3

x = x'
% x =
%    1
%    2
%    3
```
Task: Transpose b to a column vector:
```m
b = linspace(1,10,5);
b = b';
```

You can create a column vector in one command by transposing the row expression:
```m
x = (1:2:5)'
% x =
%    1
%    3
%    5
```
Task: Create column vector c from 5 to 9 with step 2 in a single command:
```m
c = (5:2:9)';
```

If creating an evenly spaced vector from 1 to 2*pi with 100 elements, prefer linspace:
```m
x = linspace(1, 2*pi, 100)
```
### Create arrays with functions

- Use functions like rand, zeros, ones, eye to create common matrices. Use one argument for n×n or two for m×n.

Examples / tasks:

```m
% 5×5 random matrix
x = rand(5);

% 5×1 random column vector
y = rand(5, 1);

% 6×3 zeros matrix
z = zeros(6, 3);
```

- Get size of an existing matrix and create a new array with the same size:

```m
s = size(x);
r = rand(size(x));   % random matrix same size as x
```

## Array Indexing and Modification
- Every MATLAB variable is an array; indexing extracts or changes values.
- An index is the position of a value; use parentheses: x(3) means the 3rd element.
- Use ranges with colons: x(2:4).
- For matrices use row,col. Colon alone means “all” (x(1,:) = row 1; x(:,3) = column 3).
- Matrix indexing is row,column; vectors use one index.
### Indexing into arrays

- Vectors: single index returns one element.
```m
y = x(5)
```
Task — Create x as the 2nd element of v:
```m
v = linspace(0,1,5)
load datafile
data
x = v(2)
```

- Use end to reference the last element.
```m
y = x(end)
```
Task — Extract last element of v into y:
```m
y = v(end)
```

- Use arithmetic with end (e.g., end-2).
```m
y = x(end-2)
```
Task — Second-to-last element (end-1) into z:
```m
z = v(end-1)
```

- Matrix element by row and column.
```m
y = A(5,7)
```
Task — 6th row, 3rd column of data into a:
```m
a = data(6, 3)
```

- end works for rows or columns.
```m
y = A(end,2)
```
Task — Last row, 3rd column of data into b:
```m
b = data(end, 3)
```

- Single-index on a matrix traverses columns (column-major). Example returns 6:
```m
A = [5 6; 7 8]
A(3)
```

- Using one index, try extracting the eighth element of data.
- You can use a variable as an index. Create idx = 8 and use data(idx).
- Tip: use end, ranges, and index variables to select or assign slices/elements.

### Extract Multiple Elements

- Colon (:) selects all elements in a dimension.
    ```m
    x = A(:,1)
    ```
- Task: create column vector from 2nd column of data.
    ```m
    load datafile
    data
    density = data(:,2)
    ```

- Use colon for ranges; example: first 3 rows of A.
    ```m
    x = A(1:3,:)
    ```
- Task: get last two columns of data.
    ```m
    volumes = data(:, end-1:end)
    ```

- Extract subvector from an index to the end.
    ```m
    x = v(3:end)
    ```
- Task: create p from 2nd to 5th elements of density.
    ```m
    p = density(2:5)
    ```

- Use nonconsecutive indices with square brackets (e.g., [1 3 6]).

### Change Values in Arrays

- Purpose: change array elements by indexing + assignment.

- Example (vector):
    - To set 3rd element of x to 1:
    ```m
    x(3) = 1
    ```
    - Task: change first element of v2 from NaN to 0.5:
    ```m
    load datafile
    data
    v2 = data(:,end)
    v2(1) = 0.5
    ```

- Example (matrix):
    - Index row,col to assign:
    ```m
    A(3,2) = 1
    ```
    - Task: change element in first row, last column of data to 0.5:
    ```m
    data(1, end) = 0.5
    ```

- Combining indexes:
    - Assign one element from another:
    ```m
    x(1) = x(2)
    ```
    - Task: set the first column of data to the second column (column-wise assignment):
    ```m
    data(:,1) = data(:,2)
    ```
- Notes:
    - Use parentheses for indexing.
    - Use end to reference the last index.
    - Assign entire columns/rows by using : for the other dimension.

## Array Calculations
### Perform Array Operations on Vectors
- MATLAB works naturally with arrays. Example (scalar broadcast):
```m
x = [1 2 3];
y = x + 2
y = 
    3     4     5
```

Task — add 1 to each element of v1 and store in r. Setup:
```m
load datafile
density = data(:,2);
v1 = data(:,3)
v2 = data(:,4)
r = v1 + 1
```

- You can add two arrays of the same size:
```m
z = x + y
```
Task — sum v1 and v2 into vs:
```m
vs = v1 + v2
```

- Multiply/divide an array by a scalar:
```m
z = 2*x
y = x/3
```
Task — divide vs by 2 into va:
```m
va = vs / 2
```

- Basic stats operate on whole vectors. Example:
```m
xMax = max(x)
```
Task — max of va into vm:
```m
vm = max(va)
```

- Array-wise math applies elementwise:
```m
xSqrt = sqrt(x)
```
Task — round elements of va into vr:
```m
vr = round(va)
```

- * is matrix multiply and fails for incompatible inner dims:
```m
z = [3 4] * [10 20]
Error using  * 
Incorrect dimensions for matrix 
multiplication. 
```
- .* is element-wise multiply:
```m
z = [3 4] .* [10 20]
z = 
    30    80
```
Task — element-wise product of density and va into mass:
```m
density
va
mass = va .* density
```

- Operations shown: two arrays (same size) and scalar-array mix.
- Other compatible sizes exist (implicit expansion / broadcasting). Example:
What size is x?
```m
x = [1 2; 3 4; 5 6; 7 8].*[1;2;3;4]
```
See "Compatible Array Sizes for Basic Operations" in docs.
```m
x = [1 2; 3 4; 5 6; 7 8].*[1;2;3;4]
size(x)
```

## Function Calls

- size (single output)
    - Returns array size as a 1×2 row: [rows, cols].
    ```m
    s = size(x)
    ```
    - Task: create dsize for data
    ```m
    load datafile
    data
    v1 = data(:,3);
    v2 = data(:,4);
    dsize = size(data)
    ```

- size (two outputs)
    - Request two outputs to get rows and columns separately.
    ```m
    [xrow,xcol] = size(x)
    ```
    - Task: create dr and dc for data
    ```m
    [dr, dc] = size(data)
    ```

- max
    - Returns max value; with two outputs also returns its index.
    ```m
    [xMax,idx] = max(x)
    ```
    - Task: v2 max and index
    ```m
    v2
    max(v2)
    [vMax, ivMax] = max(v2)
    ```

- Ignore unwanted outputs
    - Use tilde (~) to skip outputs.
    ```m
    [~,xcol] = size(x)
    [~, val] = size(data)
    ```

## Documentation

- When reading others' code and you find an unfamiliar function, search the docs.
- Every MATLAB function has a documentation page with:
    - supported calling syntaxes
    - descriptions of those syntaxes
    - examples
- Example: randn
    - one input → square matrix
    - two inputs → non‑square matrix (e.g., vector)

### Use MATLAB Documentation

- Docs contain examples and info to help solve problems.
- Task — Use randi docs to create a matrix x that:
    - contains random integers in range 1–20
    - has 5 rows and 7 columns
    ```m
    x = randi(20, 5, 7, "int8")
    ```
- Open a function's docs with:
    ```m
    doc randi
    ```
- If you don't know the function name, search the docs with a phrase, for example:
    ```m
    doc normally distributed numbers
    ```
- These searches help find functions that generate normally distributed numbers (instead of uniform).

## Plots

### Plot Vectors
- Plot two same-length vectors:
```matlab
plot(x, y)
```

- Task — plot sample vs mass1:
```matlab
plot(sample, mass1)
```

- Specify color/line/marker with a line spec string:
```matlab
plot(x, y, "r--o")   % "r--o" = red, dashed, circle markers
```

- Task — plot sample vs mass2 with red stars and no line:
```matlab
plot(sample, mass2, "r*")
```

- To overlay plots, use hold on:
```matlab
plot(x1, y1)
hold on
plot(x2, y2)
```

- Task — hold on; then plot sample vs mass1 with magenta squares and no line:
```matlab
hold on
plot(sample, mass1, "ms")
```

- Stop overlaying:
```matlab
hold off
```

- Plotting a single vector uses indices 1:n for x:
```matlab
plot(y)
```

- Task — plot v1:
```matlab
plot(v1)
```

- Use name-value arguments to set properties (e.g., line width):
```matlab
plot(y, LineWidth=5)
```

- Task — plot v1 with LineWidth 3:
```matlab
plot(v1, LineWidth=3)
```

- Name-value can follow line spec:
```matlab
plot(x, y, "ro-", LineWidth=5)
```

- Task — plot sample vs v1 with red circles, solid line, LineWidth 4:
```matlab
plot(sample, v1, "ro-", LineWidth=4)
```

- Try other plotting functions and set properties by name:
```matlab
histogram(density, FaceColor="y")
```

- Note: older MATLAB (<R2021a) uses commas and quoted names:
```matlab
plot(v1, "LineWidth", 3)
```

Further practice:
```matlab
plot(v1)
hold on
plot(v2)
hold off
plot(v1, "LineWidth", 3)
```

### Annotate Plots
- Add title:
```matlab
title("Plot Title")
```

- Task — add title "Sample Mass" (example full snippet):
```matlab
load datafile
sample = data(:,1);
density = data(:,2);
v1 = data(:,3);
v2 = data(:,4);
mass1 = density .* v1;
mass2 = density .* v2;
plot(sample, mass1, "ms")
hold on
plot(sample, mass2, "r*")
hold off
title("Sample Mass")
```

- Add axis labels:
```matlab
ylabel("Y-Axis Label")
```

- Task — add y-axis label "Mass (g)":
```matlab
ylabel("Mass (g)")
```

- Add a legend:
```matlab
legend("a", "b", "c")
```

- Task — legend with "Exp A" and "Exp B" in that order:
```matlab
legend("Exp A", "Exp B")
```

- Use variables in annotations (string concatenation):
```matlab
bar(data(3,:))
title("Sample " + sample(3) + " Data")
```

## Data Import
- Files panel: browse files. Select + Import Data or double-click to import.
- Double-click MAT -> variables load to workspace.
- Double-click image -> imported as numeric pixel array.
- Double-click spreadsheet -> Import Tool opens (many possible formats).
    - Preview shows import selection in blue.
    - Missing data highlighted orange; default replacement = NaN.
    - Default import = table (columns can have mixed types; rows align).
    - First row detected as headers → used as table variable names.
    - Import Tool infers each variable's data type.
    - Output variable name comes from file name.
- Click Import Selection to create the workspace variable.

### Import Data as a Table
- Extract table variable via dot notation:
```matlab
var = table.VariableName
```

Task — Assign elements.Density to a column vector d:
```matlab
load datafile
elements
d = elements.Density
```

- To append calculations to a table, assign a new variable:
```matlab
data.HeightMeters = data.HeightYards * 0.9144
```
- If data.HeightMeters doesn't exist, MATLAB creates it.

Task — Multiply elements.Density with elements.Volume1 (element-wise) and save as elements.Mass:
```matlab
mass = elements.Density .* elements.Volume1
mass
elements.Mass = mass
elements = sortrows(elements, "Mass")
```

- You can click a table in a live script output to interact (sort, etc.).
- To save edits back to code, click Update Code in the output pane.
- To sort by Mass via the UI: scroll right to Mass column → Sort Smallest to Largest → Update Code.

- Use dot notation to extract table variables; use array indexing to extract rows.
```matlab
top3 = elements(1:3,:)
```
- top3 is a table.
```matlab
elements(1:3,:)
```

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
<iframe src="https://matlabacademy.mathworks.com/progress/share/certificate.html?id=36379dd5-8709-408b-bf98-3b0ba78be71f" title="MATLAB Academy Certificate" style="width:100%;border:0;" loading="lazy"></iframe>

<p>If the certificate does not display, <a href="https://matlabacademy.mathworks.com/progress/share/certificate.html?id=36379dd5-8709-408b-bf98-3b0ba78be71f" target="_blank" rel="noopener">open the certificate in a new tab</a>.</p>

or just go to <a href="/assets/pdf/Matlab01.pdf"> for the certificate hosted here </a>
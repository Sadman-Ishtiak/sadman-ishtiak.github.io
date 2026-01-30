---
title: Matlab Onramp course notes - Part 2: Vectors, Matrices & Arrays
date: 2026-01-29 01:00:00 +0600
categories: [Matlab Academy, Matlab]
tags: [matlab, learning]
description: "Studying the self paced course in matlab academy for academic work - Part 2"
math: true
---
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


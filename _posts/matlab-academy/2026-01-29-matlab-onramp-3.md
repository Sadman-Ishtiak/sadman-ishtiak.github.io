---
title: Matlab Onramp course notes - Part 3: Plots & Data Import
date: 2026-01-29 02:00:00 +0600
categories: [Matlab Academy, Matlab]
tags: [matlab, learning]
description: "Studying the self paced course in matlab academy for academic work - Part 3"
math: true
---
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


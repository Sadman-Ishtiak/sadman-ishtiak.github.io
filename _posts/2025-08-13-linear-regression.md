---
title: Linear Regression
date: 2025-08-13 00:00:00 +0600
categories: [Data Science, Statistics]
tags: [statistics, linear-regression, math, data-science]     # TAG names should always be lowercase
description : "Learning the basics of linear regression"
math: true
---
# Learning the basics of linear regression
Linear regression is a statistical method used to model the relationship between a dependent variable and one or more independent variables by fitting a linear equation to observed data. In linear regression we use try to use least squares to fit a line through data. 

Let us assume there is a dataset with two values that are linearly related with each other ie, if the value of the data in the dataset is assumed to be `(x,y)` we can put them in a `y = mx + c` relation using linear regression.
## Single input Linear Regression
So, assuming there is a linear relation between an output variable and one or more input variables we can use this linear regression technique to get the constant values for the linear equation for the relation.

The formula for `Linear Regression` to get `(y = mx + c)`is,

$$m = \frac{\sum{(x - \bar{x})(y - \bar{y})}}{\sum{(x - \bar{x})^{2}}}$$
and
$$c = \bar{y} - m\bar{x}$$
Where the bar of something means the average value of that value. The `m` and the `c` can then be put in the standard straight line formula `y = mx + c` and then make a Linear Regression model.
## Multiple input Liner Regression
The general formula for multiple linear regression is:

$$y = \beta_0 + \beta_1x_1 + \beta_2x_2 + ... + \beta_nx_n + \epsilon$$

1. y is the dependent variable (the value you are trying to predict).
2. $x_1, x_2, x_3, ... x_n$ ​are the independent variables (the input features).
3. $\beta_0$ is the y-intercept, the value of y when all independent variables are zero.
4. $\beta_1, \beta_2, \beta_3, ..., \beta_n$ are the coefficients or weights for each independent variable, representing the change in y for a one-unit change in the corresponding x.
5. ϵ is the error term or residual, which accounts for the variability in y that cannot be explained by the independent variables.
6. Since there are n number of regressor variable or independent variables we will have n+1 parameters or coeffecients in the model.

The formula $y = \beta_0 + \beta_1x_1 + \beta_2x_2 + ... + \beta_nx_n + \epsilon$ can be written in the matrix form as, 
$$Y = X\beta + \epsilon$$
where assuming k is the number of observations, 

$$Y = \begin{bmatrix}
y_1 \\
y_2 \\
y_3 \\
\vdots \\
y_k
\end{bmatrix}$$

$$X = \begin{bmatrix}
1 & x_{11} & x_{12} & x_{13} & ... & x_{1n} \\
1 & x_{21} & x_{22} & x_{23} & ... & x_{2n} \\
1 & x_{31} & x_{32} & x_{33} & ... & x_{3n} \\
\vdots & \vdots & \vdots & \vdots & \ddots & \vdots \\
1 & x_{k1} & x_{k2} & x_{k3} & ... & x_{kn} \\
\end{bmatrix}$$

$$\beta = \begin{bmatrix}
\beta_1 \\ \beta_{2} \\ \beta_{3} \\ \vdots \\ \beta_{n}
\end{bmatrix}$$

$$\epsilon = \begin{bmatrix}
\epsilon_1 \\ \epsilon_{2} \\ \epsilon_{3} \\ \vdots \\ \epsilon_{k}
\end{bmatrix}$$

Generally we do not care about the error $\epsilon$ when we are trying to estimate using linear regression model as we always assume that there will be some error when trying to estimate. and the core idea of linear regression is to reduce the error. So we need the value of the coeffecient $\beta$ from the function. using matrix algebra the value of the coeffecient is,

$$\beta = (X^{T}X)^{-1}X^{T}Y$$

where $X^{T}$ means transpose of $X$ and $X^{-1}$ means inverse of matrix $X$. 

## Example for two information dataset
Let us take a good look at the [Heights and Weights Dataset](https://www.kaggle.com/datasets/burnoutminer/heights-and-weights-dataset/data) from kaggle for this example and get on the kaggle notebook. 

The first step of using regression on the dataset is to read the data and store it in a python variable
```py
import csv
data = []
with open("/kaggle/input/heights-and-weights-dataset/SOCR-HeightWeight.csv", "r", encoding='utf-8') as f:
    reader = csv.DictReader(f)
    for i in reader:
        data.append(i)
```
Doing so reads stores the data in the memory as a string. I have to convert it into floating point as height and weight. 
```py
for i in range(len(data)):
    for j in ["Height(Inches)", "Weight(Pounds)"]:
        try:
            data[i][j] = float(data[i][j])
        except:
            print(i, j, data[i][j])
```
The linear regression formula requires the average of the values
```py
heights = [i['Height(Inches)'] for i in data]
weights = [i['Weight(Pounds)'] for i in data]
number = len(data)
print(sum(heights), sum(weights), number)
avg_height = sum(heights) / number
avg_weight = sum(weights) / number
print(avg_height, avg_weight)
```
which gives the output 

![Value of the output](/assets/images/linear-regression-1.png)

then we need to calculate the value of `m` in `y = mx + c` using the formula

$$m = \frac{\sum{(x - \bar{x})(y - \bar{y})}}{\sum{(x - \bar{x})^{2}}}$$

and the value of `c` using the formula

$$c = \bar{y} - m\bar{x}$$

and by implementing them we get,
```py
numerator = 0
denominator = 0

for i in range(number):
    numerator   += ((heights[i] - avg_height) * (weights[i] - avg_weight))
    denominator += ((heights[i] - avg_height)**2)
m = numerator / denominator


c = avg_weight - m * avg_height
```

The last part of the work is to get some value and calculate errors to check how good the regression.
```py
square_error = 0
absolute_error = 0
c_weights = []
for i in range(number):
    actual_weight = weights[i]
    actual_height = heights[i]
    calculated_weight = m * actual_height + c
    c_weights.append(calculated_weight)
    square_error += ((actual_weight - calculated_weight) ** 2)
    absolute_error += abs(actual_weight - calculated_weight)

print("Mean Square Error :", square_error / number)
print("Root Mean Square Error :", (square_error / number)**.5)
print("Mean Absolute Error :", absolute_error / number)
```

This will give us the output 
```text
Mean Square Error : 101.58853248632813
Root Mean Square Error : 10.0791136756328
Mean Absolute Error : 8.037502348939391
```

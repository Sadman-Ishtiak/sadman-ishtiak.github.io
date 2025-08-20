---
title: Bash Scripting
date: 2025-08-20 00:00:00 +0600
categories: [Hacking, Tryhackme]
tags: [bashscripting, hacking, tryhackme, bash, linux]
description : "A Walkthrough room to teach you the basics of bash scripting"
math: true
---
This room is the walkthrough for learning bash scripting which is one of the default terminal language in linux. Bash terminal can also be used in windows and any other operating systems and can be helpful for many usages and automations. 

## Task 1 Introduction
This section gives some basic information about bash scripts. Bash scripts can be given in the terminal by one of two ways. They are, 

1. Using bash directly in the terminal
2. Writing a bash script file in `.sh` extension to automate the script

Considering bash is a turing complete language and so we can use this to do almost anything programmatic. One of the most useful resource for bash scripting is [https://devhints.io/bash](https://devhints.io/bash).

## Task 2 Our first simple bash scripts
### Prining text in terminal using bash
we use `echo` command to print something in bash terminal.
```bash
echo "Hello"
```
### Commenting code or document in bash
To comment we use the `#` before the tergeted comment.
```bash
# This is a comment
# Printing hello
echo "Hello"
```
### Make .sh script executable
To make shell script executable we need to make the change the mode executable by using `chmod`
```bash
# There is a file example.sh converting to executable
chmod +x example.sh
# running the program
./example.sh
```
### Who is the user
To find who is the current user in terminal we use `whoami` or `id` in the bash terminal
```bash
whoami
```

```bash
id
```

## Task 3 Variables
### Defining and using variables
Variables in bash termianls uses a `$` before the variable identifier or variable name. For example,
```bash
$h = "Hello world!"
echo $h
```
Would print `Hello world!` in the terminal.
### Debugging 
To debug we have to use `set -` or `set +` command. we can even use `bash -x` command. to run a bash script file in debug mode, 
```bash
# the file is example.sh
bash -x ./example.sh
```
to debug code in the file but not the entire code
```bash
name="Abul"
age=100
set -x
age=$((age + 50))
echo "$name is $age years old"
set +x
```

## Task 4 Parameters
Parameters are inputs given in the shell script command. This is usd in shell script to make variable input and outputs for the given parameter. The general usages of this is, 
```bash
bash ./hello.sh sadman
```
which if `hello.sh` contains the following
```bash
echo "Hello $1"
```
the numbers in the dollar signs are the parameters passed in the shell script call. the ./hello.sh itself is the `0th` parameter and the name is the parameter.
if we want to know the number of parameter we use `#` symbol
```bash
echo "$#"
```

## Task 5 Arrays
Arrays are the 0 indexed list of values in bash. In bash we define array like following,
```bash
cars=('honda' 'audi' 'bmw' 'tesla')
```
we use access each variable using `${var[]}`
```bash
# Print the entire array
echo "${cars[@]}"
# Print one variable
echo "${transport[1]}"
```
To delete a variable we `unset` it
```bash
unset cars[3]
```
## Task 6 Conditionals
there are three conditionals, 

1. Basic if statement
    ```bash
    num=15
    if [ $num -gt 10 ]; then
        echo "Number is greater than 10"
    fi
    ```
2. If...else statement
    ```bash
    num=8
    if [ $num -gt 10 ]; then
        echo "Number is greater than 10"
    else
        echo "Number is 10 or less"
    fi
    ```
3. If...elif...else statement
    ```bash
    num=10
    if [ $num -gt 10 ]; then
        echo "Number is greater than 10"
    elif [ $num -eq 10 ]; then
        echo "Number is exactly 10"
    else
        echo "Number is less than 10"
    fi
    ```
4. Nested if statement
    ```bash
    num=5
    if [ $num -gt 0 ]; then
        if [ $num -lt 10 ]; then
            echo "Number is between 1 and 9"
        fi
    fi
    ```
### Comparisons
The comparing symbols are generally not some symbols like other programming language in bash.
<table width='100%'>
    <tr>
        <th>bash symbol</th>
        <th>equivalant or description</th>
    </tr>
    <tr>
        <td>-eq</td>
        <td>==</td>
    </tr>
    <tr>
        <td>-ne</td>
        <td>!=</td>
    </tr>
    <tr>
        <td>-lt</td>
        <td><</td>
    </tr>
    <tr>
        <td>-gt</td>
        <td>></td>
    </tr>
    <tr>
        <td>-le</td>
        <td><=</td>
    </tr>
    <tr>
        <td>-ge</td>
        <td>>=</td>
    </tr>
    <tr>
        <td>-f</td>
        <td>File exists</td>
    </tr>
    <tr>
        <td>-w</td>
        <td>File have write access</td>
    </tr>
    <tr>
        <td>-r</td>
        <td>File have read access</td>
    </tr>
    <tr>
        <td>-d</td>
        <td>is a directory</td>
    </tr>
</table>
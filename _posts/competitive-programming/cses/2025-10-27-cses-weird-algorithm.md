--- 
title: "CSES: Weird Algorithm"
date: 2025-10-27 00:00:00 +0600
categories: [Competitive Programming, CSES]
tags: [cses, introductory-problems]
math: true
---

## Introductory Problems - Weird Algorithm

- **Time limit:** 1.00 s
- **Memory limit:** 512 MB

Consider an algorithm that takes as input a positive integer $n$. If $n$ is even, the algorithm divides it by two, and if $n$ is odd, the algorithm multiplies it by three and adds one. The algorithm repeats this, until $n$ is one. For example, the sequence for $n=3$ is as follows: 

$$3 
\rightarrow 10 
\rightarrow 5 
\rightarrow 16 
\rightarrow 8 
\rightarrow 4 
\rightarrow 2 
\rightarrow 1$$

Your task is to simulate the execution of the algorithm for a given value of $n$.
#### Input
The only input line contains an integer $n$.
#### Output
Print a line that contains all values of nnn during the algorithm.
#### Constraints
$$1 \le n \le 10^6$$
#### Example
##### Input:
```text
3
```
##### Output:
```text
3 10 5 16 8 4 2 1
```
#### Code 
```cpp
#include<iostream>
using namespace std;
int main() {
    long long int n;
    cin >> n;
    while(n>1) {
        cout << n << " ";
        if(n%2==0)
            n=n/2;
        else
            n=n*3+1;
    }
    cout << n ;
    return 0;
}
```

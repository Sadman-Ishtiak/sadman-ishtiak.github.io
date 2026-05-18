--- 
title: "CSES: Missing Number"
date: 2025-10-29 00:00:00 +0600
categories: [Competitive Programming, CSES]
tags: [cses, introductory-problems]
math: true
---

## Introductory Problems - Missing Number

- **Time limit:** 1.00s 
- **Memory limit:** 512 MB

You are given all numbers between $1,2,\ldots,n$ except one. Your task is to find the missing number.
#### Input
The first input line contains an integer n.

The second line contains n-1 numbers. Each number is distinct and between 1 and n (inclusive).

#### Output
Print the missing number.
#### Constraints
$$2 \le n \le 2 \cdot 10^5$$
#### Example
##### Input:
```text
5
2 3 1 5
```

#### Output:
```text
4
```
#### Code
To solve this there are a few school of thoughts and ways to solve this. One is the sum of first n numbers is $rac{n(n+1)}{2}$. So we can sum the given numbers and find the number missing with math.

$$missing = rac{n(n+1)}{2} - sum$$

```cpp
#include<iostream>
 
using namespace std;
int main() {
    long long int n,sum = 0,check;
    cin >> n;
    for(int i = 0; i < n - 1; i++) {
        cin >> check;
        sum = sum + check;
    }
    check = n*(n + 1) / 2;
    cout << check - sum;
    return 0;
}
```

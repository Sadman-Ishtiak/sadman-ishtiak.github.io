---
title: "LISP Programming and Symbolic Computation"
date: 2026-10-23 00:00:00 +0600
categories: [Artificial Intelligence, Academic Notes]
tags: [lisp, functional-programming, lab]
description: "LISP basics: CAR/CDR/CONS, conditionals, recursion, and programs."
excerpt: "LISP basics: CAR/CDR/CONS, conditionals, recursion, and programs."
math: true
---

{% raw %}
# Introduction to LISP

## LISP Overview

**LISP** (LISt Processing) is the second-oldest high-level programming language, created by John McCarthy in 1958. It was designed for symbolic computation and has been the primary language for artificial intelligence research for decades.

<div markdown="1" style="border-left:4px solid #1a5c9e;background:#f0f4f8;padding:14px 18px;margin:18px 0;border-radius:6px;">

LISP

**LISP** (LISt Processing) is a family of programming languages in which both code and data are represented as lists. The language treats programs as data structures that can be inspected, modified, and executed. Common Lisp is the most widely used dialect.

</div>

### Key Features of LISP

- **Symbolic computation:** LISP manipulates symbols and symbolic expressions, not just numeric values.

- **Homoiconicity:** LISP code and data share the same representation (lists), enabling macros and metaprogramming.

- **Automatic memory management:** LISP provides garbage collection, freeing the programmer from manual memory management.

- **First-class functions:** Functions can be passed as arguments, returned as values, and stored in data structures.

- **Interactive development:** The read—eval—print loop (REPL) allows incremental testing and debugging.

- **Recursion as a control structure:** LISP relies on recursion rather than iteration as the primary looping mechanism.

### LISP Syntax

LISP syntax is based on **S-expressions** (Symbolic Expressions). An S-expression is either:

- An **atom**: a number, symbol, or string (e.g., `42`, `hello`, `"AI"`)

- A **list**: a sequence of S-expressions enclosed in parentheses (e.g., `(+ 1 2)`, `(car ’(a b c))`)

*Figure: LISP S-expression hierarchy.*

<div markdown="1" style="border-left:4px solid #2e7d32;background:#e8f5e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

LISP Expressions

- **Atom:** `42` (number), `hello` (symbol), `"AI"` (string) — evaluate to themselves.

- **List as function call:** `(+ 1 2)` evaluates to `3`.

- **List as data (quoted):** `’(a b c)` evaluates to the list `(A B C)`.

- **Nested expression:** `(* (+ 2 3) (- 5 1))` evaluates to `20`.

</div>

## Basic List Manipulation Functions

A **list** in LISP is the fundamental data structure. Lists are built from **cons cells** — pairs with two parts: the `car` (first element) and the `cdr` (rest of the list). The empty list is denoted `nil` or `()`.

<div markdown="1" style="border-left:4px solid #1a5c9e;background:#f0f4f8;padding:14px 18px;margin:18px 0;border-radius:6px;">

CAR and CDR

`CAR` returns the first element of a list. `CDR` returns the list without its first element.

- `(car list)` — first element

- `(cdr list)` — the rest of the list (a list)

</div>

```lisp
(car '(a b c d))
(cdr '(a b c d))
```

<div markdown="1" style="border-left:4px solid #2e7d32;background:#e8f5e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

CAR and CDR

- `(car ’(a b c d))` $\rightarrow$ `A`

- `(cdr ’(a b c d))` $\rightarrow$ `(B C D)`

- `(car ’((a b) c d))` $\rightarrow$ `(A B)`

- `(cdr ’((a b) c d))` $\rightarrow$ `(C D)`

</div>

<div markdown="1" style="border-left:4px solid #1a5c9e;background:#f0f4f8;padding:14px 18px;margin:18px 0;border-radius:6px;">

CONS

`CONS` constructs a new cons cell. It takes two arguments: the first becomes the `car` and the second becomes the `cdr` of the new cell.

- `(cons x y)` — creates a pair `(x . y)`

- If `y` is a list, `cons` prepends `x` to `y`.

</div>

```lisp
(cons 'a '(b c d))
(cons 'a (cons 'b (cons 'c nil)))
```

<div markdown="1" style="border-left:4px solid #2e7d32;background:#e8f5e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

CONS

- `(cons ’a ’(b c d))` $\rightarrow$ `(A B C D)`

- `(cons ’a ’b)` $\rightarrow$ `(A . B)` (dotted pair)

- `(cons ’a nil)` $\rightarrow$ `(A)`

- `(cons 1 (cons 2 (cons 3 nil)))` $\rightarrow$ `(1 2 3)`

</div>

<div markdown="1" style="border-left:4px solid #1a5c9e;background:#f0f4f8;padding:14px 18px;margin:18px 0;border-radius:6px;">

LIST

`LIST` creates a list from its arguments. Unlike `cons` which builds pairs, `list` always produces a proper list.

- `(list arg1 arg2 ... argn)` — creates a new list of n elements

</div>

```lisp
(list 'a 'b 'c 'd)
(list 1 2 3)
(list 'a '(b c) 'd)
```

<div markdown="1" style="border-left:4px solid #2e7d32;background:#e8f5e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

LIST

- `(list ’a ’b ’c ’d)` $\rightarrow$ `(A B C D)`

- `(list 1 2 3)` $\rightarrow$ `(1 2 3)`

- `(list ’a ’(b c) ’d)` $\rightarrow$ `(A (B C) D)`

- `(list)` $\rightarrow$ `NIL`

</div>

<div markdown="1" style="border-left:4px solid #1a5c9e;background:#f0f4f8;padding:14px 18px;margin:18px 0;border-radius:6px;">

APPEND

`APPEND` concatenates two or more lists. It returns a new list containing the elements of all argument lists in order.

- `(append list1 list2 ... listn)` — concatenates lists

- Arguments except the last are copied; the last is shared.

</div>

```lisp
(append '(a b) '(c d))
(append '(1 2) '(3 4) '(5 6))
```

<div markdown="1" style="border-left:4px solid #2e7d32;background:#e8f5e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

APPEND

- `(append ’(a b) ’(c d))` $\rightarrow$ `(A B C D)`

- `(append ’(1 2) ’(3 4) ’(5 6))` $\rightarrow$ `(1 2 3 4 5 6)`

- `(append ’(a) ’(b) nil ’(c))` $\rightarrow$ `(A B C)`

</div>

## Additional List Manipulation Functions

LISP provides many built-in functions for common list operations. Table [tab:additional-list-functions] summarises the most frequently used ones.

| **Function** | **Format**           | **Purpose**                           |
|:-------------|:---------------------|:--------------------------------------|
| LENGTH       | `(length list)`      | Returns the number of elements        |
| REVERSE      | `(reverse list)`     | Returns a reversed copy of the list   |
| MEMBER       | `(member item list)` | Tests membership; returns tail or nil |
| NTH          | `(nth n list)`       | Returns the nth element (0-indexed)   |
| LAST         | `(last list)`        | Returns the last cons cell            |
| FIRST        | `(first list)`       | Synonym for car                       |
| REST         | `(rest list)`        | Synonym for cdr                       |
| BUTLAST      | `(butlast list)`     | Returns list without the last element |

Additional list manipulation functions in LISP.

<div markdown="1" style="border-left:4px solid #1a5c9e;background:#f0f4f8;padding:14px 18px;margin:18px 0;border-radius:6px;">

LENGTH

`LENGTH` returns the number of elements in a list.

- `(length list)` — integer count of top-level elements

</div>

```lisp
(length '(a b c d))
(length '())
```

<div markdown="1" style="border-left:4px solid #2e7d32;background:#e8f5e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

LENGTH

- `(length ’(a b c d))` $\rightarrow$ `4`

- `(length ’())` $\rightarrow$ `0`

- `(length ’((a b) c (d e)))` $\rightarrow$ `3`

</div>

<div markdown="1" style="border-left:4px solid #1a5c9e;background:#f0f4f8;padding:14px 18px;margin:18px 0;border-radius:6px;">

REVERSE

`REVERSE` returns a new list with elements in reverse order. The original list is not modified.

- `(reverse list)` — reversed copy of the list

</div>

```lisp
(reverse '(a b c d))
```

<div markdown="1" style="border-left:4px solid #2e7d32;background:#e8f5e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

REVERSE

- `(reverse ’(a b c d))` $\rightarrow$ `(D C B A)`

- `(reverse ’((a b) c d))` $\rightarrow$ `(D C (A B))`

</div>

<div markdown="1" style="border-left:4px solid #1a5c9e;background:#f0f4f8;padding:14px 18px;margin:18px 0;border-radius:6px;">

MEMBER

`MEMBER` tests whether an item appears in a list. If found, it returns the tail of the list starting from that item; otherwise it returns `nil`.

- `(member item list)` — tail starting at item, or nil

</div>

```lisp
(member 'b '(a b c d))
(member 'x '(a b c d))
```

<div markdown="1" style="border-left:4px solid #2e7d32;background:#e8f5e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

MEMBER

- `(member ’b ’(a b c d))` $\rightarrow$ `(B C D)`

- `(member ’x ’(a b c d))` $\rightarrow$ `NIL`

- `(member 3 ’(1 2 3 4))` $\rightarrow$ `(3 4)`

</div>

<div markdown="1" style="border-left:4px solid #1a5c9e;background:#f0f4f8;padding:14px 18px;margin:18px 0;border-radius:6px;">

NTH

`NTH` returns the nth element of a list using zero-based indexing. `(nth n list)` is equivalent to `(car (nthcdr n list))`.

- `(nth n list)` — element at position n

</div>

```lisp
(nth 0 '(a b c d))
(nth 2 '(a b c d))
```

<div markdown="1" style="border-left:4px solid #2e7d32;background:#e8f5e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

NTH

- `(nth 0 ’(a b c d))` $\rightarrow$ `A`

- `(nth 2 ’(a b c d))` $\rightarrow$ `C`

- `(nth 5 ’(a b c d))` $\rightarrow$ `NIL`

</div>

<div markdown="1" style="border-left:4px solid #1a5c9e;background:#f0f4f8;padding:14px 18px;margin:18px 0;border-radius:6px;">

LAST

`LAST` returns the last cons cell of a list. For a proper list, this is the last element wrapped in a list of length 1.

- `(last list)` — returns the last cons cell

</div>

```lisp
(last '(a b c d))
(last '(1 2 3))
```

<div markdown="1" style="border-left:4px solid #2e7d32;background:#e8f5e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

LAST

- `(last ’(a b c d))` $\rightarrow$ `(D)`

- `(last ’(1 2 3))` $\rightarrow$ `(3)`

- `(last ’(a))` $\rightarrow$ `(A)`

- `(last ’())` $\rightarrow$ `NIL`

</div>

<div markdown="1" style="border-left:4px solid #1a5c9e;background:#f0f4f8;padding:14px 18px;margin:18px 0;border-radius:6px;">

FIRST and REST

`FIRST` is a synonym for `CAR` — it returns the first element of a list. `REST` is a synonym for `CDR` — it returns the list without its first element.

- `(first list)` — first element (same as `car`)

- `(rest list)` — the rest of the list (same as `cdr`)

</div>

```lisp
(first '(a b c d))
(rest '(a b c d))
```

<div markdown="1" style="border-left:4px solid #2e7d32;background:#e8f5e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

FIRST and REST

- `(first ’(a b c d))` $\rightarrow$ `A`

- `(rest ’(a b c d))` $\rightarrow$ `(B C D)`

- `(first ’((1 2) 3 4))` $\rightarrow$ `(1 2)`

- `(rest ’((1 2) 3 4))` $\rightarrow$ `(3 4)`

</div>

<div markdown="1" style="border-left:4px solid #1a5c9e;background:#f0f4f8;padding:14px 18px;margin:18px 0;border-radius:6px;">

BUTLAST

`BUTLAST` returns a list with the last element removed. The original list is not modified.

- `(butlast list)` — list without the last element

</div>

```lisp
(cons 'a '(b c d))
(cons 'a (cons 'b (cons 'c nil)))
```0

<div markdown="1" style="border-left:4px solid #2e7d32;background:#e8f5e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

BUTLAST

- `(butlast ’(a b c d))` $\rightarrow$ `(A B C)`

- `(butlast ’(1 2 3))` $\rightarrow$ `(1 2)`

- `(butlast ’(a))` $\rightarrow$ `NIL`

- `(butlast ’())` $\rightarrow$ `NIL`

</div>

## Conditional Constructs

LISP provides **COND** and **IF** as the primary conditional constructs for decision-making in programs.

<div markdown="1" style="border-left:4px solid #1a5c9e;background:#f0f4f8;padding:14px 18px;margin:18px 0;border-radius:6px;">

COND

`COND` is the general conditional construct. It evaluates a sequence of test–action pairs. Each pair is a list where the first element is a test expression and the remaining elements are actions. For the first test that evaluates to true (non-nil), the corresponding actions are evaluated and the last value is returned.

- `(cond (test1 action1) (test2 action2) ... (t default))`

- The symbol `t` is used for the default/else case.

</div>

```lisp
(cons 'a '(b c d))
(cons 'a (cons 'b (cons 'c nil)))
```1

<div markdown="1" style="border-left:4px solid #2e7d32;background:#e8f5e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

COND

- If `x = 5`: `(cond ((> x 0) ’positive) ((< x 0) ’negative) (t ’zero))` $\rightarrow$ `POSITIVE`

- If `x = -3`: same expression $\rightarrow$ `NEGATIVE`

- If `x = 0`: same expression $\rightarrow$ `ZERO`

</div>

<div markdown="1" style="border-left:4px solid #1a5c9e;background:#f0f4f8;padding:14px 18px;margin:18px 0;border-radius:6px;">

IF

`IF` is a simpler conditional that takes a test, a then-form, and an optional else-form.

- `(if test then-form else-form)`

- If test evaluates to true (non-nil), then-form is evaluated; otherwise else-form is evaluated.

</div>

```lisp
(cons 'a '(b c d))
(cons 'a (cons 'b (cons 'c nil)))
```2

<div markdown="1" style="border-left:4px solid #2e7d32;background:#e8f5e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

IF

- `(if (> 10 5) ’yes ’no)` $\rightarrow$ `YES`

- `(if (> 3 5) ’yes ’no)` $\rightarrow$ `NO`

- `(if ’() ’true ’false)` $\rightarrow$ `FALSE` (empty list is false)

- `(if 42 ’true ’false)` $\rightarrow$ `TRUE` (any non-nil is true)

</div>

## Recursion in LISP

Recursion is the primary control mechanism in LISP. A recursive function calls itself with modified arguments until a base case is reached.

<div markdown="1" style="border-left:4px solid #1a5c9e;background:#f0f4f8;padding:14px 18px;margin:18px 0;border-radius:6px;">

Recursion

A **recursive function** is a function that calls itself. Every recursive function must have:

- A **base case** that stops the recursion

- A **recursive case** that reduces the problem toward the base case

In LISP, recursion naturally follows the structure of lists: operate on the `car`, then recurse on the `cdr`.

</div>

The factorial function is the classic example of recursion:

```lisp
(cons 'a '(b c d))
(cons 'a (cons 'b (cons 'c nil)))
```3

<figure>
<img src="/assets/images/ai-book/figures/book-003-p3.png" alt="Recursive flow for (factorial 5)." />
<figcaption>Recursive flow for <code>(factorial 5)</code>.</figcaption>
</figure>

<div markdown="1" style="border-left:4px solid #2e7d32;background:#e8f5e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Factorial Execution Trace

Evaluation of `(factorial 5)`:

1.  `(factorial 5)` $\rightarrow$ $5 \times$ `(factorial 4)`

2.  `(factorial 4)` $\rightarrow$ $4 \times$ `(factorial 3)`

3.  `(factorial 3)` $\rightarrow$ $3 \times$ `(factorial 2)`

4.  `(factorial 2)` $\rightarrow$ $2 \times$ `(factorial 1)`

5.  `(factorial 1)` $\rightarrow$ $1$ (base case reached)

6.  Unwinding: $2 \times 1 = 2$, $3 \times 2 = 6$, $4 \times 6 = 24$, $5 \times 24 = 120$

7.  Final result: `120`

</div>

## Practical Programs

This section presents complete LISP programs that solve common computational problems. Each program is defined as a function using `defun`.

### Area of a Circle

<div markdown="1" style="border-left:4px solid #1a5c9e;background:#f0f4f8;padding:14px 18px;margin:18px 0;border-radius:6px;">

Area of a Circle

The area $A$ of a circle with radius $r$ is given by $A = \pi r^2$.

- `(area-circle r)` — returns $\pi r^2$ using $\pi \approx 3.1416$

</div>

```lisp
(cons 'a '(b c d))
(cons 'a (cons 'b (cons 'c nil)))
```4

<div markdown="1" style="border-left:4px solid #2e7d32;background:#e8f5e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Area of a Circle

- `(area-circle 5)` $\rightarrow$ $3.1416 \times 5 \times 5 = 78.54$

- `(area-circle 7)` $\rightarrow$ $3.1416 \times 7 \times 7 = 153.9384$

</div>

### Area of a Triangle

<div markdown="1" style="border-left:4px solid #1a5c9e;background:#f0f4f8;padding:14px 18px;margin:18px 0;border-radius:6px;">

Area of a Triangle

The area $A$ of a triangle with base $b$ and height $h$ is $A = \frac{1}{2} b h$.

- `(area-triangle b h)` — returns $\frac{1}{2} \times b \times h$

</div>

```lisp
(cons 'a '(b c d))
(cons 'a (cons 'b (cons 'c nil)))
```5

<div markdown="1" style="border-left:4px solid #2e7d32;background:#e8f5e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Area of a Triangle

- `(area-triangle 10 5)` $\rightarrow$ $0.5 \times 10 \times 5 = 25.0$

- `(area-triangle 7 3)` $\rightarrow$ $0.5 \times 7 \times 3 = 10.5$

</div>

### Sum and Average of Numbers

<div markdown="1" style="border-left:4px solid #1a5c9e;background:#f0f4f8;padding:14px 18px;margin:18px 0;border-radius:6px;">

Sum and Average

Given a list of numbers, `sum-list` computes the total by recursively adding the first element to the sum of the rest. `average-list` divides the sum by the length of the list.

- `(sum-list lst)` — recursively computes the sum

- `(average-list lst)` — computes the arithmetic mean

</div>

```lisp
(cons 'a '(b c d))
(cons 'a (cons 'b (cons 'c nil)))
```6

<div markdown="1" style="border-left:4px solid #2e7d32;background:#e8f5e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Sum and Average

- `(sum-list ’(10 20 30 40))` $\rightarrow$ $10 + 20 + 30 + 40 = 100$

- `(average-list ’(10 20 30 40))` $\rightarrow$ $100 / 4 = 25.0$

- `(sum-list ’(5 15 25))` $\rightarrow$ $45$

- `(average-list ’(5 15 25))` $\rightarrow$ $15.0$

</div>

### Maximum and Minimum of Numbers

<div markdown="1" style="border-left:4px solid #1a5c9e;background:#f0f4f8;padding:14px 18px;margin:18px 0;border-radius:6px;">

Maximum and Minimum

Given a list of numbers, `max-list` finds the largest element and `min-list` finds the smallest. Both use recursion to compare elements.

- `(max-list lst)` — recursively finds the maximum

- `(min-list lst)` — recursively finds the minimum

</div>

```lisp
(cons 'a '(b c d))
(cons 'a (cons 'b (cons 'c nil)))
```7

<div markdown="1" style="border-left:4px solid #2e7d32;background:#e8f5e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Maximum and Minimum

- `(max-list ’(34 78 12 56 90))` $\rightarrow$ `90`

- `(min-list ’(34 78 12 56 90))` $\rightarrow$ `12`

- `(max-list ’(-5 0 3 -1 8))` $\rightarrow$ `8`

- `(min-list ’(-5 0 3 -1 8))` $\rightarrow$ `-5`

</div>

### Factorial Computation

<div markdown="1" style="border-left:4px solid #1a5c9e;background:#f0f4f8;padding:14px 18px;margin:18px 0;border-radius:6px;">

Factorial

The factorial of a non-negative integer $n$, denoted $n!$, is the product of all positive integers from 1 to $n$. By definition, $0! = 1$. $$n! = \prod_{k=1}^{n} k = n \times (n-1) \times (n-2) \times \cdots \times 1$$

- `(factorial n)` — computes $n!$ recursively

</div>

```lisp
(cons 'a '(b c d))
(cons 'a (cons 'b (cons 'c nil)))
```8

<div markdown="1" style="border-left:4px solid #2e7d32;background:#e8f5e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Factorial Computation

- `(factorial 0)` $\rightarrow$ `1`

- `(factorial 5)` $\rightarrow$ $5 \times 4 \times 3 \times 2 \times 1 = 120$

- `(factorial 7)` $\rightarrow$ $7! = 5040$

- `(factorial 10)` $\rightarrow$ $10! = 3628800$

</div>

### Array Declaration and Access

<div markdown="1" style="border-left:4px solid #1a5c9e;background:#f0f4f8;padding:14px 18px;margin:18px 0;border-radius:6px;">

Array Declaration and Access

LISP provides the `make-array` function to create arrays. Elements are accessed and modified using `aref` and `setf`.

- `(make-array ’(size))` — creates a one-dimensional array

- `(aref array index)` — retrieves element at index

- `(setf (aref array index) value)` — assigns value to element

</div>

```lisp
(cons 'a '(b c d))
(cons 'a (cons 'b (cons 'c nil)))
```9

<div markdown="1" style="border-left:4px solid #2e7d32;background:#e8f5e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Array Declaration and Access

- `(aref arr 0)` $\rightarrow$ `10`

- `(aref arr 2)` $\rightarrow$ `30`

- `(aref arr 4)` $\rightarrow$ `50`

- `(setf (aref arr 0) 100)` then `(aref arr 0)` $\rightarrow$ `100`

</div>

### PutProp Function (Property Lists)

<div markdown="1" style="border-left:4px solid #1a5c9e;background:#f0f4f8;padding:14px 18px;margin:18px 0;border-radius:6px;">

PutProp and Property Lists

**Property lists** (plists) allow associating key–value pairs with symbols. In Common Lisp, `get` retrieves a property value and `setf` with `get` assigns one. `PutProp` is the traditional name for assigning properties.

- `(putprop symbol value property)` — assigns a property (traditional)

- `(setf (get ’symbol ’property) value)` — Common Lisp equivalent

- `(get ’symbol ’property)` — retrieves the property value

</div>

```lisp
(list 'a 'b 'c 'd)
(list 1 2 3)
(list 'a '(b c) 'd)
```0

<div markdown="1" style="border-left:4px solid #2e7d32;background:#e8f5e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

PutProp Function

- After `(setf (get ’person ’name) ’Alice)`: `(get ’person ’name)` $\rightarrow$ `ALICE`

- After `(putprop ’book ’ai-intro ’title)`: `(get ’book ’title)` $\rightarrow$ `AI-INTRO`

- Properties can be removed with `(remprop symbol property)`.

</div>

{% endraw %}

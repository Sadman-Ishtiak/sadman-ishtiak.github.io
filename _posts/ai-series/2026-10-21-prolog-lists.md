---
title: "Prolog Programming: Lists and Operations"
date: 2026-10-21 00:00:00 +0600
categories: [Artificial Intelligence, Academic Notes]
tags: [prolog, lists, lab]
description: "List representation and the classic list/set operations."
excerpt: "List representation and the classic list/set operations."
math: true
---

{% raw %}
# Prolog Lists

## List Representation

A list in Prolog is a sequence of elements enclosed in square brackets. The empty list is written as `[]`. Internally, a list is represented as a binary tree where the head is the first element and the tail is the rest of the list.

<div markdown="1" style="border-left:4px solid #1a5c9e;background:#f0f4f8;padding:14px 18px;margin:18px 0;border-radius:6px;">

Head and Tail

Every non-empty list can be decomposed into its **HEAD** (the first element) and its **TAIL** (the remaining list). The notation `[H|T]` unifies `H` with the head and `T` with the tail. The empty list `[]` has no head or tail.

</div>

```prolog
% Examples of list decomposition
?- [H|T] = [a, b, c].
H = a
T = [b, c]

?- [H|T] = [x].
H = x
T = []
```

Lists can contain any type of term, including other lists (nested lists):

```prolog
?- [H|T] = [[1, 2], 3, 4].
H = [1, 2]
T = [3, 4]
```

<div markdown="1" style="border-left:4px solid #2e7d32;background:#e8f5e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

List Decomposition

The pattern `[X|Xs]` is the standard way to process lists recursively:

```prolog
% Print each element of a list
print_all([]).
print_all([H|T]) :- write(H), nl, print_all(T).
```

Query: `print_all([apple, banana, cherry]).` prints each fruit on a separate line.

</div>

## Basic List Operations

### Membership

<div markdown="1" style="border-left:4px solid #1a5c9e;background:#f0f4f8;padding:14px 18px;margin:18px 0;border-radius:6px;">

List Membership

`list_member(X, L)` succeeds if `X` is an element of list `L`. The predicate has two clauses: (1) `X` is the head of the list, or (2) `X` is a member of the tail.

</div>

```prolog
list_member(X, [X|_]).
list_member(X, [_|TAIL]) :- list_member(X, TAIL).
```

<div markdown="1" style="border-left:4px solid #2e7d32;background:#e8f5e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Membership Queries

```prolog
?- list_member(b, [a, b, c]).
true

?- list_member(x, [a, b, c]).
false

?- list_member(X, [1, 2, 3]).
X = 1 ;
X = 2 ;
X = 3
```

The third query demonstrates backtracking: Prolog finds all elements one by one.

</div>

### Length Calculation

<div markdown="1" style="border-left:4px solid #1a5c9e;background:#f0f4f8;padding:14px 18px;margin:18px 0;border-radius:6px;">

List Length

`list_length(L, N)` computes the length `N` of list `L`. The base case states that the empty list has length 0. The recursive case counts one for the head and adds the length of the tail.

</div>

```prolog
list_length([], 0).
list_length([_|TAIL], N) :-
    list_length(TAIL, N1),
    N is N1 + 1.
```

<div markdown="1" style="border-left:4px solid #2e7d32;background:#e8f5e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Length in Action

```prolog
?- list_length([a, b, c], N).
N = 3

?- list_length([], N).
N = 0
```

</div>

### Concatenation

<div markdown="1" style="border-left:4px solid #1a5c9e;background:#f0f4f8;padding:14px 18px;margin:18px 0;border-radius:6px;">

List Concatenation

`list_concat(L1, L2, L3)` succeeds if `L3` is the concatenation of `L1` followed by `L2`. The base case concatenates an empty list with `L` to produce `L`. The recursive case builds the result element by element.

</div>

```prolog
list_concat([], L, L).
list_concat([X1|L1], L2, [X1|L3]) :-
    list_concat(L1, L2, L3).
```

<div markdown="1" style="border-left:4px solid #2e7d32;background:#e8f5e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Concatenation Examples

```prolog
?- list_concat([a, b], [c, d], R).
R = [a, b, c, d]

?- list_concat([1, 2], [3], X).
X = [1, 2, 3]
```

The predicate can also be used to split a list by leaving the third argument unbound.

</div>

### Deletion

<div markdown="1" style="border-left:4px solid #1a5c9e;background:#f0f4f8;padding:14px 18px;margin:18px 0;border-radius:6px;">

Deletion from a List

`list_delete(X, L, R)` removes the first occurrence of `X` from `L`, producing `R`. Three cases: (1) deleting `X` from a singleton list `[X]` gives `[]`, (2) deleting `X` from `[X|L1]` gives `L1`, (3) deleting `X` from `[Y|L2]` preserves `Y` as the head and recurses on the tail.

</div>

```prolog
list_delete(X, [X], []).
list_delete(X, [X|L1], L1).
list_delete(X, [Y|L2], [Y|L1]) :-
    list_delete(X, L2, L1).
```

<div markdown="1" style="border-left:4px solid #2e7d32;background:#e8f5e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Deletion Examples

```prolog
?- [H|T] = [[1, 2], 3, 4].
H = [1, 2]
T = [3, 4]
```0

Only the first occurrence is removed.

</div>

### Insertion

<div markdown="1" style="border-left:4px solid #1a5c9e;background:#f0f4f8;padding:14px 18px;margin:18px 0;border-radius:6px;">

Insertion into a List

`list_insert(X, L, R)` inserts `X` into `L` at any position, producing `R`. Insertion is the inverse of deletion: `list_delete(X, R, L)`.

</div>

```prolog
?- [H|T] = [[1, 2], 3, 4].
H = [1, 2]
T = [3, 4]
```1

<div markdown="1" style="border-left:4px solid #2e7d32;background:#e8f5e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Insertion Examples

```prolog
?- [H|T] = [[1, 2], 3, 4].
H = [1, 2]
T = [3, 4]
```2

By backtracking, Prolog finds all possible positions for the insertion.

</div>

## Set Operations on Lists

Treating lists as sets (ignoring order and duplicates), Prolog can compute union and intersection.

### Set Union

<div markdown="1" style="border-left:4px solid #1a5c9e;background:#f0f4f8;padding:14px 18px;margin:18px 0;border-radius:6px;">

Set Union

`union(S1, S2, S)` computes the set union of `S1` and `S2`. Elements of `S1` that already appear in `S2` are not added again (using `member/2` to check).

</div>

```prolog
?- [H|T] = [[1, 2], 3, 4].
H = [1, 2]
T = [3, 4]
```3

<div markdown="1" style="border-left:4px solid #2e7d32;background:#e8f5e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Union Example

```prolog
?- [H|T] = [[1, 2], 3, 4].
H = [1, 2]
T = [3, 4]
```4

The element `a` appears only in the first set; `b` and `c` are common and not duplicated; `d` appears only in the second set.

</div>

### Set Intersection

<div markdown="1" style="border-left:4px solid #1a5c9e;background:#f0f4f8;padding:14px 18px;margin:18px 0;border-radius:6px;">

Set Intersection

`intersect(S1, S2, S)` computes the set intersection of `S1` and `S2`. An element is included in the result only if it appears in both sets.

</div>

```prolog
?- [H|T] = [[1, 2], 3, 4].
H = [1, 2]
T = [3, 4]
```5

<div markdown="1" style="border-left:4px solid #2e7d32;background:#e8f5e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Intersection Example

```prolog
?- [H|T] = [[1, 2], 3, 4].
H = [1, 2]
T = [3, 4]
```6

Only `b` and `d` are common to both sets.

</div>

## Bubble Sort

<div markdown="1" style="border-left:4px solid #1a5c9e;background:#f0f4f8;padding:14px 18px;margin:18px 0;border-radius:6px;">

Bubble Sort

`bubblesort(Input, Sorted)` sorts a list using the bubble sort algorithm. It repeatedly swaps adjacent elements that are out of order. Each pass places the largest remaining element at the end. The predicate `swap/2` performs one pass, and the sort repeats until no swaps are needed.

</div>

```prolog
?- [H|T] = [[1, 2], 3, 4].
H = [1, 2]
T = [3, 4]
```7

<div markdown="1" style="border-left:4px solid #2e7d32;background:#e8f5e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Bubble Sort in Action

```prolog
?- [H|T] = [[1, 2], 3, 4].
H = [1, 2]
T = [3, 4]
```8

The cut (`!`) in `bubblesort/2` prevents backtracking once a swap pass is made, ensuring the recursion proceeds deterministically.

</div>

{% endraw %}

---
title: "Prolog Programming: Lists and Advanced Operations"
date: 2026-10-21 00:00:00 +0600
categories: [Artificial Intelligence, Academic Notes]
tags: [prolog, lists, ai-lab]
description: "Comprehensive academic notes on Prolog Programming: Lists and Advanced Operations from the Artificial Intelligence series."
math: true
---

# Prolog Lists


% ==================== Section 16.1 ====================

## List Representation


A list in Prolog is a sequence of elements enclosed in square brackets. The empty list is written as \texttt{[]}. Internally, a list is represented as a binary tree where the head is the first element and the tail is the rest of the list.



<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 Head and Tail</strong>


Every non-empty list can be decomposed into its **HEAD** (the first element) and its **TAIL** (the remaining list). The notation \texttt{[H|T]} unifies \texttt{H} with the head and \texttt{T} with the tail. The empty list \texttt{[]} has no head or tail.

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




<div style="border-left: 4px solid #2e7d32; background-color: #e8f5e9; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>💡 List Decomposition</strong>


The pattern \texttt{[X|Xs]} is the standard way to process lists recursively:

```prolog
% Print each element of a list
print_all([]).
print_all([H|T]) :- write(H), nl, print_all(T).
```

Query: \texttt{print\_all([apple, banana, cherry]).} prints each fruit on a separate line.

</div>



% ==================== Section 16.2 ====================

## Basic List Operations


### Membership




<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 List Membership</strong>


\texttt{list\_member(X, L)} succeeds if \texttt{X} is an element of list \texttt{L}. The predicate has two clauses: (1) \texttt{X} is the head of the list, or (2) \texttt{X} is a member of the tail.

</div>




```prolog
list_member(X, [X|_]).
list_member(X, [_|TAIL]) :- list_member(X, TAIL).
```




<div style="border-left: 4px solid #2e7d32; background-color: #e8f5e9; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>💡 Membership Queries</strong>



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




<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 List Length</strong>


\texttt{list\_length(L, N)} computes the length \texttt{N} of list \texttt{L}. The base case states that the empty list has length 0. The recursive case counts one for the head and adds the length of the tail.

</div>




```prolog
list_length([], 0).
list_length([_|TAIL], N) :-
    list_length(TAIL, N1),
    N is N1 + 1.
```




<div style="border-left: 4px solid #2e7d32; background-color: #e8f5e9; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>💡 Length in Action</strong>



```prolog
?- list_length([a, b, c], N).
N = 3

?- list_length([], N).
N = 0
```


</div>



### Concatenation




<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 List Concatenation</strong>


\texttt{list\_concat(L1, L2, L3)} succeeds if \texttt{L3} is the concatenation of \texttt{L1} followed by \texttt{L2}. The base case concatenates an empty list with \texttt{L} to produce \texttt{L}. The recursive case builds the result element by element.

</div>




```prolog
list_concat([], L, L).
list_concat([X1|L1], L2, [X1|L3]) :-
    list_concat(L1, L2, L3).
```




<div style="border-left: 4px solid #2e7d32; background-color: #e8f5e9; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>💡 Concatenation Examples</strong>



```prolog
?- list_concat([a, b], [c, d], R).
R = [a, b, c, d]

?- list_concat([1, 2], [3], X).
X = [1, 2, 3]
```

The predicate can also be used to split a list by leaving the third argument unbound.

</div>



### Deletion




<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 Deletion from a List</strong>


\texttt{list\_delete(X, L, R)} removes the first occurrence of \texttt{X} from \texttt{L}, producing \texttt{R}. Three cases: (1) deleting \texttt{X} from a singleton list \texttt{[X]} gives \texttt{[]}, (2) deleting \texttt{X} from \texttt{[X|L1]} gives \texttt{L1}, (3) deleting \texttt{X} from \texttt{[Y|L2]} preserves \texttt{Y} as the head and recurses on the tail.

</div>




```prolog
list_delete(X, [X], []).
list_delete(X, [X|L1], L1).
list_delete(X, [Y|L2], [Y|L1]) :-
    list_delete(X, L2, L1).
```




<div style="border-left: 4px solid #2e7d32; background-color: #e8f5e9; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>💡 Deletion Examples</strong>



```prolog
?- list_delete(a, [a, b, a, c], R).
R = [b, a, c]

?- list_delete(x, [a, b], R).
false
```

Only the first occurrence is removed.

</div>



### Insertion




<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 Insertion into a List</strong>


\texttt{list\_insert(X, L, R)} inserts \texttt{X} into \texttt{L} at any position, producing \texttt{R}. Insertion is the inverse of deletion: \texttt{list\_delete(X, R, L)}.

</div>




```prolog
list_insert(X, L, R) :- list_delete(X, R, L).
```




<div style="border-left: 4px solid #2e7d32; background-color: #e8f5e9; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>💡 Insertion Examples</strong>



```prolog
?- list_insert(x, [a, b], R).
R = [x, a, b] ;
R = [a, x, b] ;
R = [a, b, x]
```

By backtracking, Prolog finds all possible positions for the insertion.

</div>



% ==================== Section 16.3 ====================

## Set Operations on Lists


Treating lists as sets (ignoring order and duplicates), Prolog can compute union and intersection.

### Set Union




<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 Set Union</strong>


\texttt{union(S1, S2, S)} computes the set union of \texttt{S1} and \texttt{S2}. Elements of \texttt{S1} that already appear in \texttt{S2} are not added again (using \texttt{member/2} to check).

</div>




```prolog
union([], S, S).
union(S, [], S).
union([E|T], S2, S) :-
    member(E, S2), union(T, S2, S).
union([E|T], S2, [E|S]) :-
    union(T, S2, S).
```




<div style="border-left: 4px solid #2e7d32; background-color: #e8f5e9; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>💡 Union Example</strong>



```prolog
?- union([a, b, c], [b, c, d], U).
U = [a, b, c, d]
```

The element \texttt{a} appears only in the first set; \texttt{b} and \texttt{c} are common and not duplicated; \texttt{d} appears only in the second set.

</div>



### Set Intersection




<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 Set Intersection</strong>


\texttt{intersect(S1, S2, S)} computes the set intersection of \texttt{S1} and \texttt{S2}. An element is included in the result only if it appears in both sets.

</div>




```prolog
intersect([], _, []).
intersect([E|T], S2, [E|S]) :-
    member(E, S2), intersect(T, S2, S).
intersect([E|T], S2, S) :-
    intersect(T, S2, S).
```




<div style="border-left: 4px solid #2e7d32; background-color: #e8f5e9; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>💡 Intersection Example</strong>



```prolog
?- intersect([a, b, c, d], [b, d, e], I).
I = [b, d]
```

Only \texttt{b} and \texttt{d} are common to both sets.

</div>



% ==================== Section 16.4 ====================

## Bubble Sort




<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 Bubble Sort</strong>


\texttt{bubblesort(Input, Sorted)} sorts a list using the bubble sort algorithm. It repeatedly swaps adjacent elements that are out of order. Each pass places the largest remaining element at the end. The predicate \texttt{swap/2} performs one pass, and the sort repeats until no swaps are needed.

</div>




```prolog
bubblesort(Input, Sorted) :-
    swap(Input, List), !,
    bubblesort(List, Sorted).
bubblesort(Sorted, Sorted).

swap([X, Y|List], [Y, X|List]) :- X > Y.
swap([Z|List], [Z|List1]) :-
    swap(List, List1).

printlist([]) :- nl.
printlist([H|T]) :-
    write(H), write(' '),
    printlist(T).
```




<div style="border-left: 4px solid #2e7d32; background-color: #e8f5e9; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>💡 Bubble Sort in Action</strong>



```prolog
?- bubblesort([3, 1, 4, 1, 5, 9], S).
S = [1, 1, 3, 4, 5, 9]
```

The cut (\texttt{!}) in \texttt{bubblesort/2} prevents backtracking once a swap pass is made, ensuring the recursion proceeds deterministically.

</div>



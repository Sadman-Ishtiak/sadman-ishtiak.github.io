---
title: "Advanced Prolog: Graphs, Automata and Files"
date: 2026-10-22 00:00:00 +0600
categories: [Artificial Intelligence, Academic Notes]
tags: [prolog, graphs, ai-lab]
description: "Comprehensive academic notes on Advanced Prolog: Graphs, Automata and Files from the Artificial Intelligence series."
math: true
---

# Advanced Prolog


% ==================== Section 17.1 ====================

## Looping and Recursion


Prolog does not have traditional looping constructs (for, while). Instead, iteration is achieved through **RECURSION** -- a predicate calls itself with a modified argument until a base case is reached.



<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 Recursive Loop</strong>


A recursive loop in Prolog is defined by: (1) a **BASE CASE** that stops the recursion, and (2) a **RECURSIVE CASE** that performs work and calls itself with a decreasing counter. The \texttt{is/2} operator evaluates arithmetic expressions.

</div>




```prolog
testloop(0) :- !.
testloop(N) :-
    N > 0,
    write('Number : '), write(N), nl,
    M is N - 1,
    testloop(M).
```




<div style="border-left: 4px solid #2e7d32; background-color: #e8f5e9; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>💡 Counting Down</strong>



```prolog
?- testloop(5).
Number : 5
Number : 4
Number : 3
Number : 2
Number : 1
true
```

The cut in the base case ensures that once \texttt{N = 0} is reached, Prolog does not attempt to backtrack into the recursive clause.

</div>



% ==================== Section 17.2 ====================

## Menu-Driven Programs




<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 Menu-Driven Program</strong>


A **MENU-DRIVEN PROGRAM** presents a list of options, reads the user's choice, performs the corresponding computation, and repeats. In Prolog, this is implemented as a recursive predicate that keeps control within the menu until the user chooses to exit.

</div>




```prolog
menu :-
    write('---- Area Calculation ----'), nl,
    write('1. Calculate area of circle'), nl,
    write('2. Calculate area of square'), nl,
    write('3. Calculate area of sphere'), nl,
    read(Choice),
    (
        Choice = 1,
        write('Enter radius: '), read(R),
        Result is 3.14 * R * R,
        write('Area of circle = '), write(Result), nl, menu ;
        Choice = 2,
        write('Enter side: '), read(A),
        Result is A * A,
        write('Area of square = '), write(Result), nl, menu ;
        Choice = 3,
        write('Enter radius: '), read(R),
        Result is 4 * 3.14 * R * R,
        write('Area of sphere = '), write(Result), nl, menu
    ).
```




<div style="border-left: 4px solid #2e7d32; background-color: #e8f5e9; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>💡 Running the Menu</strong>



```prolog
?- menu.
---- Area Calculation ----
1. Calculate area of circle
2. Calculate area of square
3. Calculate area of sphere
|: 1.
Enter radius: 5.
Area of circle = 78.5
...
```

The menu loops indefinitely (no exit option in this version). Each choice recalculates and re-displays the menu via the recursive call at the end of each branch.

</div>



% ==================== Section 17.3 ====================

## Tree Traversal




<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 Tree Traversal</strong>


In Prolog, a tree can be represented as a set of \texttt{edge/2} facts. A traversal from node \texttt{A} to node \texttt{B} succeeds if there is a path following edges from \texttt{A} downward to \texttt{B}. This is a depth-first search on the tree structure.

</div>




```prolog
% Tree definition
edge(a, b).  edge(a, c).
edge(b, d).  edge(b, e).
edge(c, f).
edge(f, g).

% Route: reach B through an intermediate node
route(A, B) :- edge(A, C), route(C, B).
% Route: direct edge
route(A, B) :- edge(A, B).
```


[htbp]



![](/assets/images/ai-book/figures/book-009-p6.png)



*Caption: Tree represented by \texttt{edge/2*
 predicates}

\end{figure}



<div style="border-left: 4px solid #2e7d32; background-color: #e8f5e9; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>💡 Tree Traversal Example</strong>



```prolog
?- route(a, g).
true

?- route(a, X).
X = b ;
X = c ;
X = d ;
X = e ;
X = f ;
X = g
```

The query \texttt{route(a, g)} succeeds because there is a path \texttt{a $\rightarrow$ c $\rightarrow$ f $\rightarrow$ g}. Backtracking enumerates all reachable nodes.

</div>



% ==================== Section 17.4 ====================

## Graph Problems


### Cyclic Graph Path Finding


Trees do not contain cycles, but general graphs do. When traversing a graph, Prolog can enter infinite loops by following a cycle repeatedly. To avoid this, we maintain a **VISITED LIST** of nodes already seen.



<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 Visited List</strong>


A **VISITED LIST** tracks nodes that have already been visited during a search. Before following an edge, we check that the target node is not already in the visited list. This prevents infinite loops in cyclic graphs.

</div>




```prolog
% Cyclic graph definition
edge(a, b).  edge(a, c).
edge(b, d).  edge(d, e).
edge(e, b).  % creates a cycle

path(A, B) :- nextRoute(A, B, []), write(B).

nextRoute(A, B, Visited) :-
    edge(A, X),
    not(member(X, Visited)),
    (
        B = X ;
        nextRoute(X, B, [A|Visited])
    ).
```




<div style="border-left: 4px solid #2e7d32; background-color: #e8f5e9; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>💡 Cycle Avoidance</strong>



```prolog
?- path(a, d).
a -> b -> d
true

?- path(a, e).
a -> b -> d -> e
true
```

Without the visited list, the path \texttt{a $\rightarrow$ b $\rightarrow$ d $\rightarrow$ e $\rightarrow$ b $\rightarrow$ d $\rightarrow$ ...} would loop forever. The visited list ensures each node is visited at most once per path.

</div>



### Tree vs.\ Graph Traversal




<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 Tree vs Graph Traversal</strong>


**TREE TRAVERSAL** does not require a visited list because trees are acyclic --- there is exactly one path between any two nodes. **GRAPH TRAVERSAL** on cyclic graphs requires a visited list to prevent infinite loops. Both use the same recursive depth-first pattern, but the graph version adds cycle detection.

</div>




```prolog
% Tree traversal (no visited list needed)
route(A, B) :- edge(A, B).
route(A, B) :- edge(A, C), route(C, B).

% Graph traversal (visited list required)
path(A, B) :- traverse(A, B, []).

traverse(A, B, Visited) :-
    edge(A, X),
    not(member(X, Visited)),
    (B = X ; traverse(X, B, [A|Visited])).
```


[htbp]

\begin{tabular}{lp{6cm}p{6cm}}
\toprule
Aspect & Tree traversal & Graph traversal \\
\midrule
Data structure & Acyclic (tree) & May contain cycles \\
Visited list & Not required & Required to prevent infinite loops \\
Termination & Always terminates & Guaranteed only with visited list \\
Complexity & O(n) & O(n + e) with visited list \\
Redundancy & No redundant paths & Multiple paths to same node possible \\
\bottomrule
\end{tabular}


*Caption: Tree traversal vs.\ graph traversal comparison*



\end{table}



<div style="border-left: 4px solid #2e7d32; background-color: #e8f5e9; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>💡 When to Use Each</strong>


Use **tree traversal** when the data structure is guaranteed acyclic (e.g., family trees, parse trees). Use **graph traversal with a visited list** when cycles are possible (e.g., road networks, dependency graphs). The visited list adds O(n) space but guarantees termination.

</div>



% ==================== Section 17.5 ====================

## Finite Automata in Prolog


### DFA Simulation




<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 Deterministic Finite Automaton (DFA)</strong>


A **DETERMINISTIC FINITE AUTOMATON (DFA)** is a finite state machine with a unique transition for each state--symbol pair. In Prolog, it is represented with three kinds of facts: \texttt{start/1} (initial state), \texttt{delta/3} (transition function), and \texttt{final/1} (accepting states).

</div>



[htbp]



![](/assets/images/ai-book/figures/book-003-p3.png)



*Caption: DFA that accepts strings ending with \texttt{b*
}

\end{figure}


```prolog
% DFA that accepts strings ending with 'b'
start(0).
delta(0, a, 0).
delta(0, b, 1).
delta(1, a, 0).
delta(1, b, 1).
final(1).

parse(L) :- start(S), trans(S, L).

trans(S, []) :- final(S), write(S), write(' '), write([]), nl.
trans(S, [A|B]) :-
    delta(S, A, S1),
    write(S), write(' '), write([A|B]), nl,
    trans(S1, B).
```




<div style="border-left: 4px solid #2e7d32; background-color: #e8f5e9; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>💡 DFA Simulation</strong>



```prolog
?- parse([a, b, b]).
0 [a, b, b]
0 [b, b]
1 [b]
1 []
true
```

The DFA starts in state 0 and processes each symbol. After reading \texttt{a b b}, it ends in the final state 1.

</div>



### NFA Simulation




<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 Nondeterministic Finite Automaton (NFA)</strong>


A **NONDETERMINISTIC FINITE AUTOMATON (NFA)** allows multiple possible transitions for the same state--symbol pair. In Prolog, this is modeled by multiple \texttt{t/3} (transition) facts with the same state and symbol but different target states. Prolog's built-in backtracking explores all possible paths.

</div>



[htbp]

\begin{tikzpicture}[->,>=stealth,node distance=3cm,auto,initial text={}]
\node[state,initial] (0) {$0$};
\node[state,right of=0] (1) {$1$};
\node[state,accepting,right of=1] (2) {$2$};
\path (0) edge[loop above] node{a} (0)
          edge[bend left] node{a} (1)
      (1) edge[loop above] node{a,b} (1)
          edge[bend left] node{b} (2);
\end{tikzpicture}

*Caption: NFA that accepts $a(a+b)^*b$*


\end{figure}


```prolog
% NFA that accepts a(a+b)*b
t(0, a, 0).  t(0, a, 1).
t(1, a, 1).  t(1, b, 1).
t(1, b, 2).

start(0).
favorable(2).

check_word(S, []) :- favorable(S), write(S).
check_word(S, [H|T]) :-
    t(S, H, Q),
    check_word(Q, T),
    write(H), write(S).

run :-
    write('NFA: a(a+b)*b'), nl,
    write('Input a word as a list (e.g., [a,b,b]): '),
    read(W),
    write('Path (reversed): '),
    start(S), check_word(S, W).
```




<div style="border-left: 4px solid #2e7d32; background-color: #e8f5e9; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>💡 NFA Simulation</strong>



```prolog
?- run.
NFA: a(a+b)*b
Input a word as a list (e.g., [a,b,b]): [a, b, b].
Path (reversed): 2b1b1a0
true
```

The NFA explores multiple transition paths. Prolog's backtracking finds the path that leads to a favorable state.

</div>



% ==================== Section 17.6 ====================

## File Handling


### Writing to Files




<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 Writing to a File</strong>


\texttt{tell(Filename)} redirects all subsequent output to the named file. \texttt{told} closes the file and restores output to the console. Between \texttt{tell} and \texttt{told}, any \texttt{write/1} or \texttt{nl/0} output goes to the file instead of the screen.

</div>




```prolog
write_to_file :-
    tell('mfile.txt'),
    write('Start'),
    told.
```




<div style="border-left: 4px solid #2e7d32; background-color: #e8f5e9; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>💡 File Writing</strong>


After running \texttt{write\_to\_file.}, the file \texttt{mfile.txt} contains the text \texttt{Start}. If the file does not exist, Prolog creates it. If it exists, its previous contents are overwritten.

</div>



### Reading from Files




<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 Reading from a File</strong>


\texttt{see(Filename)} redirects input from the named file. \texttt{seen} closes the file and restores input to the keyboard. \texttt{read/1} reads the next Prolog term from the current input stream.

</div>




```prolog
read_from_file(Infile, Outfile) :-
    see(Infile),
    tell(Outfile),
    read(X1), read(X2), read(X3),
    write(X1), nl, write(X2), nl, write(X3), nl,
    seen,
    told.
```




<div style="border-left: 4px solid #2e7d32; background-color: #e8f5e9; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>💡 File Reading and Copying</strong>


\texttt{read\_from\_file('data.txt', 'output.txt')} reads the first three Prolog terms from \texttt{data.txt} and writes them (one per line) to \texttt{output.txt}. The \texttt{see} and \texttt{seen} pair redirects input; the \texttt{tell} and \texttt{told} pair redirects output.

</div>



### Stream Control and Redirection




<div style="border-left: 4px solid #1a5c9e; background-color: #f0f4f8; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>📖 Stream Control</strong>


A **STREAM** is a Prolog term representing an input/output source. Instead of global redirections with \texttt{tell/1} and \texttt{see/1}, modern Prolog supports \texttt{open/3}, \texttt{close/1}, \texttt{set\_input/1}, and \texttt{set\_output/1} for finer control. Named streams can be passed as arguments to predicates, allowing multiple open I/O channels simultaneously.

</div>




```prolog
% Writing to a file via named stream
write_stream :-
    open('data.txt', write, S),
    write(S, 'Hello from stream!'),
    nl(S),
    close(S).

% Reading from a file via named stream
read_stream :-
    open('data.txt', read, S),
    read(S, Term),
    write('Term read: '), write(Term), nl,
    close(S).

% Inspecting current I/O streams
check_streams :-
    current_input(In),
    current_output(Out),
    write('Current input: '), write(In), nl,
    write('Current output: '), write(Out), nl.
```




<div style="border-left: 4px solid #2e7d32; background-color: #e8f5e9; padding: 15px; margin: 20px 0; border-radius: 4px;">
<strong>💡 Stream Redirection in Action</strong>


The predicate \texttt{with\_output\_to/2} temporarily redirects output:

```prolog
?- open('log.txt', write, S),
   with_output_to(S, write('log entry')),
   close(S).
```

Using named streams instead of global \texttt{tell}/\texttt{see} allows multiple files to remain open at once and avoids global state changes that can interfere with other predicates.

</div>



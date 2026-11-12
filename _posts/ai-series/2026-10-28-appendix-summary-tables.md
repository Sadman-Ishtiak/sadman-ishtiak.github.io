---
title: "Appendix C: Summary Tables and Reference"
date: 2026-10-28 00:00:00 +0600
categories: [Artificial Intelligence, Academic Notes]
tags: [summary, reference, tables]
description: "Comprehensive academic notes on Appendix C: Summary Tables and Reference from the Artificial Intelligence series."
math: true
---


# Summary Tables


This appendix collects key comparison and reference tables for the major topics covered in this book. Each table consolidates definitions, properties, and complexity results for quick revision.

% ===================================================================
## Uninformed Search Comparison


\newcolumntype{Y}{>{\raggedright\arraybackslash}p{2.2cm}}
[htbp]


\footnotesize
\begin{tabular}{lYYYYc}
\toprule
**Algorithm** & **Complete?** & **Optimal?** & **Time Complexity** & **Space Complexity** & **Data Structure** \\
\midrule
BFS &
  Yes &
  Yes$^\dagger$ &
  $O(b^d)$ &
  $O(b^d)$ &
  FIFO Queue \\
\midrule
UCS &
  Yes &
  Yes &
  $O(b^{1+\lfloor C^*/\epsilon\rfloor})$ &
  $O(b^{1+\lfloor C^*/\epsilon\rfloor})$ &
  Priority Queue \\
\midrule
DFS &
  No &
  No &
  $O(b^m)$ &
  $O(bm)$ &
  LIFO Stack \\
\midrule
DLS &
  No$^\ddagger$ &
  No &
  $O(b^\ell)$ &
  $O(b\ell)$ &
  LIFO Stack \\
\midrule
IDS &
  Yes &
  Yes$^\dagger$ &
  $O(b^d)$ &
  $O(bd)$ &
  LIFO Stack \\
\midrule
Bidirectional &
  Yes &
  Yes$^\dagger$ &
  $O(b^{d/2})$ &
  $O(b^{d/2})$ &
  Two Queues \\
\bottomrule
\multicolumn{6}{>{\raggedright\arraybackslash}p{\dimexpr\textwidth-2\tabcolsep\relax}}{\footnotesize $^\dagger$ Only if all step costs are equal.}\\
\multicolumn{6}{>{\raggedright\arraybackslash}p{\dimexpr\textwidth-2\tabcolsep\relax}}{\footnotesize $^\ddagger$ Yes if $\ell \geq d$, but $\ell$ is typically not known in advance.}\\
\multicolumn{6}{>{\raggedright\arraybackslash}p{\dimexpr\textwidth-2\tabcolsep\relax}}{\footnotesize Note: All entries assume **graph search** (with explored set). Tree search may have different properties.}
\end{tabular}


*Caption: Comparison of uninformed (blind) search strategies. $b$ is the branching factor, $d$ is the solution depth, $m$ is the maximum search depth, $\ell$ is the depth limit for DLS, $C^*$ is the optimal cost, and $\epsilon$ is the minimum step cost.*

\end{table}

% ===================================================================
## Informed Search Comparison


\newcolumntype{Z}{>{\raggedright\arraybackslash}p{2.5cm}}
[htbp]


\footnotesize
\begin{tabularx}{\textwidth}{lZcccX}
\toprule
**Algorithm** & **Heuristic Use** & **Complete?** & **Optimal?** & **Time Complexity** & **Space Complexity** \\
\midrule
Greedy Best-First &
  $f(n) = h(n)$ &
  No &
  No &
  $O(b^m)$ &
  $O(b^m)$ \\
\midrule
A* &
  $f(n) = g(n) + h(n)$ &
  Yes &
  Yes$^\dagger$ &
  $O(b^{\Delta})$ &
  $O(b^{\Delta})$ \\
\midrule
IDA* &
  $f$-cost cutoff &
  Yes &
  Yes$^\dagger$ &
  $O(b^d)$ &
  $O(bd)$ \\
\midrule
RBFS &
  $f(n) = g(n) + h(n)$ &
  Yes &
  Yes$^\dagger$ &
  $O(n^2)$ worst &
  $O(bd)$ \\
\bottomrule
\multicolumn{6}{l}{\footnotesize $^\dagger$ With an admissible (never-overestimating) heuristic.}\\
\multicolumn{6}{l}{\footnotesize A* requires consistency (monotonicity) for optimality in graph search.}
\end{tabularx}


*Caption: Comparison of informed (heuristic) search strategies. $b$ is the branching factor, $d$ is the solution depth, $m$ is the maximum search depth, and $\Delta$ is the relative error of the heuristic.*

\end{table}

% ===================================================================
## Logical Equivalence Laws


[htbp]


\footnotesize
\begin{tabularx}{\textwidth}{llX}
\toprule
**Law** & **Name** & **Formula** \\
\midrule
Commutativity of $\land$   & Commutative (and)   & $(\alpha \land \beta) \equiv (\beta \land \alpha)$ \\
Commutativity of $\lor$    & Commutative (or)    & $(\alpha \lor \beta) \equiv (\beta \lor \alpha)$ \\
Associativity of $\land$   & Associative (and)   & $((\alpha \land \beta) \land \gamma) \equiv (\alpha \land (\beta \land \gamma))$ \\
Associativity of $\lor$    & Associative (or)    & $((\alpha \lor \beta) \lor \gamma) \equiv (\alpha \lor (\beta \lor \gamma))$ \\
Double negation            & Double Negation     & $\neg(\neg\alpha) \equiv \alpha$ \\
Implication elimination    & Implication Def.    & $(\alpha \Rightarrow \beta) \equiv (\neg\alpha \lor \beta)$ \\
Biconditional elimination  & Biconditional Def.  & $(\alpha \Leftrightarrow \beta) \equiv ((\alpha \Rightarrow \beta) \land (\beta \Rightarrow \alpha))$ \\
Contraposition             & Contrapositive      & $(\alpha \Rightarrow \beta) \equiv (\neg\beta \Rightarrow \neg\alpha)$ \\
De Morgan (conjunction)    & De Morgan's Law     & $\neg(\alpha \land \beta) \equiv (\neg\alpha \lor \neg\beta)$ \\
De Morgan (disjunction)    & De Morgan's Law     & $\neg(\alpha \lor \beta) \equiv (\neg\alpha \land \neg\beta)$ \\
Distributivity ($\land$ over $\lor$) & Distributive & $(\alpha \land (\beta \lor \gamma)) \equiv ((\alpha \land \beta) \lor (\alpha \land \gamma))$ \\
Distributivity ($\lor$ over $\land$) & Distributive & $(\alpha \lor (\beta \land \gamma)) \equiv ((\alpha \lor \beta) \land (\alpha \lor \gamma))$ \\
Idempotence of $\land$     & Idempotent (and)    & $(\alpha \land \alpha) \equiv \alpha$ \\
Idempotence of $\lor$      & Idempotent (or)     & $(\alpha \lor \alpha) \equiv \alpha$ \\
Absorption ($\land$)       & Absorption          & $(\alpha \land (\alpha \lor \beta)) \equiv \alpha$ \\
Absorption ($\lor$)        & Absorption          & $(\alpha \lor (\alpha \land \beta)) \equiv \alpha$ \\
Negation of $\top/\bot$    & Negation            & $\neg\top \equiv \bot,\quad \neg\bot \equiv \top$ \\
Excluded middle            & Tautology           & $\alpha \lor \neg\alpha \equiv \top$ \\
Contradiction              & Unsatisfiable       & $\alpha \land \neg\alpha \equiv \bot$ \\
\bottomrule
\end{tabularx}


*Caption: Standard logical equivalences in propositional logic. $\alpha$, $\beta$, and $\gamma$ are arbitrary propositional sentences. $\top$ denotes *true*
, $\bot$ denotes \textit{false*.}
\end{table}

% ===================================================================
## Inference Rules Summary


[htbp]


\footnotesize
\begin{tabularx}{\textwidth}{lXX}
\toprule
**Rule Name** & **Premises** & **Conclusion** \\
\midrule
Modus Ponens &
  $\alpha \Rightarrow \beta$, $\alpha$ &
  $\beta$ \\
\midrule
Modus Tollens &
  $\alpha \Rightarrow \beta$, $\neg\beta$ &
  $\neg\alpha$ \\
\midrule
And-Elimination &
  $\alpha \land \beta$ &
  $\alpha$ (or $\beta$) \\
\midrule
And-Introduction &
  $\alpha$, $\beta$ &
  $\alpha \land \beta$ \\
\midrule
Or-Introduction &
  $\alpha$ &
  $\alpha \lor \beta$ \\
\midrule
Unit Resolution &
  $\ell_1 \lor \cdots \lor \ell_k$, $\neg\ell_i$ &
  $\ell_1 \lor \cdots \lor \ell_{i-1} \lor \ell_{i+1} \lor \cdots \lor \ell_k$ \\
\midrule
Full Resolution &
  $\ell_1 \lor \cdots \lor \ell_k$, $m_1 \lor \cdots \lor m_n$ &
  $\ell_1 \lor \cdots \lor \ell_{i-1} \lor \ell_{i+1} \lor \cdots \lor \ell_k \lor m_1 \lor \cdots \lor m_{j-1} \lor m_{j+1} \lor \cdots \lor m_n$ \\
  \qquad (where $\ell_i$ and $m_j$ are complementary literals) &
  \qquad (the resolvent) \\
\midrule
Chain Rule &
  $\alpha \Rightarrow \beta$, $\beta \Rightarrow \gamma$ &
  $\alpha \Rightarrow \gamma$ \\
\midrule
Reductio ad Absurdum &
  $\alpha \Rightarrow \bot$ &
  $\neg\alpha$ \\
\midrule
Biconditional Elimination &
  $\alpha \Leftrightarrow \beta$ &
  $(\alpha \Rightarrow \beta) \land (\beta \Rightarrow \alpha)$ \\
\bottomrule
\end{tabularx}


*Caption: Key inference rules for propositional logic. The horizontal bar notation $\frac{\text{Premises*
}{\text{Conclusion}}$ means: if the premises are true, the conclusion follows.}
\end{table}

% ===================================================================
## FOL vs.\ Propositional Logic Comparison


\newcolumntype{M}{>{\raggedright\arraybackslash}p{2.8cm}}
\newcolumntype{V}{>{\raggedright\arraybackslash}p{4.5cm}}
[htbp]

\footnotesize
\begin{tabularx}{\textwidth}{M>{\raggedright\arraybackslash}X>{\raggedright\arraybackslash}X}
\toprule
**Feature** & **Propositional Logic** & **First-Order Logic** \\
\midrule
Syntax &
  Atomic sentences (proposition symbols $P, Q, \dots$) and logical connectives ($\neg, \land, \lor, \Rightarrow, \Leftrightarrow$) &
  Terms (constants, variables, functions), atomic sentences (predicates with terms), connectives, and quantifiers ($\forall$, $\exists$) \\
\midrule
Semantics &
  Truth assignment to proposition symbols; $2^n$ possible models for $n$ symbols &
  Domain (nonempty set of objects) with interpretation mapping constants $\to$ objects, predicates $\to$ relations, functions $\to$ functions \\
\midrule
Ontological Commitment &
  Facts (truth values) &
  Facts, objects, relations, and functions \\
\midrule
Epistemological Commitment &
  True, false, or unknown &
  True, false, or unknown \\
\midrule
Expressiveness &
  Cannot represent objects, relations, or general statements; each fact requires a separate symbol &
  Can represent objects, relations, properties, and quantified statements concisely \\
\midrule
Quantifiers &
  None &
  Universal ($\forall$) and existential ($\exists$) quantifiers over objects \\
\midrule
Variables &
  No variables &
  Variables with binding by quantifiers; substitutions for inference \\
\midrule
Compositionality &
  Yes (truth-functional) &
  Yes \\
\midrule
Decidability &
  **Decidable**: entailment can always be determined (truth tables or theorem proving) &
  **Semidecidable**: if a sentence is entailed, a proof will eventually be found; if not, the algorithm may never terminate \\
\midrule
Inference &
  Truth tables, resolution, DPLL, WalkSAT; complete decision procedures exist &
  Generalized Modus Ponens, resolution with unification, forward/backward chaining; refutation-complete for Horn clauses \\
\midrule
Complexity &
  SAT is NP-complete; Horn clause entailment is $O(n)$ &
  Entailment is undecidable in the general case; Datalog (function-free Horn) is decidable \\
\midrule
Frame Problem &
  Requires explicit frame axioms or successor-state axioms for each fluent &
  Same, but quantified axioms are more concise; e.g., $\forall a, s \; \neg(\text{adjacent}(a, \text{pit}))$ \\
\midrule
Typical Use &
  Simple reasoning tasks, SAT-based planning, Wumpus world, circuit verification &
  Complex domains, knowledge representation, mathematical reasoning, natural language semantics, database queries \\
\midrule
Example Statement &
  $B_{1,1} \Leftrightarrow (P_{1,2} \lor P_{2,1})$ &
  $\forall s \; \text{Breezy}(s) \Leftrightarrow \exists r \; \text{Adjacent}(r, s) \land \text{Pit}(r)$ \\
\bottomrule
\end{tabularx}


*Caption: Comparison of Propositional Logic and First-Order Logic across key dimensions.*



\end{table}

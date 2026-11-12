---
title: "Introduction to Artificial Intelligence"
date: 2026-10-05 00:00:00 +0600
categories: [Artificial Intelligence, Academic Notes]
tags: [ai, introduction, agents]
description: "Start here: what AI is, the four approaches, its foundations, and a brief history."
excerpt: "Start here: what AI is, the four approaches, its foundations, and a brief history."
math: true
---

{% raw %}
# Introduction

## What Is AI?

The field of **ARTIFICIAL INTELLIGENCE** (AI) has organised around four competing approaches. They differ along two dimensions: human–centered vs. rational–centered, and focus on thought vs. action.

<div style="border-left:4px solid #1a5c9e;background:#f0f4f8;padding:14px 18px;margin:18px 0;border-radius:6px;">

Intelligence and Artificial Intelligence

**INTELLIGENCE** is the capacity to acquire and apply knowledge, reason abstractly, adapt to new environments, and learn from experience.

**ARTIFICIAL INTELLIGENCE** (AI) is the science and engineering of making intelligent machines, especially intelligent computer programs.

</div>

### Acting Humanly: The Turing Test

The **TURING TEST**, proposed by Alan Turing (1950), measures intelligence behaviourally: a machine passes if it can hold a conversation indistinguishable from a human. Passing requires **NATURAL LANGUAGE PROCESSING**, **KNOWLEDGE REPRESENTATION**, automated reasoning, and **MACHINE LEARNING**. The test stresses only behaviour, not internal cognition.

### Thinking Humanly: Cognitive Modeling

**COGNITIVE MODELING** asks: how does the human mind work? If we can simulate human thought processes, the machine is intelligent. This requires a scientific theory of the mind – testable through cognitive science experiments – and has been pursued via cognitive architectures such as SOAR and ACT–R.

### Thinking Rationally: Laws of Thought

The **LAWS OF THOUGHT** tradition, dating to Aristotle’s syllogisms, holds that intelligence consists of following correct inferential rules. A rational thinker starts from true premises and applies valid inference rules to reach correct conclusions. **GÖDEL’S INCOMPLETENESS THEOREM** shows that there are limits to what any formal system can prove.

### Acting Rationally: The Rational Agent

The **RATIONAL AGENT** approach defines AI as designing agents that act to achieve the best expected outcome. This is the broadest approach: it subsumes logical reasoning when deduction is the best action, but also allows heuristic search, probabilistic inference, and learning.

<div style="border-left:4px solid #1a5c9e;background:#f0f4f8;padding:14px 18px;margin:18px 0;border-radius:6px;">

Rationality

An agent is **RATIONAL** if, for each possible percept sequence, it selects an action that maximises its expected performance measure, given the evidence from the percept sequence and any built–in knowledge.

</div>

An agent’s expected utility for action $a$ is: $$U(a) = \sum_{o \in O} P(o \mid a) \cdot u(o)$$ where $O$ is the set of possible outcomes, $P(o \mid a)$ is the probability of outcome $o$ given action $a$, and $u(o)$ is the utility of outcome $o$.

*Figure: Four approaches to AI organised by human–centered vs. rational–centered and focus on thought vs. action.*

AI now overwhelmingly adopts the rational–agent view. It best unifies logic, probability, learning, and engineering: any method that produces optimal outcomes is welcome, regardless of whether it mimics human cognition. This book follows the rational–agent approach.

<div style="border-left:4px solid #2e7d32;background:#e8f5e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Examples of AI Systems

- **Chess programs** (Deep Blue, Stockfish) defeated human world champions.

- **Self–driving cars** (Waymo, Tesla) perceive their environment and navigate autonomously.

- **Speech recognisers** (Siri, Alexa) transcribe natural language into commands.

- **Recommendation engines** (Netflix, Amazon) predict user preferences from past behaviour.

- **Large language models** (ChatGPT, Claude) generate fluent text across diverse tasks.

</div>

## Foundations of AI

AI draws on ideas from several disciplines. Each contributed a core insight that shaped the field.

| **Discipline** | **Key Figures**             | **Contribution to AI**                                    |
|:---------------|:----------------------------|:----------------------------------------------------------|
| Philosophy     | Aristotle, Descartes, Hume  | Logic, mind–body dualism, empiricism                      |
| Mathematics    | Boole, Frege, Gödel, Turing | Propositional/predicate logic, computability, probability |
| Neuroscience   | McCulloch, Pitts, Hebb      | Neural networks, Hebbian learning, brain as computation   |
| Economics      | Simon, Nash, von Neumann    | Decision theory, game theory, bounded rationality         |
| Linguistics    | Chomsky, Shannon            | Formal grammars, syntactic structures, information theory |

Foundational disciplines and their contributions to AI.

**Philosophy** provided the foundation. Aristotle’s syllogisms gave the first formal inference rules. Descartes raised the mind–body problem, and Hume questioned induction – how can we generalise from limited observations? These questions drive AI’s search for reliable reasoning under uncertainty.

**Mathematics** provided the formal tools. Boole’s algebra and Frege’s predicate logic turned reasoning into calculation. Gödel’s Incompleteness proved the limits of formal systems. Turing’s model of computation defined what is mechanically computable, and probability theory gave a calculus for reasoning under uncertainty.

**Neuroscience** revealed that intelligence emerges from networks of simple neurons. McCulloch and Pitts (1943) proposed a logical model of the neuron, inspiring artificial neural networks. Hebb’s rule — “cells that fire together, wire together” — became the foundation of connectionist learning.

**Economics** supplied a normative framework for rational choice. Decision theory (von Neumann and Morgenstern) formalised expected utility. Herbert Simon introduced **BOUNDED RATIONALITY** – the idea that real agents must satisfice rather than optimise – which shaped AI’s agent paradigm.

**Linguistics** analysed language structure. Chomsky’s generative grammars and the Chomsky hierarchy classified formal languages, while Shannon’s information theory quantified communication and entropy.

<div style="border-left:4px solid #2e7d32;background:#e8f5e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Foundations in Practice

Concrete links from each discipline to AI systems:

- **Philosophy:** Aristotle’s syllogisms inspired rule–based reasoning in early expert systems.

- **Mathematics:** Boolean algebra underpins logic gates in hardware and propositional theorem provers.

- **Neuroscience:** The McCulloch–Pitts neuron is the direct ancestor of modern deep–learning architectures.

- **Economics:** Utility theory drives decision–theoretic planning in autonomous robots.

- **Linguistics:** Chomsky’s context–free grammars shape programming–language parsers and syntax highlighters.

</div>

## History of AI

AI’s history alternates between ambitious breakthroughs and periods of disillusionment.

*Figure: Timeline of major milestones in artificial intelligence.*

**1943–1956: The Birth of AI.** McCulloch and Pitts (1943) introduced the first mathematical model of a neuron. Alan Turing (1950) published “Computing Machinery and Intelligence”, proposing the Turing Test. The field officially launched at the **DARTMOUTH WORKSHOP** (1956), where John McCarthy coined the term **ARTIFICIAL INTELLIGENCE**.

**1956–1974: Early Enthusiasm.** Programs like the Logic Theorist and the General Problem Solver (GPS) proved that machines could solve theorems and puzzles. ELIZA simulated conversation. Governments and universities funded ambitious projects. Expectations soared.

**1974–1980: First AI Winter.** The optimism collapsed. Early programs could not scale, handled only toy domains, and failed to deliver on promises. Funding dried up in the UK (Lighthill report) and the US.

**1980–1988: Expert Systems Boom.** **EXPERT SYSTEMS** (MYCIN, DENDRAL, XCON) encoded domain knowledge in IF–THEN rules and outperformed human specialists in narrow tasks. The commercial success revived AI, but the boom ended when maintenance costs outweighed benefits.

**1988–Present: Modern AI.** Advances in probability (Bayesian networks), machine learning (neural networks, SVMs), and data availability transformed AI into a data–driven engineering discipline. **STRONG AI** (human–level intelligence) remains the long–term goal; current systems achieve **WEAK AI** (competence in specific domains).

Key lessons from the history:

- AI is harder than pioneers expected – every “easy” problem (chess, vision, language) turned out to require deeper understanding.

- Progress has been driven by mathematical rigour (probability, logic) and empirical data, not pure speculation.

- The rational–agent view provides a stable framework that accommodates both connectionist and symbolic approaches.

## State of the Art

AI systems now match or exceed human performance in many narrow domains:

- **ROBOTICS:** Autonomous vehicles, warehouse logistics (Amazon Robotics), surgical assistants (da Vinci).

- **COMPUTER VISION:** Facial recognition, medical image diagnosis, object detection (YOLO, ResNet).

- **NATURAL LANGUAGE PROCESSING:** Machine translation (Google Translate), question answering (BERT, GPT), speech recognition.

- **GAME PLAYING:** Superhuman performance in chess (Deep Blue, 1997), Go (AlphaGo, 2016), poker (Pluribus, 2019), and StarCraft (AlphaStar, 2019).

- **EXPERT SYSTEMS:** Diagnostic tools in medicine, fault detection in manufacturing, credit scoring in finance.

<div style="border-left:4px solid #2e7d32;background:#e8f5e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

State–of–the–Art AI

- **Deep Blue** (1997) defeated world chess champion Garry Kasparov using brute–force search and evaluation heuristics.

- **AlphaGo** (2016) defeated Go champion Lee Sedol using deep neural networks and Monte Carlo tree search.

- **GPT–4** (2023) passes the bar exam, medical licensing, and produces fluent text across hundreds of tasks.

- **Waymo** (2020–) operates a fully autonomous ride–hailing service in multiple US cities.

</div>

## AI as Science vs. Engineering

<div style="border-left:4px solid #1a5c9e;background:#f0f4f8;padding:14px 18px;margin:18px 0;border-radius:6px;">

AI as Science vs. Engineering

**AI as Science** seeks to understand the nature of intelligence. It formulates hypotheses about intelligent behaviour, tests them computationally, and refines theories of reasoning, learning, and perception.

**AI as Engineering** builds artefacts that perform useful tasks. It prioritises correctness, efficiency, and robustness over fidelity to human cognition.

</div>

The two goals often reinforce each other. A scientific insight into how humans solve a problem can inspire a better algorithm; conversely, engineering constraints reveal which cognitive assumptions are tractable. This book treats both perspectives, but emphasises the scientific principles that generalise across applications.

<div style="border-left:4px solid #2e7d32;background:#e8f5e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Science vs. Engineering in Practice

- **Science:** Cognitive scientists build ACT–R models to test theories of human memory.

- **Engineering:** Google Translate uses statistical MT to produce translations without modelling human language acquisition.

</div>

## General Concept of Knowledge

Knowledge is the foundation of intelligent behaviour. AI systems represent knowledge so that they can reason, plan, and learn.

<div style="border-left:4px solid #1a5c9e;background:#f0f4f8;padding:14px 18px;margin:18px 0;border-radius:6px;">

Knowledge and Related Concepts

Data:  
Raw, uninterpreted facts. E.g., a temperature reading of $37.5^\circ$C.

Information:  
Data endowed with meaning. E.g., the patient’s temperature is $37.5^\circ$C.

KNOWLEDGE:  
True, justified belief. Integrated information that supports inference. E.g., $37.5^\circ$C indicates a fever.

WISDOM:  
The ability to apply knowledge effectively across diverse situations.

</div>

*Figure: Knowledge hierarchy: raw data is refined into information, knowledge, and ultimately wisdom.*

Knowledge is classified along several dimensions:

- **Declarative vs. Procedural:** Declarative knowledge is knowing *that* (facts, propositions); procedural knowledge is knowing *how* (skills, procedures).

- **Tacit vs. Explicit:** Tacit knowledge is personal, hard to formalise (e.g., riding a bicycle); explicit knowledge is encoded in symbols and can be communicated (e.g., a recipe).

- **Domain vs. Common–Sense:** Domain knowledge is specific to a field (e.g., medical diagnosis); common–sense knowledge covers everyday facts (e.g., objects fall downward).

AI must represent all these types. Representing knowledge is the central problem of **KNOWLEDGE REPRESENTATION**, the subject of Chapters 11 and 12.

<div style="border-left:4px solid #2e7d32;background:#e8f5e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Knowledge Types in AI Systems

- **Declarative:** A medical expert system stores facts like “Penicillin treats bacterial infections” as IF–THEN rules.

- **Procedural:** A robot arm controller encodes how to grasp an object as a sequence of motor commands.

- **Common–sense:** Cyc, a long–term AI project, encodes everyday knowledge such as “objects fall when dropped”.

</div>

## Relationship Between ML, AI, and Data Science

**MACHINE LEARNING**, **ARTIFICIAL INTELLIGENCE**, and **data science** overlap but are distinct fields.

<div style="border-left:4px solid #1a5c9e;background:#f0f4f8;padding:14px 18px;margin:18px 0;border-radius:6px;">

AI, Machine Learning, and Data Science

**ARTIFICIAL INTELLIGENCE** (AI) is the broadest field: the study and construction of intelligent agents. It includes reasoning, planning, perception, NLP, robotics, and learning.

**MACHINE LEARNING** (ML) is a subfield of AI concerned with algorithms that improve performance through experience. ML provides the data–driven engine for many modern AI systems.

**Data Science** applies statistical and computational methods to extract knowledge from data. It draws on ML, statistics, and database technology to support decision–making.

</div>

*Figure: Relationship between AI, Machine Learning, and Data Science. AI is the superset; ML is a subfield of AI; Data Science overlaps with both.*

Historically, AI emphasised symbolic reasoning; ML emerged from statistics and pattern recognition. Modern AI integrates both: an autonomous vehicle uses ML for perception (object detection) and symbolic reasoning for planning (route selection). Data Science provides the infrastructure for collecting, cleaning, and interpreting the data that fuels learning.

<div style="border-left:4px solid #2e7d32;background:#e8f5e9;padding:14px 18px;margin:18px 0;border-radius:6px;">

Distinguishing the Three Fields

- **AI** designs the overall agent architecture that decides when to brake. **ML** trains the vision model that detects pedestrians. **Data Science** analyses sensor logs to identify edge cases.

- **AI** builds a chess engine that searches the game tree. **ML** learns evaluation functions from grandmaster games. **Data Science** visualises win–rate trends from tournament data.

</div>

{% endraw %}

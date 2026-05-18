---
title: "Ch 1: Foundations of Software Engineering"
date: 2026-03-02 00:00:00 +0600
categories: [Academic, CSE-401 Software Engineering]
tags: [chapter-1, software-engineering, foundations]
description: "Software engineering fundamentals, software crisis, and essential attributes of good software."
math: true
---

## Chapter 1 — Foundations of Software Engineering
*(Sommerville Ch. 1)*

### What is Software Engineering?

Software engineering is the application of **systematic, disciplined, and quantifiable** approaches to the development, operation, and maintenance of software. It bridges computer science theory with practical engineering constraints.

**Why it matters:** Software is everywhere — embedded systems, business systems, entertainment, infrastructure. Informal "hacking" doesn't scale; engineering discipline is required for reliability, safety, and cost-effectiveness.

### Simple Program vs. Software Product

| Attribute | Simple Program | Software Product |
|---|---|---|
| Written for | Yourself | Others |
| Documentation | None needed | Essential |
| Reliability | Tolerable failures | Must be dependable |
| Maintainability | Not a concern | Critical over lifetime |
| Scale | Small, one person | Large, teams |

### Generic vs. Custom Software

| Generic Software | Custom Software |
|---|---|
| Developed for a market (e.g. MS Office) | Developed for a specific client |
| Specification controlled by developer | Specification controlled by client |
| Sold to many customers | Sold to one client |
| Developer decides on changes | Client decides on changes |

### Essential Attributes of Good Software

```
┌─────────────────────────────────────────────────────────┐
│              GOOD SOFTWARE ATTRIBUTES                   │
├───────────────────┬─────────────────────────────────────┤
│ Acceptability     │ Must be acceptable to users it is   │
│                   │ designed for                        │
├───────────────────┼─────────────────────────────────────┤
│ Dependability     │ Reliable, secure, and safe          │
├───────────────────┼─────────────────────────────────────┤
│ Efficiency        │ No wasteful use of system resources │
├───────────────────┼─────────────────────────────────────┤
│ Maintainability   │ Must evolve to meet changing needs  │
└───────────────────┴─────────────────────────────────────┘
```

### Software Categories by Application Type

1. **System software** — OS, drivers, compilers
2. **Application software** — business systems, productivity tools
3. **Engineering/scientific software** — simulations, CAD
4. **Embedded software** — device control (e.g. car ABS)
5. **Product-line software** — specialized for a market segment
6. **Web applications** — browser-based, distributed
7. **AI software** — pattern recognition, decision systems

### Key Challenges in Software Engineering

- **Heterogeneity** — systems must operate across diverse hardware, networks, and platforms
- **Business and social change** — requirements change faster than software can be delivered
- **Security and trust** — software must be trustworthy even in adversarial environments
- **Scale** — development of very large systems that cannot be developed by an individual
- **Legacy systems** — old systems must be maintained and evolved

### Software Crisis Symptoms

1. Projects delivered late and over budget
2. Software that does not meet requirements
3. Software that is unreliable and full of defects
4. Software that is difficult to maintain
5. Software development that is unmanageable and unpredictable

> *"The software crisis is that we can't make software fast enough, good enough, or cheap enough."*

### Why Rapid Delivery is Critical

Modern businesses exist in fast-moving markets. New opportunities appear and disappear quickly. A system delivered in 12 months may miss the business window entirely. **Agility and speed of deployment are now as important as functionality.**

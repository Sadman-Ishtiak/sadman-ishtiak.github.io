---
title: "Ch 11: Risk Management & Estimation"
date: 2026-03-09 00:00:00 +0600
categories: [Academic, CSE-401 Software Engineering]
tags: [chapter-11, software-engineering, risk-management]
description: "Risk management process, risk classification, and software estimation techniques."
math: true
---

## Chapter 11 — Risk Management & Estimation
*(Sommerville Ch. 23)*

### Risk Management Process

```
┌──────────────┐   ┌──────────────┐   ┌──────────────┐   ┌──────────────┐
│  Risk        │──►│  Risk        │──►│  Risk        │──►│  Risk        │
│  Identifi-   │   │  Analysis    │   │  Planning    │   │  Monitoring  │
│  cation      │   │              │   │              │   │              │
└──────────────┘   └──────────────┘   └──────────────┘   └──────────────┘
List potential     Assess             Strategies to      Monitor risks;
risks              probability &      avoid, minimize,   update analysis
                   impact             or manage          as project evolves
```

### Known vs. Predictable Risk

| Known Risk | Predictable Risk |
|---|---|
| Identified and documented before project starts | Extrapolated from past project experience |
| Can be planned for directly | Estimated from historical patterns |
| Example: a dependency on a library version | Example: staff turnover probability based on industry average |

### Risk Classification

**Technology risks:**
- Components not delivering required performance
- Immature technology not ready for production use
- Off-the-shelf software not meeting requirements

**Organizational risks:**
- Organizational restructuring affecting the project
- Financial problems causing budget cuts
- Key staff unavailable

**People risks:**
- Inability to recruit staff with required skills
- Staff illness or turnover
- Training problems

**Requirements risks:**
- Requirements changes causing rework
- Unclear or misunderstood requirements

**Estimation risks:**
- Underestimating time and effort required
- Underestimating size of software to be developed

### Example Risk Register

| Risk | Probability | Impact | Strategy |
|---|---|---|---|
| Staff turnover | Medium | High | Document processes; cross-train team |
| Requirement changes | High | Medium | Use agile; modular design |
| Technology immaturity | Low | High | Prototype early; have fallback |
| Underestimation | High | High | Use multiple estimation methods; add contingency |

### Software Cost & Effort Estimation Techniques

1. **Algorithmic cost modeling** — COCOMO II: uses size (KLOC or function points) + cost drivers
2. **Expert judgment** — experienced engineers estimate; Delphi method aggregates opinions
3. **Estimation by analogy** — compare with similar completed projects
4. **Parkinson's law** — cost expands to fill available budget (avoid this approach)
5. **Pricing to win** — quote what client will pay; dangerous without sanity check
6. **Function point analysis** — count inputs, outputs, files, interfaces, queries

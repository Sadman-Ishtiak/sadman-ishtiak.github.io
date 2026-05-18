---
title: "Ch 4: Requirements Engineering"
date: 2026-03-05 00:00:00 +0600
categories: [Academic, CSE-401 Software Engineering]
tags: [chapter-4, software-engineering, requirements]
description: "Requirements engineering process, types of requirements, and validation."
math: true
---

## Chapter 4 — Requirements Engineering
*(Sommerville Ch. 4)*

### What is Requirements Engineering?

Requirements engineering is the process of **finding out, analyzing, documenting, and checking** the services and constraints that a system must provide.

### Types of Requirements

```
Requirements
├── Functional requirements
│   └── Describe what the system should do
│       (e.g. "The system shall allow users to search by keyword")
│
├── Non-functional requirements
│   ├── Product requirements (reliability, efficiency, portability)
│   ├── Organizational requirements (standards, implementation environment)
│   └── External requirements (legal, ethical)
│
└── Domain requirements
    └── Derived from the application domain
```

### User vs. System Requirements

| User Requirements | System Requirements |
|---|---|
| Written for customers/managers | Written for developers |
| High-level, natural language | Detailed and precise |
| What the system should do | How the system does it |
| Example: "Users shall be able to search inventory" | Example: "The system shall search the inventory database using SQL within 2 seconds for datasets up to 100,000 records" |

**Why distinguish them:** User requirements define the problem; system requirements define the solution. Conflating them leads to over-constraining design decisions early, or under-specifying what is actually needed.

### The Requirements Engineering Process

```
┌────────────────┐    ┌────────────────┐    ┌────────────────┐
│  Requirements  │───►│  Requirements  │───►│  Requirements  │
│  Elicitation   │    │  Specification │    │  Validation    │
│  & Analysis    │    │                │    │                │
└────────────────┘    └────────────────┘    └────────────────┘
        ▲                                            │
        └────────────────────────────────────────────┘
                      (iterative)
```

- **Elicitation:** Interviews, workshops, observation, prototyping, use cases
- **Analysis:** Classify, model, prioritize, negotiate conflicts
- **Specification:** Document in requirements document (SRS)
- **Validation:** Checks against correctness, completeness, consistency

### Requirements Document Structure (SRS)

1. Introduction — purpose, scope, definitions
2. Overall description — product perspective, functions, user characteristics
3. Specific requirements
   - Functional requirements
   - Non-functional requirements
   - Interface requirements
4. System models — use cases, data models
5. Glossary
6. Index

### Metrics for Non-Functional Requirements

| Property | Measure |
|---|---|
| Speed | Transactions/second; response time |
| Size | Kilobytes; number of ROM chips |
| Ease of use | Training time; number of help frames |
| Reliability | Mean time to failure; probability of unavailability |
| Robustness | Time to restart after failure |
| Portability | Percentage of platform-dependent statements |

### Requirements Validation Checks

- **Validity** — do requirements reflect the actual needs of users?
- **Consistency** — are there conflicts between requirements?
- **Completeness** — are all required functions included?
- **Realism** — can requirements be implemented given budget and technology?
- **Verifiability** — can requirements be tested?

### ATM System — Example Use Cases

| Use Case | Actor | Description |
|---|---|---|
| Withdraw cash | Customer | Insert card, enter PIN, select amount, receive cash |
| Check balance | Customer | View account balance on screen |
| Transfer funds | Customer | Move money between linked accounts |
| Deposit cash | Customer | Insert cash; system credits account |
| Change PIN | Customer | Enter old PIN, enter and confirm new PIN |
| Replenish cash | Bank engineer | Load cash cartridges into ATM |

### Social and Political Factors in Requirements

Example: **National ID system**
- Political factors: civil liberties groups may oppose data collection
- Social factors: cultural attitudes toward government surveillance differ
- These factors can veto technically correct requirements or introduce legally mandatory ones

---
title: "Ch 5-8: System Modeling & Design"
date: 2026-03-06 00:00:00 +0600
categories: [Academic, CSE-401 Software Engineering]
tags: [chapter-5-8, software-engineering, design]
description: "System modeling, design principles, cohesion, and ER diagrams."
math: true
---

## Chapter 5–8 — System Modeling & Design
*(Sommerville Ch. 5–8)*

### Cohesion and Its Influence on Maintenance

**Cohesion** measures how strongly related the responsibilities of a module are.

- **High cohesion** (good): a module does one thing well → easy to understand, test, and maintain
- **Low cohesion** (bad): a module has many unrelated responsibilities → changes in one part risk breaking another

High cohesion reduces maintenance effort because:
- Changes are localized to a single module
- Modules are independently understandable
- Testing and reuse are simpler

### ER Diagram Generation

**Level 1 ER Diagram:**
- Identify entities (nouns from problem description)
- Identify relationships (verbs between entities)
- Draw entity-relationship diagram with cardinalities

**Level 2 ER Diagram:**
- Add attributes to entities
- Identify primary keys
- Resolve many-to-many relationships with junction entities

**Level 3 ER Diagram:**
- Normalize to 3NF
- Identify foreign keys
- Define all constraints

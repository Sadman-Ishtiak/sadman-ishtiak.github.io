---
title: "Ch 10: Software Quality Management"
date: 2026-03-08 00:00:00 +0600
categories: [Academic, CSE-401 Software Engineering]
tags: [chapter-10, software-engineering, quality]
description: "Software quality assurance, metrics, standards, and quality conflicts."
math: true
---

## Chapter 10 — Software Quality Management
*(Sommerville Ch. 25)*

### Software Quality Assurance (SQA)

**SQA** is a planned and systematic pattern of actions necessary to provide adequate confidence that a software product conforms to established technical requirements.

**SQA Objectives:**
1. Establish quality standards and processes
2. Monitor and measure adherence to those standards
3. Detect defects as early as possible
4. Provide feedback to improve the development process

### Quality Metrics

| Metric Type | Examples |
|---|---|
| Product metrics | Defect density, code coverage, coupling, cohesion |
| Process metrics | Defect discovery rate, rework effort, review effectiveness |
| Project metrics | Schedule variance, cost variance, staff productivity |

### Process and Product Standards

- **Process standards** — define the process to be followed (e.g. how to conduct code reviews, how to manage versions)
- **Product standards** — define characteristics of the deliverable (e.g. naming conventions, document format, interface style)

Both together ensure that a repeatable, measurable process produces consistent outputs.

### Quality Conflicts

Quality attributes often **conflict** with each other:
- **Efficiency vs. Portability** — optimized native code may not run elsewhere
- **Safety vs. Performance** — safety checks add overhead
- **Security vs. Usability** — strong authentication frustrates users
- **Maintainability vs. Efficiency** — highly modular code may be slower

### High-Quality Process → High-Quality Product

A good process:
- Identifies defects early (cheaper to fix)
- Provides checkpoints (reviews, inspections) before defects propagate
- Uses proven techniques and tools
- Makes defects visible and traceable

> *"If your process is poor, defects will be introduced faster than they are removed. The process IS the product's quality mechanism."*

### Quality Management for Large Systems

Challenges unique to large systems:
- Many teams → inconsistent standards without formal enforcement
- Long development — standards must be maintained across years
- Subsystem integration — quality issues emerge at boundaries
- Response: formal quality plans, audits, metrics dashboards, independent QA teams

---
title: "Reference: Definitions to Know"
date: 2026-03-14 00:00:00 +0600
categories: [Academic, CSE-401 Software Engineering]
tags: [definitions, reference, exam-prep]
description: "All key definitions from the Software Engineering course that you need to memorize for the exam."
math: true
---

# Definitions to Know

## Core Concepts

### Software Engineering
The application of **systematic, disciplined, and quantifiable** approaches to the development, operation, and maintenance of software. It bridges computer science theory with practical engineering constraints.

### Software Process
A **structured set of activities** required to develop a software system, including specification, design and implementation, validation, and evolution.

### SDLC (Software Development Life Cycle)
A framework for defining and controlling the process of software development through defined phases: communication, planning, modeling, construction, and deployment.

## Process Models

### Waterfall Model
A sequential process model where each phase (requirements, design, implementation, integration, maintenance) must be completed before the next begins. Inflexible but easy to manage.

### Spiral Model
An iterative process model that emphasizes risk management, dividing development into four quadrants (objectives, risk assessment, development, planning) repeated in growing spirals.

### Evolutionary Development
A process where an initial implementation is built quickly and then refined through feedback, but risks producing poorly structured systems due to continuous changes.

### Agile Methods
Process models emphasizing **customer involvement, incremental delivery, people over process, embracing change, and maintaining simplicity**. Examples: XP, Scrum.

### Plan-Driven Processes
Process models where all activities are planned in advance, requirements documented upfront, and change is costly. Suitable for large, stable requirements. Examples: Waterfall, RUP.

## Agile Practices

### Refactoring
The process of improving the **internal structure** of code **without changing its external behavior**. Keeps code clean and maintainable as the system evolves.

### Collective Ownership
An agile practice where **any developer can change any part of the code**, reducing bottlenecks and promoting shared responsibility.

### Pair Programming
A development practice where **two developers work at one workstation**, improving code quality and knowledge sharing.

### User Stories
Short narratives written from the user's perspective describing what the system should do, used in agile methods to capture requirements.

### Test-First Development
An agile practice of writing tests before writing the code being tested, ensuring code meets requirements and improving design.

### Continuous Integration
An agile practice of **integrating and testing code multiple times daily**, catching defects early and reducing integration problems.

## Requirements Engineering

### Functional Requirement
A requirement that **describes what the system should do** (e.g., "Users shall be able to search by keyword").

### Non-Functional Requirement
A requirement that describes **system properties** like reliability, efficiency, portability, or performance constraints, rather than specific behaviors.

### User Requirement
A **high-level, natural language** requirement written for customers/managers describing **what the system should do**.

### System Requirement
A **detailed and precise** requirement written for developers describing **how the system does it** with specific technical constraints.

### Requirement Specification
A document that contains a complete definition of requirements, typically including functional, non-functional, and interface requirements.

## Design & Modeling

### Cohesion
A measure of **how strongly related the responsibilities** of a module are. High cohesion (good) means a module does one thing well; low cohesion (bad) means many unrelated responsibilities.

### Module
A discrete unit of software with well-defined interfaces, responsible for a specific set of functions. High cohesion within modules improves maintainability.

### Entity-Relationship Diagram (ER Diagram)
A visual representation of entities, their attributes, and relationships used in database design.

## Testing

### Unit Testing
Testing **individual functions, methods, or classes** in isolation, performed by developers.

### Component Testing
Testing a **composite of multiple units**, including interface testing between components.

### System Testing
Testing the **end-to-end behavior of the complete system** as a whole, performed by an independent test team.

### Integration Testing
Testing the **combined behavior of multiple components**, verifying interfaces work correctly when modules are integrated.

### Acceptance Testing
**User testing** of the system to validate it meets customer needs and requirements.

### Verification
The process of checking that the system **meets the specification** ("Are we building the product right?").

### Validation
The process of checking that the system **meets customer needs** ("Are we building the right product?").

### White Box Testing
Testing where the **tester knows the internal structure** and tests specific code paths. Also called structural testing.

### Black Box Testing
Testing where the **tester only knows inputs/outputs** and tests against the specification. Also called functional testing.

## Quality Management

### Software Quality Assurance (SQA)
A **planned and systematic pattern of actions** to provide adequate confidence that a software product conforms to established technical requirements.

### Quality Metric
A measurable attribute used to assess quality, such as **defect density, code coverage, coupling, cohesion** (product metrics), or **defect discovery rate, rework effort** (process metrics).

### Quality Standard
A defined requirement or characteristic for a process (e.g., code review procedures) or product (e.g., naming conventions).

### Rework
**Effort spent fixing defects** or redoing work that was done incorrectly, a major cost in software development.

## Risk Management

### Known Risk
A risk **identified and documented before the project starts**, that can be planned for directly (e.g., dependency on a specific library version).

### Predictable Risk
A risk **extrapolated from past project experience**, estimated from historical patterns (e.g., staff turnover probability).

### Risk Register
A document listing identified risks with their probability, impact, and mitigation strategies.

## Project Management

### Milestone
A **point in the schedule where progress is measured**, internal to the team (e.g., "Design review complete").

### Deliverable
A **tangible output produced for the customer or stakeholder** (e.g., "System design document v1.0").

### Work Breakdown Structure (WBS)
A hierarchical decomposition of the project into smaller, manageable activities and dependencies.

## Configuration Management

### Baseline
A **reviewed and agreed-upon specification or product** that serves as the basis for further development and can only be changed through formal change control.

### Codeline
A **sequence of versions of source code** with later versions derived from earlier versions.

### Mainline
A **sequence of baselines** representing different versions of a system.

### Version Management
The **tracking of versions** of components and the prevention of conflicts when multiple developers work on the same system.

### Change Management
The **process for assessing and implementing changes** to a system, including evaluation of business impact, cost, risk, and dependencies.

## Software Evolution & Maintenance

### Legacy Software
**Old software that continues to be used** because it meets business needs, even though it may use outdated technology and be expensive to maintain.

### Corrective Maintenance
**Fixing defects** discovered after software delivery (~20% of maintenance effort).

### Adaptive Maintenance
**Modifying the system for a new environment** (new OS, hardware, regulations) (~20% of maintenance effort).

### Perfective Maintenance
**Adding new features or improving performance** based on user requests and competition (~50% of maintenance effort).

### Preventive Maintenance
**Restructuring code to improve maintainability** without changing functionality (~10% of maintenance effort).

### Re-engineering
**Restructuring code without changing functionality** (refactoring at scale), a strategy for improving legacy systems.

### Wrapping
**Adding a new interface layer (API)** around an old system, a strategy for improving legacy systems without replacing them.

## Professional Practice

### Software Engineering Ethics
A set of **principles guiding professional behavior**, including public interest, client interest, product quality, professional judgment, and lifelong learning.

### ACM/IEEE Code of Ethics
Professional code emphasizing: public interest, client/employer interest, product quality, judgment, management practices, profession advancement, colleague treatment, and self-development.

## Estimation & Scheduling

### COCOMO (Constructive Cost Model)
An **algorithmic cost modeling technique** that estimates software development effort using size (KLOC or function points) and cost drivers.

### Function Point Analysis
A technique to **count inputs, outputs, files, interfaces, and queries** to estimate the size and cost of software development.

### Delphi Method
A technique for **aggregating expert opinions** to create consensus estimates of effort and cost.

### Estimation by Analogy
An estimation technique that **compares the current project with similar completed projects** to predict effort and cost.

## DevOps

### Continuous Integration (CI)
The practice of **frequently integrating code changes** (multiple times daily) and automatically testing them to catch defects early.

### Continuous Deployment (CD)
The practice of **automatically deploying tested code to production**, enabling rapid feature releases.

### Infrastructure as Code
The practice of **managing infrastructure (servers, networks, storage) through version-controlled code**, making environments reproducible.

## Key Comparisons

### Plan-Driven vs. Agile
**Plan-Driven:** Activities planned in advance, requirements documented upfront, change is costly, suitable for stable requirements (Waterfall). **Agile:** Incremental planning, requirements emerge through iteration, change is expected, suitable for changing requirements (Scrum, XP).

### Generic vs. Custom Software
**Generic:** Developed for a market, specification controlled by developer, sold to many customers. **Custom:** Developed for a specific client, specification controlled by client, sold to one client.

### Milestone vs. Deliverable
**Milestone:** Point in schedule for progress measurement, internal. **Deliverable:** Tangible output for customer or stakeholder.

### Verification vs. Validation
**Verification:** "Building the product right" — checking against specification. **Validation:** "Building the right product" — checking against customer needs.

### White Box vs. Black Box Testing
**White Box:** Tester knows structure, tests specific paths. **Black Box:** Tester only knows inputs/outputs, tests against specification.

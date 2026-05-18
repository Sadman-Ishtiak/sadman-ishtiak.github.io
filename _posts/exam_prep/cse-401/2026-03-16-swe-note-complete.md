---
title: Complete Software Engineering Semester Note Based on The Previous Questions for CSE-401
date: 2026-03-16 00:00:00 +0600
categories: [Academic, CSE-401 Software Engineering]
tags: [semester, questions, software-engineering, academic]
description: "Comprehensive study notes for CSE-401 Software Engineering, organized by chapter and topic, based on previous exam questions. Includes key concepts, definitions, diagrams, and examples to prepare for the final exam."
math: true
---

# Software Engineering — Comprehensive Study Notes
### Based on Ian Sommerville's *Software Engineering* (10th Edition)
*Organized in learning sequence · Exam-focused · Diagram-inclusive*

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

---

## Chapter 2 — Software Processes & Process Models
*(Sommerville Ch. 2)*

### What is a Software Process?

A software process is a **structured set of activities** required to develop a software system.

**Major process activities:**
1. **Specification** — defining what the system should do
2. **Design and implementation** — defining and building the system structure
3. **Validation** — checking that it does what the customer wants
4. **Evolution** — changing the system in response to customer needs

### Plan-Driven vs. Agile Processes

```
Plan-Driven                          Agile
──────────────────────────           ──────────────────────────
All activities planned in            Incremental planning
advance                              
Requirements documented up           Requirements emerge through
front                                iteration
Change is costly                     Change is expected & welcomed
Suitable for large, stable           Suitable for changing,
requirements                         unclear requirements
Examples: Waterfall, RUP             Examples: Scrum, XP
```

### The Waterfall Model

```
     ┌──────────────────────┐
     │  Requirements        │
     │  definition          │
     └──────────┬───────────┘
                │
     ┌──────────▼───────────┐
     │  System & software   │
     │  design              │
     └──────────┬───────────┘
                │
     ┌──────────▼───────────┐
     │  Implementation &    │
     │  unit testing        │
     └──────────┬───────────┘
                │
     ┌──────────▼───────────┐
     │  Integration &       │
     │  system testing      │
     └──────────┬───────────┘
                │
     ┌──────────▼───────────┐
     │  Operation &         │
     │  maintenance         │
     └──────────────────────┘
```

**Pros:**
- Easy to manage — each phase has specific deliverables
- Works well when requirements are very well understood
- Good for large, safety-critical systems (aerospace, defense)

**Cons:**
- Inflexible — difficult to respond to changing requirements
- Working software not produced until late in the lifecycle
- Requirements rarely fully known at project start

**Phase entry/exit criteria (Classical Waterfall):**
- **Entry:** Previous phase fully documented and signed off
- **Exit:** Current phase deliverables reviewed and accepted by stakeholders

### Boehm's Spiral Model

```
              Determine objectives,
              alternatives, constraints
   4th ◄──────────────────────────────── 1st
   quadrant                          quadrant
   Plan next                         Identify and
   iteration                         resolve risks
   ▲                                       ▼
   3rd                               2nd
   quadrant                          quadrant
   Develop and                       Evaluate
   validate next                     alternatives
   level ─────────────────────────►
```

The spiral is divided into **4 quadrants**, repeated across growing spirals:

| Quadrant | Activities |
|---|---|
| 1. Objective setting | Identify objectives, constraints, alternatives |
| 2. Risk assessment | Identify and resolve risks; may involve prototyping |
| 3. Development & validation | Choose a development model; build and test |
| 4. Planning | Review with the client; plan the next iteration |

**Key concept:** Each loop of the spiral represents a phase of the software process. Risk is explicitly addressed at every iteration.

*Can also be used for:* planning iterative development of large systems where risk is high, or for systems where requirements are unclear.

### SDLC Framework Activities

1. **Communication** — customer communication and requirements gathering
2. **Planning** — project plan, resource estimation, scheduling
3. **Modeling** — analysis and design
4. **Construction** — coding and testing
5. **Deployment** — delivery and feedback

### Evolutionary Development

In evolutionary development, initial implementation is built quickly, then refined through feedback. **Problem:** The process is not visible; it's hard to track progress. Systems are often **poorly structured** because continuous change degrades the architecture — making them difficult to maintain.

> *"Programs developed using evolutionary development are likely to be difficult to maintain because there is no overall structure — they become a patchwork of changes."*

---

## Chapter 3 — Agile Software Development
*(Sommerville Ch. 3)*

### What is Agility?

**Agility** is the ability to respond to change rapidly and effectively. In software, this means:
- Delivering working software frequently
- Embracing changing requirements even late in development
- Close, daily collaboration between business and developers

### Principles of Agile Methods (Agile Manifesto)

| Principle | Meaning |
|---|---|
| Customer involvement | Customers provide and prioritize requirements constantly |
| Incremental delivery | Software developed in small increments with customer input |
| People not process | Individual developer skills are recognized and exploited |
| Embrace change | Design the system to accommodate change |
| Maintain simplicity | Actively work to eliminate complexity |

### How Agile Leads to Accelerated Development

1. Minimal up-front documentation reduces overhead
2. Working software delivered in weeks, not months
3. Continuous feedback prevents building the wrong thing
4. Small increments allow rapid course correction
5. Close team collaboration reduces communication latency

### Extreme Programming (XP)

XP pushes agile principles to the extreme. Key practices:

- **User stories** — requirements written on index cards as short narratives from the user's perspective
- **Test-first development** — write test before code
- **Pair programming** — two developers work at one workstation
- **Refactoring** — continuously improve code structure without changing behavior
- **Collective ownership** — any developer can change any part of the code
- **Continuous integration** — code integrated and tested multiple times daily
- **Small releases** — start with minimum useful feature set; release frequently

**User stories on cards — advantages vs. disadvantages:**

| Advantages | Disadvantages |
|---|---|
| Simple and accessible to non-technical stakeholders | Incomplete — can miss system-wide requirements |
| Easy to prioritize and reorder | Difficult to judge story completeness |
| Encourages conversation | Hard to trace to system requirements |
| Low overhead | May miss important non-functional requirements |

### Refactoring

**Refactoring** is the process of improving the internal structure of code without changing its external behavior. It keeps code clean and maintainable as the system evolves.

Role in testing: Refactoring after tests pass ensures code remains understandable and maintainable, making future tests easier to write and bugs easier to find.

### Scrum

**Scrum** is an agile method that focuses on managing iterative development rather than specific software engineering practices.

#### The Scrum Sprint Cycle

```
Product           Sprint             Potentially
Backlog ────────► Planning ────────► Shippable
(prioritized      Meeting            Product
feature list)         │             Increment
                       │
              ┌────────▼──────────┐
              │   SPRINT          │
              │   (2–4 weeks)     │
              │                   │
              │  Daily Scrum      │
              │  (15-min standup) │
              │  ┌──────────────┐ │
              │  │ What did I   │ │
              │  │ do yesterday?│ │
              │  │ What today?  │ │
              │  │ Any blocks?  │ │
              │  └──────────────┘ │
              └───────────────────┘
                       │
              ┌────────▼──────────┐
              │  Sprint Review    │
              │  Sprint           │
              │  Retrospective    │
              └───────────────────┘
```

**Scrum roles:**
- **Product Owner** — defines and prioritizes the product backlog
- **Scrum Master** — ensures the team follows Scrum process, removes impediments
- **Development Team** — self-organizing team that delivers the increment

### DevOps

DevOps combines **Development** and **Operations** to shorten the development lifecycle and deliver features continuously. Key impacts:

- Breaks silos between development and operations teams
- Enables continuous integration and continuous deployment (CI/CD)
- Infrastructure as code — environments are reproducible and version-controlled
- Faster release cycles with automated testing and deployment pipelines
- Monitoring in production feeds back into development priorities

### AI in Software Engineering

AI is transforming software engineering in several areas:

- **Code generation** — tools like GitHub Copilot suggest code completions
- **Automated testing** — AI generates test cases from specifications
- **Bug detection** — static analysis with ML identifies likely defects
- **Requirements extraction** — NLP tools extract requirements from documents
- **Project estimation** — ML models predict effort from historical data

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

---

## Chapter 9 — Software Testing
*(Sommerville Ch. 9)*

### Verification vs. Validation

```
Verification                    Validation
────────────────────────        ────────────────────────
"Are we building the            "Are we building the
product right?"                 right product?"

Checks against                  Checks against
specification                   customer needs

Static (reviews,                Dynamic (running
inspections)                    the software)
or dynamic                      
```

### Testing Hierarchy

```
             ┌─────────────────┐
             │ Acceptance      │  ← User tests the system
             │ Testing         │
             └────────┬────────┘
                      │
             ┌────────▼────────┐
             │ System          │  ← Integration of all components
             │ Testing         │
             └────────┬────────┘
                      │
             ┌────────▼────────┐
             │ Integration/    │  ← Modules combined and tested
             │ Component Test  │
             └────────┬────────┘
                      │
             ┌────────▼────────┐
             │ Unit            │  ← Individual functions/classes
             │ Testing         │
             └─────────────────┘
```

### Unit, Component, and System Testing Defined

| Level | Focus | Who |
|---|---|---|
| Unit testing | Individual functions, methods, or classes | Developer |
| Component testing | Composite of multiple units; interface testing | Developer |
| System testing | End-to-end behavior of the complete system | Independent test team |

### Why Integration Testing is Harder Than Unit Testing

- Units work in isolation but may fail when combined
- Interface mismatches between components only appear at integration
- Timing and synchronization issues emerge
- Dependencies on databases, networks, or external services introduce non-determinism
- Harder to isolate which component caused a failure

### White Box vs. Black Box Testing

| White Box | Black Box |
|---|---|
| Tester knows internal structure | Tester only knows inputs/outputs |
| Tests specific code paths | Tests against specification |
| Can miss system-level issues | Can miss code-level issues |
| Also called structural testing | Also called functional testing |

### The Traditional Testing Process (Plan-Driven)

```
Test         ┌──────────┐    ┌──────────┐    ┌──────────┐
Plan    ────►│  Unit    │───►│Component │───►│ System   │
             │  Testing │    │ Testing  │    │ Testing  │
             └──────────┘    └──────────┘    └──────────┘
                                                   │
             ┌─────────────────────────────────────▼──┐
             │         Release Testing                │
             │   (Testing by independent team)        │
             └─────────────────────────────────────┬──┘
                                                   │
             ┌─────────────────────────────────────▼──┐
             │         User Testing                   │
             │   (Alpha / Beta / Acceptance)           │
             └─────────────────────────────────────────┘
```

### When to Stop Testing

There is no perfect answer, but practical criteria include:
- All planned test cases have been executed
- Defect discovery rate drops below a pre-defined threshold
- Code coverage targets are met (e.g. 85% branch coverage)
- Remaining known defects are accepted risks by the customer
- Time and budget are exhausted (business decision)

### Acceptance Testing Process

```
┌──────────────────────────────────────────────────────────┐
│                  Acceptance Testing Process              │
├──────────┬──────────┬──────────┬──────────┬─────────────┤
│  Define  │  Plan    │  Derive  │  Run     │  Negotiate  │
│  accept- │  accept- │  accept- │  accept- │  & decide   │
│  ance    │  ance    │  ance    │  ance    │  on accept- │
│  criteria│  tests   │  tests   │  tests   │  ance       │
└──────────┴──────────┴──────────┴──────────┴─────────────┘
```

### Benefits of Early User Involvement in Testing

- Users validate that the system meets their actual needs, not just spec
- Real usage patterns reveal bugs that synthetic tests miss
- Acceptance criteria can be refined before final delivery
- Reduces risk of rejection at formal acceptance

**Disadvantages:** Users may not be available; they may introduce bias toward workflows they already know; managing feedback from many users adds overhead.

### Should Developers Test Their Own Code?

**For developer testing:**
- Deep knowledge of code helps design effective tests
- Faster feedback loop during development
- Developers most motivated to find defects early

**Against developer testing:**
- Psychological bias — developers unconsciously avoid testing edge cases
- Same misunderstanding of requirements may affect both code and test
- Best practice: developers write unit tests; independent teams do system and acceptance testing

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

---

## Chapter 12 — Project Management & Planning
*(Sommerville Ch. 22–23)*

### Why Project Management Matters

Without management, software projects:
- Exceed budget and schedule
- Deliver wrong functionality
- Suffer from poor team coordination
- Accumulate unresolvable technical debt

### Role of a Project Manager

- **Planning** — develop project plan, allocate resources
- **Organizing** — structure teams, define roles and responsibilities
- **Monitoring** — track progress against the plan
- **Leading** — motivate the team; resolve conflicts
- **Communicating** — manage stakeholder expectations
- **Risk management** — identify and mitigate risks continuously

**Motivating people** is critical. Teams with high morale deliver better software faster. Maslow's hierarchy applies: basic needs (salary) → safety (job security) → social (team belonging) → esteem (recognition) → self-actualization (challenging work).

### Why Project Planning is Iterative

Initial plans are based on incomplete information. As the project progresses:
- Requirements become clearer
- Risks materialize or disappear
- Estimates are revised with actual data
- Technology choices are validated or changed

> *"A project plan must be a living document, continuously reviewed and updated as new information becomes available."*

### Main Components of a Project Plan

1. **Introduction** — objectives, constraints, assumptions
2. **Project organization** — team structure, roles, responsibilities
3. **Risk analysis** — identified risks and mitigation strategies
4. **Hardware and software resource requirements**
5. **Work breakdown structure** — activities, dependencies
6. **Project schedule** — milestones, Gantt charts, critical path
7. **Monitoring and reporting mechanisms**

### Milestone vs. Deliverable

| Milestone | Deliverable |
|---|---|
| A point in the schedule where progress is measured | A tangible output produced for the customer |
| Internal to the team | Provided to the customer or stakeholder |
| Example: "Design review complete" | Example: "System design document v1.0" |

### Software Pricing Factors

- **Market opportunity** — price may be set low to gain market entry
- **Cost uncertainty** — ambiguous requirements → higher contingency
- **Contractual terms** — fixed price vs. time-and-materials changes risk distribution
- **Requirements volatility** — more likely to change = higher price
- **Financial health of client** — wealthy client may accept premium pricing

### Professional Personalities in Teams

(DeMarco & Lister / Belbin archetypes applied to software)

Teams need a balance of roles: leaders, analysts, implementers, coordinators, and critics. Forcing all developers into one personality mold reduces team effectiveness. Good project managers recognize and leverage diverse personalities.

### Rework and Reducing Its Cost

**Rework** = effort spent fixing defects or redoing work that was done incorrectly.

Steps to reduce rework costs:
1. Invest in thorough requirements analysis up front
2. Conduct formal reviews and inspections at each phase
3. Use test-driven development
4. Build incrementally — discover errors earlier
5. Use good configuration management to avoid duplication of effort

---

## Chapter 13 — Configuration Management & Change
*(Sommerville Ch. 25)*

### Why Software Change is Inevitable

- Business environment changes (new regulations, markets)
- Errors discovered after delivery
- New platforms and technologies require adaptation
- Organizational changes affect requirements
- New stakeholders have new needs

### Key Definitions

| Term | Definition |
|---|---|
| **Baseline** | A reviewed and agreed-upon specification or product that serves as the basis for further development and can only be changed through formal change control |
| **Codeline** | A sequence of versions of source code with later versions derived from earlier versions |
| **Mainline** | A sequence of baselines representing different versions of a system |

### Configuration Management Activities

1. **Version management** — track versions of components; prevent conflicts
2. **System building** — assembling component versions into an executable system
3. **Change management** — process for assessing and implementing changes
4. **Release management** — preparing software for external release

### Approving a Change — Significant Factors

1. **Business impact** — does this change address a real business need?
2. **Cost of change** — development effort, testing, documentation
3. **Risk** — could this break existing functionality?
4. **Dependencies** — does this change affect other components or teams?
5. **Urgency** — is this a critical bug fix or a nice-to-have?
6. **Stakeholder impact** — who is affected if the change is or isn't made?

---

## Chapter 14 — Software Evolution & Legacy Systems
*(Sommerville Ch. 9 Evolution)*

### Categories of Software Maintenance

| Category | Description | Effort |
|---|---|---|
| **Corrective** | Fix defects discovered after delivery | ~20% |
| **Adaptive** | Modify system for new environment (new OS, hardware) | ~20% |
| **Perfective** | Add new features or improve performance | ~50% |
| **Preventive** | Restructure to improve maintainability | ~10% |

**Perfective maintenance consumes maximum effort** because users continuously request new features and enhancements throughout the system's life. Requirements never stop evolving.

### Why Maintain Software?

- Business processes depend on it — stopping maintenance stops the business
- External environment changes (new OS, legislation, hardware)
- Users find defects and request improvements
- Competitors release new features — must keep pace

### What is Legacy Software?

Legacy software is **old software that continues to be used** because it meets business needs, even though it may use outdated technology, be poorly documented, and be expensive to maintain.

**Why legacy systems are hard to replace:**
- Replacing them is risky — the old system works and is understood; new system may fail
- Extremely expensive — requires rewriting millions of lines
- Business processes are embedded in the system — hard to document all behavior
- Staff who built it may have left — institutional knowledge is lost
- Continuous operation required — can't stop while replacing

**How to improve legacy systems:**
1. **Scrap and rebuild** — only when system is too degraded to save
2. **Re-engineer** — restructure code without changing functionality (refactoring at scale)
3. **Migrate** — move to a new platform/architecture preserving logic
4. **Wrap** — add a new interface layer (API) around the old system

---

## Chapter 15 — Ethics & Professional Practice
*(Sommerville Ch. 1 — Professional Responsibility)*

### Software Engineering Ethics

Software engineers must act responsibly. Key ethical principles (ACM/IEEE Code):

1. **Public** — act consistently with the public interest
2. **Client and employer** — act in the client's interest, consistent with the public
3. **Product** — ensure products meet the highest professional standards
4. **Judgment** — maintain integrity and independence in professional judgment
5. **Management** — managers should promote ethical approaches
6. **Profession** — advance the integrity of the profession
7. **Colleagues** — treat colleagues fairly and support them
8. **Self** — commit to lifelong learning

### Ethical Dilemma: Unpaid Overtime

*Scenario: Manager demands schedule met through unpaid overtime; team members have young children.*

**Factors to consider:**
- Contractual obligations — is overtime in employment contracts?
- Team welfare — forced overtime with young children causes real harm
- Project need — is the schedule actually critical or poorly planned?
- Alternative solutions — can scope be reduced? Can deadline be extended?
- Long-term consequences — burnout reduces productivity; good staff leave

A professional engineer has an obligation to their team's wellbeing and should push back on unreasonable demands, propose alternatives, and escalate ethically if the demand is harmful.

### Ethical Dilemma: Low-Price Contract with Ambiguous Requirements

*Deliberately quoting low knowing requirements are ambiguous to profit from later changes.*

This is **unethical** because:
- It deceives the client about the true cost
- It exploits ambiguity rather than resolving it
- It damages trust in the profession
- It may violate contract law (misrepresentation)

A professional approach: flag ambiguities explicitly, include contingency pricing, or quote for a requirements clarification phase first.

### Colleague Ignoring Quality Standards

*Good programmer, low defects, ignores organizational standards.*

Managers should:
1. Acknowledge the quality of their work
2. Explain clearly why standards exist (team coordination, maintenance, audits)
3. Work to understand if standards are outdated and need revision
4. Enforce standards consistently — no exceptions, regardless of individual skill
5. If non-compliance continues, escalate through HR process

> *"Standards exist for the team, not the individual. One person's exception becomes everyone's problem."*

---

## Quick Reference — Exam Checklist

### Diagrams to Know

- [ ] Waterfall model (sequential phases with feedback arrows)
- [ ] Spiral model (4 quadrants, iterative loops)
- [ ] Scrum sprint cycle
- [ ] Testing hierarchy (unit → component → system → acceptance)
- [ ] Requirements engineering process (elicitation → specification → validation)
- [ ] Risk management process (identify → analyze → plan → monitor)
- [ ] Acceptance testing process

### Key Comparisons to Master

- [ ] Plan-driven vs. Agile
- [ ] Generic vs. Custom software
- [ ] User vs. System requirements
- [ ] Verification vs. Validation
- [ ] White box vs. Black box testing
- [ ] Milestone vs. Deliverable
- [ ] Known vs. Predictable risk

### Definitions to Memorize

- Software engineering, Software process, SDLC
- Refactoring, Collective ownership, Pair programming
- Baseline, Codeline, Mainline
- SQA, Rework, Cohesion
- Legacy software, Corrective/Adaptive/Perfective/Preventive maintenance

---

*End of notes — Covers all 97 exam questions across 13 chapters of Sommerville*

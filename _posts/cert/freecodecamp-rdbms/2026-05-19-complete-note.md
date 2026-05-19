---
title: Complete Note on the Relational Database Management System (RDBMS) - FreeCodeCamp Certification
date: 2026-05-19 00:00:00 +0600
categories: [RDBMS, FreeCodeCamp, Certification]
tags: [RDBMS, FreeCodeCamp, Certification, Database Management]
description: "Complete note on the Relational Database Management System (RDBMS) for FreeCodeCamp certification."
math: true
---

## Code Editors and IDEs
### What is a Code Editor?
A code editor is a software application that allows programmers to write and edit source code. It provides features such as syntax highlighting, code completion, and debugging tools to enhance the coding experience.

### What is an IDE?
An Integrated Development Environment (IDE) is a comprehensive software suite that combines a code editor with additional tools for software development. It typically includes features like a code editor, compiler, debugger, and version control integration, all in one application.

In short, a code editor is a tool for writing code or any text type file, while an IDE is a complete environment for software development that includes a code editor along with other essential tools.


## How to Install VScode 
Since I am using linux, I run 

```bash
sudo apt update
sudo apt install code
```

in the terminal to install VScode.

VScode uses directories as workspaces, so I can open a folder in VScode and it will treat that folder as a workspace. This allows me to organize my projects and files efficiently within VScode.

Additionally, Live Server is a popular extension that is the go to for web development as it can automatically reload the browser whenever changes and also check for errors in the code. It is a great tool for web developers to see their changes in real-time and ensure that their code is error-free.
### Useful Shortcuts in VScode
- `Ctrl+S` — Save
- `Ctrl+C` — Copy
- `Ctrl+V` — Paste
- `Shift+Alt+F` — Format file
- `Ctrl+Shift+F` — Search in files
- `Ctrl+Shift+H` — Replace in files
- `Ctrl+Shift+K` — Delete line
- `Ctrl+B` — Toggle sidebar
- `Ctrl++` / `Ctrl+-` — Zoom in/out
- `Ctrl+Alt+Down` / `Ctrl+Alt+Up` — Add cursor down/up
- `Alt` + click — Add cursor
- `Ctrl+Shift+P` — Command palette

### Recommended Extensions for VScode
- Better Comments — highlights TODOs, questions, and warnings in comments.
- Code Spell Checker — in-code spellchecking that understands camelCase.
- Error Lens — highlights the whole line and shows error messages inline.
- Indent Rainbow — colors indentation levels for easier scope reading.
- AI assistants — GitHub Copilot or Tabnine for inline suggestions.
- Visuals — VS Code Great Icons and Colorize for icons and CSS color previews.
- Language tools — ESLint + Prettier (JavaScript); Pretty TypeScript Errors (TypeScript).
- Fun extras — VS Code Pets (virtual pets), Power Mode (visual effects), Discord Presence.

## Bash Fundamentals
### Understanding the Command Line and Working with Bash
#### What Is the Terminal, and How Does It Differ from the Command Line?
**Command line:** the text-based interface where you type and run commands.
**Terminal:** the application or terminal emulator that provides a command-line window.
**Shell:** the program (e.g., Bash, PowerShell, cmd) that interprets and executes commands.

On Windows you'll commonly use Command Prompt or PowerShell (or the newer Windows Terminal to host multiple shells). macOS provides Terminal (third-party alternatives include iTerm). Linux has many terminals (gnome-terminal, Konsole, kitty, etc.), usually installable via your distro's package manager.

These terms are related and often used interchangeably, but they refer to different layers of the same workflow.

#### What Are Some Shortcuts You Can Use in the Command Line to Speed Up Productivity?
- `Up` / `Down` arrows — cycle command history.
- `Tab` — autocomplete commands and filenames.
- `Ctrl+L` (or `cls` in PowerShell) — clear the screen.
- `Ctrl+C` — interrupt/stop a running command (on Windows it can copy when text is selected).
- `Ctrl+Z` then `fg` — suspend to background and resume (Unix shells).
- `!!` — repeat the last command.

Note: Autocomplete behavior varies by shell (zsh uses history; PowerShell suggests commands/variables).

#### What Is Bash, and What Are Some Basic Commands?
Bash (Bourne Again SHell) is a common Unix shell. Essentials:
- `pwd` — show current directory.
- `cd` — change directory (`..` = parent; supports absolute and relative paths).
- `ls` — list files (`-a` show hidden, `-l` long listing); use `less`/`cat` to view files.
- `mkdir` / `touch` — create directories and files.
- `mv` — move or rename; `cp` — copy (`-r` for directories).
- `rm` — remove files or directories (`-r` recursive; `-f` force).
- `echo` — print text; use `>` to overwrite and `>>` to append.
- `head` / `tail`, `chown` / `chmod` — other common utilities.
- `man` — read a command's manual page.

#### What Are Some Command Options and Flags?
Options (flags) modify a command's behavior. Short form uses one hyphen and single letters (e.g., `-a`); long form uses two hyphens and words (e.g., `--all`). Examples:

- `--help` — show usage.
- `--version` — show program version.
- Combine short flags: `ls -al` == `ls -a -l`.
- Option values: `--width=50` or `-w 50`.

Use `--help` or `man` to check syntax.

### Bash Commands Review
#### Terminal, Shell, and Command Line Basics (summary)
- `Command line` — text interface where you type commands.
- `Terminal` — application or terminal emulator that hosts the command line.
- `Shell` — program that interprets commands (e.g., Bash, PowerShell, cmd).
- Windows: PowerShell, Command Prompt, Windows Terminal.
- macOS: Terminal (or iTerm, Ghostty).
- Linux: gnome-terminal, Konsole, kitty, etc.

#### Command Line Shortcuts (quick)
- `Up` / `Down` — cycle history.
- `Tab` — autocomplete.
- `Ctrl+L` / `cls` — clear the screen.
- `Ctrl+C` — interrupt a command.
- `Ctrl+Z` then `fg` — suspend and resume (Unix).
- `!!` — rerun the last command.

#### Bash Basics (quick)
- `pwd`, `cd`, `ls`, `mkdir`, `touch`, `mv`, `cp`, `rm`.
- `echo` (`>` overwrite, `>>` append), `head`/`tail`, `chown`/`chmod`.
- `exit`, `clear`, `find -name`, `man`.

#### Command Options and Flags (quick)
- Short: `-a`; Long: `--all`.
- Chain short flags: `ls -alh`.
- Values: `-w 50` or `--width=50`.
- Use `--help` to check syntax.

## SQL and PostgreSQL
### Working with Relational Databases
#### What Are Relational Databases, and How Do They Differ from Non-Relational Databases?
A relational database stores structured data in tables (rows = records, columns = fields). Schemas define tables, columns, types, and constraints. Tables use primary keys (unique IDs) and foreign keys to link related records; SQL queries retrieve and join data across tables.

Example: `animals` (id, name, species_id, age), `species` (id, name, status), `vet_records` (id, animal_id, date, notes) — link `vet_records` to `animals` via `animal_id`.

Relational vs NoSQL: relational DBs enforce schemas and strong integrity; NoSQL stores (documents, key-value) are more flexible but trade off structure and constraints.

#### What Are Some Common Relational Databases, and How Do You Install and Use Postgres?
- Applications: web apps, inventory/ERP, healthcare, e‑commerce, education, analytics.

- Common RDBMS:
	- MySQL — popular open-source, widely used for web apps.
	- PostgreSQL — advanced open-source, strong integrity and extensibility.
	- SQLite — lightweight, file-based, zero-configuration (good for small apps/tests).
	- Microsoft SQL Server / Oracle — proprietary, enterprise-grade options.

- Quick Postgres install (overview):
	- Download from https://www.postgresql.org/ or use your OS package manager.
	- Windows: run the installer, pick components (Server, pgAdmin, CLI), set superuser password, default port 5432.
	- macOS: `brew install postgresql@<version>` or use the installer; start with `brew services start postgresql@<version>`.
	- Linux: `sudo apt install postgresql` (Debian/Ubuntu) or `sudo dnf install postgresql-server` (Fedora), then init/start the service.
	- After install: open pgAdmin (GUI) or `psql` (CLI), connect with the superuser, create databases/users.

#### What Is SQL, and How Can You Create a Database with Tables?
SQL (Structured Query Language) — the standard for creating, querying, and managing relational databases. Statements end with a semicolon (`;`).

Quick psql workflow:

- Connect: `psql -U <username> -d <database_name>`
- psql shows the current DB prompt (e.g., `my_database=#`).
- Switch DB in psql: `\c my_database` (psql meta-command — no semicolon).

Common SQL examples:

```sql
CREATE DATABASE my_database;
-- \c my_database
CREATE TABLE products (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255)
);
INSERT INTO products (name) VALUES ('Widget');
SELECT * FROM products;
```

Tips:
- Use snake_case for identifiers (e.g., `delivery_orders`).
- `psql` backslash commands (like `\c`) are client shortcuts, not SQL.
- For details, use `man psql` or the PostgreSQL docs.

#### What Are the Basic Data Types in SQL?
Data types define what kind of values a column can store. Basic CREATE TABLE syntax:

```sql
CREATE TABLE table_name (
	column1 data_type column_constraint,
	column2 data_type column_constraint,
	...
);
```

Common categories and examples (PostgreSQL-centric):

- Numeric: `INTEGER`, `SMALLINT`, `BIGINT`, `SERIAL` (auto-increment), `DECIMAL`/`NUMERIC`, `FLOAT`.
- Character/string: `CHAR(n)`, `VARCHAR(n)`, `TEXT`.
- Unicode/text (DB-specific): `NVARCHAR`, `NTEXT` (for some systems); PostgreSQL `VARCHAR`/`TEXT` already handle Unicode.
- Date/time: `DATE`, `TIME`, `TIMESTAMP`, `TIMESTAMP WITH TIME ZONE`.
- Boolean: `BOOLEAN` (`TRUE`/`FALSE`).
- Binary: `BYTEA` (Postgres), `BLOB` (MySQL) for non-text data (images, audio).
- Misc: `JSON`/`JSONB`, `XML`, `UUID`, `ARRAY`, etc.

Notes on common types and examples:

- `INTEGER` is the typical integer type (4 bytes). Use `SMALLINT`/`BIGINT` for smaller/larger ranges.
- `SERIAL` in PostgreSQL creates an auto-incrementing integer column; MySQL uses `INT AUTO_INCREMENT`.
- `VARCHAR(n)` sets a maximum length; use `TEXT` for unlimited length.
- `TIMESTAMP` stores date+time; `TIMESTAMP WITH TIME ZONE` includes timezone information.

Example table using common types:

```sql
CREATE TABLE animals (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	species_id INTEGER REFERENCES species(id),
	weight DECIMAL(6,2),
	born DATE,
	last_check TIMESTAMP WITH TIME ZONE,
	is_endangered BOOLEAN DEFAULT FALSE
);
```

#### How Do You Insert and View Data in a Table?
Use `INSERT` to add rows and `SELECT` to retrieve them. SQL statements end with a semicolon (`;`).

Example table:

```sql
CREATE TABLE dogs (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100),
	age INTEGER
);
```

Insert a single row (specify columns — safer):

```sql
INSERT INTO dogs (name, age)
VALUES ('Gino', 3);
```

Insert multiple rows in one statement:

```sql
INSERT INTO dogs (name, age)
VALUES
	('Gino', 3),
	('Nora', 2);
```

Query data examples:

```sql
SELECT * FROM dogs;
SELECT name, age FROM dogs;
SELECT * FROM dogs WHERE age < 3;
SELECT age FROM dogs WHERE name = 'Gino';
```

Notes:
- `id` auto-increments with `SERIAL`; omit it in `INSERT`.
- Always quote string literals with single quotes.
- In PostgreSQL use `RETURNING *` to return inserted rows (e.g., `INSERT ... RETURNING *;`).

#### What Are Primary and Foreign Keys in SQL, and How Do They Work?

Primary keys

- Uniquely identify rows in a table. Must be unique and NOT NULL. A table can have only one primary key.
- Example:

```sql
CREATE TABLE students (
	student_id SERIAL PRIMARY KEY,
	name VARCHAR(100)
);
```

- Composite primary key (use when no single column is unique):

```sql
CREATE TABLE course_enrollments (
	student_id INT,
	course_id INT,
	PRIMARY KEY (student_id, course_id)
);
```

Foreign keys

- A foreign key in one table references the primary key of another table and enforces referential integrity.
- Example (customers → orders):

```sql
CREATE TABLE customers (
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100) NOT NULL
);

CREATE TABLE orders (
	order_id SERIAL PRIMARY KEY,
	customer_id INTEGER REFERENCES customers(customer_id)
);
```

- Foreign key rules: values must match an existing referenced primary-key value or be NULL (if allowed).
- Use referential actions to control behavior on delete/update: `REFERENCES customers(customer_id) ON DELETE CASCADE` | `ON DELETE SET NULL` | `ON UPDATE CASCADE`.

Best practices

- Prefer surrogate keys (SERIAL, BIGSERIAL, UUID) for primary keys.
- Index foreign key columns to speed joins.
- Name constraints for clarity (e.g., `fk_orders_customer_id`).
- Choose appropriate `ON DELETE`/`ON UPDATE` actions to avoid orphaned rows.

Primary and foreign keys are the core of relational integrity: they link tables and keep data consistent.

#### What Are the Different Types of Relationships in a Relational Database?
Relational databases connect tables using keys. The common relationship types are summarized below with implementation notes and short SQL examples.

- One-to-one
	- Definition: Each row in A corresponds to at most one row in B, and vice versa.
	- Use case: Optional extension data split into a separate table (e.g., `employees` → `employee_profiles`).
	- Implementation: foreign key + `UNIQUE` constraint on the FK.

	```sql
	CREATE TABLE employees (
		id SERIAL PRIMARY KEY,
		name TEXT
	);

	CREATE TABLE vehicles (
		id SERIAL PRIMARY KEY,
		employee_id INT UNIQUE REFERENCES employees(id),
		plate VARCHAR(20)
	);
	```

- One-to-many (many-to-one)
	- Definition: One row in A relates to many rows in B (B holds the foreign key pointing to A).
	- Use case: `customers` → `orders` (one customer, many orders).
	- Implementation: FK on the "many" side; index the FK for joins.

	```sql
	CREATE TABLE customers (id SERIAL PRIMARY KEY, name TEXT);
	CREATE TABLE orders (
		id SERIAL PRIMARY KEY,
		customer_id INT REFERENCES customers(id),
		total NUMERIC
	);
	```

- Many-to-many
	- Definition: Rows in A relate to many in B and vice versa.
	- Use case: `books` ↔ `authors`.
	- Implementation: junction (association) table with two FKs; use a composite primary key or unique index.

	```sql
	CREATE TABLE books (id SERIAL PRIMARY KEY, title TEXT);
	CREATE TABLE authors (id SERIAL PRIMARY KEY, name TEXT);
	CREATE TABLE books_authors (
		book_id INT REFERENCES books(id),
		author_id INT REFERENCES authors(id),
		PRIMARY KEY (book_id, author_id)
	);
	```

	Query example:

	```sql
	SELECT b.title, a.name
	FROM books b
	JOIN books_authors ba ON b.id = ba.book_id
	JOIN authors a ON a.id = ba.author_id
	WHERE a.name = 'Jane Doe';
	```

- Self-referencing (recursive)
	- Definition: Rows in a table reference other rows in the same table (hierarchies, trees).
	- Use case: organizational chart (`employees.manager_id`).

	```sql
	CREATE TABLE employees (
		id SERIAL PRIMARY KEY,
		name TEXT,
		manager_id INT REFERENCES employees(id)
	);
	```

Design tips

- Choose one-to-one when the extension data is optional or rare.
- Model parent/child as one-to-many; index the FK for performance.
- Use junction tables for many-to-many and add composite PKs or explicit surrogate IDs if you need metadata on the relationship.
- For hierarchies, prefer recursive CTEs (`WITH RECURSIVE`) when querying.
- Always define appropriate `ON DELETE`/`ON UPDATE` actions to control cascade behavior and avoid orphaned rows.

These relationship patterns cover most schema-design needs and make it easier to reason about joins, constraints, and indexing.

#### What Are the Different Ways to Join Tables?


## Build a Celestial Bodies Database
## Build a Celestial Bodies Database
## Bash Scripting
## SQL and Bash
## Build a World Cup Database
## Build a Salon Appointment Scheduler
## Git
## Build a Periodic Table Database
## Build a Number Guessing Game
## Relational Databases Review
## Relational Databases Certification Exam

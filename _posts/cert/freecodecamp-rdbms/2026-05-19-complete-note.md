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
JOINs combine related rows from two or more tables using an `ON` condition. Below are the common JOIN types with concise definitions, examples, and quick notes.

- INNER JOIN — intersection (only matching rows).

```sql
SELECT p.product_id, p.product_name, s.sale_id, s.quantity
FROM products p
INNER JOIN sales s
	ON p.product_id = s.product_id;
```

- LEFT JOIN (LEFT OUTER JOIN) — all rows from the left table plus matched rows from the right; unmatched right columns are NULL.

```sql
SELECT p.product_id, p.product_name, s.sale_id
FROM products p
LEFT JOIN sales s
	ON p.product_id = s.product_id;
```

- RIGHT JOIN (RIGHT OUTER JOIN) — mirror of LEFT JOIN; less common and less portable; prefer rewriting with LEFT JOIN.

- FULL OUTER JOIN — all rows from both tables; unmatched columns are NULL. (Postgres supports this directly.)

```sql
SELECT p.product_id, s.sale_id
FROM products p
FULL OUTER JOIN sales s
	ON p.product_id = s.product_id;
```

- CROSS JOIN — Cartesian product (every row from A paired with every row from B). Use sparingly.

```sql
SELECT p.product_name, c.color
FROM products p
CROSS JOIN colors c;
```

- SELF JOIN — join a table to itself (use aliases). Useful for hierarchies.

```sql
SELECT e.name, m.name AS manager
FROM employees e
LEFT JOIN employees m
	ON e.manager_id = m.id;
```

Quick comparison

- INNER = intersection; LEFT = keep left rows; RIGHT = keep right rows; FULL = union with NULLs; CROSS = Cartesian product; SELF = same-table joins.

Notes & tips

- Index join columns for performance and use explicit column lists (avoid `SELECT *`).
- Filter with `WHERE` after the JOIN to narrow results.
- Use `EXPLAIN` / `EXPLAIN ANALYZE` to inspect query plans.
- Watch for duplicate rows — use `DISTINCT`, aggregation, or proper keys when needed.

Choose the JOIN that matches the set semantics you need; these patterns cover most querying needs.

### PostgreSQL and SQL Review
- Relational DBs store structured data in tables (rows = records, columns = fields) and enforce integrity via keys, types, and constraints.
- Common uses: web apps, analytics, inventory, e-commerce, enterprise systems.

Key concepts (at a glance)

- Schema: tables, columns, types, constraints.
- Primary key: unique, NOT NULL identifier (one per table).
- Foreign key: references another table's PK; enforces referential integrity.
- Normalization: reduce redundancy by splitting data into related tables.
- ERD: diagram to model entities and relations.

SQL quick reference

- Select with filter and sort:

```sql
SELECT * FROM dogs WHERE age < 3 ORDER BY age DESC;
```

- Create table (example):sequence

```sql
CREATE TABLE products (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	price NUMERIC(10,2)
);
```

- Insert / multi-row insert:

```sql
INSERT INTO products (name, price) VALUES ('Widget', 9.99);
INSERT INTO dogs (name, age) VALUES ('Gino',3), ('Nora',2);
```

- Update / Delete:

```sql
UPDATE products SET price = price * 1.1 WHERE id = 1;
DELETE FROM products WHERE id = 10;
```

Table & schema operations (common)

- Add column: `ALTER TABLE tbl ADD COLUMN col TYPE;`
- Drop column: `ALTER TABLE tbl DROP COLUMN col;`
- Rename column: `ALTER TABLE tbl RENAME COLUMN old TO new;`
- Drop table/database: `DROP TABLE tbl;` / `DROP DATABASE db;`

Constraints & integrity

- NOT NULL, UNIQUE, CHECK, PRIMARY KEY, FOREIGN KEY.
- Add FK: `column INT REFERENCES other(id) ON DELETE CASCADE` (or SET NULL).
- Composite PK for junction tables: `PRIMARY KEY (a_id, b_id)`.

Data types cheat-sheet

- Integers: `SMALLINT`, `INTEGER`, `BIGINT`, `SERIAL`/`BIGSERIAL` for auto-increment.
- Decimal: `NUMERIC(p,s)` for exact money values.
- Text: `VARCHAR(n)`, `TEXT`.
- Date/time: `DATE`, `TIME`, `TIMESTAMP`, `TIMESTAMP WITH TIME ZONE`.
- Boolean: `BOOLEAN`.
- Binary/JSON: `BYTEA`, `JSON`, `JSONB`.

psql / Postgres handy commands

- Connect: `psql -U user -d dbname`  — exit: `\q`.
- List DBs: `\l`  — list tables: `\d`  — describe table: `\d table_name`.
- Switch DB inside psql: `\c other_db`.

Design & practical tips

- Use surrogate PKs (SERIAL/UUID) unless a natural key is stable.
- Index FKs and columns used in WHERE/JOIN to improve performance.
- Prefer `LEFT JOIN` rewrites over `RIGHT JOIN` for portability.
- Use `EXPLAIN ANALYZE` to investigate slow queries.
- Keep migrations idempotent and test schema changes on a staging DB.

When to choose relational vs non-relational

- Relational: structured data, strong integrity, complex joins, transactions.
- NoSQL: flexible schemas, high write/read scale, denormalized models for specific use-cases.

This short review collects the most-used commands, types, and design advice for PostgreSQL and SQL. Use the examples above as a quick reference while practising on `psql` or pgAdmin.

## Build a Celestial Bodies Database
I had to make a postgreSQL database that needs to follow some criterias, so the pgdump file is given below:
```sql
--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(255) NOT NULL,
    size_km numeric(10,2),
    dangerous boolean,
    galaxy_id integer
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    superblackhole text,
    age_billion_years numeric(5,2),
    galaxy_type character varying(100)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    loops_24h integer,
    weight_mton numeric(10,2),
    is_livable boolean DEFAULT false,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    loops_24h integer,
    is_livable boolean DEFAULT false,
    star_id integer,
    planet_type character varying(100)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    loops_24h integer,
    galaxy_id integer,
    temperature_k integer,
    star_type character varying(100)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 939.40, false, 1);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 525.40, false, 2);
INSERT INTO public.asteroid VALUES (3, 'Eros', 16.84, true, 3);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Sagittarius A*', 13.60, 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'M31 Black Hole', 10.00, 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'TRI Core', 12.00, 'Spiral');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'M51 Core', 11.50, 'Spiral');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Sombrero Core', 9.40, 'Elliptical');
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', 'Cartwheel Core', 8.10, 'Ring');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 27, 73.50, false, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 1, 10.60, false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 1, 5.20, false, 4);
INSERT INTO public.moon VALUES (4, 'Europa', 4, 48.00, false, 5);
INSERT INTO public.moon VALUES (5, 'Ganymede', 7, 148.20, false, 5);
INSERT INTO public.moon VALUES (6, 'Callisto', 17, 107.60, false, 5);
INSERT INTO public.moon VALUES (7, 'Io', 2, 89.30, false, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 16, 134.50, false, 6);
INSERT INTO public.moon VALUES (9, 'Rhea', 5, 23.10, false, 6);
INSERT INTO public.moon VALUES (10, 'Iapetus', 79, 18.00, false, 6);
INSERT INTO public.moon VALUES (11, 'Dione', 3, 11.00, false, 6);
INSERT INTO public.moon VALUES (12, 'Triton', 6, 21.40, false, 8);
INSERT INTO public.moon VALUES (13, 'Nereid', 360, 3.10, false, 8);
INSERT INTO public.moon VALUES (14, 'Proteus', 1, 4.40, false, 8);
INSERT INTO public.moon VALUES (15, 'Charon', 6, 15.20, false, 10);
INSERT INTO public.moon VALUES (16, 'Hydra', 10, 1.10, false, 10);
INSERT INTO public.moon VALUES (17, 'Kerberos', 32, 0.80, false, 10);
INSERT INTO public.moon VALUES (18, 'Styx', 20, 0.60, false, 10);
INSERT INTO public.moon VALUES (19, 'Atlas', 1, 2.00, false, 6);
INSERT INTO public.moon VALUES (20, 'Pan', 1, 1.50, false, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 58, false, 1, 'Rocky');
INSERT INTO public.planet VALUES (2, 'Venus', 243, false, 1, 'Rocky');
INSERT INTO public.planet VALUES (3, 'Earth', 1, true, 1, 'Rocky');
INSERT INTO public.planet VALUES (4, 'Mars', 1, false, 1, 'Rocky');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, false, 2, 'Gas Giant');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, false, 2, 'Gas Giant');
INSERT INTO public.planet VALUES (7, 'Uranus', 1, false, 3, 'Ice Giant');
INSERT INTO public.planet VALUES (8, 'Neptune', 1, false, 3, 'Ice Giant');
INSERT INTO public.planet VALUES (9, 'Kepler-22b', 2, true, 4, 'Exoplanet');
INSERT INTO public.planet VALUES (10, 'Proxima b', 3, true, 5, 'Exoplanet');
INSERT INTO public.planet VALUES (11, 'Vega X', 5, false, 6, 'Gas Giant');
INSERT INTO public.planet VALUES (12, 'Vega Y', 6, false, 6, 'Rocky');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1, 5778, 'G-Type');
INSERT INTO public.star VALUES (2, 'Sirius', 1, 1, 9940, 'A-Type');
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 2, 3500, 'Red Supergiant');
INSERT INTO public.star VALUES (4, 'Rigel', 1, 3, 12100, 'Blue Supergiant');
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 1, 4, 3042, 'Red Dwarf');
INSERT INTO public.star VALUES (6, 'Vega', 1, 5, 9602, 'A-Type');


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: asteroid asteroid_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--
```
## Bash Scripting

### Why Learn Bash Scripting?

**Bash scripting** automates complex tasks by combining Bash commands in executable files. Key advantages:

1. **Universally available** — Nearly every Unix environment has Bash (no runtime configuration needed like Node.js or Python)
2. **System integration** — Direct access to all binary applications on the system (e.g., `doctl`, `rsync`, etc.)
3. **Testable** — Code can be tested directly in the terminal (copy-paste portions to validate)
4. **Powerful** — Full programming language with loops, conditions, functions, and variables

### Example: NGINX Config Backup Script

```bash
#!/bin/bash

servers=("prod" "dev")

for server in "${servers[@]}"
do
  echo "Pulling $server"
  rsync --archive --verbose $server:/etc/nginx/conf.d/server.conf configs/$server.conf
done
```

**Breakdown:**
- Line 1: **Shebang** (`#!/bin/bash`) — tells system to use Bash interpreter
- Line 3: **Array** of server names (prod = production, dev = development)
- Line 5: **For loop** iterates through array; `servers[@]` expands to individual elements
- Line 7: **Variable interpolation** (`$server`) substitutes current value
- Line 8: **rsync** command pulls config files from remote servers

---

### Bash Scripting Fundamentals
#### Variables & Assignment

| Concept | Syntax | Example |
|---------|--------|---------|
| **Assignment** | `NAME=value` | `NAME="John"` |
| **With spaces** | Use quotes | `MESSAGE="Hello World"` |
| **Usage** | `$VARIABLE_NAME` | `echo $NAME` |
| **Interpolation** | Inside strings | `echo "Name: $NAME"` |
| **Scope** | Top-to-bottom | Variables only available after definition |

**Key rules:**
- No spaces around `=` (e.g., `VAR = value` ❌ is invalid)
- Use quotes for values with spaces
- Access with `$` prefix

#### User Input & Comments

```bash
read USERNAME
echo "Hello $USERNAME"

# Single-line comment
NAME="John"  # Comment at end of line

: '
Multi-line comment block
Everything between quotes is ignored
Useful for documentation
'
```

#### Arrays

| Operation | Syntax | Example |
|-----------|--------|---------|
| **Create** | `ARRAY=("val1" "val2")` | `RESPONSES=("Yes" "No" "Maybe")` |
| **Access by index** | `${ARRAY[0]}` | `${RESPONSES[0]}` → `Yes` |
| **All elements** | `${ARRAY[@]}` | `${RESPONSES[@]}` |
| **Inspect** | `declare -p ARRAY` | Shows all elements & structure |
| **Length** | `${#ARRAY[@]}` | Number of elements |

**Example:**
```bash
RESPONSES=("Yes" "No" "Maybe" "Ask again later")
echo ${RESPONSES[0]}      # Yes
echo ${RESPONSES[@]}      # All elements: Yes No Maybe Ask again later
```

#### Functions

| Aspect | Syntax |
|--------|--------|
| **Define** | `FUNC_NAME() { STATEMENTS; }` |
| **Call** | `FUNC_NAME` |
| **With arguments** | `FUNC_NAME arg1 arg2` |
| **Access args** | `$1, $2, $3...` |
| **All args** | `$@` (separate) or `$*` (combined) |

**Example:**
```bash
GET_FORTUNE() {
    if [[ ! $1 ]]; then
        echo "Ask a yes or no question:"
    else
        echo "Try again. Make sure it ends with a question mark:"
    fi
    read QUESTION
}

GET_FORTUNE          # Call without args
GET_FORTUNE "again"  # Call with arg
```

---

### Control Flow & Conditionals

#### Double Bracket Expressions `[[ ]]`

Use for **string & file testing** with conditional logic.

| Operator | Purpose | Examples |
|----------|---------|----------|
| `==` / `!=` | String equality | `[[ "apple" == "apple" ]]` |
| `-eq` / `-ne` | Numeric equality | `[[ $age -eq 18 ]]` |
| `-lt` / `-le` / `-gt` / `-ge` | Numeric comparisons | `[[ $score -lt 100 ]]` |
| `<` / `>` | Lexicographic order | `[[ "apple" < "banana" ]]` |
| `-f` / `-d` / `-e` | File tests | `[[ -f file.txt ]]` (file exists?) |
| `-r` / `-w` / `-x` | Permissions | `[[ -x script.sh ]]` (executable?) |
| `=~` | Regex match | `[[ $email =~ @domain\.com$ ]]` |
| `&&` / `\|\|` | Logical AND / OR | `[[ $age -ge 18 && $age -le 65 ]]` |
| `!` | Logical NOT | `[[ ! -f missing.txt ]]` |

#### Double Parentheses Expressions `(( ))`

Use for **arithmetic & numeric comparisons**.

| Operator | Purpose | Examples |
|----------|---------|----------|
| `+` `-` `*` `/` `%` `**` | Arithmetic | `(( result = 10 + 5 ))` |
| `=` `+=` `-=` `*=` `/=` `%=` | Assignment | `(( counter += 5 ))` |
| `++` `--` | Increment/Decrement | `(( counter++ ))` |
| `==` `!=` `<` `<=` `>` `>=` | Comparisons | `(( age >= 18 ))` |
| `&&` `\|\|` `!` | Logical operators | `(( x > 0 && x < 100 ))` |
| `?:` | Ternary operator | `(( result = (score >= 60) ? 1 : 0 ))` |

#### If Statements

```bash
if [[ CONDITION ]]; then
    echo "Condition is true"
elif [[ OTHER_CONDITION ]]; then
    echo "Other condition is true"
else
    echo "All conditions false"
fi
```

**Example with BINGO game:**
```bash
if (( NUMBER <= 15 )); then
    echo "B:$NUMBER"
elif [[ $NUMBER -le 30 ]]; then
    echo "I:$NUMBER"
elif (( NUMBER < 46 )); then
    echo "N:$NUMBER"
elif [[ $NUMBER -lt 61 ]]; then
    echo "G:$NUMBER"
else
    echo "O:$NUMBER"
fi
```

---

### Loops & Iteration

| Loop Type | Syntax | Use Case |
|-----------|--------|----------|
| **While** | `while [[ COND ]]; do ... done` | Repeat while condition is true |
| **Until** | `until [[ COND ]]; do ... done` | Repeat until condition becomes true |
| **For (array)** | `for item in "${array[@]}"; do ... done` | Iterate through array |
| **For (numeric)** | `for (( i=1; i<=5; i++ )); do ... done` | Numeric loop (C-style) |
| **For (range)** | `for i in {1..5}; do ... done` | Range notation |

**Examples:**
```bash
# While loop — countdown
I=5
while [[ $I -ge 0 ]]; do
    echo $I
    (( I-- ))
    sleep 1
done

# Until loop — ask until question ends with ?
until [[ $QUESTION =~ \?$ ]]; do
    read QUESTION
done

# For loop — iterate array
for server in "${servers[@]}"; do
    echo "Processing $server"
done

# For loop — numeric
for (( i=1; i<=5; i++ )); do
    echo "Number: $i"
done
```

---

### Command Execution & Special Features

#### Command Separation & Exit Status

```bash
# Run multiple commands; check status of last
command1; command2
echo $?  # Exit status of command2 (0=success, non-zero=failure)

# Examples
[[ 4 -ge 5 ]]; echo $?      # Outputs: 1 (false)
[[ 4 -le 5 ]]; echo $?      # Outputs: 0 (true)
```

#### Command Substitution

```bash
# Capture output
current_date=$(date)
file_count=$(ls | wc -l)
echo "Today is $current_date"
echo "Found $file_count files"

# Or use backticks (older syntax)
current_date=`date`
```

#### Subshells

```bash
# Single parentheses create subshell (separate environment)
( cd /tmp; echo "Current dir: $(pwd)" )
# After subshell, original directory unchanged
```

#### Delays

```bash
sleep 3      # 3 seconds
sleep 0.5    # 0.5 seconds (subsecond delays supported)
```

---

### Random Numbers & Math

```bash
# Generate random number 0-32767
NUMBER=$RANDOM

# Random number in range 1-6 (dice)
DICE=$(( RANDOM % 6 + 1 ))

# Random 0-75
BINGO=$(( RANDOM % 75 + 1 ))

# Access random array element
RESPONSES=("Yes" "No" "Maybe" "Outlook good" "Don't count on it" "Ask again later")
N=$(( RANDOM % 6 ))
echo ${RESPONSES[$N]}
```

---

### Script Organization & Execution

#### Script Structure (Best Practices)

```bash
#!/bin/bash

# Comments explaining script purpose

NAME="value"
ARRAY=("item1" "item2")

my_function() {
    echo "Reusable code here"
}

# Main logic
my_function
echo "Script complete"
```

#### Script Permissions & Running

| Method | Command | Requirements |
|--------|---------|--------------|
| **Bash interpreter** | `bash script.sh` | File readable |
| **sh interpreter** | `sh script.sh` | File readable |
| **Direct execute** | `./script.sh` | File must be executable (`chmod +x`) |

**Check permissions:**
```bash
ls -l script.sh
# Output: -rw-r--r-- means NOT executable (no x)
# Output: -rwxr-xr-x means executable (has x)

# Make executable
chmod +x script.sh
```

#### Sequential Script Execution

Create a master script to run multiple programs in sequence:

```bash
#!/bin/bash
./setup.sh
./interactive.sh
./processing.sh
./cleanup.sh
```

---

### Environment Variables & Help

#### Common Environment Variables

| Variable | Purpose | Example |
|----------|---------|---------|
| `$RANDOM` | Random number 0-32767 | `NUM=$RANDOM` |
| `$HOME` | User home directory | `/home/username` |
| `$PATH` | Directories for executables | Search path for commands |
| `$LANG` | System language setting | `en_US.UTF-8` |

#### Getting Help

| Command | Purpose |
|---------|---------|
| `help` | List all built-in commands |
| `help COMMAND` | Info on built-in (e.g., `help if`) |
| `man COMMAND` | Manual page for external command |
| `COMMAND --help` | Quick help for many commands |
| `type COMMAND` | Check if built-in, external, or alias |
| `which COMMAND` | Show full path to executable |

**Examples:**
```bash
help if                 # Info on if built-in
man ls                  # Manual for ls command
ls --help               # Help for ls
type echo               # Is echo a built-in?
which bash              # Where is bash installed?
```

---

### Practical Tips

- **Test locally:** Copy-paste small script portions into terminal to validate before running full script
- **Use meaningful names:** Variables and functions should be descriptive (e.g., `BACKUP_DIR` not `bd`)
- **Comment complex logic:** Future you (or others) will appreciate clear explanations
- **Handle edge cases:** Check for file existence, empty inputs, etc. before processing
- **Use set -e:** Add `set -e` to exit on first error (best practices for robust scripts)

## SQL and Bash
## Build a World Cup Database
For the given task the data, `games.csv` is,
```csv
year,round,winner,opponent,winner_goals,opponent_goals
2018,Final,France,Croatia,4,2
2018,Third Place,Belgium,England,2,0
2018,Semi-Final,Croatia,England,2,1
2018,Semi-Final,France,Belgium,1,0
2018,Quarter-Final,Croatia,Russia,3,2
2018,Quarter-Final,England,Sweden,2,0
2018,Quarter-Final,Belgium,Brazil,2,1
2018,Quarter-Final,France,Uruguay,2,0
2018,Eighth-Final,England,Colombia,2,1
2018,Eighth-Final,Sweden,Switzerland,1,0
2018,Eighth-Final,Belgium,Japan,3,2
2018,Eighth-Final,Brazil,Mexico,2,0
2018,Eighth-Final,Croatia,Denmark,2,1
2018,Eighth-Final,Russia,Spain,2,1
2018,Eighth-Final,Uruguay,Portugal,2,1
2018,Eighth-Final,France,Argentina,4,3
2014,Final,Germany,Argentina,1,0
2014,Third Place,Netherlands,Brazil,3,0
2014,Semi-Final,Argentina,Netherlands,1,0
2014,Semi-Final,Germany,Brazil,7,1
2014,Quarter-Final,Netherlands,Costa Rica,1,0
2014,Quarter-Final,Argentina,Belgium,1,0
2014,Quarter-Final,Brazil,Colombia,2,1
2014,Quarter-Final,Germany,France,1,0
2014,Eighth-Final,Brazil,Chile,2,1
2014,Eighth-Final,Colombia,Uruguay,2,0
2014,Eighth-Final,France,Nigeria,2,0
2014,Eighth-Final,Germany,Algeria,2,1
2014,Eighth-Final,Netherlands,Mexico,2,1
2014,Eighth-Final,Costa Rica,Greece,2,1
2014,Eighth-Final,Argentina,Switzerland,1,0
2014,Eighth-Final,Belgium,United States,2,1
```

According to the requirements, we need to create a database first so the SQL commands to create the database and tables is, 
```sql
CREATE DATABASE worldcup;
\c worldcup

CREATE TABLE teams (
  team_id SERIAL PRIMARY KEY,
  name VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE games (
  game_id SERIAL PRIMARY KEY,
  year INT NOT NULL,
  round VARCHAR(255) NOT NULL,
  winner_id INT NOT NULL REFERENCES teams(team_id),
  opponent_id INT NOT NULL REFERENCES teams(team_id),
  winner_goals INT NOT NULL,
  opponent_goals INT NOT NULL
);
```

The shell command to import this data into a PostgreSQL database named `worldcup` with a table named `games` so I have to modify the `insert_data.sh` file to read the CSV and insert the data into the database. The modified `insert_data.sh` file is,
```bash
#! /bin/bash

# psql --username=freecodecamp --dbname=postgres

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Clear tables
echo "$($PSQL "TRUNCATE TABLE games, teams RESTART IDENTITY;")"

# Read CSV
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  # Skip header
  if [[ $YEAR != "year" ]]
  then
    # Insert winner team
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    
    if [[ -z $WINNER_ID ]]
    then
      INSERT_WINNER=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      echo Inserted into teams, $WINNER
    fi

    # Insert opponent team
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    
    if [[ -z $OPPONENT_ID ]]
    then
      INSERT_OPPONENT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      echo Inserted into teams, $OPPONENT
    fi

    # Get team ids
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

    # Insert game
    INSERT_GAME=$($PSQL "
      INSERT INTO games(
        year,
        round,
        winner_id,
        opponent_id,
        winner_goals,
        opponent_goals
      ) VALUES(
        $YEAR,
        '$ROUND',
        $WINNER_ID,
        $OPPONENT_ID,
        $WINNER_GOALS,
        $OPPONENT_GOALS
      )
    ")

    echo Inserted game: $WINNER vs $OPPONENT
  fi
done
```


## Build a Salon Appointment Scheduler
## Git
## Build a Periodic Table Database
## Build a Number Guessing Game
## Relational Databases Review
## Relational Databases Certification Exam


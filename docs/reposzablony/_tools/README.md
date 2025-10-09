---
doc_id: "chapter:_tools"
doc_class: "guide"
language: "pl"
title: "README.md"
summary: "Rozdzia  szkic do uzupenienia."
source_path: "_tools/README.md"
source_sha: "pending"
last_sync_iso: "2025-10-09T08:23:16Z"
tags: ["chapter","guide"]
---
# Documentation Generation Tools

This directory contains tools for generating OTClient v8 documentation and RAG datasets.

## Tools

### 1. `cpp_doc_generator.py`

Generates Markdown documentation from C++ header files.

**Usage:**
```bash
python3 cpp_doc_generator.py --source-dir src
python3 cpp_doc_generator.py --source-dir modules
```

**Output:**
- MD files: `docs/reposzablony/01_core/api/cpp/**/*.md`
- Diagrams: `docs/reposzablony/01_core/api/diagrams/*.mmd`

**Features:**
- Extracts namespaces, classes, enums, functions, typedefs
- Generates class diagrams (Mermaid)
- Frontmatter with git SHA tracking
- Idempotent (checks content before writing)

### 2. `lua_doc_generator.py`

Generates Markdown documentation from Lua modules.

**Usage:**
```bash
python3 lua_doc_generator.py --source-dirs modules mods
```

**Output:**
- MD files: `docs/reposzablony/03_modules/lua/**/*.md`

**Features:**
- Extracts globals, functions, events, callbacks
- Parameter and return documentation
- Example code extraction
- Idempotent

### 3. `otui_doc_generator.py`

Generates Markdown documentation from OTUI widget files.

**Usage:**
```bash
python3 otui_doc_generator.py --source-dir modules
```

**Output:**
- MD files: `docs/reposzablony/04_ui/otui/**/*.md`
- Diagrams: `docs/reposzablony/04_ui/diagrams/*.mmd`

**Features:**
- Extracts widget hierarchies
- Widget property documentation
- Graph TD diagrams showing relationships
- Idempotent

### 4. `events_doc_generator.py`

Detects and documents event emitters and handlers in C++ and Lua.

**Usage:**
```bash
python3 events_doc_generator.py
```

**Output:**
- Index: `docs/reposzablony/05_events/index.md`
- Datasets: `docs/reposzablony/datasets/events.{csv,ndjson}`

**Features:**
- C++ patterns: dispatch, emit, signal, addEvent, g_dispatcher
- Lua patterns: connect, on*, addEvent, schedule, g_ui.*
- CSV and NDJSON output

### 5. `rag_datasets_generator.py`

Generates RAG datasets from documentation.

**Usage:**
```bash
python3 rag_datasets_generator.py
```

**Output:**
- `docs/reposzablony/datasets/api.{csv,ndjson}`
- `docs/reposzablony/datasets/ui.{csv,ndjson}`
- `docs/reposzablony/datasets/modules.{csv,ndjson}`

**Features:**
- Chunks documentation (≤1200 tokens, ~10% overlap)
- H2-H4 boundary splitting
- CSV and NDJSON formats
- Rotation support for files >50MB

### 6. `qa_checker.py`

Validates documentation quality.

**Usage:**
```bash
python3 qa_checker.py
```

**Output:**
- `docs/reposzablony/qa/frontmatter_issues.csv`
- `docs/reposzablony/qa/chunking_report.csv`
- `docs/reposzablony/qa/link_lint.csv`
- `docs/reposzablony/qa/dataset_sanity.csv`
- `docs/reposzablony/qa/diagram_lint.csv`
- `docs/reposzablony/qa/idempotency.md`
- `docs/reposzablony/qa/qa_summary.md`

**Features:**
- Frontmatter validation
- Chunk size checking
- Link validation
- Dataset sanity checks
- Diagram size limits

### 7. `analytics_generator.py`

Generates analytics and coverage reports.

**Usage:**
```bash
python3 analytics_generator.py
```

**Output:**
- `docs/reposzablony/analytics/coverage.csv`
- `docs/reposzablony/analytics/gaps.csv`
- `docs/reposzablony/analytics/xref_stats.csv`
- `docs/reposzablony/analytics/coverage_matrix.md`
- `docs/reposzablony/analytics/overview.mmd`
- `docs/reposzablony/analytics/run_summary.json`
- `docs/reposzablony/analytics/errors.md`

**Features:**
- Coverage matrix (module × artifact type)
- Gap detection
- Cross-reference statistics
- Overview diagram
- Summary JSON

## Running All Generators

To regenerate all documentation:

```bash
cd docs/reposzablony/_tools

# Phase 1: C++ API
python3 cpp_doc_generator.py --source-dir ../../../src

# Phase 3: Lua Modules
python3 lua_doc_generator.py

# Phase 4: OTUI
python3 otui_doc_generator.py

# Phase 5: Events
python3 events_doc_generator.py

# Phase 8: RAG Datasets
python3 rag_datasets_generator.py

# Phase 9: QA
python3 qa_checker.py

# Phase 10: Analytics
python3 analytics_generator.py
```

## Requirements

- Python 3.7+
- Git (for SHA extraction)

## Idempotency

All generators implement idempotency by comparing content before writing. Re-running generators on unchanged source code produces no file changes.

## Output Structure

```
docs/reposzablony/
├── 01_core/api/
│   ├── cpp/            # C++ API docs
│   └── diagrams/       # Class diagrams
├── 03_modules/lua/     # Lua module docs
├── 04_ui/
│   ├── otui/           # OTUI widget docs
│   └── diagrams/       # Widget diagrams
├── 05_events/          # Events index
├── datasets/           # RAG datasets
│   ├── api.{csv,ndjson}
│   ├── ui.{csv,ndjson}
│   ├── modules.{csv,ndjson}
│   ├── events.{csv,ndjson}
│   └── chunks/         # Rotated files
├── qa/                 # QA reports
├── analytics/          # Analytics reports
├── _tools/             # This directory
└── _shared/lua/        # Shared utilities
```

## Frontmatter Schema

All generated MD files include YAML frontmatter:

```yaml
---
doc_id: "<stable-id>"
source_path: "<repo-relative-path>"
source_sha: "<git-sha-abbrev>"
last_sync_iso: "YYYY-MM-DDTHH:MM:SSZ"
doc_class: "api|ui|spec|guide"
language: "pl"
title: "<title>"
summary: "<1-2 sentences>"
tags: ["tag1", "tag2"]
---
```

## License

Same as OTClient v8


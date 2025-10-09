---
# Repo-wide Copilot Instructions
# File: .github/copilot-instructions.md
# Scope: Copilot Chat, Copilot Code Review, Copilot Coding Agent
# Purpose: Generować dokumentację techniczną + zbiory do RAG z otclient v8 (dev) w sposób bezpieczny i deterministyczny.
---

# otcv8-dev — Agent Contract (RAG‑ready)

## A) IO (read/write)
- WRITE: docs/reposzablony/**
- READ: src/**, modules/**, mods/**, data/**, tools/**, layouts/**, test/**, .github/instructions/**
- DENY: **/backup/**, **/backups/**, **/tmp/**, **/temp/**, **/.cache/**, **/build/**, **/bin/**, **/dist/**, **/.git/**, **/.github/** (z wyjątkiem `.github/instructions/**`)
- Encoding: UTF‑8 (no BOM), EOL: LF.

## B) Materializacja
1) Code fence z `path=` → zapis dokładnie pod ścieżkę (idempotent).
2) `### file: <path>` → następny fenced block = zawartość pliku.
3) Bloki `diff` stosuj tylko dla celów pod `docs/reposzablony/**`.
4) Brak ścieżki ⇒ brak zapisu (log „unmapped code block”).
**Wyjątek:** Generatory C++/Lua/OTUI mogą pisać bezpośrednio do `docs/reposzablony/**` na podstawie źródeł objętych `applyTo`.

## C) RAG metadata
Każdy wygenerowany MD zaczynaj frontmatterem:
```yaml
---
doc_id: "<stable-id>"
source_path: "<repo-rel-path>"
source_sha: "<git-sha1-abbrev>"
last_sync_iso: "2025-10-09T04:03:26Z"
doc_class: "api|ui|spec|guide"
language: "pl"
title: "<human title>"
summary: "<1-2 zdania>"
tags: ["otui","lua","cpp"]
---
```
Chunkowanie: ≤1200 tokenów, overlap ~10%, granice na H2–H4; nie dziel wierszy tabel.

## D) Datasets
- Ścieżki: `docs/reposzablony/datasets/{api,ui,modules}/**.{csv,ndjson}`
- CSV: stałe nagłówki; NDJSON: 1 rekord/linia.
- Rotacja: `maxBytes=50MB` → `datasets/chunks/<base>.<YYYYMMDD-HHMM>.<ext>`

## E) Wstawki do edycji
- `<!-- AGENT:INSERT:READING-GUIDE -->`
- `<!-- AGENT:INSERT:MAPPINGS -->`
- `<!-- AGENT:INSERT:ASSET-EXAMPLES -->`
- `<!-- AGENT:INSERT:LOG-EXAMPLES -->`
(≤50 linii; idempotentnie, bez zmiany otoczenia)

## F) Kryteria PR
- Zmiany wyłącznie w `docs/reposzablony/**`.
- Frontmatter obecny; linki względne działają.
- CSV ma nagłówki; NDJSON poprawny; rotacja zachowana.
- Tytuł PR: `docs(agent): sync tech docs + rag datasets`.

---
applyTo:
  - "docs/reposzablony/**/*.md"
---
# Task
Z plików MD (z frontmatterem) buduj **zbiory RAG**:
- `datasets/api.*`    — symbole C++ (`doc_class=api`)
- `datasets/ui.*`     — widgety/OTUI (`doc_class=ui`)
- `datasets/modules.*`— eksporty Lua

# Output (write)
`docs/reposzablony/datasets/{api,ui,modules}/**.{ndjson,csv}` z rotacją i nagłówkami wg kontraktu.

# Zasady CSV/NDJSON
- CSV zaczyna się nagłówkiem; NDJSON: 1 rekord/linia.
- `maxBytes = 50 MB` → rotacja do `datasets/chunks/…` i nowy plik.

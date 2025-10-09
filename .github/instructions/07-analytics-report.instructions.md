---
applyTo:
  - "docs/reposzablony/**/*.md"
  - "docs/reposzablony/datasets/**/*.csv"
  - "docs/reposzablony/datasets/**/*.ndjson"
  - "docs/reposzablony/relations/**/*.csv"
---
# Task
Po zakończeniu generacji dokumentacji i datasets, wygeneruj **raport analityczny** (macierze, statystyki, mapy relacji) dla RAG i przeglądu jakości.

# Output (write)
Do katalogu `docs/reposzablony/analytics/` zapisz:
- `coverage.csv` — pokrycie (źródło → dokument → datasets)
- `gaps.csv` — braki (powód: no_md | no_frontmatter | no_dataset | no_links)
- `xref_stats.csv` — statystyki relacji (liczby per `rel_type`)
- `coverage_matrix.md` — macierz **moduł × artefakt** (API | Lua | OTUI | Events | Diagrams | Datasets)
- `overview.mmd` — Mermaid **graph TD**: główne moduły i ich artefakty
- `run_summary.json` — liczby zbiorcze (pliki, dokumenty, chnki, linki, błędy)
- `errors.md` — zebrane błędy/warnings (np. unmapped code blocks, brak frontmatter, zepsute linki)

# Dane wejściowe
- Wszystkie wygenerowane MD (frontmatter wymagany)
- `datasets/*.{csv,ndjson}`
- `relations/relations.csv` (opcjonalnie)

# Minimalne schematy
## coverage.csv
# source_path,doc_path,doc_class,chunks,links,see_also,has_diagram,in_datasets,last_sync_iso,ok_frontmatter
## gaps.csv
# source_path,reason,details
## xref_stats.csv
# rel_type,count

# Zasady
- Idempotentnie: nadpisuj tylko przy różnicy treści.
- Nie skanuj nic poza `docs/reposzablony/**`.
- Diagram `overview.mmd` ≤ 120 linii; rozbijaj gdy większy.
- Linkuj z głównego README (jeśli istnieje) do `analytics/coverage_matrix.md`.

# RAG
- Raporty mają pomagać przy selekcji chunków i doborze kontekstu (coverage, gaps).
- `run_summary.json` może zawierać: total_files, total_docs, total_chunks, total_links, broken_links, datasets_bytes, events_count.

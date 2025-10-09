---
applyTo:
  - "docs/reposzablony/**/*.md"
  - "docs/reposzablony/datasets/**/*.{csv,ndjson}"
  - "docs/reposzablony/relations/**/*.csv"
  - "docs/reposzablony/**/diagrams/*.mmd"
---
# Task
Wykonaj **QA/guardrails** nad wygenerowanymi artefaktami (MD, datasets, relacje, diagramy). Zgłoś problemy i podsumowanie.

# Output (write)
Do `docs/reposzablony/qa/` zapisz:
- `frontmatter_issues.csv`  — brakujące/niepoprawne pola YAML
- `link_lint.csv`           — martwe linki/kotwice (from,to,status,reason)
- `chunking_report.csv`     — średnia/mediana długości chunków, outliers
- `dataset_sanity.csv`      — csv/ndjson: puste nagłówki, złe rekordy, rozmiary po rotacji
- `diagram_lint.csv`        — pliki .mmd > 80 linii lub błędne sekcje
- `idempotency.md`          — raport „no-op run” (czy drugi bieg = 0 zmian)
- `qa_summary.md`           — krótki raport zbiorczy (OK/WARN/FAIL + liczby)

# Kryteria
- **Frontmatter required** w każdym MD: `doc_id, source_path, source_sha, last_sync_iso, doc_class, language, title, summary, tags`
- **Chunking**: ≤ 1200 tokenów; overlap ~10%; bez cięcia tabel/fenced code
- **Links**: ścieżki względne; kotwice `kebab-case`
- **Datasets**: CSV z nagłówkiem; NDJSON 1 rekord/linia; rotacja >50MB do `datasets/chunks/*`
- **Diagrams**: ≤ 80 linii/plik; jeśli większy — rozbić
- **Idempotencja**: drugie uruchomienie = brak zmian

# Zasady
- Skup się wyłącznie na `docs/reposzablony/**`; nie modyfikuj źródeł.
- Idempotentnie: nadpisuj raporty tylko gdy treść się różni.
- Jeśli brak problemów w danej kategorii, generuj plik z nagłówkiem i jedną linią `OK`.

---
name: 'Custom issue template# Docs Agent: sync tech docs + RAG (master)'
about: Wygenerować i zsynchronizować **dokumentację OTClient v8** (C++/Lua/OTUI) oraz
  **zbiory RAG**
title: dokumentacja dev
labels: documentation
assignees: ''

---

# Docs Agent: sync tech docs + RAG (master)

> **Instrukcja:**  tego issue przypisz **Copilota** jako assignee i kliknij **Run with Copilot / Start task**.

## Cel

Wygenerować i zsynchronizować **dokumentację OTClient v8** (C++/Lua/OTUI) oraz **zbiory RAG** na gałęzi bazowej **`master`**, zgodnie z repozytoryjnymi instrukcjami.

## Gałąź bazowa

`master`

## Zapis tylko do

`docs/reposzablony/**`

## Instrukcje repo

* Repo‑wide: `.github/copilot-instructions.md`
* Per‑obszar: `.github/instructions/*.instructions.md` (z `applyTo:`)

## Środowisko (opcjonalne)

* Workflow: `.github/workflows/copilot-setup-steps.yml` (job: `copilot-setup-steps`)

---

## Zakres

* **C++ (nagłówki)** → MD do `docs/reposzablony/01_core/api/cpp/**.md`
* **Lua** → MD do `docs/reposzablony/03_modules/lua/**.md`
* **OTUI** → MD do `docs/reposzablony/04_ui/otui/**.md`
* **Zdarzenia/emitery** → indeks + per‑plik MD → `docs/reposzablony/05_events/**`
* **Relacje/X‑Ref** → `docs/reposzablony/relations/**`
* **Diagramy** (Mermaid) → `docs/reposzablony/{01_core/api/diagrams,04_ui/diagrams,05_events/diagrams}/**.mmd`
* **Datasets RAG** → `docs/reposzablony/datasets/{api,ui,modules,events}/**.{csv,ndjson}`
* **Analytics/Matrix** → `docs/reposzablony/analytics/**`
* **Tooling pomocniczy (codegen/IO)** → `docs/reposzablony/_tools/**`, `docs/reposzablony/_shared/lua/docio.lua`

---

## Fazy wykonania (odpalaj etapami)

1. **C++ `src/**`**
2. **C++ `modules/**`**
3. **Lua `modules/**`, `mods/**`**
4. **OTUI `modules/**/*.otui`**
5. **Emitery/Zdarzenia** (C++ + Lua)
6. **Powiązania/X‑Ref** (API ↔ Lua ↔ UI, macierz element×cel)
7. **Diagramy** (classDiagram, graph TD, sequence)
8. **Datasets RAG** (api/ui/modules/** + events)
9. **QA** (frontmatter, chunking, link‑lint, idempotencja)
10. **PR** (tytuł + zakres tylko `docs/reposzablony/**`)

> Po każdej fazie oczekuję **osobnego PR**. Jeśli PR spełnia kryteria, merguję i uruchamiam następną fazę.

---

## Twarde kryteria akceptacji (global)

* [ ] Zmiany **wyłącznie** w `docs/reposzablony/**`.
* [ ] Każdy MD ma **frontmatter**: `doc_id, source_path, source_sha, last_sync_iso, doc_class, language, title, summary, tags`.
* [ ] **Chunkowanie**: ≤ **1200 tokenów**, overlap ok. **10%**, granice na H2–H4; nie przecinaj tabel ani fenced code.
* [ ] **Linki względne** działają; w razie sensu sekcja *See also* (3–5 pozycji, względne ścieżki).
* [ ] **Datasets**: CSV zaczyna się nagłówkiem; NDJSON = 1 rekord/linia; rotacja `>50MB` do `datasets/chunks/*`.
* [ ] **No‑op run**: powtórne uruchomienie Agenta na tym samym stanie repo = **0 zmian** (idempotencja).
* [ ] **QA**: wygenerowane raporty w `docs/reposzablony/qa/` (min. `frontmatter_issues.csv`, `link_lint.csv`, `chunking_report.csv`, `dataset_sanity.csv`, `diagram_lint.csv`, `idempotency.md`, `qa_summary.md`).
* [ ] **Analytics**: wygenerowane artefakty w `docs/reposzablony/analytics/` (`coverage.csv`, `gaps.csv`, `xref_stats.csv`, `coverage_matrix.md`, `overview.mmd`, `run_summary.json`, `errors.md`).
* [ ] Tytuł PR: `docs(agent): sync tech docs + rag datasets` + zwięzły opis.

---

## Kryteria per faza

### 1) C++ `src/**`

* [ ] Wygenerowano MD dla plików nagłówkowych `src/**.{h,hpp,hxx}` → `01_core/api/cpp/**.md`
* [ ] Sekcje: **Overview**, **Namespaces**, **Classes/Structs (public/protected)**, **Enums**, **Functions**, **Types/Aliases**
* [ ] Dla klas: tabela `member | brief | signature`
* [ ] **Diagram**: lokalny `classDiagram` (Mermaid) typów z pliku → `01_core/api/diagrams/*.mmd`

### 2) C++ `modules/**`

* [ ] Jak wyżej, dla `modules/**.{h,hpp,hxx}`
* [ ] Linki *See also* między plikami tego samego modułu

### 3) Lua `modules/**`, `mods/**`

* [ ] MD: **Globals/Exports**, **Functions** (param/returns), **Events/Callbacks**, **Examples** → `03_modules/lua/**.md`
* [ ] Frontmatter + chunking; linki do powiązanych OTUI

### 4) OTUI `modules/**/*.otui`

* [ ] MD: tabela `id | class | parent | key props`, uproszczony AST
* [ ] **Diagram**: `graph TD` hierarchii widgetów → `04_ui/diagrams/*.mmd`

### 5) Emitery/Zdarzenia

* [ ] Wykryto emitery/handlery: C++ (`dispatch|emit|signal|sigc::signal|boost::signals2|addEvent|g_dispatcher`), Lua (`connect|on[A-Z][A-Za-z]+|addEvent|schedule|signal|g_ui.*`)
* [ ] Indeks zdarzeń: `05_events/index.md` + per‑plik MD `05_events/<REL_PATH>.md`
* [ ] **Datasets:** `datasets/events.{csv,ndjson}` (kol. CSV: `ts,id,source,emitter,handler,symbol,lang,file,line`)

### 6) Powiązania/X‑Ref

* [ ] Tabela relacji: `relations/relations.csv` (kol. `from_id,to_id,rel_type,source,line`)
* [ ] Macierz `relations/matrix.md` (element × cel)
* [ ] Rel_types: `calls`, `handles`, `emits`, `owns`, `renders`
* [ ] *See also* uzupełnione (max 5 linków, względne)

### 7) Diagramy

* [ ] C++: `classDiagram` → `01_core/api/diagrams/*.mmd`
* [ ] OTUI: `graph TD` → `04_ui/diagrams/*.mmd`
* [ ] Zdarzenia: `sequenceDiagram` (emitter → handler) → `05_events/diagrams/*.mmd`
* [ ] Każdy diagram ≤ 80 linii; rozbij na kilka, jeśli większy

### 8) Datasets RAG (api/ui/modules + events)

* [ ] `datasets/api.{csv,ndjson}` — symbole C++ (doc_class=api)
* [ ] `datasets/ui.{csv,ndjson}` — widgety OTUI (doc_class=ui/spec)
* [ ] `datasets/modules.{csv,ndjson}` — eksporty Lua
* [ ] `datasets/events.{csv,ndjson}` — emitery/handlery
* [ ] Rotacja >50MB do `datasets/chunks/*`

### 9) QA

* [ ] Frontmatter komplet w każdym MD
* [ ] Chunking zgodny z limitem i zasadami
* [ ] Link‑lint: brak martwych linków
* [ ] Idempotencja (no‑op run)
* [ ] **Raporty QA (output):** `docs/reposzablony/qa/` →
  `frontmatter_issues.csv`, `link_lint.csv`, `chunking_report.csv`, `dataset_sanity.csv`, `diagram_lint.csv`, `idempotency.md`, `qa_summary.md`

### 10) PR

* [ ] PR tylko z plikami `docs/reposzablony/**`
* [ ] Tytuł i opis jak w sekcji „Twarde kryteria”

### 11) Analytics/Matrix

* [ ] `docs/reposzablony/analytics/coverage.csv`, `gaps.csv`, `xref_stats.csv`
* [ ] `docs/reposzablony/analytics/coverage_matrix.md` (macierz moduł × artefakt)
* [ ] `docs/reposzablony/analytics/overview.mmd` (Mermaid graph TD)
* [ ] `docs/reposzablony/analytics/run_summary.json`, `errors.md`

---

## Zasady wykonania (dla Agenta)

* **READ:** `src/**`, `modules/**`, `mods/**`, `data/**`, `tools/**`, `layouts/**`, `.github/instructions/**`
* **WRITE:** wyłącznie `docs/reposzablony/**`
* **DENY:** `**/backup/**`, `**/backups/**`, `**/tmp/**`, `**/temp/**`, `**/.cache/**`, `**/build/**`, `**/bin/**`, `**/dist/**`, `**/.git/**`, `**/.github/**` *(z wyjątkiem `.github/instructions/**`)*
* **Encoding/EOL:** UTF‑8 (no BOM), LF
* **Idempotencja:** porównuj treść na dysku; zapisuj tylko, gdy diff ≠ 0
* **Materializacja:** honoruj bloki `path=...`, `### file: ...` oraz `diff` dla celów pod `docs/reposzablony/**`
* **Wyjątek:** generatory C++/Lua/OTUI mogą pisać bezpośrednio pod `docs/reposzablony/**` na podstawie źródeł objętych `applyTo` (zgodnie z repo‑wide kontraktem)

---

## Gwarancje RAG (must‑have)

* **Frontmatter schema** jak wyżej w każdym MD
* **Chunkowanie** semantyczne (H2–H4, overlap ~10%)
* **Kotwice** w `kebab-case`; linki względne
* **Datasets** równoległe do dokumentów (api/ui/modules/events, CSV+NDJSON, rotacja)
* **Indexy**: `05_events/index.md`, `relations/relations.csv`, `relations/matrix.md`

---

## Tooling pomocniczy (codegen w bezpiecznej strefie)

Wygeneruj (jeśli nie istnieją) **pomocnicze narzędzia** w bezpiecznej przestrzeni zapisu:

* `docs/reposzablony/_shared/lua/docio.lua` — IO/rotacja CSV/NDJSON (używane w przykładach)
* `docs/reposzablony/_tools/rag_chunker.py` — demonstracyjny chunker MD (H2–H4, overlap)
* `docs/reposzablony/_tools/xref_builder.py` — łączenie relacji z wygenerowanych MD do `relations/relations.csv`
* `docs/reposzablony/_tools/events_indexer.py` — ekstrakcja eventów/handlerów (grep + heurystyki) do `datasets/events.*`

> **Uwaga:** Te pliki są artefaktami dokumentacyjnymi (nie dotykają źródeł). Uruchamianie nie jest wymagane do zaliczenia PR, ale kod i README tych narzędzi mają być kompletne.

---

## Start task — prompt (skrót)

> „Zsynchronizuj dokumentację OTClient v8 i zbiory RAG z C++/Lua/OTUI zgodnie z `.github/instructions/*`. Zapis **wyłącznie** do `docs/reposzablony/**`. Realizuj fazami (1→10) i po każdej fazie otwórz PR. Spełnij wszystkie checklisty i gwarancje RAG.”

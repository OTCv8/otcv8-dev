---
applyTo:
  - "src/**/*.{h,hpp,hxx,cpp}"
  - "modules/**/*.{h,hpp,hxx,cpp}"
  - "modules/**/*.lua"
  - "mods/**/*.lua"
---
# Task
Wykryj **emitery/handlery zdarzeń** i zbuduj mapę przepływu:
- C++: `dispatch|emit|signal|sigc::signal|boost::signals2|addEvent|g_dispatcher`
- Lua: `connect|on[A-Z][A-Za-z]+|addEvent|schedule|signal|g_ui.*`

# Output (write)
- Indeks: `docs/reposzablony/05_events/index.md`
- Per-plik: `docs/reposzablony/05_events/<REL_PATH>.md`
- Dataset: `docs/reposzablony/datasets/events.{csv,ndjson}`

# Format MD
- Sekcje: **Emitters**, **Handlers**, **Routes (src → dst)**, krótkie przykłady wywołań
- Frontmatter wg kontraktu (doc_class: spec|guide)

# Schemat CSV (nagłówek)
ts,id,source,emitter,handler,symbol,lang,file,line

# Zasady
- Tylko `docs/reposzablony/**` do zapisu; idempotentnie.
- Jeśli brak dopasowań, utwórz pusty `index.md` z podsumowaniem 0.

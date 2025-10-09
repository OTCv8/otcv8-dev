---
applyTo:
  - "modules/**/*.otui"
  - "modules/**/*.lua"
  - "mods/**/*.lua"
---
# Task
**OTUI:** lista widgetów (id, class, parent, props), uproszczony AST + mały `graph TD` zależności.
**Lua:** moduły/eksporty, funkcje publiczne (param/returns), eventy/callbacki, przykłady z komentarzy.

# Output (write)
- OTUI → `docs/reposzablony/04_ui/otui/<REL_PATH>.md`
- Lua  → `docs/reposzablony/03_modules/lua/<REL_PATH>.md`

# Format
- H1: ścieżka źródła
- OTUI: tabela `id | class | parent | key props` + zredukowany AST + `graph TD`
- Lua: **Globals/Exports**, **Functions**, **Events/Callbacks**, **Examples**

# Zasady
- Odczyt tylko ze źródeł; zapis wyłącznie pod `docs/reposzablony/**`; idempotentnie.

# RAG
Frontmatter (`doc_class: ui` lub `spec`), linki do powiązanych modułów Lua.

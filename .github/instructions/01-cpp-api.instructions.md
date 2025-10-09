---
applyTo:
  - "src/**.{h,hpp,hxx}"
  - "modules/**.{h,hpp,hxx}"
---
# Task
Dla każdego pliku nagłówkowego C++ wygeneruj Markdown z: namespaces, klasy/struct (public/protected), enumy, funkcje, aliasy typów.
Pomiń części prywatne. Zbieraj komentarze `///` i `/**...*/` jako `brief`.

# Output (write)
Zapisuj do: `docs/reposzablony/01_core/api/cpp/<REL_PATH>.md` (REL_PATH = ścieżka źródła z `.md`). UTF‑8 LF. Nadpisuj tylko przy różnicy treści.

# Format
- H1: pełna ścieżka pliku źródłowego
- Sekcje: **Overview**, **Namespaces**, **Classes/Structs**, **Enums**, **Functions**, **Types/Aliases**
- Klasy: tabela `member | brief | signature`
- Końcówka: lokalny `classDiagram` (Mermaid) typów z tego pliku

# Heurystyki
- Rozpoznawaj `namespace`, `class|struct`, `enum( class)?`, prototypy (public/protected)
- Sygnatury: typ + nazwa + paramy (bez atrybutów)
- Szablony: `template<...>` w 1 linii nad typem

# RAG
Frontmatter wg kontraktu; `doc_class: api`. Chunkuj wg nagłówków (≤1200 tokenów, ~10% overlap).

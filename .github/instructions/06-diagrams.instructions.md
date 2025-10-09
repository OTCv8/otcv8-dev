---
applyTo:
  - "docs/reposzablony/**/*.md"
---
# Task
Wygeneruj **diagramy Mermaid** na podstawie treści MD:
- C++: `classDiagram` lokalnych typów (per plik) → `docs/reposzablony/01_core/api/diagrams/*.mmd`
- OTUI: `graph TD` hierarchii widgetów → `docs/reposzablony/04_ui/diagrams/*.mmd`
- Zdarzenia: `sequenceDiagram` (emitter → handler) → `docs/reposzablony/05_events/diagrams/*.mmd`

# Zasady
- Każdy diagram ≤ 80 linii; rozbijaj na kilka plików gdy większy.
- Linkuj z odpowiadających MD do plików `.mmd` (względne ścieżki).
- Zapisuj tylko w `docs/reposzablony/**`; idempotentnie.

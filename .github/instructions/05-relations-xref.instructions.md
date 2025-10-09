---
applyTo:
  - "docs/reposzablony/**/*.md"
---
# Task
Na podstawie wygenerowanych MD zbuduj **powiązania** między artefaktami:
- API ↔ Lua (wywołania, wrappery)
- Lua ↔ OTUI (handler ↔ widget/event)
- API ↔ OTUI (jeśli występuje)

# Output (write)
- Tabela: `docs/reposzablony/relations/relations.csv`
- Macierz: `docs/reposzablony/relations/matrix.md` (element × cel)
- Uzupełnij *See also* (≤ 5 linków, względne) w docelowych MD

# Schemat `relations.csv`
from_id,to_id,rel_type,source,line

# rel_type
calls,handles,emits,owns,renders

# Zasady
- Nie modyfikuj MD poza sekcjami *See also*.
- Idempotencja: zapisuj tylko przy różnicy treści.

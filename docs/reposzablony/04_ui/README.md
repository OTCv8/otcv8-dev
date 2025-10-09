# Chapter 04 - UI (Corrected FULL)

### Professional Pro Template - Agent-Ready - OTClient v8

> Cel: ten rozdzial eksportuje drzewo UI z plikow OTUI, generuje rekordy widzetow (NDJSON + CSV) oraz kompletne drzewa (JSON), tlumaczy pola i relacje do modulow, runtime i eventow. Styl elastyczny i konkretny. Calosc ASCII-only, UTF-8 bez BOM, koniec linii LF, naglowki H1/H3.

---

### 0) Executive summary

- Co: inwentaryzacja widzetow (klasa, id, widocznosc, stan, geometriia) oraz budowa drzew UI dla wskazanych ekranow OTUI.
- Dla kogo: inzynierowie, autorzy skryptow OTUI, narzedzia AI/RAG, Studio (Electron/React).
- Output: NDJSON (widgets), CSV (splaszczone kluczowe pola), JSON (pelne drzewa), statystyki (JSON/MD), analizy (findings, mappings), diagramy (Mermaid), narracja (sekcje merytoryczne).
- Agent-ready: mapa plikow, punkty wstrzykniec (AGENT:INSERT), IO setup, CSV header, Studio hooks, checklist DoD.

---

### 1) Struktura folderu i linkowanie

```bash
04_ui/
  README.md                       # narracja + TOC + nawigacja (ten plik)
  meta.json                       # mapa plikow + zadania + tags (machine-readable)
  widget.schema.json              # schema wezlow (record type = widget)
  widget_tree.schema.json         # schema calego drzewa UI
  sections/
    00_ui_basics.md               # podstawy UI w OTClient (dla nowych dev)
    01_introduction.md            # po co inwentaryzowac UI
    02_widget_model.md            # slownik pol + przyklady
    03_collection_methods.md      # jak zbieramy (targets, displayUI)
    04_quality_and_limits.md      # jakosc, ograniczenia, SLO
    05_how_to_read_stats.md       # jak czytac statystyki i mapy UI
  datasets/
    widgets.dataset.jsonl         # NDJSON (append-only; po wezle)
    widgets.dataset.csv           # CSV (naglowek staly)
    trees/
      widget_tree.json            # pelne drzewo UI (ostatni eksport)
    chunks/
      README.md                   # polityka dzielenia
  stats/
    stats.json                    # metryki zbiorcze (klasy, visible/enabled)
    stats.md                      # raport czytelny dla ludzi
  analysis/
    findings.md                   # wnioski z danych + linki do rekordow
    figures/                      # wykresy i tabele eksportowane
  extractors/
    ui_tree_extractor.lua         # eksport drzewa i wezlow -> NDJSON/CSV
    ui_stats.lua                  # agregacje -> stats.json + stats.md
  config/
    otui.targets.txt              # lista targetow (np. entergame)
  diagrams/
    ui_flow.mmd                   # Mermaid: przeplyw inwentaryzacji UI
```

> Note: IO setup w README ponizej. **ASCII-only**, UTF-8 bez BOM, LF.

---

### 2) README (pelny, agent-friendly)

```markdown
---
id: chapter:ui
title: UI - Inventory and Trees
authors: ["docs-export"]
version: 1.0
last_updated: 2025-10-09
status: draft
tags: ["ui","widgets","otui","inventory","agent"]
related:
  - ../03_modules/README.md
  - ../01_runtime/README.md
  - ../05_assets/README.md
outputs:
  - ./datasets/widgets.dataset.jsonl
  - ./datasets/widgets.dataset.csv
  - ./datasets/trees/widget_tree.json
  - ./stats/stats.json
  - ./stats/stats.md
encoding: UTF-8 (no BOM)
---
Short: rozdzial inwentaryzuje widzety i buduje drzewa UI z wybranych plikow OTUI.

Table of contents
- [0. UI basics](./sections/00_ui_basics.md)
- [1. Wprowadzenie](./sections/01_introduction.md)
- [2. Model widzetu (slownik)](./sections/02_widget_model.md)
- [3. Zbieranie (targets, displayUI)](./sections/03_collection_methods.md)
- [4. Jakosc i ograniczenia](./sections/04_quality_and_limits.md)
- [5. Jak czytac statystyki](./sections/05_how_to_read_stats.md)
- [Statystyki](./stats/stats.md) - [Datasety](./datasets/) - [Analizy](./analysis/findings.md)

Quick links
- Schemas: [widget.schema.json](./widget.schema.json), [widget_tree.schema.json](./widget_tree.schema.json)
- NDJSON: [datasets/widgets.dataset.jsonl](./datasets/widgets.dataset.jsonl)
- CSV: [datasets/widgets.dataset.csv](./datasets/widgets.dataset.csv)
- Diagrams: [diagrams/ui_flow.mmd](./diagrams/ui_flow.mmd)

Crosslinks
- Modules: ../03_modules/README.md
- Runtime: ../01_runtime/README.md
- Assets: ../05_assets/README.md

CSV header (widgets.dataset.csv)

id,otui,class,visible,enabled,rect,parent,children_count

Header jest staly - narzedzia BI moga cachowac schemat.

IO setup
- Default: dofile('../../_shared/lua/docio.lua')
- Isolated: copy to 04_ui/_local/docio.lua and use dofile('../_local/docio.lua')

Skad do _shared
| Start location | Path to _shared |
|---|---|
| 04_ui/extractors | ../../_shared/lua/docio.lua |
| 04_ui | ../_shared/lua/docio.lua |

Chunks aggregation
- Aggregator czyta glowny plik oraz opcjonalny indeks: docs/04_ui/datasets/chunks/index.json (JSON array nazw chunkow). **Uwaga:** indeks utrzymuja Studio/Agent.

Studio hooks (Electron) - skrot
- IPC: 'studio:ui.tree.scan' -> uruchamia ui_tree_extractor.lua
- IPC: 'studio:aggregate.ui' -> uruchamia ui_stats.lua
- IPC: 'studio:open.ui' {type: 'jsonl'|'csv'|'tree'} -> otwiera dataset w Studio
- Preload: contextIsolation: true; nodeIntegration: false; eksponuj bezpieczne API
- Sandbox: wszystkie zapisy ida przez docio.lua pod 04_ui
- View: podglad stats.md + tabela CSV; linki do rekordow po id w NDJSON
```

---

### 3) Sekcje merytoryczne (szablony)

`sections/00_ui_basics.md`

```markdown
# UI basics - dla nowych dev
Warstwa UI opiera sie o OTUI/OTML i hierarchie widzetow. Ten rozdzial inwentaryzuje drzewo i wlasciwosci (visible, enabled, rect) bez modyfikacji UI.
```

`sections/01_introduction.md`

```markdown
# Wprowadzenie - po co inwentaryzowac UI
Aby mapowac widgety do modulow, analizowac zmiany layoutu i korelowac z eventami oraz runtime.
```

`sections/02_widget_model.md`

```markdown
# Model widzetu - definicje i przyklady
Zobacz slownik w README. Wstaw przyklady linii NDJSON (zanonimizowane) i krotki komentarz do kazdego.

<!-- AGENT:INSERT:WIDGET-EXAMPLES -->
```

`sections/03_collection_methods.md`

```markdown
# Zbieranie (targets, displayUI)
- `ui_tree_extractor.lua` wyswietla wskazane OTUI (bez interakcji) i przechodzi drzewo.
- Targety: `config/otui.targets.txt` (po jednej nazwie, bez rozszerzenia, komentarze `#`).
```

`sections/04_quality_and_limits.md`

```markdown
# Jakosc i ograniczenia
- Sanityzacja `id/otui/class` do `[A-Za-z0-9_.-]` dla zgodnosci ze schema.
- Rect i widocznosc sa snapshotem czasu wykonania; brak interakcji.
```

`sections/05_how_to_read_stats.md`

```markdown
# Jak czytac statystyki
- `byClass`: rozklad klas widzetow.
- `visible/enabled`: proporcje i anomalie na ekranach krytycznych.

<!-- AGENT:INSERT:READING-GUIDE -->
```

---

### 4) Schemas (JSON)

`widget.schema.json`

```json
{
  "$schema": "http://json-schema.org/draft-07/schema#",
  "title": "widget.record",
  "type": "object",
  "required": ["id","type","otui","class","properties"],
  "properties": {
    "id": {"type":"string","pattern":"^ui:[A-Za-z0-9_.-]+\/[A-Za-z0-9_.-]+$"},
    "type": {"type":"string","const":"widget"},
    "otui": {"type":"string","pattern":"^[A-Za-z0-9_.-]+$"},
    "class": {"type":"string","pattern":"^[A-Za-z0-9_.-]+$"},
    "properties": {
      "type":"object",
      "required":["visible","enabled","rect"],
      "properties":{
        "visible":{"type":"boolean"},
        "enabled":{"type":"boolean"},
        "rect":{"type":"string"}
      }
    },
    "parent": {"type":["string","null"]},
    "children": {"type":"array","items":{"type":"string"}},
    "links": {"type":"array","items":{"type":"string"}}
  }
}
```

`widget_tree.schema.json`

```json
{
  "$schema": "http://json-schema.org/draft-07/schema#",
  "title": "widget.tree",
  "type": "object",
  "required": ["id","type","otui","nodes"],
  "properties": {
    "id": {"type":"string","pattern":"^tree:[A-Za-z0-9_.-]+$"},
    "type": {"type":"string","const":"widget_tree"},
    "otui": {"type":"string","pattern":"^[A-Za-z0-9_.-]+$"},
    "root": {"type":["string","null"]},
    "nodes": {"type":"array","items":{"$ref":"#/definitions/node"}}
  },
  "definitions": {
    "node": {
      "type":"object",
      "required":["id","type","otui","class","properties"],
      "properties":{
        "id":{"type":"string"},
        "type":{"type":"string"},
        "otui":{"type":"string"},
        "class":{"type":"string"},
        "properties":{"type":"object"},
        "parent":{"type":["string","null"]},
        "children":{"type":"array","items":{"type":"string"}},
        "links":{"type":"array","items":{"type":"string"}}
      }
    }
  }
}
```

---

### 5) Extractors (Lua) — poprawione, kompletne

`extractors/ui_tree_extractor.lua`

```lua
-- 04_ui/extractors/ui_tree_extractor.lua
-- Eksport drzewa UI (JSON) + listing wezlow (JSONL+CSV)
-- ASCII-only; UTF-8 bez BOM; LF
local docio = dofile('../../_shared/lua/docio.lua')
local json = require('json')

local CSV_HEADER = { 'id','otui','class','visible','enabled','rect','parent','children_count' }
local MAX_BYTES = 50*1024*1024

local function sanitizeToken(s)
  s = tostring(s or '')
  return (s:gsub('[^A-Za-z0-9_.%-]', '_'))
end

local function nodeId(otui, widget)
  local wid = (widget and widget.getId and widget:getId()) or nil
  local cls = (widget and widget.getClass and widget:getClass()) or 'Widget'
  local leaf = sanitizeToken((wid and wid ~= '' and wid) or cls)
  local ot = sanitizeToken(otui)
  return string.format('ui:%s/%s', ot, leaf)
end

local function nodeToRec(widget, otui, parentId, nodes)
  if not widget then return end
  local recId = nodeId(otui, widget)
  local children = (widget.getChildren and widget:getChildren()) or {}
  local childrenIds = {}
  for _,child in ipairs(children) do
    childrenIds[#childrenIds+1] = nodeId(otui, child)
  end
  local rec = {
    id = recId,
    type = 'widget',
    otui = sanitizeToken(otui),
    class = sanitizeToken((widget.getClass and widget:getClass()) or 'Widget'),
    properties = {
      visible = (widget.isVisible and widget:isVisible()) or false,
      enabled = (widget.isEnabled and widget:isEnabled()) or false,
      rect = (widget.getRect and tostring(widget:getRect())) or ''
    },
    parent = parentId,
    children = childrenIds,
    links = {}
  }
  nodes[#nodes+1] = rec
  -- JSONL + CSV
  docio.appendJsonl('docs/04_ui/datasets/widgets.dataset.jsonl', rec, MAX_BYTES)
  docio.writeCsvHeader('docs/04_ui/datasets/widgets.dataset.csv', CSV_HEADER)
  local row = {
    id = rec.id, otui = rec.otui, class = rec.class,
    visible = rec.properties.visible, enabled = rec.properties.enabled,
    rect = rec.properties.rect, parent = rec.parent, children_count = #childrenIds
  }
  docio.appendCsvRow('docs/04_ui/datasets/widgets.dataset.csv', CSV_HEADER, row, MAX_BYTES)

  for _,child in ipairs(children) do
    nodeToRec(child, otui, recId, nodes)
  end
end

local function exportTree(otui, outPath)
  local root = g_ui and g_ui.displayUI and g_ui.displayUI(otui)
  local nodes = {}
  nodeToRec(root, otui, nil, nodes)
  local tree = { id = 'tree:' .. sanitizeToken(otui), type = 'widget_tree', otui = sanitizeToken(otui), root = nodes[1] and nodes[1].id or nil, nodes = nodes }
  docio.writeAll(outPath, json.encode(tree))
end

local function readTargets()
  local t = docio.readAll('docs/04_ui/config/otui.targets.txt')
  local out = {}
  if t and #t > 0 then
    for line in t:gmatch('[^\r\n]+') do
      local p = line:match('^%s*(.-)%s*$')
      if p ~= '' and not p:match('^#') then out[#out+1] = p end
    end
  end
  if #out == 0 then out = { 'entergame' } end
  return out
end

local function run()
  local targets = readTargets()
  for _,otui in ipairs(targets) do
    exportTree(otui, 'docs/04_ui/datasets/trees/widget_tree.json')
  end
end

run()
```

`extractors/ui_stats.lua`

```lua
-- 04_ui/extractors/ui_stats.lua
-- Agregacja -> stats.json + stats.md (deterministyczny output)
-- ASCII-only; UTF-8 bez BOM; LF
local docio = dofile('../../_shared/lua/docio.lua')
local json = require('json')

local function parseLines(text)
  local out = {}
  if not text or #text == 0 then return out end
  for line in text:gmatch('[^\r\n]+') do
    local ok, obj = pcall(function() return json.decode(line) end)
    if ok and type(obj) == 'table' then out[#out+1] = obj end
  end
  return out
end

local function loadAllRecords()
  local recs = {}
  local head = docio.readAll('docs/04_ui/datasets/widgets.dataset.jsonl')
  local headList = parseLines(head)
  for i=1,#headList do recs[#recs+1] = headList[i] end
  local indexText = docio.readAll('docs/04_ui/datasets/chunks/index.json')
  if indexText and #indexText > 0 then
    local ok, list = pcall(function() return json.decode(indexText) end)
    if ok and type(list) == 'table' then
      for _,fname in ipairs(list) do
        local path = fname
        if not tostring(fname):match('^docs/') then
          path = 'docs/04_ui/datasets/chunks/' .. tostring(fname)
        end
        local t = docio.readAll(path)
        local more = parseLines(t)
        for i=1,#more do recs[#recs+1] = more[i] end
      end
    end
  end
  return recs
end

local function stats(recs)
  local s = { count = #recs, byClass = {}, visible = {true=0,false=0}, enabled = {true=0,false=0} }
  for _,r in ipairs(recs) do
    if r and r.class then
      s.byClass[r.class] = (s.byClass[r.class] or 0) + 1
    end
    local vis = (r and r.properties and r.properties.visible) or false
    local ena = (r and r.properties and r.properties.enabled) or false
    if vis then s.visible.true = s.visible.true + 1 else s.visible.false = s.visible.false + 1 end
    if ena then s.enabled.true = s.enabled.true + 1 else s.enabled.false = s.enabled.false + 1 end
  end
  return s
end

local function writeSection(title, map)
  local lines, keys = {}, {}
  for k,_ in pairs(map) do keys[#keys+1] = k end
  table.sort(keys)
  lines[#lines+1] = title
  for _,k in ipairs(keys) do lines[#lines+1] = string.format('- %s: %d', k, map[k]) end
  lines[#lines+1] = ''
  return table.concat(lines, '\n')
end

local function writeMD(s)
  local md = {}
  md[#md+1] = '# UI - Statystyki\n'
  md[#md+1] = ''
  md[#md+1] = string.format('- Rekordy: %d\n', s.count)
  md[#md+1] = ''
  md[#md+1] = writeSection('## By class', s.byClass)
  md[#md+1] = writeSection('## Visible', s.visible)
  md[#md+1] = writeSection('## Enabled', s.enabled)
  md[#md+1] = 'Hint: porownaj klasy i ich widocznosc z ekranami krytycznymi.\n'
  return table.concat(md)
end

local function run()
  local recs = loadAllRecords()
  local s = stats(recs)
  docio.writeAll('docs/04_ui/stats/stats.json', json.encode(s))
  docio.writeAll('docs/04_ui/stats/stats.md', writeMD(s))
end

run()
```

---

### 6) Diagrams (Mermaid)

`diagrams/ui_flow.mmd`

```mermaid
graph TD
  Studio[Electron Studio] -->|IPC scan| Extractor
  Extractor --> NDJSON[(widgets.dataset.jsonl)]
  Extractor --> CSV[(widgets.dataset.csv)]
  NDJSON --> Stats[stats.json and stats.md]
  CSV --> Stats
  Extractor --> Tree[(trees/widget_tree.json)]
  Stats --> Studio
```

---

### 7) meta.json (spojne crosslinks)

```json
{
  "$schemaVersion": 1,
  "chapterId": "chapter:ui",
  "title": "UI - Inventory and Trees",
  "owners": ["docs-export"],
  "tags": ["ui","widgets","otui","inventory","agent"],
  "fileMap": {
    "readme": "./README.md",
    "schemas": ["./widget.schema.json","./widget_tree.schema.json"],
    "sections": [
      "./sections/00_ui_basics.md",
      "./sections/01_introduction.md",
      "./sections/02_widget_model.md",
      "./sections/03_collection_methods.md",
      "./sections/04_quality_and_limits.md",
      "./sections/05_how_to_read_stats.md"
    ],
    "datasets": {
      "jsonl": "./datasets/widgets.dataset.jsonl",
      "csv": "./datasets/widgets.dataset.csv",
      "trees": "./datasets/trees/widget_tree.json",
      "chunksDir": "./datasets/chunks"
    },
    "stats": {
      "json": "./stats/stats.json",
      "md": "./stats/stats.md"
    },
    "analysis": {
      "findings": "./analysis/findings.md",
      "figuresDir": "./analysis/figures"
    },
    "extractors": [
      "./extractors/ui_tree_extractor.lua",
      "./extractors/ui_stats.lua"
    ],
    "diagrams": [
      "./diagrams/ui_flow.mmd"
    ],
    "config": {
      "targets": "./config/otui.targets.txt"
    }
  },
  "linking": {
    "recordIdPattern": "ui:<otui>/<id-or-class>",
    "crossChapter": {
      "modules": "../03_modules/README.md",
      "runtime": "../01_runtime/README.md",
      "assets": "../05_assets/README.md"
    }
  },
  "agent": {
    "tasks": [
      {"id": "inventory", "desc": "Eksport drzewa UI do JSONL/CSV/Tree", "outputs": ["datasets.jsonl", "datasets.csv", "trees.json"]},
      {"id": "aggregate", "desc": "Agregacja do stats.json/stats.md", "outputs": ["stats.json", "stats.md"]},
      {"id": "author", "desc": "Uzupelnienie sekcji i findings + wstrzykniecia danych", "targets": ["sections/*", "analysis/*"]}
    ],
    "insertPoints": {
      "sections/02_widget_model.md": ["AGENT:INSERT:WIDGET-EXAMPLES"],
      "sections/05_how_to_read_stats.md": ["AGENT:INSERT:READING-GUIDE"],
      "analysis/findings.md": ["AGENT:INSERT:FINDINGS"]
    }
  }
}
```

---

### 8) Encoding i formatowanie (UTF-8 safe)

- Pliki: UTF-8 bez BOM, ASCII-only w tresci (kreska '-', cudzyslow ", apostrof ').
- Koniec linii: LF. Unikaj znakow specjalnych i dlugich myslnikow.
- Naglowki: H1 (#), pozostale H3 (###) aby Sphinx parsowal lagodniej.

---

### 9) DoD Checklist (klikane)

- [ ] Zapis do docs/04_ui/datasets/widgets.dataset.jsonl i widgets.dataset.csv dziala (>= 200 wezlow lub zgodnie z targets).
- [ ] Wygenerowano stats/stats.json oraz stats/stats.md (deterministyczny output list; brak bledow w parsowaniu).
- [ ] Uzupelniono sections/00..05 i analysis/findings.md (AGENT:INSERT wypelnione realnymi danymi).
- [ ] Diagram ui_flow.mmd istnieje i jest logiczny.
- [ ] meta.json ma poprawne crosslinks: ../03_modules, ../01_runtime, ../05_assets.
- [ ] Walidacja probki 20 linii NDJSON przeciw widget.schema.json zakonczona bez bledow.

# Chapter 05 - Assets

### Professional Pro Template - Agent-Ready - OTClient v8

> Cel: ten rozdzial inwentaryzuje zasoby klienta (assets) w katalogu data/ i modulach (obrazy, audio, czcionki, OTUI/OTML, Lua, JSON, itp.). Generuje rekordy w NDJSON i CSV oraz dodatkowe metadane (rozmiar, ext, kategoria, checksum). Styl elastyczny i konkretny. Calosc ASCII-only, UTF-8 bez BOM.

---

### 0) Executive summary

- Co: indeks zasobow i ich stan (istnieje/nie), rozmiar, checksum, przypisana kategoria, relacje do modulow i UI.
- Dla kogo: inzynierowie, maintainerzy builda, narzedzia AI/RAG i Studio (Electron/React).
- Output: NDJSON (pelny), CSV (splaszczony), statystyki (JSON/MD), analizy (findings, gaps), diagramy (Mermaid), narracja (sekcje merytoryczne).
- Agent-ready: mapa plikow, punkty wstrzykniec (AGENT:INSERT), IO setup, CSV header, Studio hooks, checklist DoD.

---

### 1) Struktura folderu i linkowanie

```bash
05_assets/
  README.md                         # narracja + TOC + nawigacja (ten plik)
  meta.json                         # mapa plikow + zadania + tags (machine-readable)
  assets.schema.json                # walidacja rekordow NDJSON (asset)
  sections/
    00_assets_basics.md             # podstawy zasobow w OTClient
    01_introduction.md              # po co inwentaryzowac assets (kontekst)
    02_asset_model.md               # slownik pol + przyklady + pulapki
    03_collection_methods.md        # jak zbieramy (targets, listy plikow)
    04_quality_and_limits.md        # jakosc, ograniczenia, SLO
    05_how_to_read_stats.md         # jak czytac statystyki i mapowac braki
  datasets/
    assets.dataset.jsonl            # NDJSON (append-only)
    assets.dataset.csv              # CSV (naglowek staly)
    chunks/
      README.md                     # polityka dzielenia
  stats/
    stats.json                      # metryki zbiorcze (kategorie, braki)
    stats.md                        # raport czytelny dla ludzi
  analysis/
    findings.md                     # wnioski z danych + linki do rekordow
    gaps.md                         # lista brakow (nieistniejace sciezki)
    figures/                        # wykresy i tabele eksportowane
  extractors/
    assets_inventory.lua            # skan wskazanych plikow -> NDJSON+CSV
    assets_stats.lua                # agregacje -> stats.json + stats.md
  config/
    assets.targets.txt              # lista celow: pliki i/lub aliasy list
    assets.files.txt                # opcjonalna lista pelnych sciezek plikow
  diagrams/
    assets_flow.mmd                 # Mermaid: przeplyw inwentaryzacji
```

> Note: IO setup w README ponizej. Zawsze ASCII-only, UTF-8 bez BOM, LF konce linii.

---

### 2) README - nawigacja i instrukcje (Agent-friendly)

```markdown
---
id: chapter:assets
title: Assets - Inventory and Integrity
authors: ["docs-export"]
version: 1.0
last_updated: 2025-10-08
status: draft
tags: ["assets","inventory","integrity","otclient","agent"]
related:
  - ../03_modules/README.md
  - ../04_ui/README.md
  - ../01_runtime/README.md
outputs:
  - ./datasets/assets.dataset.jsonl
  - ./datasets/assets.dataset.csv
  - ./stats/stats.json
  - ./stats/stats.md
encoding: UTF-8 (no BOM)

---

Short: rozdzial inwentaryzuje zasoby (assets) i podaje ich stan, rozmiar, checksum i kategorie. Wyniki sa pod BI, RAG i kontrola spojnosc builda.

Table of contents
- [0. Assets basics](./sections/00_assets_basics.md)
- [1. Wprowadzenie](./sections/01_introduction.md)
- [2. Model assetu (slownik)](./sections/02_asset_model.md)
- [3. Zbieranie (targets, listy plikow)](./sections/03_collection_methods.md)
- [4. Jakosc i ograniczenia](./sections/04_quality_and_limits.md)
- [5. Jak czytac statystyki](./sections/05_how_to_read_stats.md)
- [Statystyki](./stats/stats.md) - [Datasety](./datasets/) - [Analizy](./analysis/findings.md)

Quick links
- Schema: [assets.schema.json](./assets.schema.json)
- NDJSON: [datasets/assets.dataset.jsonl](./datasets/assets.dataset.jsonl)
- CSV: [datasets/assets.dataset.csv](./datasets/assets.dataset.csv)
- Diagrams: [diagrams/assets_flow.mmd](./diagrams/assets_flow.mmd)

Crosslinks
- Modules: ../03_modules/README.md
- UI: ../04_ui/README.md
- Runtime: ../01_runtime/README.md

CSV header (assets.dataset.csv)

id,path,exists,checksum,sizeBytes,ext,category

Header jest staly - narzedzia BI moga cachowac schemat.

`IO setup`
- Default: dofile('../../_shared/lua/docio.lua')
- Isolated: copy to 05_assets/_local/docio.lua and use dofile('../_local/docio.lua')

`Skad do _shared`
| Start location | Path to _shared |
|---|---|
| 05_assets/extractors | ../../_shared/lua/docio.lua |
| 05_assets | ../_shared/lua/docio.lua |

`Chunks aggregation`
- Aggregator czyta glowny plik oraz opcjonalny indeks: docs/05_assets/datasets/chunks/index.json (JSON array nazw chunkow).

`Studio hooks (Electron) - skrot`
- IPC: 'studio:assets.inventory.scan' -> uruchamia assets_inventory.lua
- IPC: 'studio:aggregate.assets' -> uruchamia assets_stats.lua
- IPC: 'studio:open.assets' {type: 'jsonl'|'csv'} -> otwiera dataset w Studio
- Preload: contextIsolation: true; nodeIntegration: false; eksponuj bezpieczne API
- Sandbox: wszystkie zapisy ida przez docio.lua pod 05_assets
- View: podglad stats.md + tabela CSV; linki do rekordow po id w NDJSON
```

---

### 3) Mapa plikow i odpowiedzialnosci (reference for Agents)

| Plik / Katalog | Rola | Kto uzupelnia | Uwagi |
|---|---|---|---|
| assets.schema.json | walidacja rekordow assets | Agent/CI | waliduj linie po linii |
| datasets/*.jsonl | pelne rekordy (append) | inventory | rotacja w chunks/ |
| datasets/*.csv | widok splaszczony | inventory | tylko skalary |
| stats/*.json\|md | metryki zbiorcze | aggregator | kategorie, braki |
| sections/*.md | narracja i wyjasnienia | Agent/Autor | AGENT:INSERT punkty |
| analysis/* | wnioski i braki | Agent/Analityk | linkuj id rekordow |
| extractors/*.lua | zrzut i agregacja | system | nie zmieniaj API zapisu |

---

### 4) Slownik assetu (data dictionary)

| Pole | Typ | Przyklad | Znaczenie |
|---|---|---|---|
| id | string | res:/data/images/ui/login.png | Unikat: `res:<sciezka>` |
| path | string | /data/images/ui/login.png | Sciezka w zasobach. |
| exists | boolean | true | Czy plik istnieje wg g_resources. |
| checksum | string | fnv1a32:ab12cd34 | Kontrola integralnosci (FNV-1a 32-bit). |
| sizeBytes | number | 45678 | Rozmiar pliku w bajtach. |
| ext | string | png | Rozszerzenie. |
| category | string | image | Kategoria (image,audio,font,otui,otml,lua,json,otmod,other). |
| links[] | string[] | mod:..., ui:... | Powiazania z modulami i UI. |

> Agent tip: w sections/02_asset_model.md wstaw 5-8 realnych rekordow z NDJSON i krotki komentarz do kazdego.

---

### 5) Pipeline danych (odczyt -> zapis -> analiza)

1. Inventory pobiera cele z config/assets.targets.txt oraz/lub assets.files.txt i dopisuje rekordy do NDJSON + CSV.
2. Aggregator liczy rozklady kategorii i braki, zapisuje stats.*.
3. Narracja: sekcje opisowe z przykladami i odwolaniami do id assets.
4. Analizy: findings i gaps (np. brakujace pliki vs referencje w OTUI/modulach).
5. Publikacja: sprawdz checklist DoD i oznacz rozdzial jako ready.

---

### 6) Sekcje merytoryczne - szablony i wprowadzenie do assets

`sections/00_assets_basics.md`

```markdown
# Assets - podstawy dla nowych dev
Assets to pliki zasobow: grafiki, dzwieki, czcionki, definicje UI (OTUI/OTML), skrypty (Lua), itp. Klient laduje je przez system zasobow.

Pojecia
- g_resources.fileExists(path), g_resources.readFileContents(path), g_resources.writeFileContents(path).
- Zrodla zasobow: folder data/ i zasoby modulow.
- Wartosciowe atrybuty: rozmiar, rozszerzenie, checksum i kategoria.
```

`sections/01_introduction.md`

```markdown
# Wprowadzenie - po co inwentaryzowac assets
Inventory assets wykrywa braki, spiecia wersji i niespojnosci. Daje baze pod optymalizacje i kontrola integralnosci builda.

Kiedy uzywac
- audyt builda przed wydaniem,
- sledzenie zmian zasobow,
- walidacja referencji z UI i modulow.
```

`sections/02_asset_model.md`

```markdown
# Model assetu - definicje i przyklady
Zobacz slownik w README. Wstaw przyklady z NDJSON i krotkie komentarze.

<!-- AGENT:INSERT:ASSET-EXAMPLES -->
```

`sections/03_collection_methods.md`

```markdown
# Zbieranie (targets, listy plikow)
- assets_inventory.lua: czyta config/assets.targets.txt (lista celow). Linie moga wskazywac pliki lub alias @filelist.
- Optional: assets.files.txt zawiera pelne sciezki plikow (po jednej w linii).
- Jesli docelowo dodasz wsparcie dla skanowania katalogow, dopisz do config i dokumentacji.
```

`sections/04_quality_and_limits.md`

```markdown
# Jakosc i ograniczenia
- Brak pelnego skanowania katalogow bez wsparcia w API - korzystamy z list docelowych.
- Checksum to FNV-1a 32-bit obliczany po bajtach; wystarczy do diffa i kontroli zmian.
- Roznice forkow: opisz w analysis/findings.md.
```

`sections/05_how_to_read_stats.md`

```markdown
# Jak czytac statystyki
- Rozklad kategorii pokazuje profil zasobow w projekcie.
- Lista brakow (exists=false) wskazuje problemy referencji.

<!-- AGENT:INSERT:READING-GUIDE -->
```

---

### 7) Polityka dzielenia danych - datasets/chunks/README.md

```markdown
# Chunks - polityka
- Utrzymuj glowne pliki do ok. 50 MB.
- Starsze dane przenos do assets.dataset.<YYYYMMDD-HHMM>.jsonl oraz .csv.
- Po przeniesieniu chunkow traktuj je jako read-only.
- Zaktualizuj meta.json (datasets.chunksDir) gdy zmieni sie nazwa katalogu.
```

---

### 8) Schema - assets.schema.json

```json
{
  "$schema": "http://json-schema.org/draft-07/schema#",
  "title": "asset.record",
  "type": "object",
  "required": ["id","path","exists","checksum","sizeBytes","ext","category"],
  "properties": {
    "id": {"type":"string","pattern":"^res:\/.+"},
    "path": {"type":"string"},
    "exists": {"type":"boolean"},
    "checksum": {"type":"string"},
    "sizeBytes": {"type":"number"},
    "ext": {"type":"string"},
    "category": {"type":"string"},
    "links": {"type":"array","items":{"type":"string"}}
  }
}
```

---

### 9) Extractors (Lua) - gotowe pliki

`extractors/assets_inventory.lua`

```lua
-- 05_assets/extractors/assets_inventory.lua
-- Inwentaryzacja assets -> JSONL + CSV (splaszczone kluczowe pola)
-- ASCII-only; UTF-8 bez BOM; LF
local docio = dofile('../../_shared/lua/docio.lua')
local json = require('json')

local CSV_HEADER = { 'id','path','exists','checksum','sizeBytes','ext','category' }
local MAX_BYTES = 50*1024*1024

local function fnv1a32(s)
  local bitlib = rawget(_G, 'bit32') or rawget(_G, 'bit')
  local band, bxor = assert(bitlib and bitlib.band, 'bit/bit32 required'), assert(bitlib.bxor, 'bit/bit32 required')
  local hash = 2166136261
  for i = 1, #s do
    hash = bxor(hash, string.byte(s, i))
    hash = band((hash * 16777619), 0xFFFFFFFF)
  end
  return string.format('fnv1a32:%08x', hash)
end

local function extOf(path)
  local ext = path:match('%.([A-Za-z0-9]+)$') or ''
  return string.lower(ext)
end

local function categoryOf(ext)
  if ext == 'png' or ext == 'jpg' or ext == 'jpeg' or ext == 'bmp' or ext == 'gif' then return 'image' end
  if ext == 'otui' then return 'otui' end
  if ext == 'otml' then return 'otml' end
  if ext == 'lua' then return 'lua' end
  if ext == 'json' then return 'json' end
  if ext == 'otmod' then return 'otmod' end
  if ext == 'ogg' or ext == 'mp3' or ext == 'wav' then return 'audio' end
  if ext == 'ttf' or ext == 'otf' or ext == 'woff' then return 'font' end
  return 'other'
end

local function addAsset(path)
  local exists = g_resources and g_resources.fileExists and g_resources.fileExists(path)
  local content = exists and g_resources.readFileContents(path) or nil
  local size = content and #content or 0
  local ext = extOf(path)
  local rec = {
    id = 'res:' .. path,
    path = path,
    exists = exists and true or false,
    checksum = content and fnv1a32(content) or '',
    sizeBytes = size,
    ext = ext,
    category = categoryOf(ext),
    links = {}
  }
  docio.appendJsonl('docs/05_assets/datasets/assets.dataset.jsonl', rec, MAX_BYTES)
  docio.writeCsvHeader('docs/05_assets/datasets/assets.dataset.csv', CSV_HEADER)
  local row = {
    id = rec.id, path = rec.path, exists = rec.exists, checksum = rec.checksum,
    sizeBytes = rec.sizeBytes, ext = rec.ext, category = rec.category
  }
  docio.appendCsvRow('docs/05_assets/datasets/assets.dataset.csv', CSV_HEADER, row, MAX_BYTES)
end

local function readLines(path)
  local t = docio.readAll(path)
  local out = {}
  if not t or #t == 0 then return out end
  for line in t:gmatch('[^\r\n]+') do
   local p = line:match('^%s*(.-)%s*$')
    if p ~= '' and not p:match('^#') then out[#out+1] = p end
  end
  return out
end

local function loadTargets()
  local targets = {}
  local t = readLines('docs/05_assets/config/assets.targets.txt')
  for _,entry in ipairs(t) do
    if entry:match('^@filelist$') then
      local fl = readLines('docs/05_assets/config/assets.files.txt')
      for i=1,#fl do targets[#targets+1] = fl[i] end
    else
      targets[#targets+1] = entry
    end
  end
  return targets
end

local function run()
  local targets = loadTargets()
  for _,p in ipairs(targets) do addAsset(p) end
end

run()
```

`extractors/assets_stats.lua`

```lua
-- 05_assets/extractors/assets_stats.lua
-- Agregacja assets -> stats.json + stats.md (deterministyczny output)
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
  local head = docio.readAll('docs/05_assets/datasets/assets.dataset.jsonl')
  local headList = parseLines(head)
  for i=1,#headList do recs[#recs+1] = headList[i] end
  local indexText = docio.readAll('docs/05_assets/datasets/chunks/index.json')
  if indexText and #indexText > 0 then
    local ok, list = pcall(function() return json.decode(indexText) end)
    if ok and type(list) == 'table' then
      for _,fname in ipairs(list) do
        local path = fname
        if not tostring(fname):match('^docs/') then
          path = 'docs/05_assets/datasets/chunks/' .. tostring(fname)
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
  local s = { count = #recs, byCategory = {}, missing = 0, byExt = {} }
  for _,r in ipairs(recs) do
    local cat = (r and r.category) or 'unknown'
    s.byCategory[cat] = (s.byCategory[cat] or 0) + 1
    local ext = (r and r.ext) or ''
    s.byExt[ext] = (s.byExt[ext] or 0) + 1
    if not (r and r.exists) then s.missing = s.missing + 1 end
  end
  return s
end

local function writeMD(s)
  local md = {}
  md[#md+1] = '# Assets - Statystyki\n\n'
  md[#md+1] = string.format('- Rekordy: %d\n', s.count)
  md[#md+1] = string.format('- Braki (exists=false): %d\n', s.missing)
  md[#md+1] = '\n## By category\n'
  local cats = {}
  for k,_ in pairs(s.byCategory) do cats[#cats+1] = k end
  table.sort(cats)
  for _,k in ipairs(cats) do md[#md+1] = string.format('- %s: %d\n', k, s.byCategory[k]) end
  md[#md+1] = '\n## By extension\n'
  local exts = {}
  for k,_ in pairs(s.byExt) do exts[#exts+1] = k end
  table.sort(exts)
  for _,k in ipairs(exts) do md[#md+1] = string.format('- %s: %d\n', k, s.byExt[k]) end
  md[#md+1] = '\nHint: sprawdz kategorie z najwiekszym udzialem brakow i zestaw je z referencjami w UI/modulach.\n'
  return table.concat(md)
end

local function run()
  local recs = loadAllRecords()
  local s = stats(recs)
  docio.writeAll('docs/05_assets/stats/stats.json', json.encode(s))
  docio.writeAll('docs/05_assets/stats/stats.md', writeMD(s))
end

run()
```

---

### 10) Diagram (Mermaid)

`diagrams/assets_flow.mmd`

```mermaid
graph TD
  Studio[Electron Studio] -->|IPC scan| Inventory
  Inventory --> NDJSON[(assets.dataset.jsonl)]
  Inventory --> CSV[(assets.dataset.csv)]
  NDJSON --> Stats[stats.json and stats.md]
  CSV --> Stats
  Stats --> Studio
```

---

### 11) Encoding i formatowanie (UTF-8 safe)

- Pliki: UTF-8 bez BOM, ASCII-only w tresci (kreska '-', cudzyslow ", apostrof ').
- Koniec linii: LF. Unikaj znakow specjalnych i dlugich myslnikow.
- Naglowki: H1 (#), pozostale H3 (###) aby Sphinx parsowal lagodniej.

---

### 12) Jakosc, SLO i bezpieczenstwo (krotko)

- NDJSON append-only; przy duzych wolumenach uzyj chunks.
- CSV zawiera tylko skalary; pelne zaleznosci w links[].
- Nie zapisuj tresci plikow; tylko checksum i metadane.

---

### 13) DoD Checklist - Agent clickable

- [ ] Zapis do docs/05_assets/datasets/assets.dataset.jsonl i assets.dataset.csv dziala (>= 100 rekordow lub zgodnie z targets).
- [ ] Wygenerowano stats/stats.json oraz stats/stats.md (deterministyczny output list).
- [ ] Uzupelniono sekcje: 00_assets_basics.md, 01_introduction.md, 02_asset_model.md (z przykladami), 03_collection_methods.md.
- [ ] W analysis/gaps.md dodano min. 1 liste brakow z linkami do miejsc uzycia (jesli znane).
- [ ] Diagram assets_flow.mmd istnieje i jest logiczny.
- [ ] meta.json ma poprawne crosslinks: ../03_modules, ../04_ui, ../01_runtime.
- [ ] Walidacja probki 20 linii NDJSON przeciw assets.schema.json zakonczona bez bledow.

---

### 14) meta.json - wzorzec z tagami i linkowaniem

```json
{
  "$schemaVersion": 1,
  "chapterId": "chapter:assets",
  "title": "Assets - Inventory and Integrity",
  "owners": ["docs-export"],
  "tags": ["assets","inventory","integrity","otclient","agent"],
  "fileMap": {
    "readme": "./README.md",
    "schema": "./assets.schema.json",
    "sections": [
      "./sections/00_assets_basics.md",
      "./sections/01_introduction.md",
      "./sections/02_asset_model.md",
      "./sections/03_collection_methods.md",
      "./sections/04_quality_and_limits.md",
      "./sections/05_how_to_read_stats.md"
    ],
    "datasets": {
      "jsonl": "./datasets/assets.dataset.jsonl",
      "csv": "./datasets/assets.dataset.csv",
      "chunksDir": "./datasets/chunks"
    },
    "stats": {
      "json": "./stats/stats.json",
      "md": "./stats/stats.md"
    },
    "analysis": {
      "findings": "./analysis/findings.md",
      "gaps": "./analysis/gaps.md",
      "figuresDir": "./analysis/figures"
    },
    "extractors": [
      "./extractors/assets_inventory.lua",
      "./extractors/assets_stats.lua"
    ],
    "diagrams": [
      "./diagrams/assets_flow.mmd"
    ],
    "config": {
      "targets": "./config/assets.targets.txt",
      "files": "./config/assets.files.txt"
    }
  },
  "linking": {
    "recordIdPattern": "res:<path>",
    "crossChapter": {
      "modules": "../03_modules/README.md",
      "ui": "../04_ui/README.md",
      "runtime": "../01_runtime/README.md"
    }
  },
  "agent": {
    "tasks": [
      {"id": "inventory", "desc": "Skan assets do JSONL/CSV", "outputs": ["datasets.jsonl", "datasets.csv"]},
      {"id": "aggregate", "desc": "Agregacja do stats.json/stats.md", "outputs": ["stats.json", "stats.md"]},
      {"id": "author", "desc": "Uzupelnienie sekcji i gaps + wstrzykniecia danych", "targets": ["sections/*", "analysis/*"]}
    ],
    "insertPoints": {
      "sections/02_asset_model.md": ["AGENT:INSERT:ASSET-EXAMPLES"],
      "sections/05_how_to_read_stats.md": ["AGENT:INSERT:READING-GUIDE"],
      "analysis/findings.md": ["AGENT:INSERT:FINDINGS"],
      "analysis/gaps.md": ["AGENT:INSERT:GAPS"]
    }
  }
}
```

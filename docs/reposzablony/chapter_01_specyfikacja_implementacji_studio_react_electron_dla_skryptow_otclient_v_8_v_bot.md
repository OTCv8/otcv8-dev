# Chapter 01 - Runtime

### Professional Pro Template - Agent-Ready - OTClient v8

> Cel: rozdzial ma byc zrodlem prawdy o srodowisku uruchomieniowym klienta (FPS/UPS, pamiec, okno/OS, build). Laczy surowe dane z opisem, kontekstem, przykladami, zadaniami dla Agenta AI i jasnymi kryteriami ukonczenia. Styl jest elastyczny i konkretny. Caly dokument i kod sa ASCII-only, kodowanie UTF-8 bez BOM.

---

### 0) Executive summary

- Co: komplet metryk runtime + wyjasnienia jak je czytac i uzywac (UI scaling, wydajnosc, korelacje z eventami i logami).
- Dla kogo: inzynierowie, autorzy skryptow (OTUI/vBot), systemy AI/RAG.
- Wyniki: NDJSON (pelne), CSV (splaszczony), statystyki (JSON/MD), analizy (findings, comparisons), diagram (Mermaid), narracja (sekcje merytoryczne).
- Agent-ready: mapa plikow, punkty wstrzykniec (AGENT:INSERT), tags, spis tresci i linkowanie, checklist DoD z polami do odhaczania.

---

### 1) Struktura folderu i linkowanie

```bash
01_runtime/
  README.md                     # narracja + TOC + nawigacja (ten plik)
  meta.json                     # mapa plikow + zadania + tags (machine-readable)
  runtime.schema.json           # walidacja rekordow NDJSON
  sections/
    00_otclient_basics.md      # wprowadzenie do OTClient (dla nowych dev)
    01_introduction.md          # po co mierzymy runtime (kontekst)
    02_runtime_model.md         # slownik pol + przyklady + pulapki
    03_collection_methods.md    # jak zbieramy (ekstraktory, czestotliwosc)
    04_quality_and_limits.md    # jakosc, ograniczenia, SLO
    05_how_to_read_stats.md     # jak czytac statystyki + interpretacje
  datasets/
    runtime.dataset.jsonl       # NDJSON (append-only)
    runtime.dataset.csv         # CSV (naglowek staly)
    chunks/                     # partycje przy duzych wolumenach
      README.md                 # polityka dzielenia
  stats/
    stats.json                  # metryki zbiorcze (min/avg/max, itp.)
    stats.md                    # raport czytelny dla ludzi
  analysis/
    findings.md                 # wnioski z danych + linki do rekordow
    comparisons.md              # porownania buildow/konfiguracji
    figures/                    # obrazy (wykresy, tabele eksportowane)
  extractors/
    runtime_extractor.lua       # snapshot -> JSONL + CSV (rotacja, flatten)
    runtime_stats.lua           # agregacja -> stats.json + stats.md
  diagrams/
    runtime_stack.mmd           # Mermaid: przeplyw danych i kontekst
```

> Note: zobacz README sekcja IO setup.

---

### 2) README - nawigacja i instrukcje (Agent-friendly)

```markdown
---
id: chapter:runtime
title: Runtime and Build - Snapshots
authors: ["docs-export"]
version: 1.0
last_updated: 2025-10-08
status: draft
tags: ["runtime","performance","ui","otclient","agent"]
related:
  - .../02_events/README.md
  - .../04_ui/README.md
outputs:
  - ./datasets/runtime.dataset.jsonl
  - ./datasets/runtime.dataset.csv
  - ./stats/stats.json
  - ./stats/stats.md
encoding: UTF-8 (no BOM)
---
Short: rozdzial zbiera metryki runtime i tlumaczy, jak je czytac. Uzywaj jako kontekstu przy pracy nad UI, automatyzacja (vBot) i analizach wydajnosci.

Table of contents
- [0. OTClient - podstawy](./sections/00_otclient_basics.md)
- [1. Wprowadzenie](./sections/01_introduction.md)
- [2. Model danych (slownik)](./sections/02_runtime_model.md)
- [3. Zbieranie danych (ekstraktory)](./sections/03_collection_methods.md)
- [4. Jakosc i ograniczenia](./sections/04_quality_and_limits.md)
- [5. Jak czytac statystyki](./sections/05_how_to_read_stats.md)
- [Statystyki](./stats/stats.md) - [Datasety](./datasets/) - [Analizy](./analysis/findings.md)

Quick links
- Schema: [runtime.schema.json](./runtime.schema.json)
- NDJSON: [datasets/runtime.dataset.jsonl](./datasets/runtime.dataset.jsonl)
- CSV: [datasets/runtime.dataset.csv](./datasets/runtime.dataset.csv)
- Diagram: [diagrams/runtime_stack.mmd](./diagrams/runtime_stack.mmd)

Crosslinks
- Events: .../02_events/README.md (korelacje logowania z FPS/UPS)
- UI: .../04_ui/README.md (wplyw window.displaySize na layout)
- Logging: .../09_logging/README.md (kontekst zdarzen i czasu)

How to work (for Agent)
1) Uruchom extractors/runtime_extractor.lua (cyklicznie lub on-demand).
2) Uruchom extractors/runtime_stats.lua -> odswiez stats/.
3) Uzupelnij sekcje w sections/ i wstaw przyklady w miejscach <!-- AGENT:INSERT:... -->.
4) Zapisz obserwacje w analysis/findings.md i porownania w analysis/comparisons.md.
5) Sprawdz checklist DoD na koncu tego dokumentu.

### CSV header (runtime.dataset.csv)

id,ts,fps,ups,memoryKB,window.displaySize,window.isMaximized,window.platform,build.name,build.version,build.buildVersion,build.arch,build.graphics

### IO setup
- Default: dofile('../../_shared/lua/docio.lua')
- Isolated: copy to 01_runtime/_local/docio.lua and use dofile('../_local/docio.lua')

Skad do _shared
| Start location | Path to _shared |
|---|---|
| 01_runtime/extractors | ../../_shared/lua/docio.lua |
| 01_runtime | ../_shared/lua/docio.lua |

### Studio hooks (Electron) - skrot
- IPC: 'studio:extract.runtime.tick' uruchamia runtime_extractor.lua (pojedynczy snapshot)
- IPC: 'studio:aggregate.runtime' uruchamia runtime_stats.lua (agregacja)
- IPC: 'studio:open.dataset' {type: 'jsonl' lub 'csv'} otwiera podglad w Studio
- Preload: contextIsolation: true; nodeIntegration: false; eksponuj tylko bezpieczne API do renderer
- Sandbox: wszystkie zapisy ida przez docio.lua pod 01_runtime
- View: podglad stats.md + tabela CSV; linki do rekordow po id w NDJSON

```

---

### 3) Mapa plikow i odpowiedzialnosci (reference for Agents)

| Plik / Katalog | Rola | Kto uzupelnia | Uwagi |
|---|---|---|---|
| runtime.schema.json | walidacja rekordow NDJSON | Agent/CI | waliduj linie po linii |
| datasets/*.jsonl | pelne dane (append) | extractor | rozmiar kontroluj przez chunks/ |
| datasets/*.csv | widok splaszczony | extractor | staly naglowek; zlozone -> *_json |
| stats/*.json\|md | metryki zbiorcze | extractor | stats.md jest czytelne dla ludzi |
| sections/*.md | narracja i wyjasnienia | Agent/Autor | wstaw dane w AGENT:INSERT |
| analysis/* | wnioski i porownania | Agent/Analityk | linkuj id rekordow z JSONL |
| extractors/*.lua | zrzut i agregacja | system | nie modyfikuj API zapisu |

---

### 4) Slownik pol (data dictionary)

Cel: jednoznacznie nazwac i zrozumiec kazde pole rekordu runtime.

| Pole | Typ | Przyklad | Znaczenie |
|---|---|---|---|
| id | string | runtime:2025-10-08T12:00:00Z | Unikat pomiaru (UTC ISO8601). |
| ts | string | 2025-10-08T12:00:00Z | Czas pomiaru (UTC). |
| fps | number | 144 | Klatki/s (rendering). Wplyw: GPU, VSync, scena. |
| ups | number | 60 | Aktualizacje/s (logika gry). |
| memoryKB | number | 512000 | Przyblizone zuzycie RAM procesu. |
| window.displaySize | string | 1920x1080 | Rozmiar obszaru renderowania; wplywa na layout UI. |
| window.isMaximized | boolean | true | Czy okno jest zmaksymalizowane. |
| window.platform | string | win | Identyfikator platformy (win, linux, mac). |
| build.name | string | OTClient | Nazwa aplikacji. |
| build.version | string | 8.0.0 | Wersja logiczna. |
| build.buildVersion | string | build-1234 | Identyfikator builda. |
| build.arch | string | x64 | Architektura procesu. |
| build.graphics | string | OpenGL | Backend grafiki. |
| links[] | string[] | proto:..., ui:... | Powiazania z innymi rozdzialami. |

> Agent tip: w sections/02_runtime_model.md wstaw 2-3 realne rekordy z NDJSON i jednozdaniowe interpretacje.

---

### 5) Pipeline danych (odczyt -> zapis -> analiza)

1. Snapshot (extractor) -> dopisz rekord do datasets/runtime.dataset.jsonl i wiersz do datasets/runtime.dataset.csv.
2. Agregacja -> przelicz stats.json i wygeneruj stats.md.
3. Narracja -> uzupelnij sections/* przykladami i komentarzem.
4. Analizy -> dodaj wnioski i porownania (analysis/*) z linkami do id rekordow.
5. Publikacja -> sprawdz checklist DoD i oznacz rozdzial jako ready.

---

### 6) Sekcje merytoryczne - szablony i wprowadzenie do OTClient

sections/00_otclient_basics.md

```markdown
# OTClient - podstawy dla nowych dev
Ten plik daje lekki kontekst: co to jest OTClient, jakich ma menedzerow i gdzie znajdziesz interfejsy, z ktorych korzystamy w tym rozdziale.

Najwazniejsze pojecia
- g_client: metryki klienta (fps, ups, pamiec, architektura).
- g_window: srodowisko okna (rozmiar, platforma, stan okna).
- g_app: metadane aplikacji (nazwa, wersja, buildVersion).
- modules: modulowa struktura kodu, w tym skrypty i pliki OTUI.
- OTUI: opis interfejsu w plikach .otui (drzewa widzetow), istotne przy zaleznosci od rozmiaru okna.

Jak to laczy sie z runtime
- runtime to widok „tu i teraz” srodowiska klienta.
- dane z runtime sa czesto korelowane z eventami (logowanie) i z UI (skalowanie).
```

sections/01_introduction.md

```markdown
# Wprowadzenie - po co mierzymy runtime
Rama: patrzymy na sygnaly widoczne z poziomu klienta. Celem nie jest pelny profiling, tylko szybkie uchwycenie trendow (fps/ups, pamiec, okno/os, build) i ich wplywu na UX/UI.

Kiedy uzywac
- porownania buildow,
- decyzje o skalowaniu UI,
- kontekst dla skryptow automatyzujacych.
```

sections/02_runtime_model.md

```markdown
# Model danych - definicje i przyklady
Uzyj tabeli w README jako slownika. Wstaw krotki wycinek danych i komentarz.

<!-- AGENT:INSERT:MODEL-EXAMPLES -->
```

sections/03_collection_methods.md

```markdown
# Zbieranie danych (ekstraktory)
- runtime_extractor.lua -> JSONL/CSV (append), rotacja.
- runtime_stats.lua -> stats.json i stats.md.

Czestotliwosc: 1-5 s (ciagle) lub on-demand. Przy dluzszych sesjach uzyj datasets/chunks.
```

sections/04_quality_and_limits.md

```markdown
# Jakosc i ograniczenia
- FPS/UPS zalezne od sceny, sterownikow i OS.
- memoryKB jest przyblizeniem; porownuj warunki do warunkow.
- Roznice miedzy forkami opisz w analysis/findings.md.
```

sections/05_how_to_read_stats.md

```markdown
# Jak czytac statystyki (bez nadinterpretacji)
- min/avg/max to szybki opis trendu.
- Porownuj podobne warunki (scena, okno, build).

<!-- AGENT:INSERT:READING-GUIDE -->
```

---

### 7) Polityka dzielenia danych - datasets/chunks/README.md

```markdown
# Chunks - polityka
- Utrzymuj glowne pliki do ok. 50 MB.
- Starsze dane przenos do runtime.dataset.<YYYYMMDD-HHMM>.jsonl oraz .csv.
- Po przeniesieniu chunkow traktuj je jako read-only.
- Zaktualizuj meta.json (datasets.chunksDir) gdy zmieni sie nazwa katalogu.
```

---

### 8) Extractors (Lua) - gotowe pliki

extractors/runtime_extractor.lua

```lua
-- Snapshot runtime + build -> JSONL + CSV (rotacja, flatten)
-- Agent: uruchamiaj cyklicznie lub na zadanie, potem odpal agregator.
local docio = dofile('../../_shared/lua/docio.lua')
local json = require('json')
local CSV_HEADER = {
  'id','ts','fps','ups','memoryKB',
  'window.displaySize','window.isMaximized','window.platform',
  'build.name','build.version','build.buildVersion','build.arch','build.graphics'
}
local function nowIso()
  local t = os.date('!*t')
  return string.format('%04d-%02d-%02dT%02d:%02d:%02dZ', t.year, t.month, t.day, t.hour, t.min, t.sec)
end
local function strSize(s)
  if not s then return '' end
  return string.format('%dx%d', s.width, s.height)
end
local function snapshot()
  return {
    id = 'runtime:' .. nowIso(),
    type = 'runtime',
    ts = nowIso(),
    fps = (g_client and g_client:getFps() or 0),
    ups = (g_client and g_client:getUps() or 0),
    memoryKB = (g_client and g_client:getMemoryUsage() or 0),
    window = {
      displaySize = (g_window and strSize(g_window:getDisplaySize()) or ''),
      isMaximized = (g_window and g_window:isMaximized() or false),
      platform = (g_window and g_window:getPlatform() or '')
    },
    build = {
      name = (g_app and g_app:getName() or ''),
      version = (g_app and g_app:getVersion() or ''),
      buildVersion = (g_app and g_app:getBuildVersion() or ''),
      arch = (g_client and g_client:getArch() or ''),
      graphics = (g_client and g_client:getGraphicsEngine() or '')
    },
    links = {}
  }
end
local function run()
  local rec = snapshot()
  docio.appendJsonl('01_runtime/datasets/runtime.dataset.jsonl', rec, 1024*1024)
  docio.writeCsvHeader('01_runtime/datasets/runtime.dataset.csv', CSV_HEADER)
  local f = docio.flatten(rec)
  local row = {
    ['id']=f['id'], ['ts']=f['ts'], ['fps']=f['fps'], ['ups']=f['ups'], ['memoryKB']=f['memoryKB'],
    ['window.displaySize']=f['window.displaySize'], ['window.isMaximized']=f['window.isMaximized'], ['window.platform']=f['window.platform'],
    ['build.name']=f['build.name'], ['build.version']=f['build.version'], ['build.buildVersion']=f['build.buildVersion'], ['build.arch']=f['build.arch'], ['build.graphics']=f['build.graphics']
  }
  docio.appendCsvRow('01_runtime/datasets/runtime.dataset.csv', CSV_HEADER, row, 1024*1024)
end
run()
```

extractors/runtime_stats.lua

```lua
-- Agregacja NDJSON -> stats.json oraz stats.md (lekki przebieg)
local docio = dofile('../../_shared/lua/docio.lua')
local json = require('json')
local function parseLines(t)
  local o = {}
  if not t or #t == 0 then return o end
  for line in t:gmatch('[^\r\n]+') do
    local ok, obj = pcall(function() return json.decode(line) end)
    if ok and type(obj) == 'table' then o[#o+1] = obj end
  end
  return o
end
local function stats(re)
  local s = {count=#re, fps={min=nil,max=nil,avg=0}, ups={min=nil,max=nil,avg=0}, memoryKB={min=nil,max=nil,avg=0}}
  if #re == 0 then return s end
  local fs, us, ms = 0, 0, 0
  for _, r in ipairs(re) do
    local f = tonumber(r.fps) or 0
    local u = tonumber(r.ups) or 0
    local m = tonumber(r.memoryKB) or 0
    s.fps.min = (s.fps.min and math.min(s.fps.min, f)) or f
    s.fps.max = (s.fps.max and math.max(s.fps.max, f)) or f
    s.ups.min = (s.ups.min and math.min(s.ups.min, u)) or u
    s.ups.max = (s.ups.max and math.max(s.ups.max, u)) or u
    s.memoryKB.min = (s.memoryKB.min and math.min(s.memoryKB.min, m)) or m
    s.memoryKB.max = (s.memoryKB.max and math.max(s.memoryKB.max, m)) or m
    fs = fs + f; us = us + u; ms = ms + m
  end
  s.fps.avg = fs / #re
  s.ups.avg = us / #re
  s.memoryKB.avg = ms / #re
  return s
end
local function writeMD(s)
  return table.concat({
    '# Runtime - Statystyki\n\n',
    string.format('- Rekordy: %d\n', s.count),
    string.format('- FPS min/avg/max: %s / %.2f / %s\n', tostring(s.fps.min or '-'), s.fps.avg or 0, tostring(s.fps.max or '-')),
    string.format('- UPS min/avg/max: %s / %.2f / %s\n', tostring(s.ups.min or '-'), s.ups.avg or 0, tostring(s.ups.max or '-')),
    string.format('- memoryKB min/avg/max: %s / %.2f / %s\n', tostring(s.memoryKB.min or '-'), s.memoryKB.avg or 0, tostring(s.memoryKB.max or '-')),
    '\nHint: porownuj warunki (ta sama scena/okno/build).\n'
  })
end
local function run()
  local t = docio.readAll('01_runtime/datasets/runtime.dataset.jsonl')
  local re = parseLines(t)
  local s = stats(re)
  docio.writeAll('01_runtime/stats/stats.json', json.encode(s))
  docio.writeAll('01_runtime/stats/stats.md', writeMD(s))
end
run()
```

---

### 9) Diagram (Mermaid) - diagrams/runtime_stack.mmd

```mermaid
graph TD
  Studio[Electron Studio] -->|IPC extract or aggregate| Extractors
  subgraph Client
    W[Window] --> G[Graphics Engine]
    A[Application] --> B[Build Info]
  end
  G --> FPS[FPS]
  A --> UPS[UPS]
  A --> MEM[Memory]
  Extractors --> DS[(runtime.dataset.jsonl)]
  Extractors --> CSV[(runtime.dataset.csv)]
  DS --> Stats[stats.json and stats.md]
  CSV --> Stats
  Stats --> Studio
```

---

### 10) Encoding i formatowanie (UTF-8 safe)

- Zawsze zapisuj pliki w UTF-8 bez BOM.
- Uzywaj ASCII w tresci (kreska '-', cudzyslow ", apostrof '). Unikaj znakow specjalnych (np. •, —, …, ->).
- Zlamy wierszy: LF (\n). W Mermaid i tabelach uzywaj ASCII.
- Naglowki: tytul H1 (#), pozostale H3 (###) aby Sphinx parsowal lagodniej.

---

### 11) Jakosc, SLO i bezpieczenstwo (krotko)

- ID/czas: id = `runtime:<ISO8601>`, ts w UTC.
- CSV: staly naglowek, tylko skalary; zlozone pola do *_json.
- IO SLO: snapshot lekki; dlugie sesje -> chunks/.
- Bezpieczenstwo: brak danych wrazliwych; nie zapisuj prywatnych sciezek ani kluczy.

---

### 12) DoD Checklist - Agent clickable

- [ ] Zebrano >= 1 rekord w datasets/runtime.dataset.jsonl i dopisano do runtime.dataset.csv.
- [ ] Wygenerowano stats/stats.json oraz stats/stats.md.
- [ ] Uzupelniono sekcje: 00_otclient_basics.md, 01_introduction.md, 02_runtime_model.md (z przykladami), 03_collection_methods.md.
- [ ] W analysis/findings.md zapisano >= 2 obserwacje z linkami do id rekordow; w razie porownan uzupelniono analysis/comparisons.md.
- [ ] Diagram diagrams/runtime_stack.mmd istnieje i odzwierciedla przeplyw danych.
- [ ] meta.json zawiera poprawne sciezki, tags, agent.tasks, insertPoints.
- [ ] Walidacja probki 10 linii NDJSON przeciw runtime.schema.json zakonczona bez bledow.

---

### 13) meta.json - wzorzec z tagami i linkowaniem

```json
{
  "$schemaVersion": 1,
  "chapterId": "chapter:runtime",
  "title": "Runtime and Build - Snapshots",
  "owners": ["docs-export"],
  "tags": ["runtime","performance","ui","otclient","agent"],
  "fileMap": {
    "readme": "./README.md",
    "schema": "./runtime.schema.json",
    "sections": [
      "./sections/00_otclient_basics.md",
      "./sections/01_introduction.md",
      "./sections/02_runtime_model.md",
      "./sections/03_collection_methods.md",
      "./sections/04_quality_and_limits.md",
      "./sections/05_how_to_read_stats.md"
    ],
    "datasets": {
      "jsonl": "./datasets/runtime.dataset.jsonl",
      "csv": "./datasets/runtime.dataset.csv",
      "chunksDir": "./datasets/chunks"
    },
    "stats": {
      "json": "./stats/stats.json",
      "md": "./stats/stats.md"
    },
    "analysis": {
      "findings": "./analysis/findings.md",
      "comparisons": "./analysis/comparisons.md",
      "figuresDir": "./analysis/figures"
    },
    "extractors": [
      "./extractors/runtime_extractor.lua",
      "./extractors/runtime_stats.lua"
    ],
    "diagram": "./diagrams/runtime_stack.mmd"
  },
  "linking": {
    "recordIdPattern": "runtime:<ISO8601>",
    "crossChapter": {
      "events": ".../02_events/README.md",
      "ui": ".../04_ui/README.md",
      "logging": ".../09_logging/README.md"
    }
  },
  "agent": {
    "tasks": [
      {"id": "collect", "desc": "Zbieranie snapshotow do JSONL/CSV", "outputs": ["datasets.jsonl", "datasets.csv"]},
      {"id": "aggregate", "desc": "Agregacja do stats.json/stats.md", "outputs": ["stats.json", "stats.md"]},
      {"id": "author", "desc": "Uzupelnienie sekcji merytorycznych + wstrzykniecia danych", "targets": ["sections/*", "analysis/*"]}
    ],
    "insertPoints": {
      "sections/02_runtime_model.md": ["AGENT:INSERT:MODEL-EXAMPLES"],
      "sections/05_how_to_read_stats.md": ["AGENT:INSERT:READING-GUIDE"],
      "analysis/findings.md": ["AGENT:INSERT:FINDINGS"],
      "analysis/comparisons.md": ["AGENT:INSERT:COMPARISONS"]
    }
  }
}
```

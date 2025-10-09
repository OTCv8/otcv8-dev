# Chapter 10 - Game Runtime

### Professional Pro Template - Agent-Ready - OTClient v8

> Cel: ten rozdzial zbiera cykliczne snapshoty stanu gry (player, pozycja, statystyki, podstawowe flagi walki) w bezpiecznej, znormalizowanej formie. Generuje rekordy NDJSON i CSV, statystyki oraz diagramy. Styl elastyczny i konkretny. Calosc ASCII-only, UTF-8 bez BOM.

---

### 0) Executive summary

- Co: obserwacje runtime gry w czasie (hp/mp, poziom, predkosc, pozycja, tryby walki, proste liczebnosci). Bez danych wrazliwych ani tresci czatu.
- Dla kogo: inzynierowie, QA, narzedzia AI/RAG i Studio (Electron/React).
- Output: NDJSON (pelny), CSV (splaszczony), statystyki (JSON/MD), narracja (sekcje). Opcjonalnie wykresy (figures) generowane poza klientem.
- Agent-ready: mapa plikow, AGENT:INSERT, IO setup, CSV header, Studio hooks, checklist DoD.

---

### 1) Struktura folderu i linkowanie

```bash
10_game_runtime/
  README.md                          # narracja + TOC + nawigacja (ten plik)
  meta.json                          # mapa plikow + zadania + tags (machine-readable)
  game_runtime.schema.json           # walidacja rekordow NDJSON (game_runtime)
  sections/
    00_game_runtime_basics.md        # podstawy runtime gry (dla nowych dev)
    01_introduction.md               # po co logowac runtime gameplay
    02_game_runtime_model.md         # slownik pol + przyklady + pulapki
    03_collection_methods.md         # jak zbieramy (snapshot tick)
    04_quality_and_limits.md         # jakosc, ograniczenia, SLO
    05_how_to_read_stats.md          # jak czytac statystyki i korelowac
  datasets/
    game_runtime.dataset.jsonl       # NDJSON (append-only, 1 snapshot/linia)
    game_runtime.dataset.csv         # CSV (naglowek staly)
    chunks/
      README.md                      # polityka dzielenia
  stats/
    stats.json                       # metryki zbiorcze (hp%, mp%, tryby)
    stats.md                         # raport czytelny dla ludzi
  analysis/
    findings.md                      # wnioski z danych + linki do rekordow
    correlations.md                  # korelacje z events/ui/network
    figures/                         # wykresy i tabele eksportowane
  extractors/
    game_runtime_snapshot.lua        # snapshot cykliczny -> NDJSON/CSV
    game_runtime_stats.lua           # agregacje -> stats.json + stats.md
  config/
    game_runtime.policy.json         # np. {"storePlayerName": false}
    game_runtime.sampling.ms         # np. "1000" (tekst; Agent czyta wartosc)
  diagrams/
    game_runtime_flow.mmd            # Mermaid: przeplyw zbierania
```

> Note: IO setup w README ponizej. Zawsze ASCII-only, UTF-8 bez BOM, LF konce linii.

---

### 2) README - nawigacja i instrukcje (Agent-friendly)

```markdown
---
id: chapter:game_runtime
title: Game Runtime - Time Series Snapshots
authors: ["docs-export"]
version: 1.0
last_updated: 2025-10-08
status: draft
tags: ["runtime","game","player","snapshots","otclient","agent"]
related:
  - ../01_runtime/README.md
  - ../02_events/README.md
  - ../03_modules/README.md
  - ../04_ui/README.md
  - ../09_logging/README.md
outputs:
  - ./datasets/game_runtime.dataset.jsonl
  - ./datasets/game_runtime.dataset.csv
  - ./stats/stats.json
  - ./stats/stats.md
encoding: UTF-8 (no BOM)
---
Short: rozdzial zbiera cykliczne snapshoty stanu gry i publikuje je w formacie przyjaznym dla BI i RAG. Bezpiecznie: bez danych wrazliwych.

Table of contents
- [0. Game runtime basics](./sections/00_game_runtime_basics.md)
- [1. Wprowadzenie](./sections/01_introduction.md)
- [2. Model snapshotu (slownik)](./sections/02_game_runtime_model.md)
- [3. Zbieranie (snapshot tick)](./sections/03_collection_methods.md)
- [4. Jakosc i ograniczenia](./sections/04_quality_and_limits.md)
- [5. Jak czytac statystyki](./sections/05_how_to_read_stats.md)
- [Statystyki](./stats/stats.md) - [Datasety](./datasets/) - [Analizy](./analysis/findings.md)

Quick links
- Schema: [game_runtime.schema.json](./game_runtime.schema.json)
- NDJSON: [datasets/game_runtime.dataset.jsonl](./datasets/game_runtime.dataset.jsonl)
- CSV: [datasets/game_runtime.dataset.csv](./datasets/game_runtime.dataset.csv)
- Diagrams: [diagrams/game_runtime_flow.mmd](./diagrams/game_runtime_flow.mmd)

Crosslinks
- Runtime (system): ../01_runtime/README.md
- Events: ../02_events/README.md
- UI: ../04_ui/README.md
- Logging: ../09_logging/README.md

CSV header (game_runtime.dataset.csv)
```

id,ts,player.level,player.hp,player.maxHp,player.mana,player.maxMana,player.cap,player.soul,player.speed,player.pos,combat.fightMode,combat.pvpMode,combat.inFight

```markdown
Header jest staly - narzedzia BI moga cachowac schemat.

IO setup
- Default: dofile('../../_shared/lua/docio.lua')
- Isolated: copy to 10_game_runtime/_local/docio.lua and use dofile('../_local/docio.lua')

Skad do _shared
| Start location | Path to _shared |
|---|---|
| 10_game_runtime/extractors | ../../_shared/lua/docio.lua |
| 10_game_runtime | ../_shared/lua/docio.lua |

Chunks aggregation
- Aggregator czyta glowny plik oraz opcjonalny indeks: docs/10_game_runtime/datasets/chunks/index.json (JSON array nazw chunkow).

Studio hooks (Electron) - skrot
- IPC: 'studio:game_runtime.snapshot.start' -> uruchamia cykliczne snapshoty (interval z config)
- IPC: 'studio:game_runtime.snapshot.stop' -> zatrzymuje cykliczne snapshoty
- IPC: 'studio:aggregate.game_runtime' -> uruchamia game_runtime_stats.lua
- IPC: 'studio:open.game_runtime' {type: 'jsonl'|'csv'} -> otwiera dataset w Studio
- Preload: contextIsolation: true; nodeIntegration: false; eksponuj bezpieczne API
- Sandbox: wszystkie zapisy ida przez docio.lua pod 10_game_runtime
- View: podglad stats.md + tabela CSV; linki do rekordow po id w NDJSON
```

---

### 3) Mapa plikow i odpowiedzialnosci (reference for Agents)

| Plik / Katalog | Rola | Kto uzupelnia | Uwagi |
|---|---|---|---|
| game_runtime.schema.json | walidacja rekordow snapshotu | Agent/CI | waliduj linie po linii |
| datasets/*.jsonl | pelne rekordy (append) | snapshot | rotacja w chunks/ |
| datasets/*.csv | widok splaszczony | snapshot | tylko skalary i krotkie stringi |
| stats/*.json\|md | metryki zbiorcze | aggregator | hp%, mp%, tryby |
| sections/*.md | narracja i wyjasnienia | Agent/Autor | AGENT:INSERT punkty |
| analysis/* | wnioski i korelacje | Agent/Analityk | linkuj id rekordow |
| extractors/*.lua | zrzut i agregacja | system | nie zmieniaj API zapisu |

---

### 4) Slownik snapshotu (data dictionary)

| Pole | Typ | Przyklad | Znaczenie |
|---|---|---|---|
| id | string | grt:2025-10-08T12:00:00Z | Unikat: grt:\<ISO8601\>. |
| type | string | game_runtime | Stala wartosc: game_runtime. |
| ts | string | 2025-10-08T12:00:00Z | Czas snapshotu (UTC). |
| player.level | number | 123 | Poziom postaci. |
| player.hp | number | 500 | HP aktualne. |
| player.maxHp | number | 1000 | HP maksymalne. |
| player.mana | number | 300 | Mana aktualna. |
| player.maxMana | number | 900 | Mana maksymalna. |
| player.cap | number | 1200 | Pojemnosc (capacity). |
| player.soul | number | 100 | Soul points. |
| player.speed | number | 410 | Predkosc. |
| player.pos | string | 32369,32241,7 | Pozycja jako CSV x,y,z. |
| combat.fightMode | string | offensive | Tryb walki. |
| combat.pvpMode | string | secure | Tryb PvP. |
| combat.inFight | boolean | false | Flaga walki. |
| links[] | string[] | evt:..., ui:... | Powiazania z innymi rozdzialami. |

> Agent tip: w sections/02_game_runtime_model.md wstaw 3-5 realnych snapshotow (anonimizuj nazwe postaci jesli logujesz) i skomentuj krótko.

---

### 5) Pipeline danych (odczyt -> zapis -> analiza)

1. Snapshot: co N ms (config) czytaj odtwarzalne metryki i dopisuj rekord do NDJSON + CSV.
2. Aggregator: licz min/avg/max hp% i mp%, rozklad trybow walki, histogram predkosci; zapis stats.*.
3. Narracja: sekcje opisowe z przykladami i odniesieniami do id.
4. Analizy: korelacje z eventami (np. onGameStart/onLoginError) i UI (np. entergame).
5. Publikacja: sprawdz checklist DoD.

---

### 6) Sekcje merytoryczne - szablony i wprowadzenie do Game Runtime

sections/00_game_runtime_basics.md

```markdown
# Game runtime - podstawy dla nowych dev
Snapshot runtime gry jest przydatny do sledzenia kondycji postaci i srodowiska w czasie. Zbieramy tylko metryki techniczne, bez tresci czatu.

Pojecia
- localPlayer: obiekt gracza; pola moga sie roznic miedzy forkami, wiec korzystamy z pcall/trymethod.
- fight/pvp modes: biezace ustawienia walki.
- position: wspolrzedne x,y,z.
```

sections/01_introduction.md

```markdown
# Wprowadzenie - po co logowac game runtime
Aby diagnozowac regresje, stroic makra i korelowac gameplay z eventami i UI. To takze baza do alertow (np. niskie hp%).

Kiedy uzywac
- testy A/B buildow,
- analiza nieudanych polaczen (kontekst z events),
- audyt zachowania makr (vBot) vs stan postaci.
```

sections/02_game_runtime_model.md

```markdown
# Model snapshotu - definicje i przyklady
Zobacz slownik w README. Wstaw przyklady z NDJSON i skomentuj po jednym zdaniu.

<!-- AGENT:INSERT:GRuntime-EXAMPLES -->
```

sections/03_collection_methods.md

```markdown
# Zbieranie (snapshot tick)
- game_runtime_snapshot.lua: sterowany cyklicznie (interval z config), defensywne odczyty tryMethod.
- Studio: start/stop przez IPC. Zapis do docs/10_game_runtime/datasets/...
- CSV zawiera tylko wybrane skalary, pelny rekord w NDJSON.
```

sections/04_quality_and_limits.md

```markdown
# Jakosc i ograniczenia
- API localPlayer moze roznic sie miedzy forkami. Dlatego uzywamy tryMethod i tolerujemy braki.
- Nie logujemy nazw postaci domyslnie (storePlayerName=false w policy).
- Brak listy ekwipunku i czatu; to swiadoma decyzja prywatnosci i wolumenu danych.
```

sections/05_how_to_read_stats.md

```markdown
# Jak czytac statystyki
- hp% i mp% (min/avg/max) dadza szybki obraz stabilnosci walki.
- Rozklad trybow walki moze wskazac niespojnosci makr lub UI.

<!-- AGENT:INSERT:READING-GUIDE -->
```

---

### 7) Polityka dzielenia danych - datasets/chunks/README.md

```markdown
# Chunks - polityka
- Utrzymuj glowne pliki do ok. 50 MB.
- Starsze dane przenos do game_runtime.dataset.<YYYYMMDD-HHMM>.jsonl oraz .csv.
- Po przeniesieniu chunkow traktuj je jako read-only.
- Zaktualizuj meta.json (datasets.chunksDir) gdy zmieni sie nazwa katalogu.
```

---

### 8) Schema - game_runtime.schema.json

```json
{
  "$schema": "http://json-schema.org/draft-07/schema#",
  "title": "game_runtime.record",
  "type": "object",
  "required": ["id","type","ts","player","combat"],
  "properties": {
    "id": {"type":"string","pattern":"^grt:[0-9TZ:-]+(-[0-9]+)?$"},
    "type": {"type":"string","const":"game_runtime"},
    "ts": {"type":"string","format":"date-time"},
    "player": {
      "type":"object",
      "properties":{
        "level":{"type":"number"},
        "hp":{"type":"number"},
        "maxHp":{"type":"number"},
        "mana":{"type":"number"},
        "maxMana":{"type":"number"},
        "cap":{"type":"number"},
        "soul":{"type":"number"},
        "speed":{"type":"number"},
        "pos":{"type":"string"}
      }
    },
    "combat": {
      "type":"object",
      "properties":{
        "fightMode":{"type":"string"},
        "pvpMode":{"type":"string"},
        "inFight":{"type":"boolean"}
      }
    },
    "links": {"type":"array","items":{"type":"string"}}
  }
}
```

---

### 9) Extractors (Lua) - gotowe pliki

extractors/game_runtime_snapshot.lua

```lua
-- 10_game_runtime/extractors/game_runtime_snapshot.lua
-- Snapshot runtime gry -> JSONL + CSV
-- ASCII-only; UTF-8 bez BOM; LF
local docio = dofile('../../_shared/lua/docio.lua')
local json = require('json')

local CSV_HEADER = {
  'id','ts','player.level','player.hp','player.maxHp','player.mana','player.maxMana','player.cap','player.soul','player.speed','player.pos',
  'combat.fightMode','combat.pvpMode','combat.inFight'
}
local MAX_BYTES = 50*1024*1024
local running = false

local function nowIso()
  local t = os.date('!*t')
  return string.format('%04d-%02d-%02dT%02d:%02d:%02dZ', t.year, t.month, t.day, t.hour, t.min, t.sec)
end

local function trymethod(obj, name)
  local ok, res = pcall(function()
    if obj and type(obj[name]) == 'function' then return obj[name](obj) end
    return nil
  end)
  if ok then return res end
  return nil
end

local function posToCsv(pos)
  if type(pos) == 'table' and pos.x and pos.y and pos.z then
    return string.format('%d,%d,%d', pos.x, pos.y, pos.z)
  end
  return ''
end

local function snapshot()
  local ts = nowIso()
  local lp = trymethod(g_game, 'getLocalPlayer')
  local level = tonumber(trymethod(lp, 'getLevel')) or 0
  local hp = tonumber(trymethod(lp, 'getHealth')) or 0
  local maxHp = tonumber(trymethod(lp, 'getMaxHealth')) or 0
  local mana = tonumber(trymethod(lp, 'getMana')) or 0
  local maxMana = tonumber(trymethod(lp, 'getMaxMana')) or 0
  local cap = tonumber(trymethod(lp, 'getCapacity')) or 0
  local soul = tonumber(trymethod(lp, 'getSoul')) or 0
  local speed = tonumber(trymethod(lp, 'getSpeed')) or 0
  local pos = posToCsv(trymethod(lp, 'getPosition'))

  local fightMode = trymethod(lp, 'getFightMode') or ''
  local pvpMode = trymethod(lp, 'getPVPMode') or trymethod(lp, 'getPvpMode') or ''
  local inFight = trymethod(lp, 'isInFight') or false

  local rec = {
    id = 'grt:' .. ts,
    type = 'game_runtime',
    ts = ts,
    player = {
      level = level,
      hp = hp,
      maxHp = maxHp,
      mana = mana,
      maxMana = maxMana,
      cap = cap,
      soul = soul,
      speed = speed,
      pos = pos
    },
    combat = {
      fightMode = tostring(fightMode or ''),
      pvpMode = tostring(pvpMode or ''),
      inFight = (inFight and true or false)
    },
    links = {}
  }

  -- JSONL
  docio.appendJsonl('docs/10_game_runtime/datasets/game_runtime.dataset.jsonl', rec, MAX_BYTES)
  -- CSV
  docio.writeCsvHeader('docs/10_game_runtime/datasets/game_runtime.dataset.csv', CSV_HEADER)
  local row = {
    ['id']=rec.id, ['ts']=rec.ts,
    ['player.level']=rec.player.level, ['player.hp']=rec.player.hp, ['player.maxHp']=rec.player.maxHp,
    ['player.mana']=rec.player.mana, ['player.maxMana']=rec.player.maxMana, ['player.cap']=rec.player.cap,
    ['player.soul']=rec.player.soul, ['player.speed']=rec.player.speed, ['player.pos']=rec.player.pos,
    ['combat.fightMode']=rec.combat.fightMode, ['combat.pvpMode']=rec.combat.pvpMode, ['combat.inFight']=rec.combat.inFight
  }
  docio.appendCsvRow('docs/10_game_runtime/datasets/game_runtime.dataset.csv', CSV_HEADER, row, MAX_BYTES)
end

-- Sterowanie cyklicznym snapshotem (na IPC lub makrze vBot)
function start_game_runtime_snapshots()
  running = true
end

function stop_game_runtime_snapshots()
  running = false
end

-- Jednorazowy bieg (wywolaj bezpiecznie z makra lub IPC)
-- snapshot()
```

extractors/game_runtime_stats.lua

```lua
-- 10_game_runtime/extractors/game_runtime_stats.lua
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
  local head = docio.readAll('docs/10_game_runtime/datasets/game_runtime.dataset.jsonl')
  local headList = parseLines(head)
  for i=1,#headList do recs[#recs+1] = headList[i] end
  local indexText = docio.readAll('docs/10_game_runtime/datasets/chunks/index.json')
  if indexText and #indexText > 0 then
    local ok, list = pcall(function() return json.decode(indexText) end)
    if ok and type(list) == 'table' then
      for _,fname in ipairs(list) do
        local path = fname
        if not tostring(fname):match('^docs/') then
          path = 'docs/10_game_runtime/datasets/chunks/' .. tostring(fname)
        end
        local t = docio.readAll(path)
        local more = parseLines(t)
        for i=1,#more do recs[#recs+1] = more[i] end
      end
    end
  end
  return recs
end

local function statsPct(sum, n)
  if n <= 0 then return 0 end
  return (sum / n)
end

local function stats(re)
  local s = { count = #re, hpPct = {min=nil,max=nil,avg=0}, mpPct = {min=nil,max=nil,avg=0}, speed = {min=nil,max=nil,avg=0}, fightMode = {}, pvpMode = {} }
  local hps, mps, speeds = 0, 0, 0
  for _,r in ipairs(re) do
    local hp = tonumber(r.player and r.player.hp) or 0
    local mh = tonumber(r.player and r.player.maxHp) or 0
    local mp = tonumber(r.player and r.player.mana) or 0
    local mm = tonumber(r.player and r.player.maxMana) or 0
    local sp = tonumber(r.player and r.player.speed) or 0
    local hpP = (mh > 0) and (100.0 * hp / mh) or 0
    local mpP = (mm > 0) and (100.0 * mp / mm) or 0

    s.hpPct.min = (s.hpPct.min and math.min(s.hpPct.min, hpP)) or hpP
    s.hpPct.max = (s.hpPct.max and math.max(s.hpPct.max, hpP)) or hpP
    s.mpPct.min = (s.mpPct.min and math.min(s.mpPct.min, mpP)) or mpP
    s.mpPct.max = (s.mpPct.max and math.max(s.mpPct.max, mpP)) or mpP

    hps = hps + hpP
    mps = mps + mpP
    speeds = speeds + sp

    local fm = tostring(r.combat and r.combat.fightMode or '')
    local pm = tostring(r.combat and r.combat.pvpMode or '')
    s.fightMode[fm] = (s.fightMode[fm] or 0) + 1
    s.pvpMode[pm] = (s.pvpMode[pm] or 0) + 1
  end
  if s.count > 0 then
    s.hpPct.avg = hps / s.count
    s.mpPct.avg = mps / s.count
    s.speed.min = nil; s.speed.max = nil -- opcjonalnie licz min/max speed
    s.speed.avg = speeds / s.count
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
  md[#md+1] = '# Game Runtime - Statystyki\n\n'
  md[#md+1] = string.format('- Rekordy: %d\n', s.count)
  md[#md+1] = string.format('- HP%% min/avg/max: %.2f / %.2f / %.2f\n', s.hpPct.min or 0, s.hpPct.avg or 0, s.hpPct.max or 0)
  md[#md+1] = string.format('- MP%% min/avg/max: %.2f / %.2f / %.2f\n', s.mpPct.min or 0, s.mpPct.avg or 0, s.mpPct.max or 0)
  md[#md+1] = string.format('- Speed avg: %.2f\n', s.speed.avg or 0)
  md[#md+1] = ''
  md[#md+1] = writeSection('## Fight mode', s.fightMode)
  md[#md+1] = writeSection('## PvP mode', s.pvpMode)
  md[#md+1] = 'Hint: porownaj HP% spikes z eventami walki i zmianami UI.\n'
  return table.concat(md)
end

local function run()
  local recs = loadAllRecords()
  local s = stats(recs)
  docio.writeAll('docs/10_game_runtime/stats/stats.json', json.encode(s))
  docio.writeAll('docs/10_game_runtime/stats/stats.md', writeMD(s))
end

run()
```

---

### 10) Diagram (Mermaid)

diagrams/game_runtime_flow.mmd

```mermaid
graph TD
  Studio[Electron Studio] -->|IPC start/stop| Snapshotter
  Snapshotter --> NDJSON[(game_runtime.dataset.jsonl)]
  Snapshotter --> CSV[(game_runtime.dataset.csv)]
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
- Prywatnosc: domyslnie nie zapisujemy nazw postaci ani czatu.
- Snapshot tick nie powinien przekraczac 1-2 Hz w srodowisku produkcyjnym.

---

### 13) DoD Checklist - Agent clickable

- [ ] Zapis do docs/10_game_runtime/datasets/game_runtime.dataset.jsonl i game_runtime.dataset.csv dziala (>= 300 rekordow z 5-min przebiegu przy 1 Hz).
- [ ] Wygenerowano stats/stats.json oraz stats/stats.md (deterministyczny output list).
- [ ] Uzupelniono sekcje: 00_game_runtime_basics.md, 01_introduction.md, 02_game_runtime_model.md (z przykladami), 03_collection_methods.md.
- [ ] W analysis/correlations.md dodano min. 1 korelacje game_runtime -> events/ui/logging.
- [ ] Diagram game_runtime_flow.mmd istnieje i jest logiczny.
- [ ] meta.json ma poprawne crosslinks: ../01_runtime, ../02_events, ../04_ui, ../09_logging.
- [ ] Walidacja probki 20 linii NDJSON przeciw game_runtime.schema.json zakonczona bez bledow.

---

### 14) meta.json - wzorzec z tagami i linkowaniem

```json
{
  "$schemaVersion": 1,
  "chapterId": "chapter:game_runtime",
  "title": "Game Runtime - Time Series Snapshots",
  "owners": ["docs-export"],
  "tags": ["runtime","game","player","snapshots","otclient","agent"],
  "fileMap": {
    "readme": "./README.md",
    "schema": "./game_runtime.schema.json",
    "sections": [
      "./sections/00_game_runtime_basics.md",
      "./sections/01_introduction.md",
      "./sections/02_game_runtime_model.md",
      "./sections/03_collection_methods.md",
      "./sections/04_quality_and_limits.md",
      "./sections/05_how_to_read_stats.md"
    ],
    "datasets": {
      "jsonl": "./datasets/game_runtime.dataset.jsonl",
      "csv": "./datasets/game_runtime.dataset.csv",
      "chunksDir": "./datasets/chunks"
    },
    "stats": {
      "json": "./stats/stats.json",
      "md": "./stats/stats.md"
    },
    "analysis": {
      "findings": "./analysis/findings.md",
      "correlations": "./analysis/correlations.md",
      "figuresDir": "./analysis/figures"
    },
    "extractors": [
      "./extractors/game_runtime_snapshot.lua",
      "./extractors/game_runtime_stats.lua"
    ],
    "diagrams": [
      "./diagrams/game_runtime_flow.mmd"
    ],
    "config": {
      "policy": "./config/game_runtime.policy.json",
      "sampling": "./config/game_runtime.sampling.ms"
    }
  },
  "linking": {
    "recordIdPattern": "grt:<ISO8601>",
    "crossChapter": {
      "runtime": "../01_runtime/README.md",
      "events": "../02_events/README.md",
      "ui": "../04_ui/README.md",
      "logging": "../09_logging/README.md"
    }
  },
  "agent": {
    "tasks": [
      {"id": "snapshot", "desc": "Cykliczne snapshoty game runtime do JSONL/CSV", "outputs": ["datasets.jsonl", "datasets.csv"]},
      {"id": "aggregate", "desc": "Agregacja do stats.json/stats.md", "outputs": ["stats.json", "stats.md"]},
      {"id": "author", "desc": "Uzupelnienie sekcji i korelacji + wstrzykniecia danych", "targets": ["sections/*", "analysis/*"]}
    ],
    "insertPoints": {
      "sections/02_game_runtime_model.md": ["AGENT:INSERT:GRuntime-EXAMPLES"],
      "sections/05_how_to_read_stats.md": ["AGENT:INSERT:READING-GUIDE"],
      "analysis/findings.md": ["AGENT:INSERT:FINDINGS"],
      "analysis/correlations.md": ["AGENT:INSERT:CORRELATIONS"]
    }
  }
}
```

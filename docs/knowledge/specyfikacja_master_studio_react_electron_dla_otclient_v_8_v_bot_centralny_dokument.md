# Specyfikacja implementacji (MASTER v1.0): **Studio React/Electron** dla skryptów **OTClient v8** + **modules/game_bot (vBot)**
> Dokument centralny – pełna, profesjonalna specyfikacja do autonomicznej implementacji narzędzia. Zawiera architekturę, modele danych, protokoły, checklisty, reguły jakości, plan wdrożenia, testy, ryzyka i artefakty startowe. Wszystkie kroki są deterministyczne i możliwe do zautomatyzowania na podstawie danych zawartych w tym dokumencie.

---
# 0. Executive Summary
- **Cel:** zbudować wieloplatformowe Studio (desktop **Electron** + **React/TypeScript**) do tworzenia, analizy i utrzymania skryptów **Lua/OTUI/OTML** dla **OTClient v8** oraz **vBot**.
- **Core features:**
  1) Inteligentne **podpowiedzi API** (kuratorowany `api.json` + indeks ze skanu repo),
  2) **Lint/auto‑fix** dla **OTUI** i lekkie reguły dla **Lua**,
  3) **Generator** modułów/szablonów,
  4) Integracja z klientem: **hot‑reload** i **Log Viewer** (debug przez logi),
  5) Praca **offline‑first**.
- **Ograniczenia:** brak oficjalnego step‑debuggera Lua; debug realizowany przez logi oraz hot‑reload.

---
# 1. Słownik pojęć
- **OTClient v8** – klient gry (Lua/OTUI/OTML).
- **vBot** – moduł `modules/game_bot` (makra/triggery).
- **Hot‑reload** – `g_modules.reloadModules()` (skrót w kliencie lub moduł dev).
- **Flag file** – plik‑flaga `modules/.dev/reload.flag` wyzwalający hot‑reload.
- **NDJSON** – log *newline‑delimited JSON* (każda linia = obiekt JSON).

---
# 2. Zakres / Poza zakresem
**MVP w zakresie:** edycja Lua/OTUI/OTML, podpowiedzi API, lint/auto‑fix (OTUI + Lua‑lite), generator szablonów, skan repo i indeks, Log Viewer, hot‑reload.

**Poza MVP:** step‑debugger (breakpointy), zdalne eval Lua; profiling runtime; złożone RPC do klienta (inne niż plik/log/skrót).

---
# 3. Architektura systemu
**Wariant rekomendowany:** Desktop **Electron** (React/TS + Node/FS), integracja z OTClient przez system plików i skrót hot‑reload.

```
+--------------------+       IPC        +-------------------+
| React/TS Frontend  | ←------------→ | Electron Main/Pre |
| (Vite + Monaco)    |                  |   + Node/FS       |
+--------------------+                  +-------------------+
          |   FS (read/write JSON, pliki projektu)
v
+--------------------+         plik/flag/log         +----------------+
|  Projekt lokalny   | ←--------------------------→ |  OTClient v8  |
| (lua/otui/otmod/…) |                               | (hot‑reload)  |
+--------------------+                                +----------------+
```

**Alternatywa web:** React + lokalny serwis Node (HTTP/WebSocket) + File System Access API (ograniczenia dostępu; rekomendowane tylko gdy Electron jest niewskazany).

---
# 4. Wymagania funkcjonalne (FR)
**FR‑01 – Projekty:** wybór katalogu, ostatnie projekty, walidacja (`modules/`, `.otmod`).
**FR‑02 – Eksplorator:** drzewo `.lua/.otui/.otmod` + assets; CRUD na plikach; drag‑drop; operacje atomowe.
**FR‑03 – Edytor:** Monaco (Lua/OTUI/OTML/JSON), go‑to symbol, minimapa, format, folding.
**FR‑04 – IntelliSense:** hover, signature help, autocomplete z `api.json` + indeks projektu + docstrings.
**FR‑05 – Lint OTUI:** kolejność pól, `tr()` dla stałych, anchors/margins, istnienie zasobów; auto‑fix dla kolejności i `tr()`.
**FR‑06 – Lint Lua (lite):** preferuj `local`, wykryj globalne; `table.unpack` vs `unpack`.
**FR‑07 – Generator:** moduły (`.otmod` + `main.lua` + `ui/*.otui`) + snippety vBot z checklistą.
**FR‑08 – Skan/Indeks:** glob, parsery Lua/OTUI/OTML, relacje `dofile/require` i `g_ui.loadUI`; cache inkrementalny.
**FR‑09 – Integracja z OTClient:** przycisk „Przeładuj w kliencie” (skrót/flag file).
**FR‑10 – Log Viewer:** tail NDJSON/tekst, filtry (level/tag/file:line), wyszukiwarka, eksport.
**FR‑11 – Ustawienia:** ścieżki artefaktów i logu, ignore patterns, motyw; import/eksport.
**FR‑12 – Wbudowany help:** panel „API & How‑to”, wyszukiwarka offline.

**Kryteria akceptacji (wybrane):** indeks 5k plików < 5 s z cache; brak crashy przy edycji plików 2 MB; >90% trafień podpowiedzi dla znanych symboli; auto‑fix deterministyczny.

---
# 5. Wymagania niefunkcjonalne (NFR)
- **Perf:** indeks < 5 s (cache), < 30 s zimny start; Monaco 60 FPS podczas pisania.
- **Security:** brak sieci (offline‑first), sandbox Renderer, IPC whitelist, brak uruchamiania Lua.
- **Portability:** Windows/macOS/Linux; Web (opcjonalnie, ograniczenia FS API).
- **Reliability:** zapisy atomowe (temp→rename), odtwarzanie cache po awarii.

---
# 6. Kontrakty i modele danych (kanoniczne, wersjonowane)
> Każdy JSON zawiera `$schemaVersion` i jest walidowany testami kontraktowymi.
# 6.1. `resources/api.json` (kuratorowane, seed + ingest)
```json
{
  "$schemaVersion": 1,
  "generatedAt": "2025-10-02T00:00:00Z",
  "functions": [
    {"name": "g_modules.reloadModules", "module": "g_modules", "params": [], "returns": [], "description": "Przeładowuje moduły i skrypty OTClient.", "since": "v8"},
    {"name": "g_resources.readFile", "module": "g_resources", "params": [{"name": "path", "type": "string"}], "returns": [{"type": "string"}], "description": "Czyta plik do stringa."},
    {"name": "g_resources.writeFile", "module": "g_resources", "params": [{"name": "path", "type": "string"}, {"name": "data", "type": "string"}], "returns": [{"type": "boolean"}], "description": "Zapisuje string do pliku."}
],
  "events": [
    {"name": "onGameStart", "target": "Game", "payload": [], "description": "Wywoływane przy starcie gry."}
],
  "objects": [
    {"name": "g_resources", "members": ["readFile", "writeFile"], "description": "Menedżer zasobów."}
]
}
```
> **Uwaga:** to seed. Pełny `api.json` powstaje wg §7 z lokalnych plików dokumentacji.
# 6.2. `project-index.json` (z automatycznego skanu)
```json
{
  "$schemaVersion": 1,
  "root": "/abs/path/to/project",
  "files": {"lua": ["modules/game_bot/bot.lua", "modules/client/client.lua"], "otui": ["modules/client/ui/main.otui"], "otmod": ["modules/client/client.otmod"]},
  "symbols": {"functions": {"reloadScripts": ["modules/client/client.lua:120"]}, "widgets": {"MainWindow": ["modules/client/ui/main.otui:5"]}},
  "relations": {"lua_to_otui": [{"lua": "modules/client/client.lua", "otui": "modules/client/ui/main.otui", "via": "g_ui.loadUI"}], "includes": [{"from": "modules/a/main.lua", "to": "modules/a/util.lua", "via": "dofile"}]}
}
```
# 6.3. `otui-rules.json` (lint/auto‑fix)
```json
{"$schemaVersion":1,"rules":[{"id":"OTUI-001","description":"Kolejność pól: GEOMETRIA→STYL→ZACHOWANIE.","fixable":true},{"id":"OTUI-002","description":"Stałe stringi muszą używać tr().","fixable":true},{"id":"OTUI-003","description":"Walidacja anchors/margins (brak sprzeczności).","fixable":false},{"id":"OTUI-004","description":"Weryfikacja istnienia zasobów (obrazy, fonty, style).","fixable":false}]}
```
# 6.4. `templates.json` (generator)
```json
{"$schemaVersion":1,"module.default":{"title":"Moduł OTClient — szkielet","files":[{"path":"modules/hello/hello.otmod","contents":"name: hello\n"},{"path":"modules/hello/hello.lua","contents":"-- entry point\nlocal M = {}\nreturn M\n"},{"path":"modules/hello/ui/hello.otui","contents":"MainWindow < UIWidget { }\n"}],"checklist":["Umieść katalog w modules/","Uruchom klienta i przeładuj moduły","Sprawdź log po starcie modułu"]}}
```
# 6.5. `docstrings.json`
```json
{"$schemaVersion":1,"entries":[{"file":"modules/x/main.lua","line":10,"symbol":"foo","params":[{"name":"a","type":"number"}],"returns":[{"type":"boolean"}],"comment":"---@param a number\n---@return boolean"}]}
```
# 6.6. `assets-map.json`
```json
{"$schemaVersion":1,"assets":{"images":["images/button.png"],"fonts":["fonts/verdana.otf"],"styles":["styles/dark.otui"]}}
```
# 6.7. `.studio/config.json`
```json
{"$schemaVersion":1,"projectRoot":"/abs/path/to/project","apiPath":"resources/api.json","otuiRulesPath":"resources/otui-rules.json","templatesPath":"resources/templates.json","logPath":"/abs/path/to/log.ndjson","ignore":["**/node_modules/**",".git/**"]}
```

---
# 7. Procedura ingest – budowa `api.json`
**Wejścia:** lokalne pliki dokumentacji (`OTClient_data_documentation_FULL.md`, `luafunctionscpp.md`, `modules_Documentation.md`, `src framework.md`, `src client.md`).

**Kroki:**
1) Segmentacja MD (H1–H3) i klasyfikacja sekcji: API/Events/Hooks/Globals/Managers.
2) Ekstrakcja sygnatur: `name(params) → returns`, opisów, przykładów, statusu (`since/deprecated`).
3) Normalizacja nazewnictwa (`module`: `g_resources`, `g_modules`, itp.).
4) Walidacja: unikalne `name`, kompletne `params/returns`.
5) Scalanie z `docstrings.json` (uzupełnienia typów/przykładów).
6) Eksport `resources/api.json` (dodaj `generatedAt`, `$schemaVersion`).

**Wzorce (regex – przykładowe):**
- Funkcja: `^\s*([A-Za-z0-9_\.\:]+)\s*\(([^)]*)\)\s*(?:→\s*([^\n{]+))?`
- Param: `---@param\s+(\w+)\s+([\w<>\|]+)`
- Return: `---@return\s+([\w<>\|]+)`
- Event: `\bon[A-Z][A-Za-z0-9]+\b` (lub sekcje „Events”).

**Polityka typów:** `string|number|boolean|table|any|nil|function|userdata`; `optional` jeśli oznaczone `?` lub w kwadratowych nawiasach.

**Quality Gate:** 0 duplikatów; ≥95% pozycji z opisem i kompletnymi parametrami; walidacja JSON wg schematu.

---
# 8. Skaner i parsery – specyfikacja
**FS skan:** glob `**/*.{lua,otui,otmod}`; wyklucz `.git/**`, `**/node_modules/**`, `**/.studio-cache/**`; hash (size+mtime) → indeks inkrementalny.

**Parser Lua:**
- Tokenizacja: identyfikatory, stringi, komentarze (`--`, blokowe), słowa kluczowe.
- Ekstrakcja: `function name(...)`, `obj:method(...)` (pozycja file:line).
- Docstrings: `---` + adnotacje `---@param`, `---@return` → `docstrings.json`.
- Relacje: `dofile("path")`, `require("...")` → `relations.includes`.
- Heurystyki vBot: wykrywanie `macro(`, `onTextMessage`, itp. → tag `botSymbols`.

**Parser OTUI/OTML:**
- AST wg skróconej EBNF:
```
File := (Decl | Comment)*
Decl := Type ("<" Base ">")? "{" (KV | Decl)* "}"
KV   := Key ":" Value
Value:= String | Number | Bool | Ident | Array | Object
```
- Kategoryzacja atrybutów: GEOMETRIA (`x`,`y`,`width`,`height`,`anchors`,`margin`), STYL (`font`,`color`,`image`,`style`), ZACHOWANIE (`draggable`,`onClick`,`id`).
- Relacje: `g_ui.loadUI("path")` → `relations.lua_to_otui`.

**Parser `.otmod`:** klucz:wartość (+ listy); wymagane `name`; waliduj znaki w `name`.

**Kody błędów parsera:** `P001` (Lua tokenizer), `P101` (OTUI niezamknięty blok), `P201` (.otmod brak `name`).

---
# 9. Lint/Auto‑fix – reguły
- **OTUI‑001 (order):** sortuj atrybuty: GEOMETRIA → STYL → ZACHOWANIE (auto‑fix: przetasuj z zachowaniem komentarzy).
- **OTUI‑002 (tr):** stałe literały string wrapuj `tr()` (auto‑fix; ignoruj `id`/nazwy klas).
- **OTUI‑003 (anchors):** wykryj sprzeczności anchors/margins (sugestie, bez auto‑fix).
- **OTUI‑004 (assets):** zgłoś brakujące zasoby (fuzzy podpowiedzi).
- **LUA‑001 (locals):** ostrzegaj globali; auto‑fix: `local` jeśli bez kolizji.
- **LUA‑002 (unpack):** zamieniaj `unpack` → `table.unpack` (auto‑fix bezpieczny).

---
# 10. Integracja z OTClient (hot‑reload, logi)
**Tryb A (podstawowy):** zapis → skrót hot‑reload w kliencie (np. Ctrl+Shift+R).

**Tryb B (z modułem dev):** Studio zapisuje `modules/.dev/reload.flag`; moduł dev w kliencie wykrywa i:
1) wywołuje `g_modules.reloadModules()`,
2) usuwa/przepisuje plik flagi,
3) opcjonalnie loguje wynik (NDJSON) do `modules/.dev/log.jsonl`.

**Szkic modułu dev (Lua):**
```lua
local dev = {}
local flagPath = 'modules/.dev/reload.flag'

local function readFile(path)
  local ok, data = pcall(function() return g_resources.readFile(path) end)
  if not ok then return nil end
  return data
end

local function fileExists(path)
  local data = readFile(path)
  return data ~= nil and #data > 0
end

local function tryReload()
  if fileExists(flagPath) then
    print('[dev] reload flag detected')
    g_modules.reloadModules()
    g_resources.writeFile(flagPath, '')
  end
end

local function start()
  addEvent(function()
    tryReload()
    scheduleEvent(start, 500)
  end)
end

start()
return dev
```

**Logi (NDJSON):** pola: `ts` (ISO), `level` (INFO|WARN|ERROR), `tag`, `file`, `line`, `msg`, `meta`.

Przykład:
```json
{"ts":"2025-10-02T12:34:56.789Z","level":"INFO","tag":"dev","file":"modules/x/main.lua","line":42,"msg":"Hot reload done","meta":{"changed":3}}
```

---
# 11. UI/UX (ekrany i przepływy)
- **Start:** wybór/ostatnie projekty, skróty do dokumentacji, „Nowy moduł”.
- **Eksplorator:** drzewo plików, akcje kontekstowe, status operacji FS.
- **Edytor:** Monaco + panel boczny (API/Doc), statusbar (pozycja, problems, encoding).
- **Diagnostyka:** lista Issues (filtry), Quick Fix, przejścia do linii.
- **API Browser:** lista obiektów → szczegóły (opis, params, examples) → „Wstaw snippet”.
- **Log Viewer:** stream z filtrami (ERR/WARN/INFO), szukanie, pauza, eksport.
- **Ustawienia:** ścieżki zasobów, logu, motyw, ignorowane foldery, mapowanie skrótu.

---
# 12. IPC (Electron) – kontrakty
- `studio:scan:start` – req: `{root}` → res: `project-index.json` | err: `{code,msg}`
- `studio:api:load` – req: `{path}` → res: `api.json`
- `studio:lint:run` – req: `{files[]}` → res: `{problems[]}`
- `studio:templates:generate` – req: `{templateId, targetDir, vars}` → res: `{createdFiles[]}`
- `studio:log:tail` – req: `{path}` → stream: `{line}` | `{eof}` | `{error}`

**Błędy:** `E_FS_001` (dostęp FS), `E_PARSE_LUA`, `E_PARSE_OTUI`, `E_JSON_SCHEMA`.

---
# 13. Warstwa stanu FE
- **Zustand:** `projectStore`, `editorStore`, `diagnosticsStore`, `apiStore`, `logStore`.
- **Persist:** `.studio/config.json` przez backend FS.
- **Normalizacja:** mapy symboli `name → {files[]}`.

---
# 14. Bezpieczeństwo i prywatność
- Renderer sandbox, restrykcyjne IPC, brak sieci (domyślnie), brak wykonywania Lua.
- Backup `.bak` przy auto‑fixach; zapisy atomowe.

---
# 15. Wydajność i stabilność
- Worker Threads dla parserów; debounce 150 ms; cache w `.studio-cache/`.
- „Big file mode” w Monaco > 2 MB (ograniczenie części funkcji).

---
# 16. i18n, A11y, theming
- i18n: `en`/`pl`; wymuszaj `tr()` w OTUI poprzez lint.
- A11y: ARIA, focus outlines, kontrast WCAG AA.
- Tematy: Light/Dark/High‑Contrast; zapis w config.

---
# 17. Testy i QA
- **Unit:** parsery (Lua/OTUI), lint rules, generator.
- **Contract:** walidacja JSON kontra schemat, IPC payloady/typy.
- **Integration:** skan 5k plików, pomiary czasu/RAM.
- **E2E (Playwright):** flow „Open → Edit → Lint → Generate → Reload → Logs”.
- **Regression:** snapshot AST/diagnostyki.

**DoD (final):** patrz §21 – wszystkie punkty odhaczone.

---
# 18. Build/Release/Update
- `electron-builder` (Win NSIS, macOS dmg, Linux AppImage); podpisy binarek.
- Auto‑update (opcjonalny), domyślnie wyłączony – narzędzie offline‑first.

---
# 19. Observability narzędzia
- Log aplikacji: `.studio/logs/app.ndjson`; poziomy: DEBUG/INFO/WARN/ERROR.
- Metryki: czas skanu, liczba plików, czas lintu, błędy parserów.

---
# 20. Migracje i zgodność
- `$schemaVersion` w artefaktach; migracje `vN → vN+1` dla config/cache.

---
# 21. Plan wdrożenia i checklisty
**Etap 0 – Inicjalizacja**
- [ ] Monorepo (pnpm), Vite+React+TS, Electron scaffold.
- [ ] Monaco, routing, layout.

**Etap 1 – Kontrakty i zasoby**
- [ ] Interfejsy TS (ApiFunction/ApiEvent/ProjectIndex/OtuiRule/Template).
- [ ] Dodać `resources/api.json` (seed), `otui-rules.json`, `templates.json`.

**Etap 2 – Skaner/Parsery**
- [ ] Glob/FS, cache, incremental hashing.
- [ ] Parser Lua + docstrings + relacje.
- [ ] Parser OTUI/OTML + kategoryzacja atrybutów.
- [ ] Parser `.otmod`.

**Etap 3 – IDE/UX**
- [ ] Explorer, Edytor, API Browser.
- [ ] Diagnostyka + Quick Fix.

**Etap 4 – Integracja z klientem**
- [ ] Przeładuj (skrót/flag) + Log Viewer.

**Etap 5 – Stabilizacja**
- [ ] Testy (unit/contract/integration/E2E), pakiety instalacyjne.

**Definition of Done (Końcowe):**
- [ ] Aplikacja offline; projekty się otwierają; indeks i symbole działają.
- [ ] `api.json` zasila podpowiedzi (hover/complete/signature help).
- [ ] Lint OTUI/Lua i auto‑fix (backup `.bak`).
- [ ] Integracja z OTClient: hot‑reload + logi stabilne.
- [ ] Pakiety Win/macOS/Linux; dokumentacja użytkownika; sample project.

---
# 22. Ryzyka i mitigacje
- **Brak step‑debuggera:** Log Viewer + snippety logujące + mapowanie file:line.
- **Różnice wersji:** `since/deprecated` w `api.json`, profile klienta.
- **Wydajność:** indeks inkrementalny, workers, throttling.
- **Parsery:** testy kontraktowe + snapshoty, tolerant parsing.

---
# 23. Artefakty – komplet MVP (gotowe w tym dokumencie)
- `resources/api.json` – seed (6.1 + 24.A)
- `resources/otui-rules.json` – (6.3 + 24.B)
- `resources/templates.json` – (6.4 + 24.C)
- `docstrings.json` – format (6.5)
- `assets-map.json` – format (6.6)
- `.studio/config.json` – format (6.7)

---
# 24. Przykładowe dane (seed do startu)
**A. `resources/api.json` (seed)** – patrz §6.1 (pełny JSON wstawiony).

**B. `resources/otui-rules.json` (seed)** – patrz §6.3 (pełny JSON wstawiony).

**C. `resources/templates.json` (seed)** – patrz §6.4 (pełny JSON wstawiony).

---
# 25. Noty końcowe
- Ten dokument jest **źródłem prawdy (SoT)**. Dodatkowe canvasy muszą odwoływać się do sekcji (§) i kontraktów tutaj zdefiniowanych.
- Zmiany wymagają podniesienia `$schemaVersion` i przejścia testów kontraktowych.
- Wszelkie dane są przygotowane z myślą o pracy **offline** w oparciu o lokalne pliki dokumentacji i kodu.


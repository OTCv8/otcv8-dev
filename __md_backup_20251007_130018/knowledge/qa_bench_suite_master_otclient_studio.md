# QA & Bench Suite (MASTER) – **OTClient Studio**

> Cel: kompletna, wykonywalna specyfikacja testów jakości i benchmarków dla **Studio React/Electron** tworzącego skrypty **OTClient v8 + vBot**. Dokument opisuje: matrycę testową, wektory testów, E2E (Playwright), benchmarki (perf/mem), stabilność/awarie, bezpieczeństwo, CI/CD, metryki oraz kryteria akceptacji. **Transfer 1:1** – gotowe do bezpośredniej implementacji.

---
# # 0) Zakres i założenia
- **Zakres QA:** parsery (Lua‑Lite/OTUI/OTML), lint (OTUI/Lua), generator szablonów, IDE providers (hover/completion/signature/symbols), integracja z OTClient (hot‑reload + logi NDJSON), UI/UX, FS/konfiguracja, i18n/A11y, bezpieczeństwo, wydajność i stabilność.
- **Profil działania:** offline‑first, deterministyczne wyniki, brak uruchamiania Lua.
- **Źródła kontraktów:**
  - Schematy AST i JSON: *Parser & Schemas (MASTER)*.
  - Spec MASTER implementacji: *Specyfikacja implementacji (MASTER)*.
  - Lint: *OTUI Lint Rules (MASTER)*.
  - vBot: *vBot Playbook (MASTER)*.
  - IDE: *IDE Providers Spec (MASTER)*.

---
# # 1) Matryca testowa (obszary × kategorie)
| Obszar | Kategorie testów |
|---|---|
| **Parsery** | poprawność AST vs schema, tolerance (ParseError), relacje (`dofile`, `g_ui.loadUI`), edge‑cases (komentarze/unicode) |
| **Lint** | wykrywalność, auto‑fix, idempotencja, kolizje reguł, konfiguracja `otui-rules.json` |
| **Generator** | tworzenie modułów/szablonów, integralność ścieżek, zgodność z lintem/AST |
| **IDE Providers** | completion ranking, hover agregacja, signature mapping, symbols, definition/references (MVP+) |
| **Integracja OTClient** | hot‑reload (skrót/flag), log NDJSON (format/rotacja), odporność na brak katalogu |
| **Log Viewer** | tail duży/żywy plik, filtry, eksport, stabilność >1h |
| **FS/Config** | ścieżki, atomowe zapisy, migracje configu, ignorowane foldery |
| **UI/UX** | nawigacja, edycja, quick‑fix, podgląd diff, motywy, skróty |
| **i18n/A11y** | tłumaczenia, `tr()` enforce, ARIA/kontrast |
| **Bezpieczeństwo** | sandbox IPC, brak sieci, ścieżki poza projektem, path traversal, wstrzykiwanie w log |
| **Wydajność** | skan 5k plików (zimny/ciepły), lint throughput, provider latency, tail throughput |
| **Stabilność** | crash recovery, przerwane I/O, uszkodzony cache/config, długi czas działania |

---
# # 2) Konwencje nazw i identyfikatorów testów
- Prefixy **obszarowe**: `PAR-` (Parser), `LNT-` (Lint), `GEN-`, `IDE-`, `INT-` (Integracja), `LOG-`, `FS-`, `CFG-`, `UIX-`, `I18N-`, `A11Y-`, `SEC-`, `PERF-`, `RES-` (Resilience).
- Format ID: `XXX-###` (np. `PAR-011`).

---
# # 3) Zasoby testowe (fixtures) – struktura
```
qa/
├─ fixtures/
│  ├─ sample-project-small/
│  │  ├─ modules/client/client.otmod
│  │  ├─ modules/client/client.lua
│  │  ├─ modules/client/ui/main.otui
│  │  └─ images/button.png
│  ├─ sample-project-large/         # generator wygeneruje 5k plików
│  ├─ otui/
│  │  ├─ valid/
│  │  └─ invalid/
│  ├─ lua/
│  │  ├─ valid/
│  │  └─ invalid/
│  └─ templates/
├─ expected/
│  ├─ ast/
│  ├─ lint/
│  ├─ generator/
│  └─ ide/
└─ manifests/
   ├─ tests.json        # definicje przypadków
   └─ perf.json         # scenariusze benchmarków
```

---
# # 4) Parsery – przypadki i kryteria
**PAR‑001 (OTUI proste):** plik `main.otui` → AST zgodny ze schema `otui-ast.schema.json`; kategorie `id→BEHAVIOR`, `width→GEOMETRY`, `text→STYLE`.
**PAR‑002 (OTUI zagnieżdżenia):** wielopoziomowe `Decl` + dziedziczenie; brak cykli.
**PAR‑003 (OTUI błędy):** niezamknięty blok → `ParseError` z kodem `OTUI_001`, tolerant parsing zwraca resztę AST.
**PAR‑010 (Lua funkcje/metody):** deklaracje `function M.a()` i `obj:method()` → poprawne węzły `FunctionDecl` i `CallExpr.method`.
**PAR‑011 (Lua relacje):** `dofile('x.lua')`, `require('y')` → `relations.includes`.
**PAR‑012 (Lua→OTUI):** `g_ui.loadUI('ui/main.otui')` → `relations.lua_to_otui`.
**PAR‑020 (Docstrings):** `---@param / @return` → `docstrings.json`.
**Kryteria:** walidacja JSON Schema (brak błędów), deterministyczne `loc`, brak crash.

---
# # 5) Lint – przypadki i kryteria
**LNT‑001 (kolejność pól):** wymuś `GEOMETRY→STYLE→BEHAVIOR`, auto‑fix generuje spójny diff, idempotentny (drugie uruchomienie: 0 zmian).
**LNT‑002 (`tr()`):** wrap stałych stringów w `text:`; ignoruj `id`.
**LNT‑003 (anchors/margins):** wykryj sprzeczności, brak auto‑fix (sugestie).
**LNT‑004 (assets):** brakujący obraz/font/style – ERROR z propozycjami (fuzzy).
**LNT‑005 (duplikaty id):** wykryj powtórzenia.
**LNT‑010 (Lua locals):** ostrzeż o globalach; auto‑fix `local` gdy bez kolizji.
**LNT‑011 (`unpack`):** zamień na `table.unpack`.
**Kryteria:** 100% wykrywalności dla zestawu wzorcowego; brak false‑positive dla plików poprawnych.

---
# # 6) Generator – przypadki i kryteria
**GEN‑001 (moduł default):** wygeneruj `.otmod` + `hello.lua` + `ui/hello.otui`; skaner wykrywa pliki; lint OK.
**GEN‑002 (vBot macro):** wygeneruj plik `vb_auto_heal.lua`; zawiera guards + cooldown + log; przechodzi lint Lua‑lite.
**GEN‑010 (konflikt ścieżek):** próba nadpisania istniejących plików → błąd z sugestią `--force` lub zmiany nazwy.
**Kryteria:** pliki powstają atomowo (temp→rename), zawartość zgodna z template, lint = 0 ERROR.

---
# # 7) IDE Providers – przypadki i kryteria
**IDE‑COMP‑01 (Lua, API):** prefiks `g_res` + `.` → `g_resources.readFile` (score ≥ 0.9).
**IDE‑COMP‑02 (OTUI, klucze):** w kontekście klucza lista atrybutów wg kategorii i typów.
**IDE‑COMP‑03 (style):** `style:` → style z `assets-map.json.styles`.
**IDE‑HOV‑01:** hover na `g_modules.reloadModules` → opis z `api.json`.
**IDE‑SIG‑01:** `g_resources.readFile(` → `path: string` jako aktywny parametr.
**IDE‑SYM‑01:** symbole dokumentu (Lua/OTUI) – poprawne zakresy.
**Kryteria:** czasy odpowiedzi zgodne z budżetem (§10), deterministyczny ranking.

---
# # 8) Integracja z OTClient – przypadki i kryteria
**INT‑001 (flaga reload):** utwórz `modules/.dev/reload.flag` → `reload requested/done` w NDJSON.
**INT‑002 (anty‑drganie):** 3× flaga < 800 ms → 1 reload.
**INT‑003 (rotacja logu):** po przekroczeniu `maxLogBytes` plik nie rośnie, odcina pełne linie.
**INT‑010 (brak katalogu .dev):** moduł loguje do konsoli; brak crash.
**Kryteria:** brak wyjątków, log zgodny ze schematem `log-line.schema.json`.

---
# # 9) Log Viewer – przypadki i kryteria
**LOG‑001:** tail żywego pliku (1000 linii/min) bez utraty wpisów.
**LOG‑002:** filtry `level/tag/file:line` działają i zwracają podzbiór deterministycznie.
**LOG‑003:** eksport do `.ndjson` i `.txt` – zawartość zgodna z filtrem.
**Kryteria:** stabilna praca > 1h, zużycie RAM < 200 MB.

---
# # 10) Benchmarki (wydajność) – budżety i scenariusze
**BUDŻETY** (zgodne z MASTER):
- **Skan 5k plików:** ciepły < **5 s**, zimny < **30 s**.
- **Lint pliku OTUI:** < **50 ms** (średnio, na warm cache).
- **Completion:** warm < **6 ms**, cold < **25 ms**.
- **Tail logu:** ≥ **1000 linii/min** bez backlogu; CPU < **15%** na 4C/8T.
- **RAM indeksu 5k:** < **500 MB**.

**Scenariusze benchmarków:**
- **PERF‑SCAN‑01:** sample-project-large (5k) – zimny start, pomiar czasu i RAM.
- **PERF‑SCAN‑02:** powtórka (ciepły cache) – czas < 5 s.
- **PERF‑LINT‑01:** batch 100 plików OTUI – czas całkowity < 2 s.
- **PERF‑COMP‑01:** 100 zapytań completion (warm) – P95 < 6 ms.
- **PERF‑LOG‑01:** tail logu 30 min – brak wzrostu RAM.

**Format wyników (NDJSON):**
```json
{"ts":"...","bench":"PERF-SCAN-01","metric":"timeMs","value":12345,"meta":{"files":5000}}
{"ts":"...","bench":"PERF-COMP-01","metric":"p95Ms","value":5.7}
```

---
# # 11) Stabilność i odporność (Resilience)
**RES‑001 (przerwane I/O):** zapis atomowy (temp→rename); wymuś przerwanie → brak korupcji pliku docelowego.
**RES‑002 (uszkodzony cache):** `.studio-cache/*` nieczytelne → auto‑regeneracja bez crash.
**RES‑003 (uszkodzony config):** `.studio/config.json` – błąd schema → komunikat i wczytanie domyślnego.
**RES‑004 (duże pliki):** > 2 MB → „big‑file mode” (ograniczone funkcje) bez crash.
**RES‑005 (długi runtime):** 8h działania, brak wycieków (> +10% RAM).

---
# # 12) Bezpieczeństwo
**SEC‑001 (sandbox IPC):** tylko whitelista kanałów; próby nieznanych kanałów → odrzucone + log.
**SEC‑002 (path traversal):** wejścia z `..` → normalizacja i odrzucenie spoza `projectRoot`.
**SEC‑003 (no network):** brak wychodzących połączeń; monitoruj próby i loguj ostrzeżenie.
**SEC‑004 (log injection):** znaki sterujące w `msg` → escapowane; NDJSON zawsze poprawny JSON.
**SEC‑005 (arb. exec):** brak wykonywania Lua; walidacje w generatorze (bez eval).

---
# # 13) E2E (Playwright) – scenariusze
**E2E‑01 – Open → Edit → Lint → Generate → Reload → Logs**
1. Uruchom Studio (Electron, headless jeśli możliwe).
2. Wskaż `sample-project-small`.
3. Otwórz `ui/main.otui`; wstaw błąd kolejności; sprawdź diagnostykę.
4. Uruchom Quick Fix (OTUI‑001); potwierdź diff; zapis.
5. Generator: „Moduł default” → utwórz `modules/hello/*`.
6. Utwórz `modules/.dev/reload.flag` → potwierdź wpisy w Log Viewer.
7. Filtruj log po `tag=reload`; eksport do `.ndjson`.
**Kryteria:** brak błędów; czasy kroków < 2 s każdy.

**E2E‑02 – IntelliSense flow**
1. Otwórz `client.lua`; wpisz `g_res` + `.`.
2. Sprawdź, że lista zawiera `g_resources.readFile` z wysokim score.
3. Hover na `g_modules.reloadModules` → opis.
4. Wpisz `g_resources.readFile(` → signature `path: string`.
**Kryteria:** odpowiedzi < budżetów, poprawna zawartość.

---
# # 14) CI/CD – pipeline i artefakty
**Narzędzia:** pnpm/yarn, Vitest/Jest, Playwright, `electron-builder` (dry‑run), validator JSON Schema.

**Skrypty:**
```
pnpm test:unit       # parsery, lint, generator, providers (mock IPC)
pnpm test:contract   # walidacja JSON vs schematy
pnpm test:e2e        # Playwright (Electron)
pnpm bench           # benchmarki (perf.json)
pnpm build:dry       # test buildów installerów bez publikacji
```

**Artefakty CI:**
- Raporty testów JUnit/HTML, logi NDJSON bench, zrzuty ekranów E2E, paczki `*.zip` z fixtures/expected.

**Progi jakości (fail the build):**
- Testy unit/contract/E2E – 100% zielone.
- Bench – żadna metryka > budżet (P95), w przeciwnym razie **UNSTABLE**; dwie kolejne iteracje **FAIL**.

---
# # 15) Metryki i obserwowalność QA
- **Metryki czasowe:** `timeMs`, `p50/p95/p99` dla providers/scan/lint.
- **Metryki pamięci:** `rssMB`, `heapMB` podczas skanu/long‑run.
- **Jakość lintu:** wykrywalność (%) i false‑positive (%).
- **Stabilność:** liczba błędów parsera/IO na godzinę.
- **Trendy:** porównania względem poprzedniego builda (delta%).

**Format metryk (NDJSON):**
```json
{"ts":"...","suite":"bench","case":"PERF-SCAN-01","metric":"timeMs","value":12345}
{"ts":"...","suite":"qa","case":"LNT-001","metric":"fixedIssues","value":7}
```

---
# # 16) Manifest testów i benchmarków
**tests.json (przykład):**
```json
{
  "$schemaVersion": 1,
  "tests": [
    {"id":"PAR-001","path":"qa/fixtures/otui/valid/main.otui","expect":"qa/expected/ast/main.json"},
    {"id":"LNT-001","path":"qa/fixtures/otui/invalid/order.otui","expect":"qa/expected/lint/order.fixed.otui"},
    {"id":"GEN-001","template":"module.default","target":"qa/tmp/out1"}
]
}
```

**perf.json (przykład):**
```json
{
  "$schemaVersion": 1,
  "benches": [
    {"id":"PERF-SCAN-01","project":"qa/fixtures/sample-project-large","metrics":["timeMs","rssMB"]},
    {"id":"PERF-COMP-01","queries":100,"metrics":["p95Ms"]}
]
}
```

---
# # 17) Checklisty i DoD
- [ ] Zasoby testowe zbudowane (small/large, valid/invalid, expected/*).
- [ ] Unit/contract/IDE tests zielone na CI.
- [ ] E2E scenariusze wykonane (zrzuty ekranów zapisane).
- [ ] Bench w granicach budżetów; brak regresji.
- [ ] Raporty i artefakty opublikowane; trendy zaktualizowane.

---
# # 18) Noty końcowe
- Benchmarki uruchamiaj na stabilnym środowisku (stały CPU/Gov, wyłączone inne obciążenia).
- Wszystkie schematy i kontrakty muszą być wersjonowane (`$schemaVersion`) i walidowane przed zapisami.
- Zmiany w budżetach wydajności wymagają przeglądu architektonicznego (ADR) i aktualizacji tego dokumentu.

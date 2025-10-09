# IDE Providers Spec (MASTER) – **Hover**, **Completion**, **Signature Help**, **Symbols**
> Cel: pełna specyfikacja warstwy IDE dla **OTClient Studio** (Monaco + Electron). Dokument definiuje kontrakty, algorytmy, scoring, trigger‑y, schematy JSON, IPC, test‑wektory i wymagania wydajności. **Transfer 1:1** – gotowe do bezpośredniej implementacji.

---
# 0) Założenia i kontekst
- **Języki:** `lua` (Lua‑Lite) i `otui` (OTUI/OTML).
- **Źródła wiedzy:** `resources/api.json` (kuratorowane), `project-index.json` (skan), `docstrings.json` (adnotacje), `otui-rules.json` (lint).
- **Silnik:** Monaco Editor (providers + Diagnostics).
- **Cele:** wysoka trafność podpowiedzi, determinizm wyników, niskie opóźnienia (UX 60 FPS).

---
# 1) Rejestracja języków i providerów (Monaco)
# 1.1 Identyfikatory
- `languageId.luastudio = "lua"` (dialekt Lua‑Lite)
- `languageId.otuistudio = "otui"`
# 1.2 Rejestracja
- `monaco.languages.register({ id: languageId.luastudio })`
- `monaco.languages.register({ id: languageId.otuistudio })`
# 1.3 Providerzy (interfejsy Monaco)
- **Completion**: `registerCompletionItemProvider(id, provider)`
- **Hover**: `registerHoverProvider(id, provider)`
- **Signature Help**: `registerSignatureHelpProvider(id, provider)`
- **Document Symbols**: `registerDocumentSymbolProvider(id, provider)`
- **Definition/References**: (opcjonalnie MVP+) `registerDefinitionProvider`, `registerReferenceProvider`

> Dostawcy komunikują się z warstwą analiz przez **IPC** (sekcja §7) i używają lokalnych cache’y (sekcja §6).

---
# 2) Completion (auto‑uzupełnianie)
# 2.1 Triggery
- **Lua**: `.` `:` `(` `,` spacja po `function`/`local` oraz po `on` (eventy).
- **OTUI**: początek linii/po `\n`, po `:` (wartość), w nagłówku deklaracji po `"<"` (typ bazowy), w kluczu (sugestie atrybutów wg kategorii), po `style:` (style zasobów).
# 2.2 Źródła sugestii
1) **API globalne** (`api.json`): `g_*` managery, funkcje, eventy.
2) **Symbole projektu** (`project-index.json`): funkcje zdefiniowane lokalnie, widżety OTUI, pliki/ścieżki.
3) **Docstrings** (`docstrings.json`): parametry i typy – doprecyzowanie sygnatur.
4) **Heurystyki vBot**: `macro(`, `onTextMessage`, `say(` itp. – boost rank.
# 2.3 Scoring i ranking
Każdy kandydat ma **score** ∈ [0..1]. Końcowa kolejność = malejąco po `score`, tie‑break: długość nazwy ↑, alfabetycznie.

**Składniki score:**
- `s_prefix` – dopasowanie prefiksu (FZF/substring): 0.6–1.0
- `s_source` – priorytet źródła: API=1.0, projekt=0.9, docstring=0.85, heurystyka=0.8
- `s_context` – trafność kontekstu (np. po `.` proponuj członków obiektu; po `:` metody; w OTUI klucze): 0.0–0.3
- `s_recent` – pamięć ostatnio użytych: +0.05 (TTL)

`score = 0.7*s_prefix + 0.2*s_source + 0.1*s_context + s_recent`
# 2.4 Typy pozycji (Monaco CompletionItemKind)
- `Function`, `Method`, `Property`, `Variable`, `Class` (OTUI typy), `Keyword`, `Snippet`, `File`, `Folder`.
# 2.5 Snippety i InsertText
- **Lua – funkcja lokalna:** `local ${1:name} = function(${2:args})\n  ${0}\nend`
- **Lua – moduł skeleton:** `local M = {}\nfunction M.${1:fn}(${2})\n  ${0}\nend\nreturn M`
- **OTUI – widżet:** `${1:Widget} < ${2:UIWidget} {\n  id: ${3:id}\n  width: ${4:100}\n  text: tr("${5:Text}")\n}`
# 2.6 Kontekstowe listy
- **Lua `.`/`:`** → członkowie obiektu (`api.json.objects[].members`) + symbole znalezione w projekcie.
- **OTUI klucz** → lista atrybutów dozwolonych przez typ (kategoria + reguły `otui-rules.json`).
- **OTUI wartość `style:`** → style z `assets-map.json.styles`.
# 2.7 Przykład odpowiedzi (IPC → FE)
```json
{
  "items": [
    {"label":"g_modules.reloadModules","kind":"Function","detail":"OTClient v8","insertText":"g_modules.reloadModules()","range": {"start":123,"end":123},"score":0.98},
    {"label":"g_resources.readFile","kind":"Method","detail":"string readFile(path)","insertText":"g_resources.readFile(${1:path})","insertTextRules":"snippet","score":0.93}
],
  "isIncomplete": false,
  "ttlMs": 3000
}
```

---
# 3) Hover (podgląd dokumentacji)
# 3.1 Zasady agregacji
- Preferuj opis z **`api.json`**; jeżeli brak → **`docstrings.json`**; następnie heurystyki (np. typ identyfikatora z kontekstu).
- Dodaj **sygnaturę**, **opis**, **odsyłacze** (plik:linia) i przykład.
# 3.2 Format treści (Markdown)
- Nagłówek: **Nazwa** i sygnatura, typ zwracany.
- Sekcje: `Opis`, `Parametry`, `Zwraca`, `Przykład`, `Źródło`.
# 3.3 Przykład odpowiedzi
```json
{
  "contents": [
    {"value": "**g_modules.reloadModules()**→ *void*\n\nPrzeładowuje moduły i skrypty w OTClient.\n\n**Źródło:** api.json (v8)", "isTrusted": true}
],
  "range": {"start": 100, "end": 124},
  "ttlMs": 10000
}
```

---
# 4) Signature Help (podpowiedź parametrów)
# 4.1 Triggery
- **Lua:** po wpisaniu `(` oraz po `,` w kontekście wywołania.
- **OTUI:** (opcjonalnie) dla funkcji/event handlerów w wartościach `on...` (jeżeli projekt dopuszcza).
# 4.2 Agregacja sygnatur
- **Priorytet:** `docstrings.json` (najbardziej szczegółowe typy) → `api.json` → heurystyka (typ `any`).
# 4.3 Model danych
```json
{
  "signatures": [
{
      "label": "g_resources.readFile(path: string): string",
      "parameters": [
        {"label": "path: string", "documentation": "Ścieżka do pliku"}
]
}
],
  "activeSignature": 0,
  "activeParameter": 0,
  "ttlMs": 5000
}
```

---
# 5) Document Symbols / Definition / References (MVP+)
# 5.1 Document Symbols (w pliku)
- **Lua:** `FunctionDecl`, `LocalStatement (function)`, `TableConstructor (klucze funkcji)`.
- **OTUI:** `Decl` (nazwa widżetu + `id`), klucze `KV` jako *children*.

**Output (przykład):**
```json
{"symbols":[{"name":"M.reload","kind":"Function","range":{...},"selectionRange":{...}}]}
```
# 5.2 Definition
- **Lua:** nazwa funkcji/identyfikatora → lokalizacja deklaracji w bieżącym pliku lub w `project-index.json.symbols`.
- **OTUI:** `WidgetName`/`id` → definicja `Decl` w pliku.
# 5.3 References
- Przeszukanie `project-index.json` i lekkie skanowanie tokenów (prefiltrowanie po hashach plików).

---
# 6) Cache, debounce i wydajność
- **Cache L1 (process):** rezultaty zapytań na 3–10 s (`ttlMs` w odpowiedzi). Inwalidacja na zapis/zmianę pliku.
- **Cache L2 (disk):** indeksy `project-index.json` i `docstrings.json` w `.studio-cache/`.
- **Debounce:** 120–180 ms na zapytania providerów (per dokument).
- **Budżet czasu:** cel < 6 ms na rundę completions (po cache), < 25 ms cold.
- **Big file mode:** > 2 MB: ogranicz liczbę kandydatów (np. top 50).

---
# 7) IPC i kontrakty usług (backend parsers/service)
# 7.1 Kanały
- `ide:completion` → req: `CompletionQuery` → res: `CompletionResult`
- `ide:hover` → req: `HoverQuery` → res: `HoverResult`
- `ide:signature` → req: `SignatureQuery` → res: `SignatureResult`
- `ide:symbols` → req: `{uri}` → res: `DocumentSymbols`
- (MVP+) `ide:definition`, `ide:references`
# 7.2 Modele zapytań/odpowiedzi
```json
{
  "$schemaVersion": 1,
  "CompletionQuery": {"uri":"file:///...","language":"lua|otui","position":123,"prefix":"g_res","context":{"trigger":".","scope":"expr|key|value"}},
  "CompletionResult": {"items":[],"isIncomplete":false,"ttlMs":3000},

  "HoverQuery": {"uri":"file:///...","language":"lua|otui","range":{"start":100,"end":124}},
  "HoverResult": {"contents":[{"value":"...md...","isTrusted":true}],"range":{"start":100,"end":124},"ttlMs":10000},

  "SignatureQuery": {"uri":"file:///...","language":"lua|otui","callPos":130},
  "SignatureResult": {"signatures":[],"activeSignature":0,"activeParameter":0,"ttlMs":5000},

  "DocumentSymbols": {"symbols":[{"name":"...","kind":"Function","range":{}}]}
}
```
# 7.3 Błędy
- Formaty: `{code,msg,details?}`; kody: `IDE_Q_BAD_REQ`, `IDE_S_TIMEOUT`, `IDE_D_SCHEMA`.

---
# 8) Algorytmy agregacji (pseudokod TS)
# 8.1 Completion (Lua)
```ts
function completeLua(q: CompletionQuery): CompletionResult {
  const ctx = analyzeContextLua(q);
  const api = apiCatalog.lookup(ctx.object, ctx.memberPrefix); // api.json
  const proj = projectIndex.members(ctx.object, ctx.memberPrefix); // project-index
  const docs = docstrings.find(ctx.memberPrefix); // docstrings
  const heur = heuristicsVBot(ctx);
  const cand = mergeDedup([api, proj, docs, heur]);
  const scored = cand.map(c => ({...c, score: score(c, q)}));
  return finalize(scored, q);
}
```
# 8.2 Completion (OTUI)
```ts
function completeOTUI(q: CompletionQuery): CompletionResult {
  if (q.context.scope === 'key') return keysForWidget(q); // kategorie + rules
  if (q.context.scope === 'value' && q.context.key === 'style') return stylesFromAssets();
  if (q.context.scope === 'typeBase') return widgetBaseTypes();
  return genericOtuiSnippets();
}
```
# 8.3 Hover
```ts
function hover(q: HoverQuery): HoverResult {
  const sym = resolveSymbolAt(q.uri, q.range);
  const a = api.jsonSym(sym);
  const d = docstrings.for(sym);
  const m = mergeDocs(a, d);
  return renderMarkdown(m);
}
```
# 8.4 Signature Help
```ts
function signature(q: SignatureQuery): SignatureResult {
  const call = findCallAt(q.callPos);
  const fromDocs = docstrings.signature(call.callee) || api.signature(call.callee) || anySignature(call.args);
  return toSignatureResult(fromDocs, call.argIndex);
}
```

---
# 9) Integracja z lintem i nawigacją
- **Diagnostics**: provider lintu OTUI/Lua publikuje problemy zgodnie z regułami; IDE może proponować **Quick Fix** (np. OTUI‑001/002).
- **Go‑to Definition**: użyj `project-index.symbols` + lokalnego AST.
- **Peek References**: wyszukiwanie symboli w indeksie; prefiltrowanie po nazwach.

---
# 10) Konfiguracja (Ustawienia użytkownika)
```json
{
  "$schemaVersion": 1,
  "completion": {"enable": true, "maxItems": 50, "fuzzy": true, "boostVBot": true},
  "hover": {"enable": true, "markdown": true},
  "signature": {"enable": true},
  "symbols": {"enable": true},
  "ranking": {"wPrefix": 0.7, "wSource": 0.2, "wContext": 0.1},
  "performance": {"debounceMs": 150, "bigFileLimit": 2000000}
}
```

---
# 11) Test‑wektory i QA
- **COMP‑01 (Lua):** `g_res` + `.` → zawiera `g_resources.readFile` (score > 0.9).
- **COMP‑02 (OTUI):** w kluczu → lista `GEOMETRY`/`STYLE`/`BEHAVIOR` według reguł; `style:` zwraca style z assets.
- **HOV‑01:** na `g_modules.reloadModules` → opis z `api.json`.
- **SIG‑01:** `g_resources.readFile(` → `path: string` w `activeParameter=0`.
- **SYM‑01:** `Document Symbols` zwraca funkcje i widżety z poprawnymi zakresami.
- **PERF‑01:** czas odpowiedzi completions (cache warm) < 6 ms, (cold) < 25 ms.

---
# 12) Wydajność i telemetria
- Zbieraj metryki: średni czas odpowiedzi providerów, hit ratio cache, liczba kandydatów po deduplikacji.
- Ostrzeżenia w logu aplikacji, gdy cold‑path > 50 ms lub liczba kandydatów > 500.

---
# 13) Checklisty wdrożeniowe
- [ ] Rejestracja providerów dla `lua` i `otui`.
- [ ] Implementacja kanałów IPC (§7) + schematów zapytań/odpowiedzi.
- [ ] Agregacja `api.json` + `project-index.json` + `docstrings.json` (rankowanie §2.3).
- [ ] Snippety i trigger‑y (§2.1, §2.5).
- [ ] Hover/Signature z fallbackami (§3, §4).
- [ ] Document Symbols (MVP), Definition/References (MVP+).
- [ ] Cache i debounce (§6); budżety czasu i big‑file mode.
- [ ] Test‑wektory (§11) zielone; telemetria (§12) aktywna.

---
# 14) Noty końcowe
- Wyniki providerów muszą być **stabilne** między uruchomieniami (deterministyczne sortowanie); różnice jedynie przy zmianie kontekstu lub danych.
- Wszelkie rozszerzenia muszą zachować kontrakty IPC i schematy JSON (wersjonowanie `$schemaVersion`).


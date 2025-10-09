# OTUI Lint Rules (MASTER) – Specyfikacja dla **OTClient Studio**

> Cel: kompletny katalog reguł lint/auto‑fix dla **OTUI/OTML** używany przez Studio. Dokument definiuje: zachowania reguł, algorytmy auto‑fix, format diagnostyk, konfigurację, test‑wektory, integrację z edytorem i wymagania jakościowe. **Transfer 1:1** – gotowe do bezpośredniej implementacji.

---
# # 0) Założenia wspólne
- **Parser/AST**: zgodnie z dokumentem „Parser & Schemas: AST + JSON Schema (OTClient Studio)” (§ OTUI AST). Każdy węzeł posiada `loc` (`file`, `start`, `end`).
- **Kategoryzacja atrybutów**: `GEOMETRY`, `STYLE`, `BEHAVIOR` (lista bazowa w §1.3 tego dokumentu; rozszerzalna).
- **Deterministyczność**: wyniki lint i auto‑fix są deterministyczne (stabilny sort atrybutów, niezmienność białych znaków poza miejscem naprawy).
- **Backup i diff**: przy auto‑fix zapisywany jest plik `.bak` oraz generowany jest diff (Unified) do podglądu w UI.
- **Format diagnostyk** (kanał do edytora):
```json
{
  "code": "OTUI-001",
  "severity": "ERROR|WARN|INFO|HINT",
  "message": "opis problemu",
  "fix": {"title": "opis auto-fix", "edits": [{"file":"...","range":{"start":{...},"end":{...}},"text":"..."}]},
  "loc": {"file":"...","start":{"offset":...},"end":{"offset":...}},
  "meta": {"category":"GEOMETRY|STYLE|BEHAVIOR", "widget":"MainWindow", "key":"width"}
}
```

---
# # 1) Katalog reguł (z auto‑fix tam, gdzie bezpieczny)

> **Legenda pól:** `Opis`, `Wykrywanie`, `Auto‑fix`, `Przykład (before/after)`, `Severity`, `Bezpieczeństwo`, `Konfiguracja`.
# # # OTUI‑001 — Kolejność pól: GEOMETRIA → STYL → ZACHOWANIE (**auto‑fix**)
- **Opis**: w obrębie każdego bloku deklaracji widżetu atrybuty muszą być uporządkowane wg kategorii.
- **Wykrywanie**: przeanalizuj listę `KV` w `Decl.body`; jeśli sekwencja kategorii zawiera inwersje (np. `STYLE` przed `GEOMETRY`), zgłoś problem.
- **Auto‑fix**: stabilne sortowanie kluczy: najpierw wszystkie `GEOMETRY`, potem `STYLE`, potem `BEHAVIOR`. Zachowaj względną kolejność wewnątrz kategorii i przenieś komentarze razem z parą `KV`.
- **Przykład**
```otui
# BEFORE
Window < UIWidget {
  text: "Hello"
  width: 300
  id: main
}
# AFTER
Window < UIWidget {
  width: 300        # GEOMETRY
  text: "Hello"    # STYLE
  id: main          # BEHAVIOR
}
```
- **Severity**: WARN (podniesienie do ERROR konfigurowalne).
- **Bezpieczeństwo**: bezpieczny auto‑fix.
- **Konfiguracja**:
```json
{"OTUI-001":{"enabled":true,"severity":"WARN"}}
```
# # # OTUI‑002 — Statyczne teksty muszą używać `tr()` (**auto‑fix**)
- **Opis**: literały string w atrybutach kategorii STYLE (np. `text`) muszą być opakowane `tr("...")`.
- **Wykrywanie**: `KV.key` ∈ STYLE ∧ `value.type == StringLiteral` ∧ `value.value` nie zaczyna się od `tr(`.
- **Auto‑fix**: zamień `"Tekst"` → `tr("Tekst")`. Wyklucz klucze `id`, nazwy klas/stylów.
- **Przykład**
```otui
# BEFORE
Label < UIWidget { text: "Start" }
# AFTER
Label < UIWidget { text: tr("Start") }
```
- **Severity**: WARN.
- **Bezpieczeństwo**: bezpieczny auto‑fix.
- **Konfiguracja**: `{ "OTUI-002": {"enabled": true, "severity": "WARN", "allowList": ["tooltip"] } }`
# # # OTUI‑003 — Sprzeczne `anchors` / `margins` (detekcja)
- **Opis**: wykrywa sprzeczności (np. jednoczesne kotwice wykluczające się lub ujemne marginesy tam, gdzie to niedozwolone w projekcie).
- **Wykrywanie**: analizuj wartości `anchors` (obiekt/array) i `margin/…`; reguły domenowe: brak `left`+`right` bez `width` (jeśli projekt tak definiuje), brak ujemnych `margin`.
- **Auto‑fix**: brak (tylko sugestie: usuń `right` lub dodaj `width`).
- **Severity**: ERROR (domyślnie).
- **Bezpieczeństwo**: brak auto‑fixu.
# # # OTUI‑004 — Zasób nie istnieje (STYLE → `image`, `font`, `style`)
- **Opis**: odwołanie do pliku zasobu, którego nie ma w projekcie.
- **Wykrywanie**: sprawdź ścieżki względem `project-root/data/…` lub mapy zasobów (`assets-map.json`).
- **Auto‑fix**: brak; podaj propozycje (fuzzy match) najbliższych nazw.
- **Severity**: ERROR.
# # # OTUI‑005 — Zduplikowane `id` w obrębie pliku
- **Opis**: `KV.key == id` nie może wystąpić wielokrotnie z tą samą wartością w pliku.
- **Wykrywanie**: deduplikacja w `OTUIFile.body` (poziom pliku).
- **Auto‑fix**: brak; zaproponuj nowe `id` (`<id>_1`).
- **Severity**: ERROR.
# # # OTUI‑006 — Konwencja nazewnictwa `id`
- **Opis**: `id` dopuszcza `[a-z0-9_]+` (konfigurowalne).
- **Wykrywanie**: regex na `Identifier|StringLiteral`.
- **Auto‑fix**: opcjonalna transformacja do lower_snake_case (jeśli włączona).
- **Severity**: WARN.
# # # OTUI‑007 — Nieznany atrybut widżetu
- **Opis**: klucz `KV.key` nie znajduje się w dozwolonych dla danego widżetu (lista referencyjna + allow‑list projektu).
- **Wykrywanie**: porównanie do bazy atrybutów; jeśli brak dopasowania → problem.
- **Auto‑fix**: brak; podpowiedź najbliższych kluczy (Levenshtein).
- **Severity**: WARN.
# # # OTUI‑008 — Atrybut przestarzały (deprecated)
- **Opis**: użycie atrybutu oznaczonego jako przestarzały w profilu projektu.
- **Wykrywanie**: dopasowanie do listy `deprecatedAttributes` (konfiguracja).
- **Auto‑fix**: propozycja zamiennika (jeśli podany w konfiguracji).
- **Severity**: WARN.
# # # OTUI‑009 — Normalizacja booleanów
- **Opis**: wartości bool powinny być `true|false` (nie `0|1|"true"`).
- **Wykrywanie**: `value` typu `Identifier/StringLiteral/NumberLiteral` odwzorowuje bool.
- **Auto‑fix**: zamień na `true/false`.
- **Severity**: HINT.
# # # OTUI‑010 — Format kolorów
- **Opis**: akceptowane formaty kolorów wg projektu (np. `#RRGGBB`, `rgba(...)`).
- **Wykrywanie**: regex na `StringLiteral`.
- **Auto‑fix**: konwersja do kanonicznego formatu (jeśli możliwa).
- **Severity**: WARN.
# # # OTUI‑011 — Jednostki wymiarów/liczb
- **Opis**: liczby powinny być bez jednostek (lub z konkretną notacją – zależnie od projektu).
- **Wykrywanie**: `NumberLiteral` OK; `StringLiteral` z sufiksem jednostki → problem (opcjonalnie).
- **Auto‑fix**: usunięcie sufiksu, jeśli włączone.
- **Severity**: HINT/WARN.
# # # OTUI‑012 — Cykl dziedziczenia widżetów
- **Opis**: `Decl.base` tworzy cykl (A < B, B < C, C < A).
- **Wykrywanie**: graf dziedziczenia per plik (lub cały projekt); detekcja cykli.
- **Auto‑fix**: brak; raport ścieżki cyklu.
- **Severity**: ERROR.
# # # OTUI‑013 — Puste deklaracje
- **Opis**: `Decl` bez atrybutów i potomków.
- **Wykrywanie**: `Decl.body.length == 0`.
- **Auto‑fix**: usuń pusty blok (opcjonalnie, jeśli nie referencjonowany).
- **Severity**: INFO.
# # # OTUI‑014 — Niezreferencjonowany widżet (analiza projektowa)
- **Opis**: `Decl` nigdy nie ładowany przez `g_ui.loadUI` ani dziedziczony.
- **Wykrywanie**: korelacja z `project-index.json.relations.lua_to_otui` i bazą typów.
- **Auto‑fix**: brak; informacja do porządków.
- **Severity**: INFO.
# # # OTUI‑015 — Odnośnik do stylu nie istnieje
- **Opis**: `style: "…"` nie znajduje się w katalogu stylów projektu.
- **Wykrywanie**: porównanie do listy stylów (assets‑map lub dedykowana baza stylów).
- **Auto‑fix**: brak; fuzzy proposals.
- **Severity**: WARN.
# # # OTUI‑016 — Event handler w kluczu `on...` ma niekanoniczną wartość
- **Opis**: wartości eventów powinny być identyfikatorami (nie stringami) — zależnie od konwencji projektu.
- **Wykrywanie**: `key` zaczyna się od `on` + wielka litera; `value.type != Identifier`.
- **Auto‑fix**: usuń cudzysłowy (opcjonalnie).
- **Severity**: HINT/WARN.
# # # OTUI‑017 — Atrybuty powielone w obrębie tego samego `Decl`
- **Opis**: ten sam `key` występuje wielokrotnie – ostatni wygrywa (nieczytelne).
- **Wykrywanie**: duplikaty `KV.key` w `Decl.body`.
- **Auto‑fix**: scal albo usuń duplikaty (zachowaj ostatni) — **opcjonalne**.
- **Severity**: WARN.
# # # OTUI‑018 — Białe znaki i wcięcia (2 spacje)
- **Opis**: standaryzacja wcięć i trailing spaces.
- **Wykrywanie**: tokenizer whitespace; linie z tabami/końcówkami spacji.
- **Auto‑fix**: konwersja TAB→2 spacje, trim końcówek.
- **Severity**: HINT.
# # # OTUI‑019 — Komentarze (#) format
- **Opis**: komentarz powinien poprzedzać deklarację lub stać po wartości (a nie w środku tokena).
- **Wykrywanie**: pozycje `Comment` vs `KV`/`Decl`.
- **Auto‑fix**: przenieś komentarz do poprawnej pozycji (jeśli możliwe).
- **Severity**: HINT.
# # # OTUI‑020 — Klucze nieobsługiwane przez dany typ bazowy
- **Opis**: atrybut zarezerwowany dla innego typu (np. `icon` na widżecie, który go nie wspiera — wg bazy projektu).
- **Wykrywanie**: mapowanie `Type`→dozwolone atrybuty.
- **Auto‑fix**: brak.
- **Severity**: WARN.

---
# # 2) Mapowanie kategorii atrybutów (bazowa lista rozszerzalna)
- **GEOMETRY**: `x,y,width,height,anchors,margin,padding,min-width,max-width,min-height,max-height`
- **STYLE**: `font,color,image,style,opacity,icon,background,spacing,text`
- **BEHAVIOR**: `id,focusable,draggable,enabled,visible,onClick,onText,tooltip`
> Lista jest punktem startowym; może zostać poszerzona w `otui-rules.json`.

---
# # 3) Integracja z edytorem (Monaco) – diagnostyka i Quick Fix
- **Publish diagnostyk**: na każdy zapis i/lub po krótkim debounce (150 ms) po zmianie.
- **Format**: jak w §0; severity mapowane na kolor/ikonę.
- **Quick Fix**: prezentuj `fix.title`; po akceptacji wykonaj `edits[]` (wspieraj multi‑file).
- **Podgląd diff**: dla auto‑fixów wymagających większej zmiany (OTUI‑001) pokaż unified diff.

---
# # 4) Konfiguracja reguł (JSON)
```json
{
  "$schemaVersion": 1,
  "rules": {
    "OTUI-001": {"enabled": true,  "severity": "WARN"},
    "OTUI-002": {"enabled": true,  "severity": "WARN", "allowList": ["tooltip"]},
    "OTUI-003": {"enabled": true,  "severity": "ERROR"},
    "OTUI-004": {"enabled": true,  "severity": "ERROR", "assetsRoot": "data/"},
    "OTUI-005": {"enabled": true,  "severity": "ERROR"},
    "OTUI-006": {"enabled": false, "severity": "WARN", "pattern": "^[a-z0-9_]+$", "autoTransform": false},
    "OTUI-007": {"enabled": true,  "severity": "WARN", "allow": ["customAttribute"]},
    "OTUI-008": {"enabled": true,  "severity": "WARN", "map": {"oldAttr":"newAttr"}},
    "OTUI-009": {"enabled": true,  "severity": "HINT"},
    "OTUI-010": {"enabled": true,  "severity": "WARN", "format": "#RRGGBB"},
    "OTUI-011": {"enabled": false, "severity": "HINT"},
    "OTUI-012": {"enabled": true,  "severity": "ERROR"},
    "OTUI-013": {"enabled": true,  "severity": "INFO", "removeEmpty": false},
    "OTUI-014": {"enabled": true,  "severity": "INFO"},
    "OTUI-015": {"enabled": true,  "severity": "WARN"},
    "OTUI-016": {"enabled": false, "severity": "HINT"},
    "OTUI-017": {"enabled": true,  "severity": "WARN", "removeDuplicates": false},
    "OTUI-018": {"enabled": true,  "severity": "HINT"},
    "OTUI-019": {"enabled": true,  "severity": "HINT"},
    "OTUI-020": {"enabled": true,  "severity": "WARN"}
}
}
```

---
# # 5) Algorytmy auto‑fix (pseudokod TS)
# # # 5.1 OTUI‑001 (sort kategorii)
```ts
function fixOrder(decl: Decl): Edit[] {
  const groups = {G: [] as KV[], S: [] as KV[], B: [] as KV[]};
  for (const kv of decl.body.filter(isKV)) {
    const cat = categorize(kv.key); // GEOMETRY|STYLE|BEHAVIOR
    if (cat === 'GEOMETRY') groups.G.push(kv);
    else if (cat === 'STYLE') groups.S.push(kv);
    else groups.B.push(kv);
}
  const sorted = [...groups.G, ...groups.S, ...groups.B];
  if (sameOrder(decl.body, sorted)) return [];
  const text = renderKVWithComments(sorted);
  return [{ file: decl.loc.file, range: rangeOfKVBlock(decl), text }];
}
```
# # # 5.2 OTUI‑002 (wrap `tr()`)
```ts
function wrapTr(kv: KV): Edit[] {
  if (kv.value.type !== 'StringLiteral') return [];
  if (kv.key === 'id') return [];
  return [{
    file: kv.loc.file,
    range: kv.value.loc,
    text: `tr(${JSON.stringify(kv.value.value)})`
  }];
}
```
# # # 5.3 OTUI‑009 (booleany)
```ts
function normalizeBool(kv: KV): Edit[] {
  const val = kv.value;
  const toBool = (s: string) => /^(?:true|1)$/i.test(s);
  if (val.type === 'StringLiteral')
    return [{file: kv.loc.file, range: val.loc, text: toBool(val.value) ? 'true' : 'false'}];
  if (val.type === 'NumberLiteral')
    return [{file: kv.loc.file, range: val.loc, text: val.value === 0 ? 'false' : 'true'}];
  if (val.type === 'Identifier' && /^(true|false)$/i.test(val.name) === false)
    return [{file: kv.loc.file, range: val.loc, text: toBool(val.name) ? 'true' : 'false'}];
  return [];
}
```

---
# # 6) Test‑wektory (minimalny zestaw regresji)
# # # 6.1 Kolejność pól
**Wejście**
```otui
W < UIWidget { text: "x" width: 1 id: a }
```
**Oczekiwane**: pojedyncza diagnostyka `OTUI-001` + auto‑fix sortujący.
# # # 6.2 `tr()` wrap
**Wejście**
```otui
L < UIWidget { text: "Start" id: start }
```
**Oczekiwane**: `OTUI-002` z auto‑fix → `text: tr("Start")`.
# # # 6.3 Zasób nie istnieje
**Wejście**
```otui
B < UIWidget { image: "images/missing.png" }
```
**Oczekiwane**: `OTUI-004` (ERROR), propozycje fuzzy jeśli `images/button.png` istnieje.
# # # 6.4 Duplikat `id`
**Wejście**
```otui
A < UIWidget { id: x }
B < UIWidget { id: x }
```
**Oczekiwane**: `OTUI-005` na drugim wystąpieniu.

---
# # 7) Kody błędów parsera/enginu (dla OTUI)
- `OTUI_PARSE_001` – niezamknięty blok `{` (ParseError)
- `OTUI_PARSE_002` – nieznany token/literał → potraktowano jako `Identifier`
- `OTUI_ENGINE_001` – nieprawidłowa kategoria atrybutu (brak w mapie)
- `OTUI_ENGINE_100` – błąd I/O przy sprawdzaniu zasobów

---
# # 8) Wydajność i limity
- Reguły jednoprzebiegowe; jedna analiza AST/plik.
- Sprawdzenie zasobów buforowane (cache ścieżek → hash katalogów assets).
- Cały lint dla pliku < 50 ms (target), batch 100 plików < 2 s.

---
# # 9) Checklisty wdrożeniowe (dla warstwy Lint)
- [ ] Implementacja wszystkich reguł OTUI‑001…020.
- [ ] Włączone auto‑fix dla 001/002/009/018; pozostałe bezpieczne – opcjonalnie.
- [ ] Konfiguracja reguł w `otui-rules.json`; integracja w UI (enable/disable, severity).
- [ ] Testy z §6 – zielone; snapshoty zmian po auto‑fix.
- [ ] Cache zasobów i fuzzy propozycje działają.

---
# # 10) Noty końcowe
- Reguły są projektowalne – dopuszcza się dodawanie własnych rozszerzeń, o ile nie zmieniają publicznych kontraktów (format diagnostyk i edycji).
- Wszelkie zmiany w zestawie reguł wymagają podniesienia `$schemaVersion` w konfiguracji i aktualizacji test‑wektorów.

?# {% raw %}

**Pakiet:** `otc_core_v1/engine` · **Wersja:** 1.0

**Cel:** Jednolita, operacyjna specyfikacja **parsera/serializera OTUI (STRICT)**, **walidatora** i **macierzy dozwolonych dzieci**. Dokument jest fundamentem dla edytora TS (Sparky) oraz testów round‑trip.

---
# Spis treści
- [0. Zakres, definicje, założenia](#ch-0)
- [1. STRICT OTUI — gramatyka i tokenizacja](#ch-1)
- [2. Parser → AST (TypeScript)](#ch-2)
- [3. Serializer (AST → OTUI STRICT)](#ch-3)
- [4. Macierze dozwolonych dzieci (global)](#ch-4)
  - [4.1 Okna (Window‑class)](#ch-4-1)
  - [4.2 Kontenery (Content‑class)](#ch-4-2)
  - [4.3 Organizacja/Nawigacja](#ch-4-3)
  - [4.4 Dane/Edycja](#ch-4-4)
  - [4.5 Wskaźniki/Scroll](#ch-4-5)
- [5. Walidator — reguły, kody błędów/ostrzeżeń](#ch-5)
- [6. Auto‑naprawy deterministyczne](#ch-6)
- [7. Import/Export i round‑trip (edytor ↔ plik ↔ Lua)](#ch-7)
- [8. API edytora (TS): parse/serialize/validate/autofix](#ch-8)
- [9. Testy: goldeny i snapshoty](#ch-9)
- [10. Przykłady i edge‑cases](#ch-10)
- [11. Indeks haseł](#ch-11)

---

<div id="ch-0"></div>

# 0. Zakres, definicje, założenia

**Interaktywny spis:** [0.1 Zakres](#ch-0-1) · [0.2 Definicje](#ch-0-2) · [0.3 Założenia projektowe](#ch-0-3)

# 0.1 Zakres {#ch-0-1}

- Pokrycie: *cały pipeline* od tekstu OTUI (STRICT) ↔ AST (TS) ↔ walidacja ↔ auto‑naprawy ↔ eksport/import.
- Zakres UI: komplet taksonomii z części „Specyfikacja UI” (rozdz. 4) + presety kanoniczne.
- 
# 0.2 Definicje {#ch-0-2}

- **STRICT OTUI** — format bezkomentarzowy, LF, wcięcia 2 sp., kolejność GEOMETRIA→STYL→ZACHOWANIE.
- **AST** — drzewo `WidgetNode`, deterministyczne klucze i kolejność dzieci.
- **Macierz** — tablica dozwolonych dzieci dla par (parent, slot).
- 
# 0.3 Założenia projektowe {#ch-0-3}

- **Deterministyczność**: ten sam AST → ten sam OTUI (bit‑identyczny, przy tej samej wersji serializera).
- **Idempotencja**: `parse(serialize(ast))` ≡ `normalize(ast)`.
- **Brak magii**: walidator zgłasza i *tylko* przewidywalnie naprawia.

---

<div id="ch-1"></div>

# 1. STRICT OTUI — gramatyka i tokenizacja

**Interaktywny spis:** [1.1 Zasady formatowania](#ch-1-1) · [1.2 Tokeny](#ch-1-2) · [1.3 Szkic EBNF](#ch-1-3)

# 1.1 Zasady formatowania {#ch-1-1}

- **Wcięcia**: 2 spacje na poziom. **Zakaz tabów**.
- **Końce linii**: LF. **Bez BOM**.
- **Brak komentarzy** w blokach `.otui`.
- **Kolejność atrybutów** w każdym węźle: GEOMETRIA → STYL → ZACHOWANIE.

# 1.2 Tokeny {#ch-1-2}

- Słowa kluczowe typów: `MainWindow`, `StaticMainWindow`, `MiniWindow`, `ContainerWindow`, `DialogWindow`, `UIWidget`, `Panel`, `GroupBox`, `Titlebar`, `Toolbar`, `TabBar`, `TabWidget`, `Splitter`, `HorizontalSeparator`, `StatusOverlay`, `Label`, `Button`, `CheckBox`, `TextEdit`, `PasswordTextEdit`, `MultilineTextEdit`, `ComboBox`, `TextList`, `ProgressBar`, `VerticalScrollBar`, `HorizontalScrollBar`.
- Operator dziedziczenia: `<` (np. `MiniWindow < MainWindow`).
- Identyfikatory: `id: <slug>`; łańcuchy w `!text: tr('...')`; liczby całkowite; kolory `#AARRGGBB` lub `alpha`.

# 1.3 Szkic EBNF (pogglądowy) {#ch-1-3}

```
document     := node*
node         := header NEWLINE indent block?
header       := type (WS '<' WS type)? NEWLINE? attributes?
type         := IDENT
attributes   := (INDENT attr+ DEDENT)?
attr         := key ':' value NEWLINE | stateBlock | event | meta
stateBlock   := '$' IDENT ':' NEWLINE INDENT attr+ DEDENT
event        := '@' IDENT ':' VALUE NEWLINE
meta         := '&' IDENT NEWLINE
block        := INDENT (node | attr)+ DEDENT
key          := IDENT ('.' IDENT)*
value        := NUMBER | STRING | COLOR | IDENT | PATH
```

---

<div id="ch-2"></div>

# 2. Parser → AST (TypeScript)

**Interaktywny spis:** [2.1 Kształt AST](#ch-2-1) · [2.2 Normalizacja](#ch-2-2) · [2.3 Stabilizacja kolejności](#ch-2-3)

# 2.1 Kształt AST {#ch-2-1}

```ts
export type AnchorRef = string; // np. 'parent.left', 'header.bottom'
export interface Geometry {
  id: string;
  size?: [number, number];
  width?: number; height?: number;
  anchors?: Partial<Record<'fill'|'left'|'right'|'top'|'bottom'|'verticalCenter'|'horizontalCenter', AnchorRef>>;
  padding?: number; marginLeft?: number; marginRight?: number; marginTop?: number; marginBottom?: number;
}
export interface Style {
  backgroundColor?: string; imageSource?: string; imageSmooth?: boolean; imageFixedRatio?: boolean;
  font?: string; color?: string; text?: string; textWrap?: boolean; textAutoResize?: boolean; textAlign?: string; textOffset?: [number,number];
}
export interface Behavior { events?: Partial<Record<'onEnter'|'onEscape'|'onClick'|'onSetup'|'onOptionChange', string>>; states?: Record<string, Style>; }
export interface WidgetNode {
  base: string; // typ OTUI
  extends?: string; // dla np. MiniWindow < MainWindow
  geometry: Geometry;
  style?: Style;
  behavior?: Behavior;
  children?: WidgetNode[];
  variant?: string; // np. RoundCheckBox
}
```

# 2.2 Normalizacja {#ch-2-2}

- Uzupełnij brakujące struktury: `children = []`, `style = {}` gdy potrzebne.
- Zamień `style.text` → w serializacji na `!text: tr('...')`.
- Zastąp `size` parą `width/height` podczas walidacji kotwic (na potrzeby reguł), ale w serializacji zachowuj wejściową postać.
- 
# 2.3 Stabilizacja kolejności {#ch-2-3}

- Atrybuty: najpierw **GEOMETRIA**, potem **STYL**, na końcu **ZACHOWANIE** (events/states).
- Dzieci: sortuj stabilnie po `(slotPriority, y, x, id)` jeśli edytor posiada grid/snapping; inaczej po kolejności wczytania.

---

<div id="ch-3"></div>

# 3. Serializer (AST → OTUI STRICT)

**Interaktywny spis:** [3.1 Reguły wypisywania](#ch-3-1) · [3.2 Escaping i i18n](#ch-3-2) · [3.3 Sanityzacja końcowa](#ch-3-3)

# 3.1 Reguły wypisywania {#ch-3-1}

- Wcięcie: **2 spacje**.
- Puste wartości pomijaj.
- Sekcja kolejności: GEOMETRIA (`id`, `size`/`width`/`height`, `anchors.*`, `margin-*`, `padding`) → STYL → ZACHOWANIE (`@on*`, `$state:` bloki).
- 
# 3.2 Escaping i i18n {#ch-3-2}

- `style.text` → `!text: tr('...')`, `'` → `\'`.
- Kolory tylko `#AARRGGBB` lub `alpha`.

# 3.3 Sanityzacja końcowa {#ch-3-3}

- Usuń taby, trailing spaces, wymuś LF.
- Brak komentarzy w wynikowym `.otui`.

---

<div id="ch-4"></div>

# 4. Macierze dozwolonych dzieci (global)

**Interaktywny spis:** [4.1 Okna](#ch-4-1) · [4.2 Kontenery](#ch-4-2) · [4.3 Organizacja](#ch-4-3) · [4.4 Dane/Edycja](#ch-4-4) · [4.5 Wskaźniki/Scroll](#ch-4-5)

> **Legenda:** ✓ dozwolone · ✖ zabronione · �  warunkowe (patrz uwagi).

# 4.1 Okna (Window‑class) {#ch-4-1}

**MainWindow / StaticMainWindow (root)**

| Dziecko | Status | Uwagi |
|---|:---:|---|
| UIWidget, Panel, GroupBox | ✓ | Elementy panelowe.
| Label, Button, CheckBox, TextEdit, PasswordTextEdit, MultilineTextEdit, ComboBox | ✓ | Formularze i akcje.
| TextList | ✓ | Wymaga pary z VerticalScrollBar przy overflow (� ).
| ProgressBar, HorizontalSeparator | ✓ | —
| TabBar, TabWidget, Splitter | ✓ | Splitter: dokładnie 2 dzieci (� ).
| StatusOverlay | ✓ | Warstwa wierzchnia, bez złożonych dzieci (� ).
| *Window (Main/Static/Mini/Container/Dialog) | ✖ | Zakaz okien‑dzieci.
| ScrollBar (samotny) | ✖ | Zawsze para z treścią.

**MiniWindow / ContainerWindow / DialogWindow**

- Slot `titlebar`: Label, Button, UIWidget(ikona) ✓; listy/edytory/scroll ✖.
- Slot `content`: elementy panelowe ✓; okna‑dzieci ✖.
- Slot `footer` (Mini/Dialog): Button/Label/ProgressBar ✓; listy/edytory/scroll ✖.

# 4.2 Kontenery (Content‑class) {#ch-4-2}

| Parent | Dozwolone dzieci | Niedozwolone/uwagi |
|---|---|---|
| UIWidget | Wszystkie panelowe (Label/Button/Inputs/List/Progress/Scroll/Separator/StatusOverlay) | *Window ✖ |
| Panel | j.w. | *Window ✖ |
| GroupBox | `header: Label` ✓, `content: panelowe` ✓ | Scroll w header ✖ |
| TabWidget | Treść aktywnej zakładki: panelowe ✓ | *Window ✖; sam TabBar nie tu |
| StatusOverlay | Label, ProgressBar, Button(cancel) ✓ | Listy/edytory/okna ✖ |

# 4.3 Organizacja/Nawigacja {#ch-4-3}

| Komponent | Dozwolone dzieci | Niedozwolone/uwagi |
|---|---|---|
| Titlebar | Label, Button, UIWidget(ikona) | Scroll/listy/edytory ✖ |
| Toolbar | Button, HorizontalSeparator | Inne ✖ |
| TabBar | Button (zakładki) | Treść zakładek ✖ — trafia do TabWidget |
| Splitter | **Dokładnie 2** dzieci: Panel/UIWidget/GroupBox | Okna/Scroll ✖ |
| HorizontalSeparator | — | **Bez dzieci** |

# 4.4 Dane/Edycja {#ch-4-4}

| Komponent | Dzieci |
|---|---|
| Label, Button, CheckBox, TextEdit, PasswordTextEdit, ComboBox, ProgressBar, ScrollBar | **Brak** |
| MultilineTextEdit | **Brak**; przewijanie przez sąsiedni Vertical/HorizontalScrollBar |
| TextList | **Brak** ręcznych dzieci; wiersze generowane jako `UIWidget` (ListRow) runtime/templatem |

# 4.5 Wskaźniki/Scroll {#ch-4-5}

| Komponent | Zasady |
|---|---|
| VerticalScrollBar | Sibling przewijanej treści; dock **right**; treść kotwiczy `right: scroll.left` |
| HorizontalScrollBar | Sibling przewijanej treści; dock **bottom**; treść kotwiczy `bottom: hscroll.top` |

---

<div id="ch-5"></div>

# 5. Walidator — reguły, kody błędów/ostrzeżeń

**Interaktywny spis:** [5.1 Błędy (E)](#ch-5-1) · [5.2 Ostrzeżenia (W)](#ch-5-2) · [5.3 Raport](#ch-5-3)

# 5.1 Błędy (E) {#ch-5-1}

- **E001 STRICT/Format** — taby/BOM/komentarze/trailing spaces.
- **E010 Anchors/Conflict** — `anchors.fill` + inne kotwice.
- **E020 Window/Nesting** — okno (`*Window`) jako dziecko okna.
- **E030 Scroll/Orphan** — ScrollBar bez sparowanej treści.
- **E031 Scroll/Pairing** — brak kotwicy treści do ScrollBar (`right: scroll.left` lub `bottom: hscroll.top`).
- **E040 Text/i18n** — stały tekst bez `tr()` (w OTUI).
- **E050 Splitter/Arity** — != 2 dzieci.
- **E060 Titlebar/Children** — niedozwolone dziecko w `titlebar`.

# 5.2 Ostrzeżenia (W) {#ch-5-2}

- **W101 Width/AutoFit** — okno dokowane z `width` (sugeruj usunięcie).
- **W110 Margins/Odd** — nieparzyste marginesy (snapping 2 px).
- **W120 Scroll/StepMismatch** — `step` niezgodny z wielkością wiersza/slotu.
- **W130 Keyboard/Hints** — brak `@onEnter/@onEscape` w oknie dialogowym.

# 5.3 Raport {#ch-5-3}

- Struktura: `{code, severity, path, message, fix?}`.
- `path` = ścieżka węzłów (`main/content/items`).

---

<div id="ch-6"></div>

# 6. Auto‑naprawy deterministyczne

**Interaktywny spis:** [6.1 STRICT fixups](#ch-6-1) · [6.2 Anchors/Layout](#ch-6-2) · [6.3 Scroll pairing](#ch-6-3)

# 6.1 STRICT fixups {#ch-6-1}

- Usuń taby/BOM/komentarze; przytnij trailing spaces; wymuś LF.
- Uporządkuj kolejność atrybutów (GEOMETRIA→STYL→ZACHOWANIE).

# 6.2 Anchors/Layout {#ch-6-2}

- Jeśli są `anchors.left` + `anchors.right` **i** `width` → usuń `width` (Auto‑fit).
- Rozdziel `size` na `width/height` tylko na potrzeby walidacji, nie w serializacji (zachowaj wejściowy idiom).

# 6.3 Scroll pairing {#ch-6-3}

- Dla `TextList`/`MultilineTextEdit` dodaj brakujący `VerticalScrollBar` jako sibling (po prawej) i dodaj kotwicę treści `right: scroll.left`.

---

<div id="ch-7"></div>

# 7. Import/Export i round‑trip (edytor ↔ plik ↔ Lua)
**Interaktywny spis:** [7.1 Import z plików `.otui`](#ch-7-1) · [7.2 Import z Lua (blok string)](#ch-7-2) · [7.3 Eksport](#ch-7-3)
# 7.1 Import z plików `.otui` {#ch-7-1}
- Wczytaj, znormalizuj (STRICT), sparsuj do AST. Zachowaj *oryginalny układ* do porównań.
# 7.2 Import z Lua (blok string) {#ch-7-2}
- Wykryj stałe `local <Name>_OTUI = [[...]]`; wytnij treść; sprawdź STRICT; sparsuj.
- Ostrzeżenie, gdy blok zawiera komentarze — niedozwolone w OTUI (mimo bycia w Lua).
# 7.3 Eksport {#ch-7-3}
- Do pliku `.otui` (kanoniczny cel runtime).
- Opcjonalnie: *round‑trip do Lua* — odśwież istniejący blok `[[...]]` bit‑identycznie po `ensureStrictOtui()`.

---

<div id="ch-8"></div>

# 8. API edytora (TS): parse/serialize/validate/autofix
**Interaktywny spis:** [8.1 Interfejsy](#ch-8-1) · [8.2 Przepływy](#ch-8-2)

# 8.1 Interfejsy {#ch-8-1}
```ts
export function parseOtui(text: string): WidgetNode[];
export function serializeAst(nodes: WidgetNode[]): string; // STRICT OTUI
export function ensureStrictOtui(text: string): string;     // tylko format
export interface ValidationIssue { code: string; severity: 'error'|'warning'; path: string; message: string; fix?: string; }
export function validateAst(nodes: WidgetNode[]): ValidationIssue[];
export function autofixAst(nodes: WidgetNode[]): { nodes: WidgetNode[]; changes: ValidationIssue[] };
```

# 8.2 Przepływy {#ch-8-2}

- **Projekt → Walidacja → Serializacja**.
- **Import (plik/Lua) → Parser → Normalizacja → Walidacja → Edycja → Serializacja → Eksport (plik/Lua)**.

---

<div id="ch-9"></div>

# 9. Testy: goldeny i snapshoty
**Interaktywny spis:** [9.1 Goldeny round‑trip](#ch-9-1) · [9.2 Snapshoty wizualne](#ch-9-2)
# 9.1 Goldeny round‑trip {#ch-9-1}
- Zestaw `X.otui` → `parse` → `serialize` → porównanie bit‑po‑bicie.
- Dokładaj przypadki: okna, scroll pairing, Splitter, TabBar/TabWidget.
# 9.2 Snapshoty wizualne {#ch-9-2}
- Render testowy po stronie klienta (lub symulacja) i porównania pikselowe dla kluczowych presetów.

---

<div id="ch-10"></div>

# 10. Przykłady i edge‑cases

**Interaktywny spis:** [10.1 Migracja do STRICT](#ch-10-1) · [10.2 Anchors/Fill vs krawędzie](#ch-10-2) · [10.3 Splitter/Arity](#ch-10-3)

# 10.1 Migracja do STRICT {#ch-10-1}

- Wejście dowolne → `ensureStrictOtui()` → `parse` → `autofixAst()` → `serializeAst()`.

# 10.2 Anchors/Fill vs krawędzie {#ch-10-2}

**BŁĘDNY OTUI**

```otui
UIWidget
  id: box
  anchors.fill: parent
  anchors.left: parent.left
```

**PO NAPRAWIE (autofix)**

```otui
UIWidget
  id: box
  anchors.fill: parent
```

# 10.3 Splitter/Arity {#ch-10-3}

**BŁĘDNY OTUI**

```otui
Splitter
  id: split
  size: 300 160

  Panel
    id: left

```

**PO NAPRAWIE (manualnej)**

```otui
Splitter
  id: split
  size: 300 160

  Panel
    id: left

  Panel
    id: right
```

---

<div id="ch-11"></div>

# 11. Indeks haseł

- STRICT • AST • Macierz • Walidator • Auto‑naprawy • Round‑trip • Splitter • TabBar/TabWidget • StatusOverlay • Scroll pairing


{% endraw %}


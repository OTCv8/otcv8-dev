# {% raw %}

**Pakiet:** `otc_core_v1/engine` Â· **Wersja:** 1.0  
**Cel:** Jednolita, operacyjna specyfikacja **parsera/serializera OTUI (STRICT)**, **walidatora** i **macierzy dozwolonych dzieci**. Dokument jest fundamentem dla edytora TS (Sparky) oraz testĂłw roundâ€‘trip.

---
## Spis treĹ›ci
- [0. Zakres, definicje, zaĹ‚oĹĽenia](#ch-0)
- [1. STRICT OTUI â€” gramatyka i tokenizacja](#ch-1)
- [2. Parser â†’ AST (TypeScript)](#ch-2)
- [3. Serializer (AST â†’ OTUI STRICT)](#ch-3)
- [4. Macierze dozwolonych dzieci (global)](#ch-4)
  - [4.1 Okna (Windowâ€‘class)](#ch-4-1)
  - [4.2 Kontenery (Contentâ€‘class)](#ch-4-2)
  - [4.3 Organizacja/Nawigacja](#ch-4-3)
  - [4.4 Dane/Edycja](#ch-4-4)
  - [4.5 WskaĹşniki/Scroll](#ch-4-5)
- [5. Walidator â€” reguĹ‚y, kody bĹ‚Ä™dĂłw/ostrzeĹĽeĹ„](#ch-5)
- [6. Autoâ€‘naprawy deterministyczne](#ch-6)
- [7. Import/Export i roundâ€‘trip (edytor â†” plik â†” Lua)](#ch-7)
- [8. API edytora (TS): parse/serialize/validate/autofix](#ch-8)
- [9. Testy: goldeny i snapshoty](#ch-9)
- [10. PrzykĹ‚ady i edgeâ€‘cases](#ch-10)
- [11. Indeks haseĹ‚](#ch-11)

---

<div id="ch-0"></div>
## 0. Zakres, definicje, zaĹ‚oĹĽenia
**Interaktywny spis:** [0.1 Zakres](#ch-0-1) Â· [0.2 Definicje](#ch-0-2) Â· [0.3 ZaĹ‚oĹĽenia projektowe](#ch-0-3)
## # 0.1 Zakres {#ch-0-1}
- Pokrycie: *caĹ‚y pipeline* od tekstu OTUI (STRICT) â†” AST (TS) â†” walidacja â†” autoâ€‘naprawy â†” eksport/import.  
- Zakres UI: komplet taksonomii z czÄ™Ĺ›ci â€žSpecyfikacja UIâ€ť (rozdz. 4) + presety kanoniczne.
## # 0.2 Definicje {#ch-0-2}
- **STRICT OTUI** â€” format bezkomentarzowy, LF, wciÄ™cia 2 sp., kolejnoĹ›Ä‡ GEOMETRIAâ†’STYLâ†’ZACHOWANIE.
- **AST** â€” drzewo `WidgetNode`, deterministyczne klucze i kolejnoĹ›Ä‡ dzieci.
- **Macierz** â€” tablica dozwolonych dzieci dla par (parent, slot).
## # 0.3 ZaĹ‚oĹĽenia projektowe {#ch-0-3}
- **DeterministycznoĹ›Ä‡**: ten sam AST â†’ ten sam OTUI (bitâ€‘identyczny, przy tej samej wersji serializera).  
- **Idempotencja**: `parse(serialize(ast))` â‰ˇ `normalize(ast)`.
- **Brak magii**: walidator zgĹ‚asza i *tylko* przewidywalnie naprawia.

---

<div id="ch-1"></div>
## 1. STRICT OTUI â€” gramatyka i tokenizacja
**Interaktywny spis:** [1.1 Zasady formatowania](#ch-1-1) Â· [1.2 Tokeny](#ch-1-2) Â· [1.3 Szkic EBNF](#ch-1-3)
## # 1.1 Zasady formatowania {#ch-1-1}
- **WciÄ™cia**: 2 spacje na poziom. **Zakaz tabĂłw**.  
- **KoĹ„ce linii**: LF. **Bez BOM**.  
- **Brak komentarzy** w blokach `.otui`.  
- **KolejnoĹ›Ä‡ atrybutĂłw** w kaĹĽdym wÄ™Ĺşle: GEOMETRIA â†’ STYL â†’ ZACHOWANIE.
## # 1.2 Tokeny {#ch-1-2}
- SĹ‚owa kluczowe typĂłw: `MainWindow`, `StaticMainWindow`, `MiniWindow`, `ContainerWindow`, `DialogWindow`, `UIWidget`, `Panel`, `GroupBox`, `Titlebar`, `Toolbar`, `TabBar`, `TabWidget`, `Splitter`, `HorizontalSeparator`, `StatusOverlay`, `Label`, `Button`, `CheckBox`, `TextEdit`, `PasswordTextEdit`, `MultilineTextEdit`, `ComboBox`, `TextList`, `ProgressBar`, `VerticalScrollBar`, `HorizontalScrollBar`.
- Operator dziedziczenia: `<` (np. `MiniWindow < MainWindow`).
- Identyfikatory: `id: <slug>`; Ĺ‚aĹ„cuchy w `!text: tr('...')`; liczby caĹ‚kowite; kolory `#AARRGGBB` lub `alpha`.
## # 1.3 Szkic EBNF (pogglÄ…dowy) {#ch-1-3}
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
## 2. Parser â†’ AST (TypeScript)
**Interaktywny spis:** [2.1 KsztaĹ‚t AST](#ch-2-1) Â· [2.2 Normalizacja](#ch-2-2) Â· [2.3 Stabilizacja kolejnoĹ›ci](#ch-2-3)
## # 2.1 KsztaĹ‚t AST {#ch-2-1}
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
## # 2.2 Normalizacja {#ch-2-2}
- UzupeĹ‚nij brakujÄ…ce struktury: `children = []`, `style = {}` gdy potrzebne.  
- ZamieĹ„ `style.text` â†’ w serializacji na `!text: tr('...')`.  
- ZastÄ…p `size` parÄ… `width/height` podczas walidacji kotwic (na potrzeby reguĹ‚), ale w serializacji zachowuj wejĹ›ciowÄ… postaÄ‡.
## # 2.3 Stabilizacja kolejnoĹ›ci {#ch-2-3}
- Atrybuty: najpierw **GEOMETRIA**, potem **STYL**, na koĹ„cu **ZACHOWANIE** (events/states).  
- Dzieci: sortuj stabilnie po `(slotPriority, y, x, id)` jeĹ›li edytor posiada grid/snapping; inaczej po kolejnoĹ›ci wczytania.

---

<div id="ch-3"></div>
## 3. Serializer (AST â†’ OTUI STRICT)
**Interaktywny spis:** [3.1 ReguĹ‚y wypisywania](#ch-3-1) Â· [3.2 Escaping i i18n](#ch-3-2) Â· [3.3 Sanityzacja koĹ„cowa](#ch-3-3)
## # 3.1 ReguĹ‚y wypisywania {#ch-3-1}
- WciÄ™cie: **2 spacje**.  
- Puste wartoĹ›ci pomijaj.  
- Sekcja kolejnoĹ›ci: GEOMETRIA (`id`, `size`/`width`/`height`, `anchors.*`, `margin-*`, `padding`) â†’ STYL â†’ ZACHOWANIE (`@on*`, `$state:` bloki).
## # 3.2 Escaping i i18n {#ch-3-2}
- `style.text` â†’ `!text: tr('...')`, `'` â†’ `\'`.  
- Kolory tylko `#AARRGGBB` lub `alpha`.
## # 3.3 Sanityzacja koĹ„cowa {#ch-3-3}
- UsuĹ„ taby, trailing spaces, wymuĹ› LF.  
- Brak komentarzy w wynikowym `.otui`.

---

<div id="ch-4"></div>
## 4. Macierze dozwolonych dzieci (global)
**Interaktywny spis:** [4.1 Okna](#ch-4-1) Â· [4.2 Kontenery](#ch-4-2) Â· [4.3 Organizacja](#ch-4-3) Â· [4.4 Dane/Edycja](#ch-4-4) Â· [4.5 WskaĹşniki/Scroll](#ch-4-5)

> **Legenda:** âś“ dozwolone Â· âś– zabronione Â· âš  warunkowe (patrz uwagi).
## # 4.1 Okna (Windowâ€‘class) {#ch-4-1}
**MainWindow / StaticMainWindow (root)**
| Dziecko | Status | Uwagi |
|---|:---:|---|
| UIWidget, Panel, GroupBox | âś“ | Elementy panelowe.
| Label, Button, CheckBox, TextEdit, PasswordTextEdit, MultilineTextEdit, ComboBox | âś“ | Formularze i akcje.
| TextList | âś“ | Wymaga pary z VerticalScrollBar przy overflow (âš ).
| ProgressBar, HorizontalSeparator | âś“ | â€”
| TabBar, TabWidget, Splitter | âś“ | Splitter: dokĹ‚adnie 2 dzieci (âš ).
| StatusOverlay | âś“ | Warstwa wierzchnia, bez zĹ‚oĹĽonych dzieci (âš ).
| *Window (Main/Static/Mini/Container/Dialog) | âś– | Zakaz okienâ€‘dzieci.
| ScrollBar (samotny) | âś– | Zawsze para z treĹ›ciÄ….

**MiniWindow / ContainerWindow / DialogWindow**
- Slot `titlebar`: Label, Button, UIWidget(ikona) âś“; listy/edytory/scroll âś–.  
- Slot `content`: elementy panelowe âś“; oknaâ€‘dzieci âś–.  
- Slot `footer` (Mini/Dialog): Button/Label/ProgressBar âś“; listy/edytory/scroll âś–.
## # 4.2 Kontenery (Contentâ€‘class) {#ch-4-2}
| Parent | Dozwolone dzieci | Niedozwolone/uwagi |
|---|---|---|
| UIWidget | Wszystkie panelowe (Label/Button/Inputs/List/Progress/Scroll/Separator/StatusOverlay) | *Window âś– |
| Panel | j.w. | *Window âś– |
| GroupBox | `header: Label` âś“, `content: panelowe` âś“ | Scroll w header âś– |
| TabWidget | TreĹ›Ä‡ aktywnej zakĹ‚adki: panelowe âś“ | *Window âś–; sam TabBar nie tu |
| StatusOverlay | Label, ProgressBar, Button(cancel) âś“ | Listy/edytory/okna âś– |
## # 4.3 Organizacja/Nawigacja {#ch-4-3}
| Komponent | Dozwolone dzieci | Niedozwolone/uwagi |
|---|---|---|
| Titlebar | Label, Button, UIWidget(ikona) | Scroll/listy/edytory âś– |
| Toolbar | Button, HorizontalSeparator | Inne âś– |
| TabBar | Button (zakĹ‚adki) | TreĹ›Ä‡ zakĹ‚adek âś– â€” trafia do TabWidget |
| Splitter | **DokĹ‚adnie 2** dzieci: Panel/UIWidget/GroupBox | Okna/Scroll âś– |
| HorizontalSeparator | â€” | **Bez dzieci** |
## # 4.4 Dane/Edycja {#ch-4-4}
| Komponent | Dzieci |
|---|---|
| Label, Button, CheckBox, TextEdit, PasswordTextEdit, ComboBox, ProgressBar, ScrollBar | **Brak** |
| MultilineTextEdit | **Brak**; przewijanie przez sÄ…siedni Vertical/HorizontalScrollBar |
| TextList | **Brak** rÄ™cznych dzieci; wiersze generowane jako `UIWidget` (ListRow) runtime/templatem |
## # 4.5 WskaĹşniki/Scroll {#ch-4-5}
| Komponent | Zasady |
|---|---|
| VerticalScrollBar | Sibling przewijanej treĹ›ci; dock **right**; treĹ›Ä‡ kotwiczy `right: scroll.left` |
| HorizontalScrollBar | Sibling przewijanej treĹ›ci; dock **bottom**; treĹ›Ä‡ kotwiczy `bottom: hscroll.top` |

---

<div id="ch-5"></div>
## 5. Walidator â€” reguĹ‚y, kody bĹ‚Ä™dĂłw/ostrzeĹĽeĹ„
**Interaktywny spis:** [5.1 BĹ‚Ä™dy (E)](#ch-5-1) Â· [5.2 OstrzeĹĽenia (W)](#ch-5-2) Â· [5.3 Raport](#ch-5-3)
## # 5.1 BĹ‚Ä™dy (E) {#ch-5-1}
- **E001 STRICT/Format** â€” taby/BOM/komentarze/trailing spaces.  
- **E010 Anchors/Conflict** â€” `anchors.fill` + inne kotwice.  
- **E020 Window/Nesting** â€” okno (`*Window`) jako dziecko okna.  
- **E030 Scroll/Orphan** â€” ScrollBar bez sparowanej treĹ›ci.  
- **E031 Scroll/Pairing** â€” brak kotwicy treĹ›ci do ScrollBar (`right: scroll.left` lub `bottom: hscroll.top`).  
- **E040 Text/i18n** â€” staĹ‚y tekst bez `tr()` (w OTUI).  
- **E050 Splitter/Arity** â€” != 2 dzieci.  
- **E060 Titlebar/Children** â€” niedozwolone dziecko w `titlebar`.
## # 5.2 OstrzeĹĽenia (W) {#ch-5-2}
- **W101 Width/AutoFit** â€” okno dokowane z `width` (sugeruj usuniÄ™cie).  
- **W110 Margins/Odd** â€” nieparzyste marginesy (snapping 2 px).  
- **W120 Scroll/StepMismatch** â€” `step` niezgodny z wielkoĹ›ciÄ… wiersza/slotu.  
- **W130 Keyboard/Hints** â€” brak `@onEnter/@onEscape` w oknie dialogowym.
## # 5.3 Raport {#ch-5-3}
- Struktura: `{code, severity, path, message, fix?}`.  
- `path` = Ĺ›cieĹĽka wÄ™zĹ‚Ăłw (`main/content/items`).

---

<div id="ch-6"></div>
## 6. Autoâ€‘naprawy deterministyczne
**Interaktywny spis:** [6.1 STRICT fixups](#ch-6-1) Â· [6.2 Anchors/Layout](#ch-6-2) Â· [6.3 Scroll pairing](#ch-6-3)
## # 6.1 STRICT fixups {#ch-6-1}
- UsuĹ„ taby/BOM/komentarze; przytnij trailing spaces; wymuĹ› LF.
- UporzÄ…dkuj kolejnoĹ›Ä‡ atrybutĂłw (GEOMETRIAâ†’STYLâ†’ZACHOWANIE).
## # 6.2 Anchors/Layout {#ch-6-2}
- JeĹ›li sÄ… `anchors.left` + `anchors.right` **i** `width` â†’ usuĹ„ `width` (Autoâ€‘fit).  
- Rozdziel `size` na `width/height` tylko na potrzeby walidacji, nie w serializacji (zachowaj wejĹ›ciowy idiom).
## # 6.3 Scroll pairing {#ch-6-3}
- Dla `TextList`/`MultilineTextEdit` dodaj brakujÄ…cy `VerticalScrollBar` jako sibling (po prawej) i dodaj kotwicÄ™ treĹ›ci `right: scroll.left`.

---

<div id="ch-7"></div>
## 7. Import/Export i roundâ€‘trip (edytor â†” plik â†” Lua)
**Interaktywny spis:** [7.1 Import z plikĂłw `.otui`](#ch-7-1) Â· [7.2 Import z Lua (blok string)](#ch-7-2) Â· [7.3 Eksport](#ch-7-3)
## # 7.1 Import z plikĂłw `.otui` {#ch-7-1}
- Wczytaj, znormalizuj (STRICT), sparsuj do AST. Zachowaj *oryginalny ukĹ‚ad* do porĂłwnaĹ„.
## # 7.2 Import z Lua (blok string) {#ch-7-2}
- Wykryj staĹ‚e `local <Name>_OTUI = [[...]]`; wytnij treĹ›Ä‡; sprawdĹş STRICT; sparsuj.  
- OstrzeĹĽenie, gdy blok zawiera komentarze â€” niedozwolone w OTUI (mimo bycia w Lua).
## # 7.3 Eksport {#ch-7-3}
- Do pliku `.otui` (kanoniczny cel runtime).  
- Opcjonalnie: *roundâ€‘trip do Lua* â€” odĹ›wieĹĽ istniejÄ…cy blok `[[...]]` bitâ€‘identycznie po `ensureStrictOtui()`.

---

<div id="ch-8"></div>
## 8. API edytora (TS): parse/serialize/validate/autofix
**Interaktywny spis:** [8.1 Interfejsy](#ch-8-1) Â· [8.2 PrzepĹ‚ywy](#ch-8-2)
## # 8.1 Interfejsy {#ch-8-1}
```ts
export function parseOtui(text: string): WidgetNode[];
export function serializeAst(nodes: WidgetNode[]): string; // STRICT OTUI
export function ensureStrictOtui(text: string): string;     // tylko format
export interface ValidationIssue { code: string; severity: 'error'|'warning'; path: string; message: string; fix?: string; }
export function validateAst(nodes: WidgetNode[]): ValidationIssue[];
export function autofixAst(nodes: WidgetNode[]): { nodes: WidgetNode[]; changes: ValidationIssue[] };
```
## # 8.2 PrzepĹ‚ywy {#ch-8-2}
- **Projekt â†’ Walidacja â†’ Serializacja**.  
- **Import (plik/Lua) â†’ Parser â†’ Normalizacja â†’ Walidacja â†’ Edycja â†’ Serializacja â†’ Eksport (plik/Lua)**.

---

<div id="ch-9"></div>
## 9. Testy: goldeny i snapshoty
**Interaktywny spis:** [9.1 Goldeny roundâ€‘trip](#ch-9-1) Â· [9.2 Snapshoty wizualne](#ch-9-2)
## # 9.1 Goldeny roundâ€‘trip {#ch-9-1}
- Zestaw `X.otui` â†’ `parse` â†’ `serialize` â†’ porĂłwnanie bitâ€‘poâ€‘bicie.  
- DokĹ‚adaj przypadki: okna, scroll pairing, Splitter, TabBar/TabWidget.
## # 9.2 Snapshoty wizualne {#ch-9-2}
- Render testowy po stronie klienta (lub symulacja) i porĂłwnania pikselowe dla kluczowych presetĂłw.

---

<div id="ch-10"></div>
## 10. PrzykĹ‚ady i edgeâ€‘cases
**Interaktywny spis:** [10.1 Migracja do STRICT](#ch-10-1) Â· [10.2 Anchors/Fill vs krawÄ™dzie](#ch-10-2) Â· [10.3 Splitter/Arity](#ch-10-3)
## # 10.1 Migracja do STRICT {#ch-10-1}
- WejĹ›cie dowolne â†’ `ensureStrictOtui()` â†’ `parse` â†’ `autofixAst()` â†’ `serializeAst()`.
## # 10.2 Anchors/Fill vs krawÄ™dzie {#ch-10-2}
**BĹÄDNY OTUI**
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
## # 10.3 Splitter/Arity {#ch-10-3}
**BĹÄDNY OTUI**
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
## 11. Indeks haseĹ‚
- STRICT â€˘ AST â€˘ Macierz â€˘ Walidator â€˘ Autoâ€‘naprawy â€˘ Roundâ€‘trip â€˘ Splitter â€˘ TabBar/TabWidget â€˘ StatusOverlay â€˘ Scroll pairing


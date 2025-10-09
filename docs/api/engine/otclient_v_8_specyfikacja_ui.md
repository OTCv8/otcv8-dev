# OTClient v8 — Specyfikacja UI
---
# 0. Wprowadzenie i zasady
- [0.1 Cel i zakres „1:1”](#ch-0-1)
- [0.2 Terminologia (widget, layout‑owner, area/slot, preset, blueprint, AST)](#ch-0-2)
- [0.3 Kryteria jakości (deterministyczny round‑trip, zgodność 1:1)](#ch-0-3)
- [0.4 Workflow: projekt → walidacja → serializacja → eksport → import](#ch-0-4)
# 1. Konwencje formatowania i STRICT OTUI
- [1.1 Indent 2 sp., LF, bez BOM, bez tabów/komentarzy](#ch-1-1)
- [1.2 Kolejność atrybutów: GEOMETRIA → STYL → ZACHOWANIE](#ch-1-2)
- [1.3 Teksty i i18n: `!text: tr('...')`, wrap/auto‑resize/align/offset](#ch-1-3)
- [1.4 Stany: `$on`, `$!on`, `$focus` (kompletność bloków)](#ch-1-4)
- [1.5 Zasoby `data/`: fonty, obrazy, kolory (#AARRGGBB/alpha)](#ch-1-5)
# 2. Architektura UI
- [2.1 Pliki `.otui` i ładowanie `g_ui.displayUI('...')`](#ch-2-1)
- [2.2 Tworzenie dynamiczne `g_ui.createWidget('<Typ>', parent)`](#ch-2-2)
- [2.3 Hierarchia i identyfikacja (`id`, `getChildById`) ](#ch-2-3)
- [2.4 Fokus i nawigacja (bindy, `@onSetup`, FocusReason)](#ch-2-4)
# 3. Layout i własność układu
- [3.1 Zasada „layout‑owner” (parent vs child)](#ch-3-1)
- [3.2 Anchors, size, margins, padding — reguły i kolizje](#ch-3-2)
- [3.3 Scroll pairing (TextList/Multiline ↔ ScrollBar)](#ch-3-3)
- [3.4 Auto‑fit width (okna w panelach/kontenerach)](#ch-3-4)
# 4. Taksonomia komponentów (przegląd)
- [4.1 Okna: MainWindow, StaticMainWindow, MiniWindow, ContainerWindow, DialogWindow](#ch-4-1)
- [4.2 Kontenery: Panel, GroupBox, UIWidget, Grid, StatusOverlay](#ch-4-2)
- [4.3 Organizacja: Titlebar, Toolbar, TabBar/TabWidget, Splitter, HorizontalSeparator](#ch-4-3)
- [4.4 Dane/edycja: Label, Button, CheckBox, TextEdit, PasswordTextEdit, MultilineTextEdit, ComboBox, TextList/ListRow](#ch-4-4)
- [4.5 Wskaźniki: ProgressBar, ScrollBar (Vertical/Horizontal)](#ch-4-5)

---
# 5. MainWindow
- [5.1 Struktura i sloty](#ch-5-1)
- [5.2 Dozwolone dzieci (macierz)](#ch-5-2)
- [5.3 Geometria i styl](#ch-5-3)
- [5.4 Stany i zdarzenia](#ch-5-4)
- [5.5 Blueprint OTUI (kanoniczny)](#ch-5-5)
- [5.6 Mapowanie TS ↔ OTUI (serializer)](#ch-5-6)
- [5.7 Walidator (błędy/ostrzeżenia)](#ch-5-7)
- [5.8 Przykłady i edge‑cases](#ch-5-8)
# 6. StaticMainWindow
- [6.1 Struktura i sloty](#ch-6-1)
- [6.2 Dozwolone dzieci (macierz)](#ch-6-2)
- [6.3 Geometria i styl](#ch-6-3)
- [6.4 Stany i zdarzenia](#ch-6-4)
- [6.5 Blueprint OTUI](#ch-6-5)
- [6.6 TS↔OTUI](#ch-6-6)
- [6.7 Walidator](#ch-6-7)
- [6.8 Przykłady](#ch-6-8)
# 7. MiniWindow
- [7.1 Struktura (titlebar/content/footer)](#ch-7-1)
- [7.2 Titlebar: minimize/close, drag‑area](#ch-7-2)
- [7.3 Auto‑fit width i docking](#ch-7-3)
- [7.4 Stany i zdarzenia](#ch-7-4)
- [7.5 Blueprint OTUI](#ch-7-5)
- [7.6 TS↔OTUI](#ch-7-6)
- [7.7 Walidator](#ch-7-7)
- [7.8 Przykłady](#ch-7-8)
# 8. ContainerWindow
- [8.1 Struktura (titlebar/content)](#ch-8-1)
- [8.2 Titlebar: back/pin/min/close](#ch-8-2)
- [8.3 Content: ItemSlotGrid/slots, DnD](#ch-8-3)
- [8.4 Scroll i overflow](#ch-8-4)
- [8.5 Blueprint OTUI](#ch-8-5)
- [8.6 TS↔OTUI](#ch-8-6)
- [8.7 Walidator](#ch-8-7)
- [8.8 Przykłady](#ch-8-8)
# 9. DialogWindow
- [9.1 Struktura](#ch-9-1)
- [9.2 Enter/Escape (OK/Cancel)](#ch-9-2)
- [9.3 Modalność i fokus](#ch-9-3)
- [9.4 Blueprint/TS/Walidator](#ch-9-4)

---
# 10. Titlebar
- [10.1 Ikona, tytuł, przyciski](#ch-10-1)
- [10.2 Slot i dozwolone dzieci](#ch-10-2)
- [10.3 Drag‑move, fokus](#ch-10-3)
- [10.4 Blueprint/TS/Walidator](#ch-10-4)
# 11. Toolbar
- [11.1 Grupy akcji i separatory](#ch-11-1)
- [11.2 Toggle/active state](#ch-11-2)
- [11.3 Blueprint/TS/Walidator](#ch-11-3)
# 12. Panel / GroupBox
- [12.1 Sloty treści, nagłówki, separatory](#ch-12-1)
- [12.2 Dozwolone dzieci i auto‑fit](#ch-12-2)
- [12.3 Blueprint/TS/Walidator](#ch-12-3)
# 13. TabBar / TabWidget
- [13.1 Zakładki i kontener treści](#ch-13-1)
- [13.2 Zdarzenia i aktywacja](#ch-13-2)
- [13.3 Blueprint/TS/Walidator](#ch-13-3)
# 14. Splitter
- [14.1 Dwoje dzieci, min‑size, pamięć podziału](#ch-14-1)
- [14.2 Blueprint/TS/Walidator](#ch-14-2)
# 15. TextList / ListRow
- [15.1 Struktura wiersza (focus/select)](#ch-15-1)
- [15.2 Scroll pairing i kotwice](#ch-15-2)
- [15.3 Blueprinty row + walidator](#ch-15-3)
# 16. Label / UILabel
- [16.1 Wrap/auto‑resize/font/kolor/offset](#ch-16-1)
- [16.2 Blueprint/TS/Walidator](#ch-16-2)
# 17. Button
- [17.1 Stany `$on/$!on`, ikonografia, min‑size](#ch-17-1)
- [17.2 Shortcuts i zdarzenia](#ch-17-2)
- [17.3 Blueprint/TS/Walidator](#ch-17-3)
# 18. CheckBox
- [18.1 Zachowania i focus](#ch-18-1)
- [18.2 Blueprint/TS/Walidator](#ch-18-2)
# 19. TextEdit / PasswordTextEdit / MultilineTextEdit
- [19.1 Placeholder, caret, multiline](#ch-19-1)
- [19.2 Scroll pairing](#ch-19-2)
- [19.3 Blueprint/TS/Walidator](#ch-19-3)
# 20. ComboBox
- [20.1 Menu height/scroll step](#ch-20-1)
- [20.2 OptionChange i integracja](#ch-20-2)
- [20.3 Blueprint/TS/Walidator](#ch-20-3)
# 21. ProgressBar
- [21.1 Zakres, style, opis stanu](#ch-21-1)
- [21.2 Blueprint/TS/Walidator](#ch-21-2)
# 22. ScrollBar (Vertical/Horizontal)
- [22.1 Docking (right/bottom), step, pixels‑scroll](#ch-22-1)
- [22.2 Pairing rules + walidator](#ch-22-2)
# 23. HorizontalSeparator
- [23.1 Użycie i ograniczenia](#ch-23-1)
- [23.2 Blueprint](#ch-23-2)
# 24. StatusOverlay
- [24.1 Label + Progress + Cancel](#ch-24-1)
- [24.2 Blueprint/TS/Walidator](#ch-24-2)

---
# 25. Macierze dozwolonych dzieci (global)
- [25.1 Tabele macierzowe per komponent i slot](#ch-25-1)
- [25.2 Reguły globalne, zakazy, auto‑naprawy](#ch-25-2)
# 26. Walidacja i auto‑naprawy (global)
- [26.1 Błędy blokujące (STRICT, anchors, wymagane elementy)](#ch-26-1)
- [26.2 Ostrzeżenia (scroll pairing, Enter/Escape, Min/Close)](#ch-26-2)
- [26.3 Auto‑naprawy deterministyczne (kolejność, sloty, scroll, snapping 2px)](#ch-26-3)
# 27. Parser/Serializer OTUI → AST (TypeScript)
- [27.1 Specyfikacja tokenów i INDENT/DEDENT](#ch-27-1)
- [27.2 Kształt AST; API `parseOtui()` i `serializeAst()`](#ch-27-2)
- [27.3 Normalizacja do STRICT (`ensureStrictOtui()`)](#ch-27-3)
- [27.4 Testy „round‑trip” (goldeny)](#ch-27-4)
# 28. Import/Export i round‑trip (edytor ↔ plik ↔ Lua)
- [28.1 Import z `.otui` i z bloków `@OTUI_BEGIN/END`](#ch-28-1)
- [28.2 Eksport do `.otui` + odświeżenie bloku w Lua](#ch-28-2)
- [28.3 Generatory stubów Lua (`g_ui.displayUI('...')` + kontrolery)](#ch-28-3)
- [28.4 Runtime: brak publicznego `load UI from string` (tylko pliki)](#ch-28-4)
# 29. Biblioteka presetów (gotowe szablony)
- [29.1 Okna (MiniWindow, ContainerWindow, Dialog)](#ch-29-1)
- [29.2 Komponenty (Titlebar, Toolbar, Panel, …)](#ch-29-2)
- [29.3 Warianty tematyczne (narzędzie, kontener, dialog)](#ch-29-3)
# 30. Testy wizualne i regresja
- [30.1 Snapshoty i porównania 1:1](#ch-30-1)
- [30.2 DPI / font metrics / skalowanie](#ch-30-2)
- [30.3 Dostępność (kontrasty, czytelność)](#ch-30-3)
# 31. Słownik i indeks
- [31.1 Słownik atrybutów OTUI (A–Z)](#ch-31-1)
- [31.2 Indeks komponentów i właściwości](#ch-31-2)

---

<!-- Puste kotwice (placeholdery), aby linki działały od razu -->
<div id="ch-0-1"></div>

# 0.1 Cel i zakres „1:1”

Ten dokument definiuje **kanoniczne zasady projektowania UI OTClient v8** (OTUI/OTML + Lua) oraz wymagania dla Twojego **edytora TypeScript**: jak składać okna i komponenty, aby eksport/import był **deterministyczny i w 100% zgodny** z klientem. Zawiera: reguły formatowania (STRICT OTUI), taksonomię komponentów, macierze dozwolonych dzieci, blueprinty OTUI, glue Lua, walidację, parser/serializer OTUI→AST i round‑trip (edytor ↔ plik `.otui` ↔ Lua).
<div id="ch-0-2"></div>

# 0.2 Terminologia
- **Widget** — jednostka UI (np. Label, Button, TextList).
- **Layout‑owner** — rodzic odpowiadający za obszary/sloty i dokowanie dzieci.
- **Area/slot** — semantyczna przestrzeń dla dzieci (np. `titlebar`, `content`, `footer`).
- **Preset/Blueprint** — gotowy wzorzec OTUI danego komponentu/okna.
- **AST** — abstrakcyjne drzewo składniowe w edytorze (model OTUI w TS).
- **STRICT OTUI** — ścisły format tekstu `.otui`: LF, 2 spacje, brak tabów/komentarzy, stała kolejność atrybutów.
- **Round‑trip** — pewny obieg: import → edycja → eksport bez utraty semantyki ani formatowania regułowego.<div id="ch-0-3"></div>

# 0.3 Kryteria jakości
- **Zgodność 1:1** z OTClientem (układ, stany, eventy, zasoby).
- **Deterministyczny eksport** (ta sama treść wej./wyj. po serializacji, przy zachowaniu STRICT).
- **Stabilne identyfikatory `id`** i spójne nazewnictwo kontrolerów Lua.
- **Lokalizacja**: wszystkie stałe teksty przechodzą przez `tr()`.
- **Zasoby**: tylko z `data/` (fonty/obrazy), kolory #AARRGGBB/`alpha`.
- **Brak „magii”** w stanach: stany nadpisują styl, nie geometrię.<div id="ch-0-4"></div>

# 0.4 Workflow
1) **Projekt** w edytorze (drag&drop presetów; macierze pilnują dozwolonych dzieci).
2) **Walidacja** (STRICT, anchors, wymagane elementy).
3) **Serializacja** do `.otui` (kolejność GEOMETRIA→STYL→ZACHOWANIE).
4) **Eksport**: zapis `.otui` + generator stubów Lua (`g_ui.displayUI('...')`).
5) **Import**: z plików `.otui` lub bloków Lua oznaczonych `@OTUI_BEGIN/END`.
6) **Round‑trip**: zmiany w edytorze odzwierciedlone w pliku i opcjonalnym bloku Lua.
<div id="ch-1-1"></div>

# 1.1 Indent i STRICT
- **LF**, bez BOM; **spacje** (bez tabów); **brak trailing spaces**.
- **Wcięcia = 2 spacje** (mnożniki).
- **Zero komentarzy** w treści OTUI.
- Dozwolone znaki: łagodne ASCII + `#` (wyłącznie w kolorach), `-_:./<>()` itp. Wartości tekstowe w `!text` w pojedynczych cudzysłowach.

Przykład minimalnego bloku zgodnego ze STRICT:
```otui
Label
  id: info
  anchors.left: parent.left
  anchors.right: parent.right
  text-wrap: true
  !text: tr('Information')
  font: verdana-11px-monochrome
```

<div id="ch-1-2"></div>
# 1.2 Kolejność atrybutów
**GEOMETRIA** (najpierw): `id`, `size`/`width`/`height`, `anchors.*` (najpierw `fill`, potem krawędzie), `margin-*`, `padding`.
**STYL**: `background-color`, `font`, `color`, `image-*`, `text-*` (`align`, `wrap`, `auto-resize`, `offset`), `!text: tr('...')`.
**ZACHOWANIE**: `&metaFn`, `@on...` (Enter/Escape/Click/Setup/...), stany `$on/$!on/$focus`.

> Serializator **musi** zawsze emitować w tej kolejności.
<div id="ch-1-3"></div>
# 1.3 Teksty i i18n
- Każdy stały tekst: `!text: tr('...')`.
- Escaping `'` → `\'` wewnątrz `tr('...')`.
- `text-wrap`/`text-auto-resize`/`text-align`/`text-offset` sterują renderem.
- Nie umieszczaj surowych napisów poza `!text` (również w stanach).
<div id="ch-1-4"></div>

# 1.4 Stany
- `$on` / `$!on` — przełączane `widget:setOn(true/false)`.
- `$focus` — aktywne przy fokusie klawiatury.
- **Zalecenie**: stany modyfikują **styl** (kolory, `!text`, obraz), **nie** geometrię (anchors/size).

Przykład:
```otui
Button
  id: toggle
  width: 96
  !text: tr('Off')

  $on:
    !text: tr('On')
    color: #ffffff

  $!on:
    !text: tr('Off')
    color: #bbbbbb
```

<div id="ch-1-5"></div>

# 1.5 Zasoby `data/`

- **Fonty**: używaj nazw z `data/fonts/` (np. `verdana-11px-monochrome`, `verdana-11px-rounded`, `terminus-14px-bold`).
- **Obrazy**: ścieżki `/images/...`, opcje `image-smooth`, `image-fixed-ratio`.
- **Kolory**: `#AARRGGBB` lub `alpha`.
- Walidator blokuje ścieżki spoza `data/`.

<div id="ch-2-1"></div>

# 2.1 Pliki `.otui` i ładowanie

- **Kanonicznie** UI ładuje się z pliku: `local win = g_ui.displayUI('nazwa_pliku')`.
- Nazwa w `displayUI` odpowiada plikowi `.otui` w module.
- Brak publicznego API „load UI from string” — w runtime używaj plików.<div id="ch-2-2"></div>

# 2.2 Tworzenie dynamiczne

```lua
local parent = rootWidget
local row = g_ui.createWidget('UIWidget', parent)
row:setId('row1')
local name = g_ui.createWidget('Label', row)
name:setText(tr('Name'))
```
- Tworzenie dzieci w Lua jest dozwolone, ale **eksport** z edytora powinien odtwarzać układ w `.otui` (statyczny szkielet), a dynamikę zostawić skryptom.

<div id="ch-2-3"></div>

# 2.3 Hierarchia i identyfikacja

- `id` unikalne w ramach rodzica.
- Dostęp w Lua: `parent:getChildById('...')`, wyszukiwanie głębokie: `rootWidget:recursiveGetChildById('...')`.
- Widoczność: `widget:isVisible()`, `widget:setVisible(true/false)`; `:show()/:hide()`.<div id="ch-2-4"></div>

# 2.4 Fokus i nawigacja
- Bindy w `@onSetup` lub Lua: `g_keyboard.bindKeyPress('Up', fn, scope)`.
- Fokus: `widget:focus()`, powody fokusowania (FocusReason) wpływają na zachowanie.
- Listy: `focusNextChild/PreviousChild`, zapewnij `ensureChildVisible` przy przewijaniu.

<div id="ch-3-1"></div>

# 3.1 Zasada „layout‑owner”
- **Parent** definiuje sloty i reguły dokowania (anchors, padding, marginesy).
- **Child** ustawia swoje `anchors.*` względem parenta/sąsiadów.
- ScrollBar należy do parenta (kontenera), ale jest **sparowany** z przewijanym dzieckiem.

<div id="ch-3-2"></div>

# 3.2 Anchors, size, margins, kolizje

- `anchors.fill: parent` **nie** łącz z jednoczesnym `top/bottom/left/right`.
- Jeśli okno jest dokowane w panelu: ustaw `anchors.left/right: parent` i usuń `width` (auto‑fit).
- Marginesy `margin-*` i `padding` determinują odstępy — trzymaj parzyste wartości (snapping 2 px).

<div id="ch-3-3"></div>

# 3.3 Scroll pairing

- `TextList`/`MultilineTextEdit` ⇄ **`VerticalScrollBar`** jako **sibling**:
  - ScrollBar: `anchors.right/top/bottom: parent`.
  - Lista/tekst: `anchors.right: scroll.left`.
- `HorizontalScrollBar` dokowany na dole; treść: `anchors.bottom: hscroll.top`.
- Samotny ScrollBar → błąd walidacji.

<div id="ch-3-4"></div>

# 3.4 Auto‑fit width (dokowane okna)
- Dla `MiniWindow`/`DialogWindow` w panelach: domyślnie **rozciągaj w poziomie** (`anchors.left/right: parent`) i zarządzaj odstępami przez `margin-*`.
- Edytor przy eksporcie **auto‑naprawia**: usuwa `width`, gdy ustawiono `left/right`.

<div id="ch-4-1"></div>

# 4.1 Okna (Window‑class)

**Cel**: najwyższe elementy kompozycji; zapewniają ramę, titlebar, focus i skróty.

- **MainWindow**
  *Rola*: główne okno modułu/sceny.
  *Sloty*: brak nazwanych slotów — treść bezpośrednio w root.
  *Typowe*: pełnoekran/duże panele, dopuszcza wszystkie „panelowe” dzieci.
  *Zakazy*: okna‑dzieci (inne Main/StaticMain) jako potomkowie.

- **StaticMainWindow**
  *Rola*: jak MainWindow, ale **bez drag‑move** (statyczne tło/ekrany).
  *Użycie*: ekrany logowania, waiting list.

- **MiniWindow**
  *Rola*: modułowe okno narzędziowe.
  *Sloty*: `titlebar`, `content`, `footer`.
  *Przyciski*: **minimize**, **close** (opcjonalnie **back/pin**).
  *Auto‑fit*: domyślnie rozciąga się na szerokość rodzica w panelu.

- **ContainerWindow**
  *Rola*: przeglądanie zawartości (sloty/items).
  *Sloty*: `titlebar`, `content`.
  *Przyciski*: **back**, **pin/lock**, **minimize**, **close**.
  *Treść*: `ItemSlotGrid`/sloty; DnD; scroll przy overflow.

- **DialogWindow**
  *Rola*: potwierdzenia/prompt.
  *Skróty*: `@onEnter` (OK), `@onEscape` (Cancel).
  *Sloty*: typowo tytuł + treść + przyciski OK/Cancel.

<div id="ch-4-2"></div>

# 4.2 Kontenery (Content‑class)

**Cel**: organizacja i grupowanie treści.

- **Panel**
  Lekki kontener na treść. Dopuszcza większość elementów panelowych; używany jako sekcja lub obszar roboczy.

- **GroupBox**
  Panel z nagłówkiem (etykietą) i ramką/separatorem. Dla formularzy/pogrupowanych opcji.

- **UIWidget**
  Bazowy kontener/„kafelek”. Może mieć tło (`image-*`, `background-color`), służy też jako wiersze list.

- **Grid (edytorowy)**
  Artefakt **tylko w edytorze** do układania na siatce (snapping, gapy). **Nie** jest typem OTUI — przy eksporcie mapuje się na anchors/marginesy prawdziwych widgetów.

- **StatusOverlay**
  Lekka warstwa informacyjna (Label/Progress/Cancel) dokowana nad treścią. Bez złożonych dzieci.

<div id="ch-4-3"></div>

# 4.3 Organizacja i nawigacja

**Cel**: nawigowanie, przełączanie kontekstu, dzielenie przestrzeni.

- **Titlebar**
  Slot nagłówka okna: `Label` (tytuł), przyciski (**min/close/back/pin**), ewentualna ikona. Może stanowić **drag‑area**. Zakaz list, edytorów, scrollbarów.

- **Toolbar**
  Pasek akcji (grupy `Button`, separatory). Stany toggle, skróty klawiszowe.

- **TabBar / TabWidget**
  TabBar zawiera **zakładki** (przyciski), a **kontent zakładki** znajduje się w osobnym kontenerze obok/poniżej. Nie wkładamy treści do TabBar.

- **Splitter**
  Dzieli przestrzeń na **dwa** panele; wymagane `min-size` dzieci; pamiętanie podziału mile widziane.

- **HorizontalSeparator**
  Linie/separatory sekcji. Element wizualny — **bez dzieci**.

<div id="ch-4-4"></div>

# 4.4 Dane i edycja (Inputs/Lists)

**Cel**: prezentacja i wprowadzanie danych.

- **Label / UILabel**
  Tekst z `!text: tr('...')`, `font`, `color`, `text-wrap`, `text-auto-resize`, `text-align`, `text-offset`.

- **Button**
  Akcje; `@onClick`; stany `$on/$!on` (np. toggle). Minimalne wymiary zalecane ≥16×16.

- **CheckBox**
  Przełącznik bool; fokus i interakcja klawiaturą. Często obok napisu (Label) w tym samym kontenerze.

- **TextEdit / PasswordTextEdit / MultilineTextEdit**
  Pola tekstowe; `Multiline` wymaga pary ze **ScrollBar** (sibling, dock right/bottom).

- **ComboBox**
  Selektor opcji; `menu-height`, `menu-scroll-step`, `@onOptionChange`. Pozycje menu wewnętrzne (bez manualnych dzieci).

- **TextList / ListRow**
  Lista przewijana; wiersze jako `UIWidget`/custom row; fokus/zaznaczenie; para z **VerticalScrollBar** (sibling).

  <div id="ch-4-5"></div>
  
# 4.5 Wskaźniki i przewijanie

- **ProgressBar**
  Pasek postępu; zakres i styl; **bez dzieci**. Opisy stanu (Label) obok.

- **ScrollBar (Vertical/Horizontal)**
  `step`, `pixels-scroll`; **sibling** przewijanej treści. Dock: Vertical → **right**, Horizontal → **bottom**.
  **Pairing rules**: lista/tekst kotwiczy `right: scroll.left` (dla V) lub `bottom: hscroll.top` (dla H). Samotny ScrollBar → błąd.

---

> **Uwaga**: Szczegółowe macierze dozwolonych dzieci na poziomie każdego komponentu znajdują się w rozdziale **25** i są egzekwowane przez walidator podczas eksportu.

<div id="ch-5-1"></div>

# 5.1 Struktura i sloty

**MainWindow** jest najwyższym kontenerem okna roboczego modułu/sceny. Nie definiuje nazwanych slotów (jak `titlebar/content/footer`) — treść umieszczasz bezpośrednio w root lub w wydzielonych `UIWidget`/`Panel`.

**Zalecany podział logiczny (nieobowiązkowy):**
- `header` (opcjonalny pasek tytułu/toolbar jako `UIWidget`),
- `content` (główna przestrzeń pracy),
- `footer` (status/akcje).
To **nazwa własna** dzieci, nie formalny „slot” klasy — pomaga w edytorze, w walidacji i przy presetach.
<div id="ch-5-2"></div>

# 5.2 Dozwolone dzieci (macierz)

| Parent: `MainWindow` | Dopuszczone dzieci | Niedozwolone / uwagi |
|---|---|---|
| root | `UIWidget`, `Panel`, `Label`, `Button`, `TextEdit`, `PasswordTextEdit`, `MultilineTextEdit`, `TextList`, `ComboBox`, `CheckBox`, `ProgressBar`, `VerticalScrollBar`, `HorizontalSeparator`, `TabBar`, `Splitter` | Inne okna (`MainWindow/StaticMainWindow/MiniWindow/ContainerWindow/DialogWindow`) — ✖ |
| `header` (jeśli wydzielisz) | `Label`, `Button`, `Toolbar`, `UIWidget` (ikona) | Scroll/edytory/listy — ✖ |
| `content` | wszystkie elementy „panelowe” (lista powyżej) | okna‑dzieci — ✖ |
| `footer` | `Button`, `Label`, `ProgressBar` | listy/edytory — ✖ |

**Scroll pairing:** jeśli w `content` dodasz `TextList`/`MultilineTextEdit`, dockuj **VerticalScrollBar** po prawej i kotwicz treść do `scroll.left`.

<div id="ch-5-3"></div>

# 5.3 Geometria i styl (GEOMETRIA → STYL → ZACHOWANIE)

- **Rozmiar**: `size: W H` lub kotwice względem rodzica (zalecane w narzędziach: `anchors.left/right: parent` + wysokość/marginesy).
- **Kotwice**: unikaj łączenia `anchors.fill: parent` z ręcznymi `top/bottom/left/right`.
- **Marginesy/padding**: parzyste wartości (snapping 2 px) dla spójności.
- **Tło**: `background-color` lub `image-source` (np. tło ekranu); `image-smooth`, `image-fixed-ratio` w razie potrzeby.
- **Teksty**: wyłącznie `!text: tr('...')` (STRICT).
- **Fonty/obrazy**: tylko z `data/`.

> **Auto‑fit width**: osadzone w panelu `MainWindow` powinno domyślnie rozciągać się na szerokość rodzica (edytor może automatycznie usuwać `width`).

<div id="ch-5-4"></div>

# 5.4 Stany i zdarzenia

- **Zdarzenia okienne**: `@onEnter` (OK/Apply), `@onEscape` (Cancel/Close), `@onSetup` (bindy klawiszy).
- **Stany**: `MainWindow` z reguły nie używa `$on/$!on` na sobie; stosuj na przyciskach/wierszach listy.
- **Fokus i nawigacja**: w `@onSetup` zbinduj strzałki/PageUp/PageDown dla list, Enter/Escape dla akcji.
- **Zamykanie**: implementuj w controllerze (Lua), a w `.otui` tylko wiąż `@onEscape`/przyciski.

<div id="ch-5-5"></div>

# 5.5 Blueprint OTUI (kanoniczny)

```otui
MainWindow
  id: main
  size: 420 320
  anchors.left: parent.left
  anchors.top: parent.top
  margin-top: 6
  margin-left: 6

  background-color: alpha

  @onEnter: MainController.onConfirm()
  @onEscape: MainController.onCancel()
  @onSetup: MainController.onSetup()
# HEADER (opcjonalny pasek tytułu/toolbar)
  UIWidget
    id: header
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: parent.top
    height: 20

    background-color: #00000066

    Label
      id: title
      anchors.left: parent.left
      anchors.verticalCenter: parent.verticalCenter
      margin-left: 6
      text-auto-resize: true
      !text: tr('Main Window')
      font: verdana-11px-rounded
# CONTENT (lista + scroll jako sibling)
  UIWidget
    id: content
    anchors.left: parent.left
    anchors.right: scroll.left
    anchors.top: header.bottom
    anchors.bottom: footer.top
    padding: 6

    background-color: alpha

    TextList
      id: items
      anchors.fill: parent

  VerticalScrollBar
    id: scroll
    anchors.right: parent.right
    anchors.top: header.bottom
    anchors.bottom: footer.top
    step: 16
# FOOTER (akcje)
  UIWidget
    id: footer
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.bottom: parent.bottom
    height: 28

    background-color: #00000033

    Button
      id: okButton
      anchors.right: cancelButton.left
      anchors.bottom: parent.bottom
      width: 64
      margin-right: 8
      !text: tr('Ok')
      @onClick: MainController.onConfirm()

    Button
      id: cancelButton
      anchors.right: parent.right
      anchors.bottom: parent.bottom
      width: 64
      margin-right: 8
      !text: tr('Cancel')
      @onClick: MainController.onCancel()
```

**Uwagi do blueprintu:**
- ScrollBar to **sibling** `content`; lista kotwiczona do `scroll.left`.
- Wcięcia **2 spacje**, kolejność sekcji zachowana (STRICT).
- Teksty przez `tr()`; zasoby wyłącznie z `data/`.

<div id="ch-5-6"></div>

# 5.6 Mapowanie TS ↔ OTUI (serializer)

**Minimalny preset w edytorze (TS):**

```ts
export function presetMainWindow(): WidgetNode {
  return {
    base: 'MainWindow',
    geometry: { id: 'main', size: [420, 320], anchors: { left: 'parent.left', top: 'parent.top' }, marginTop: 6, marginLeft: 6 },
    style: { backgroundColor: 'alpha' },
    behavior: { events: { onEnter: 'MainController.onConfirm()', onEscape: 'MainController.onCancel()', onSetup: 'MainController.onSetup()' } },
    children: [
      { base: 'UIWidget', geometry: { id: 'header', anchors: { left: 'parent.left', right: 'parent.right', top: 'parent.top' }, height: 20 }, style: { backgroundColor: '#00000066' }, children: [
        { base: 'Label', geometry: { id: 'title', anchors: { left: 'parent.left', verticalCenter: 'parent.verticalCenter' }, marginLeft: 6, }, style: { textAutoResize: true, text: 'Main Window', font: 'verdana-11px-rounded' } }
      ]},
      { base: 'UIWidget', geometry: { id: 'content', anchors: { left: 'parent.left', right: 'scroll.left', top: 'header.bottom', bottom: 'footer.top' }, padding: 6 }, style: { backgroundColor: 'alpha' }, children: [
        { base: 'TextList', geometry: { id: 'items', anchors: { fill: 'parent' } } }
      ]},
      { base: 'VerticalScrollBar', geometry: { id: 'scroll', anchors: { right: 'parent.right', top: 'header.bottom', bottom: 'footer.top' } }, /* style */ undefined, behavior: undefined },
      { base: 'UIWidget', geometry: { id: 'footer', anchors: { left: 'parent.left', right: 'parent.right', bottom: 'parent.bottom' }, height: 28 }, style: { backgroundColor: '#00000033' }, children: [
        { base: 'Button', geometry: { id: 'okButton', anchors: { right: 'cancelButton.left', bottom: 'parent.bottom' }, width: 64, marginRight: 8 }, style: { text: 'Ok' }, behavior: { events: { onClick: 'MainController.onConfirm()' } } },
        { base: 'Button', geometry: { id: 'cancelButton', anchors: { right: 'parent.right', bottom: 'parent.bottom' }, width: 64, marginRight: 8 }, style: { text: 'Cancel' }, behavior: { events: { onClick: 'MainController.onCancel()' } } }
]}
]
};
}
```

**Serializer** musi emitować: GEOMETRIA → STYL → ZACHOWANIE, `style.text` → `!text: tr('...')`, `events` → `@on...`, stany → `$...`.

**Sanityzacja** przed zapisem: `ensureStrictOtui()` (LF, 2 sp., brak komentarzy/tabów/trailing spaces).

<div id="ch-5-7"></div>

# 5.7 Walidator (błędy/ostrzeżenia)

**Blokujące (❌):**
- Dziecko typu okno (`*Window`) wewnątrz `MainWindow`.
- Sprzeczne kotwice (`fill` + `top/bottom/left/right`).
- `TextList`/`MultilineTextEdit` bez pary **VerticalScrollBar** (gdy overflow) lub błędne kotwice pary.
- Teksty bez `tr()`; zasoby spoza `data/`.

**Ostrzeżenia (⚠️):**
- Brak `@onEnter/@onEscape` przy oknie z przyciskami OK/Cancel.
- Brak `header`/`footer` przy złożonych układach (zalecenie porządkowe).
- Nieparzyste marginesy (odstęp od siatki 2 px).<div id="ch-5-8"></div>
# 5.8 Przykłady i edge‑cases
- **Fullscreen tło**: zamiast narzucać `size`, użyj `anchors.fill: parent` i obraz tła z `image-fixed-ratio: true` (bez łączenia z ręcznymi kotwicami).
- **Lista bez scrolla**: jeśli wiesz, że elementów jest mało — dopuszczalne, ale walidator zasugeruje dodanie scrolla przy overflow.
- **Shortcuty**: w `@onSetup` zbinduj strzałki, PageUp/Down do nawigacji po liście; Enter/Escape do akcji.
- **Zamykanie okna**: mapuj `@onEscape` na `MainController.onCancel()` — sam kontroler decyduje o `:hide()`/sprzątaniu.
- **Nadpisywanie geometrii w stanach**: unikaj modyfikowania `anchors/size` wewnątrz `$on/$!on/$focus` — trzymaj stany stylistyczne (kolor/tekst).
<div id="ch-6-1"></div>
# 6.1 Struktura i sloty
**StaticMainWindow** to główne okno **statyczne** (bez drag‑move), stosowane m.in. dla ekranów logowania, komunikatów, list oczekiwania. Nie posiada formalnych slotów jak `titlebar/content/footer`, ale zalecamy logiczny podział na: `header`, `content`, `footer` (jako `UIWidget`).

- **header** (opcjonalny): pasek tytułu/toolbar (Label/Buttons).
- **content**: główna przestrzeń treści (teksty, listy, formularze, progress).
- **footer**: akcje (OK/Cancel) lub status.

StaticMainWindow nie powinno mieć **innych okien** jako dzieci.<div id="ch-6-2"></div>
# 6.2 Dozwolone dzieci (macierz)
| Parent: `StaticMainWindow` | Dopuszczone dzieci | Niedozwolone / uwagi |
|---|---|---|
| root | `UIWidget`, `Panel`, `Label`, `Button`, `TextEdit`, `PasswordTextEdit`, `MultilineTextEdit`, `TextList`, `ComboBox`, `CheckBox`, `ProgressBar`, `VerticalScrollBar`, `HorizontalSeparator`, `TabBar`, `Splitter` | Inne okna (`*Window`) — ✖ |
| `header` | `Label`, `Button`, `Toolbar`, `UIWidget` (ikona) | Scroll/edytory/listy — ✖ |
| `content` | wszystkie elementy panelowe z wiersza root | `*Window` — ✖; `ScrollBar` tylko jako para do list/tekstów |
| `footer` | `Button`, `Label`, `ProgressBar` | listy/edytory — ✖ |

**Scroll pairing**: przy `TextList`/`MultilineTextEdit` dodaj **VerticalScrollBar** (dok po prawej), a treść kotwicz do `scroll.left`.<div id="ch-6-3"></div>
# 6.3 Geometria i styl
- **Rozmiar/pozycja**: `size: W H` lub anchors; w panelach → auto‑fit szerokości (`anchors.left/right: parent`, bez `width`).
- **Kotwice**: nie łącz `anchors.fill: parent` z ręcznymi `top/bottom/left/right`.
- **Marginesy/padding**: parzyste wartości (snapping 2 px).
- **Tło**: `background-color` albo `image-source` (np. ekran powitalny) + `image-smooth/fixed-ratio` w razie potrzeby.
- **Teksty**: zawsze `!text: tr('...')` (STRICT). Zasoby tylko z `data/`.<div id="ch-6-4"></div>
# 6.4 Stany i zdarzenia
- **Zdarzenia**: `@onEnter` (OK/Continue), `@onEscape` (Cancel/Back), `@onSetup` (bindy, np. Enter/Escape/strzałki).
- **Stany**: zwykle na **dzieciach** (Button/ListRow), nie na samym `StaticMainWindow`.
- **Fokus**: zapewnij fokus pierwszego sensownego dziecka; nawigacja klawiaturą w `@onSetup`.<div id="ch-6-5"></div>
# 6.5 Blueprint OTUI (kanoniczny)
```otui
StaticMainWindow
  id: staticMain
  size: 420 320
  anchors.left: parent.left
  anchors.top: parent.top
  margin-top: 6
  margin-left: 6

  background-color: alpha

  @onEnter: StaticController.onConfirm()
  @onEscape: StaticController.onCancel()
  @onSetup: StaticController.onSetup()

  UIWidget
    id: header
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: parent.top
    height: 20

    background-color: #00000066

    Label
      id: title
      anchors.left: parent.left
      anchors.verticalCenter: parent.verticalCenter
      margin-left: 6
      text-auto-resize: true
      !text: tr('Static Window')
      font: verdana-11px-rounded

  UIWidget
    id: content
    anchors.left: parent.left
    anchors.right: scroll.left
    anchors.top: header.bottom
    anchors.bottom: footer.top
    padding: 6

    background-color: alpha

    Label
      id: info
      anchors.left: parent.left
      anchors.right: parent.right
      text-wrap: true
      !text: tr('Please wait...')
      font: verdana-11px-monochrome

    ProgressBar
      id: progress
      anchors.left: parent.left
      anchors.right: parent.right
      anchors.top: info.bottom
      margin-top: 6

  VerticalScrollBar
    id: scroll
    anchors.right: parent.right
    anchors.top: header.bottom
    anchors.bottom: footer.top
    step: 16

  UIWidget
    id: footer
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.bottom: parent.bottom
    height: 28

    background-color: #00000033

    Button
      id: cancelButton
      anchors.right: parent.right
      anchors.bottom: parent.bottom
      width: 64
      margin-right: 8
      !text: tr('Cancel')
      @onClick: StaticController.onCancel()
```

**Uwaga**: blueprint jest **STRICT** (brak komentarzy), wcięcia = 2 sp., kolejność sekcji zachowana.<div id="ch-6-6"></div>
# 6.6 Mapowanie TS ↔ OTUI (serializer)
**Preset (TS)**
```ts
export function presetStaticMainWindow(): WidgetNode {
  return {
    base: 'StaticMainWindow',
    geometry: { id: 'staticMain', size: [420, 320], anchors: { left: 'parent.left', top: 'parent.top' }, marginTop: 6, marginLeft: 6 },
    style: { backgroundColor: 'alpha' },
    behavior: { events: { onEnter: 'StaticController.onConfirm()', onEscape: 'StaticController.onCancel()', onSetup: 'StaticController.onSetup()' } },
    children: [
      { base: 'UIWidget', geometry: { id: 'header', anchors: { left: 'parent.left', right: 'parent.right', top: 'parent.top' }, height: 20 }, style: { backgroundColor: '#00000066' }, children: [
        { base: 'Label', geometry: { id: 'title', anchors: { left: 'parent.left', verticalCenter: 'parent.verticalCenter' }, marginLeft: 6 }, style: { textAutoResize: true, text: 'Static Window', font: 'verdana-11px-rounded' } }
      ]},
      { base: 'UIWidget', geometry: { id: 'content', anchors: { left: 'parent.left', right: 'scroll.left', top: 'header.bottom', bottom: 'footer.top' }, padding: 6 }, style: { backgroundColor: 'alpha' }, children: [
        { base: 'Label', geometry: { id: 'info', anchors: { left: 'parent.left', right: 'parent.right' } }, style: { textWrap: true, text: 'Please wait...', font: 'verdana-11px-monochrome' } },
        { base: 'ProgressBar', geometry: { id: 'progress', anchors: { left: 'parent.left', right: 'parent.right', top: 'info.bottom' }, marginTop: 6 } }
      ]},
      { base: 'VerticalScrollBar', geometry: { id: 'scroll', anchors: { right: 'parent.right', top: 'header.bottom', bottom: 'footer.top' } } },
      { base: 'UIWidget', geometry: { id: 'footer', anchors: { left: 'parent.left', right: 'parent.right', bottom: 'parent.bottom' }, height: 28 }, style: { backgroundColor: '#00000033' }, children: [
        { base: 'Button', geometry: { id: 'cancelButton', anchors: { right: 'parent.right', bottom: 'parent.bottom' }, width: 64, marginRight: 8 }, style: { text: 'Cancel' }, behavior: { events: { onClick: 'StaticController.onCancel()' } } }
]}
]
};
}
```
**Serializer**: identyczne reguły jak dla MainWindow — GEOMETRIA→STYL→ZACHOWANIE, `text`→`!text: tr(...)`, `events`→`@on...`, stany→`$...`. **Sanityzacja**: `ensureStrictOtui()` przed zapisem.<div id="ch-6-7"></div>
# 6.7 Walidator (błędy/ostrzeżenia)
**Blokujące (❌):**
- Dziecko typu okno (`*Window`) wewnątrz `StaticMainWindow`.
- ScrollBar w `header`/`footer`.
- Sprzeczne kotwice (`fill` + `top/bottom/left/right`).
- `TextList`/`MultilineTextEdit` bez pary ScrollBar (przy overflow) lub błędne kotwice pary.
- Teksty bez `tr()`; zasoby spoza `data/`.

**Ostrzeżenia (⚠️):**
- Brak `@onEnter/@onEscape` w ekranie wymagającym akcji (OK/Cancel).
- Brak `header`/`footer` przy złożonych układach.
- Nieparzyste marginesy (snapping 2 px).<div id="ch-6-8"></div>
# 6.8 Przykłady i edge‑cases
- **Ekran oczekiwania**: `Label` (wrap) + `ProgressBar`; `Cancel` w `footer`; brak list — ScrollBar opcjonalny.
- **MOTD / długi komunikat**: `MultilineTextEdit` + **VerticalScrollBar**; `@onEnter` = Continue, `@onEscape` = Back.
- **Tło pełnoekranowe**: `image-source` + `image-fixed-ratio`; zakotwicz `anchors.fill: parent` (bez mieszania z krawędziami).
- **Fokus**: ustaw na pierwszy przycisk/edytor; zapewnij strzałki/Enter/Escape w `@onSetup`.
<div id="ch-7-1"></div>
# 7.1 Struktura (titlebar/content/footer)
**MiniWindow** to lekkie, modułowe okno narzędziowe. Składa się z trzech logicznych obszarów:
- **`titlebar`** — nagłówek z tytułem i przyciskami (wymagane: **minimize** i **close**; opcjonalne: **back**, **pin**).
- **`content`** — główna przestrzeń robocza (formulare, listy, panele).
- **`footer`** — przyciski akcji (OK/Cancel/Apply) lub status.

**Zakazy**: w `titlebar/footer` nie umieszczaj `ScrollBar`, list ani edytorów; w `content` nie osadzaj innych okien (`*Window`).<div id="ch-7-2"></div>
# 7.2 Titlebar: minimize/close, drag‑area
- **Minimize** zwija/rozwija `content` i `footer` (zmiana widoczności/wysokości); stan może być odzwierciedlany na przycisku (np. `!text: tr('-')`/`!text: tr('+')`).
- **Close** wywołuje akcję zamknięcia (ukrycie/usunięcie okna przez kontroler Lua).
- **Back/Pin** (opcjonalnie) — stosowane w wariantach kontenerowych/narzędziowych.
- **Drag‑area**: `titlebar` może pełnić obszar przeciągania (obsługa po stronie klienta/kontrolera).

**Dozwolone dzieci `titlebar`**: `Label` (tytuł), `Button` (min/close/back/pin), `UIWidget` (ikona).<div id="ch-7-3"></div>
# 7.3 Auto‑fit width i docking
- Gdy `MiniWindow` jest osadzony w panelu/kontenerze, **domyślnie** rozciąga się na szerokość rodzica: ustaw `anchors.left/right: parent` i usuń `width`.
- Odstępy od krawędzi zapewnij przez `margin-*` (parzyste wartości — snapping 2 px).
- Unikaj łączenia `anchors.fill: parent` z ręcznymi kotwicami (`top/bottom/left/right`).<div id="ch-7-4"></div>
# 7.4 Stany i zdarzenia
- **Zdarzenia**: `@onEnter` (OK/Apply), `@onEscape` (Cancel/Close), `@onClick` (przyciski titlebara), `@onSetup` (bindy klawiatury).
- **Minimize toggle**: kontroler Lua przełącza widoczność `content` i `footer`.
- **Stany `$on/$!on`**: stosuj głównie do przycisków (np. podświetlenie aktywności), nie do geometrii okna.
- **Fokus**: po otwarciu ustaw fokus na pierwszym sensownym dziecku (`content`).<div id="ch-7-5"></div>
# 7.5 Blueprint OTUI (kanoniczny, STRICT)
```otui
MiniWindow < MainWindow
  id: miniWindow
  size: 260 180
  anchors.left: parent.left
  anchors.top: parent.top
  margin-top: 6
  margin-left: 6

  background-color: alpha

  @onEnter: MiniWindowController.onConfirm()
  @onEscape: MiniWindowController.onCancel()

  UIWidget
    id: titlebar
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: parent.top
    height: 20

    background-color: #00000066

    Label
      id: title
      anchors.left: parent.left
      anchors.verticalCenter: parent.verticalCenter
      margin-left: 6
      text-auto-resize: true
      !text: tr('Mini Window')
      font: verdana-11px-rounded

    Button
      id: minimizeBtn
      anchors.right: closeBtn.left
      anchors.verticalCenter: parent.verticalCenter
      width: 16
      !text: tr('-')
      @onClick: MiniWindowController.onToggleMinimize()

    Button
      id: closeBtn
      anchors.right: parent.right
      anchors.verticalCenter: parent.verticalCenter
      width: 16
      !text: tr('x')
      @onClick: MiniWindowController.onClose()

  UIWidget
    id: content
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: titlebar.bottom
    anchors.bottom: footer.top
    padding: 6

    background-color: alpha

  UIWidget
    id: footer
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.bottom: parent.bottom
    height: 28

    background-color: #00000033

    Button
      id: okButton
      anchors.right: cancelButton.left
      anchors.bottom: parent.bottom
      width: 64
      margin-right: 8
      !text: tr('Ok')
      @onClick: MiniWindowController.onConfirm()

    Button
      id: cancelButton
      anchors.right: parent.right
      anchors.bottom: parent.bottom
      width: 64
      margin-right: 8
      !text: tr('Cancel')
      @onClick: MiniWindowController.onCancel()
```

<div id="ch-7-6"></div>

# 7.6 Mapowanie TS ↔ OTUI (serializer)

**Preset (TS)**

```ts
export function presetMiniWindow(): WidgetNode {
  return {
    base: 'MiniWindow',
    extends: 'MainWindow',
    geometry: { id: 'miniWindow', size: [260, 180], anchors: { left: 'parent.left', top: 'parent.top' }, marginTop: 6, marginLeft: 6 },
    style: { backgroundColor: 'alpha' },
    behavior: { events: { onEnter: 'MiniWindowController.onConfirm()', onEscape: 'MiniWindowController.onCancel()' } },
    children: [
      { base: 'UIWidget', geometry: { id: 'titlebar', anchors: { left: 'parent.left', right: 'parent.right', top: 'parent.top' }, height: 20 }, style: { backgroundColor: '#00000066' }, children: [
        { base: 'Label', geometry: { id: 'title', anchors: { left: 'parent.left', verticalCenter: 'parent.verticalCenter' }, marginLeft: 6 }, style: { textAutoResize: true, text: 'Mini Window', font: 'verdana-11px-rounded' } },
        { base: 'Button', geometry: { id: 'minimizeBtn', anchors: { right: 'closeBtn.left', verticalCenter: 'parent.verticalCenter' }, width: 16 }, style: { text: '-' }, behavior: { events: { onClick: 'MiniWindowController.onToggleMinimize()' } } },
        { base: 'Button', geometry: { id: 'closeBtn', anchors: { right: 'parent.right', verticalCenter: 'parent.verticalCenter' }, width: 16 }, style: { text: 'x' }, behavior: { events: { onClick: 'MiniWindowController.onClose()' } } }
      ]},
      { base: 'UIWidget', geometry: { id: 'content', anchors: { left: 'parent.left', right: 'parent.right', top: 'titlebar.bottom', bottom: 'footer.top' }, padding: 6 }, style: { backgroundColor: 'alpha' } },
      { base: 'UIWidget', geometry: { id: 'footer', anchors: { left: 'parent.left', right: 'parent.right', bottom: 'parent.bottom' }, height: 28 }, style: { backgroundColor: '#00000033' }, children: [
        { base: 'Button', geometry: { id: 'okButton', anchors: { right: 'cancelButton.left', bottom: 'parent.bottom' }, width: 64, marginRight: 8 }, style: { text: 'Ok' }, behavior: { events: { onClick: 'MiniWindowController.onConfirm()' } } },
        { base: 'Button', geometry: { id: 'cancelButton', anchors: { right: 'parent.right', bottom: 'parent.bottom' }, width: 64, marginRight: 8 }, style: { text: 'Cancel' }, behavior: { events: { onClick: 'MiniWindowController.onCancel()' } } }
]}
]
};
}
```
**Serializer**: emituj GEOMETRIA→STYL→ZACHOWANIE; `style.text`→`!text: tr('...')`; `events`→`@on...`; stany→`$...`. **Sanityzacja**: `ensureStrictOtui()` przed zapisem.<div id="ch-7-7"></div>
# 7.7 Walidator (błędy/ostrzeżenia)
**Blokujące (❌):**
- Brak przycisków **minimize** i **close** w `titlebar`.
- Niedozwolone dzieci w `titlebar/footer` (scroll, listy, edytory).
- `content` zawiera inne okno (`*Window`).
- Sprzeczne kotwice (`fill` + krawędzie).
- Teksty bez `tr()`; zasoby spoza `data/`.

**Ostrzeżenia (⚠️):**
- Brak `@onEnter/@onEscape` dla okna z przyciskami akcji.
- Brak auto‑fit width (okno dokowane ma `width`).
- Nieparzyste marginesy (snapping 2 px).<div id="ch-7-8"></div>
# 7.8 Przykłady i edge‑cases
- **Lista w content**: wstaw `TextList` i dokołkuj `VerticalScrollBar` jako **sibling** po prawej; ustaw `content.anchors.right: scroll.left`.
- **Kolaps/rozwin**: `onToggleMinimize()` ukrywa/pokazuje `content` i `footer`; przycisk zmienia label `'-'`/`'+'`.
- **Dialog‑like**: `MiniWindow` może pełnić rolę prostego dialogu — dodaj `@onEnter/@onEscape` i układ przycisków w `footer`.
- **Wiele MiniWindow**: każde musi mieć unikalne `id`; edytor powinien zapobiegać kolizjom przy imporcie.
<div id="ch-8-1"></div>
# 8.1 Struktura (titlebar/content)
**ContainerWindow** służy do prezentacji i operacji na zawartości (sloty/elementy). Składa się z:
- **`titlebar`** — nagłówek z przyciskami **back/pin/minimize/close** i tytułem,
- **`content`** — obszar siatki slotów (przewijalny przy overflow).

**Zakazy**: w `titlebar` brak list/edytorów/scrollbarów; w `content` brak okien‑dzieci (`*Window`).

**Auto‑fit width**: po osadzeniu w panelu okno powinno rozciągać się poziomo (`anchors.left/right: parent`), odstępy przez `margin-*`.<div id="ch-8-2"></div>
# 8.2 Titlebar: back/pin/min/close
- **Back** — powrót do poprzedniego kontenera (kontroler Lua zarządza stosem/nawigacją).
- **Pin/Lock** — przypina okno (zachowanie w kontrolerze; może wpływać na z‑order/dokowanie).
- **Minimize** — zwija `content` (i ukrywa ewentualny `footer` jeśli występuje), stan sygnalizowany na przycisku.
- **Close** — ukrywa/zamyka okno przez kontroler.

**Dozwolone dzieci `titlebar`**: `Label` (tytuł), `Button` (back/pin/min/close), `UIWidget` (ikona).

<div id="ch-8-3"></div>

# 8.3 Content: siatka slotów i DnD

- **Siatka**: projektowana jako `UIWidget id: grid`, z **powtarzanymi** dziećmi `SlotWidget < UIWidget` (stały rozmiar i odstępy).
- **Rozmieszczenie**: edytor dba o snapping (2 px) i kolumny/wiersze; runtime może dynamicznie przepinać sloty, ale eksport zachowuje deterministyczny układ.
- **DnD**: źródło/cel tylko w `content` (sloty). Podświetlenie slotu podczas hover/mocy przeniesienia realizowane stanami na `SlotWidget` lub przez kontroler Lua.
- **Scroll**: przy overflow dodaj **VerticalScrollBar** jako sibling po prawej; `grid.anchors.right: scroll.left`.

<div id="ch-8-4"></div>

# 8.4 Scroll i overflow

- **VerticalScrollBar** dokowany do prawej krawędzi `ContainerWindow`; `grid` kotwiczy `right: scroll.left`.
- **Step/pixels**: ustaw `step` zgodnie z wysokością slotu (np. 32/36), aby skok przewijania pokrywał rząd.
- **Samotny ScrollBar** lub listy/edytory w `titlebar` — błąd walidacji.

<div id="ch-8-5"></div>

# 8.5 Blueprint OTUI (kanoniczny, STRICT)

```otui
ContainerWindow < MainWindow
  id: containerWindow
  size: 300 220
  anchors.left: parent.left
  anchors.top: parent.top
  margin-top: 6
  margin-left: 6

  background-color: alpha

  @onEnter: ContainerController.onConfirm()
  @onEscape: ContainerController.onBack()

  UIWidget
    id: titlebar
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: parent.top
    height: 20

    background-color: #00000066

    Label
      id: title
      anchors.left: parent.left
      anchors.verticalCenter: parent.verticalCenter
      margin-left: 6
      text-auto-resize: true
      !text: tr('Container')
      font: verdana-11px-rounded

    Button
      id: backBtn
      anchors.right: pinBtn.left
      anchors.verticalCenter: parent.verticalCenter
      width: 20
      !text: tr('<')
      @onClick: ContainerController.onBack()

    Button
      id: pinBtn
      anchors.right: minimizeBtn.left
      anchors.verticalCenter: parent.verticalCenter
      width: 20
      !text: tr('*')
      @onClick: ContainerController.onTogglePin()

    Button
      id: minimizeBtn
      anchors.right: closeBtn.left
      anchors.verticalCenter: parent.verticalCenter
      width: 16
      !text: tr('-')
      @onClick: ContainerController.onToggleMinimize()

    Button
      id: closeBtn
      anchors.right: parent.right
      anchors.verticalCenter: parent.verticalCenter
      width: 16
      !text: tr('x')
      @onClick: ContainerController.onClose()

  UIWidget
    id: content
    anchors.left: parent.left
    anchors.right: scroll.left
    anchors.top: titlebar.bottom
    anchors.bottom: parent.bottom
    padding: 6

    background-color: alpha

    UIWidget
      id: grid
      anchors.left: parent.left
      anchors.top: parent.top
      width: 1
      height: 1

      SlotWidget < UIWidget
        id: slot1
        size: 36 36
        background-color: #00000033

      SlotWidget < UIWidget
        id: slot2
        anchors.left: slot1.right
        anchors.top: slot1.top
        margin-left: 4
        size: 36 36
        background-color: #00000033

  VerticalScrollBar
    id: scroll
    anchors.right: parent.right
    anchors.top: titlebar.bottom
    anchors.bottom: parent.bottom
    step: 36
```

<div id="ch-8-6"></div>

# 8.6 Mapowanie TS ↔ OTUI (serializer)

**Preset (TS)**
```ts
export function presetContainerWindow(): WidgetNode {
  return {
    base: 'ContainerWindow',
    extends: 'MainWindow',
    geometry: { id: 'containerWindow', size: [300, 220], anchors: { left: 'parent.left', top: 'parent.top' }, marginTop: 6, marginLeft: 6 },
    style: { backgroundColor: 'alpha' },
    behavior: { events: { onEnter: 'ContainerController.onConfirm()', onEscape: 'ContainerController.onBack()' } },
    children: [
      { base: 'UIWidget', geometry: { id: 'titlebar', anchors: { left: 'parent.left', right: 'parent.right', top: 'parent.top' }, height: 20 }, style: { backgroundColor: '#00000066' }, children: [
        { base: 'Label', geometry: { id: 'title', anchors: { left: 'parent.left', verticalCenter: 'parent.verticalCenter' }, marginLeft: 6 }, style: { textAutoResize: true, text: 'Container', font: 'verdana-11px-rounded' } },
        { base: 'Button', geometry: { id: 'backBtn', anchors: { right: 'pinBtn.left', verticalCenter: 'parent.verticalCenter' }, width: 20 }, style: { text: '<' }, behavior: { events: { onClick: 'ContainerController.onBack()' } } },
        { base: 'Button', geometry: { id: 'pinBtn', anchors: { right: 'minimizeBtn.left', verticalCenter: 'parent.verticalCenter' }, width: 20 }, style: { text: '*' }, behavior: { events: { onClick: 'ContainerController.onTogglePin()' } } },
        { base: 'Button', geometry: { id: 'minimizeBtn', anchors: { right: 'closeBtn.left', verticalCenter: 'parent.verticalCenter' }, width: 16 }, style: { text: '-' }, behavior: { events: { onClick: 'ContainerController.onToggleMinimize()' } } },
        { base: 'Button', geometry: { id: 'closeBtn', anchors: { right: 'parent.right', verticalCenter: 'parent.verticalCenter' }, width: 16 }, style: { text: 'x' }, behavior: { events: { onClick: 'ContainerController.onClose()' } } }
      ]},
      { base: 'UIWidget', geometry: { id: 'content', anchors: { left: 'parent.left', right: 'scroll.left', top: 'titlebar.bottom', bottom: 'parent.bottom' }, padding: 6 }, style: { backgroundColor: 'alpha' }, children: [
        { base: 'UIWidget', geometry: { id: 'grid', anchors: { left: 'parent.left', top: 'parent.top' }, size: [1,1] }, children: [
          { base: 'SlotWidget', extends: 'UIWidget', geometry: { id: 'slot1', size: [36,36] }, style: { backgroundColor: '#00000033' } },
          { base: 'SlotWidget', extends: 'UIWidget', geometry: { id: 'slot2', anchors: { left: 'slot1.right', top: 'slot1.top' }, marginLeft: 4, size: [36,36] }, style: { backgroundColor: '#00000033' } }
]}
      ]},
      { base: 'VerticalScrollBar', geometry: { id: 'scroll', anchors: { right: 'parent.right', top: 'titlebar.bottom', bottom: 'parent.bottom' } }, behavior: { } }
]
};
}
```
**Serializer**: GEOMETRIA→STYL→ZACHOWANIE; `style.text`→`!text: tr('...')`; `events`→`@on...`. **Sanityzacja**: `ensureStrictOtui()`.

**Uwaga**: `SlotWidget < UIWidget` to **lokalna klasa stylu** w pliku; w realnym projekcie możesz podmienić na własny typ slotu.<div id="ch-8-7"></div>
# 8.7 Walidator (błędy/ostrzeżenia)
**Blokujące (❌):**
- Brak przycisku **back** w `titlebar` (nawigacja kontenera).
- Niedozwolone dzieci w `titlebar` (scroll/listy/edytory).
- `content` zawiera inne okno (`*Window`).
- `VerticalScrollBar` bez sparowanej treści (`grid`) lub odwrotnie (overflow bez scrolla).
- Sprzeczne kotwice (`fill` + krawędzie). Teksty bez `tr()`; zasoby spoza `data/`.

**Ostrzeżenia (⚠️):**
- Brak `pin`/`minimize`/`close` w `titlebar` (wymagane zależnie od projektu).
- `step` scrolla nie odpowiada wysokości wiersza slotów (nieprzyjemne przewijanie).
- Nieparzyste marginesy/spacing (snapping 2 px).<div id="ch-8-8"></div>
# 8.8 Przykłady i edge‑cases
- **Powrót (back)**: `ContainerController.onBack()` przywraca poprzedni kontener (stack), a `@onEscape` mapuje się na tę samą akcję.
- **Pin/Lock**: przełącza stan „przypięty” okna; w `$on` przycisku możesz zmienić kolor/ikonę.
- **Overflow**: przy dodaniu N+1 rzędu slotów → edytor proponuje VerticalScrollBar i kotwice `grid.right: scroll.left`.
- **DnD**: slot w stanie „hover” (`$focus` lub własny stan logiczny) zmienia tło; kontroler waliduje dozwolone dropy.
- **Minimalne rozmiary slotu**: ≥32×32 (lub projektowe), spacing ≥4 px — zapewnij spójność siatki.

---

# 9. DialogWindow
- [9.1 Struktura](#ch-9-1)
- [9.2 Enter/Escape (OK/Cancel)](#ch-9-2)
- [9.3 Modalność i fokus](#ch-9-3)
- [9.4 Blueprint OTUI (STRICT)](#ch-9-4)
- [9.5 Preset TS (serializer‑ready)](#ch-9-5)
- [9.6 Walidator (błędy/ostrzeżenia)](#ch-9-6)
- [9.7 Przykłady i edge‑cases](#ch-9-7)

<div id="ch-9-1"></div>

# 9.1 Struktura
**DialogWindow** to lekkie okno dialogowe do potwierdzeń, komunikatów i prostych promptów.
- Obszary: `titlebar`, `content`, `footer` (analogicznie do MiniWindow).
- Wymagane skróty: **Enter = OK**, **Escape = Cancel**.
- Zakazy: brak okien‑dzieci (`*Window`) w `content`; brak list/edytorów/scrolla w `titlebar`/`footer`.

<div id="ch-9-2"></div>

# 9.2 Enter/Escape (OK/Cancel)
- `@onEnter` → akcja domyślna (OK/Apply).
- `@onEscape` → anulowanie/zamknięcie.
- Edytor wymusza obecność **co najmniej jednego** przycisku w `footer` i mapuje go na Enter/Escape zgodnie z rolą.

<div id="ch-9-3"></div>

# 9.3 Modalność i fokus
- Modalność: opcjonalna (np. przez overlay modułu).
- Po otwarciu ustaw fokus na domyślny przycisk OK lub pierwsze pole edycji.
- Zamknięcie: kontroler Lua decyduje o `:hide()` i sprzątaniu zasobów.

<div id="ch-9-4"></div>

# 9.4 Blueprint OTUI (STRICT)
```otui
DialogWindow < MainWindow
  id: dialog
  size: 300 140
  anchors.left: parent.left
  anchors.top: parent.top
  margin-top: 8
  margin-left: 8

  background-color: alpha

  @onEnter: DialogController.onOk()
  @onEscape: DialogController.onCancel()

  UIWidget
    id: titlebar
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: parent.top
    height: 20

    background-color: #00000066

    Label
      id: title
      anchors.left: parent.left
      anchors.verticalCenter: parent.verticalCenter
      margin-left: 6
      text-auto-resize: true
      !text: tr('Dialog')
      font: verdana-11px-rounded

  UIWidget
    id: content
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: titlebar.bottom
    anchors.bottom: footer.top
    padding: 8

    background-color: alpha

    Label
      id: message
      anchors.left: parent.left
      anchors.right: parent.right
      text-wrap: true
      !text: tr('Are you sure?')
      font: verdana-11px-monochrome

  UIWidget
    id: footer
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.bottom: parent.bottom
    height: 32

    background-color: #00000033

    Button
      id: okButton
      anchors.right: cancelButton.left
      anchors.bottom: parent.bottom
      width: 72
      margin-right: 8
      !text: tr('Ok')
      @onClick: DialogController.onOk()

    Button
      id: cancelButton
      anchors.right: parent.right
      anchors.bottom: parent.bottom
      width: 72
      margin-right: 8
      !text: tr('Cancel')
      @onClick: DialogController.onCancel()
```

<div id="ch-9-5"></div>

# 9.5 Preset TS (serializer‑ready)

```ts
export function presetDialogWindow(): WidgetNode {
  return {
    base: 'DialogWindow', extends: 'MainWindow',
    geometry: { id: 'dialog', size: [300,140], anchors: { left: 'parent.left', top: 'parent.top' }, marginTop: 8, marginLeft: 8 },
    style: { backgroundColor: 'alpha' },
    behavior: { events: { onEnter: 'DialogController.onOk()', onEscape: 'DialogController.onCancel()' } },
    children: [
      { base: 'UIWidget', geometry: { id: 'titlebar', anchors: { left: 'parent.left', right: 'parent.right', top: 'parent.top' }, height: 20 }, style: { backgroundColor: '#00000066' }, children: [
        { base: 'Label', geometry: { id: 'title', anchors: { left: 'parent.left', verticalCenter: 'parent.verticalCenter' }, marginLeft: 6 }, style: { textAutoResize: true, text: 'Dialog', font: 'verdana-11px-rounded' } }
      ]},
      { base: 'UIWidget', geometry: { id: 'content', anchors: { left: 'parent.left', right: 'parent.right', top: 'titlebar.bottom', bottom: 'footer.top' }, padding: 8 }, style: { backgroundColor: 'alpha' }, children: [
        { base: 'Label', geometry: { id: 'message', anchors: { left: 'parent.left', right: 'parent.right' } }, style: { textWrap: true, text: 'Are you sure?', font: 'verdana-11px-monochrome' } }
      ]},
      { base: 'UIWidget', geometry: { id: 'footer', anchors: { left: 'parent.left', right: 'parent.right', bottom: 'parent.bottom' }, height: 32 }, style: { backgroundColor: '#00000033' }, children: [
        { base: 'Button', geometry: { id: 'okButton', anchors: { right: 'cancelButton.left', bottom: 'parent.bottom' }, width: 72, marginRight: 8 }, style: { text: 'Ok' }, behavior: { events: { onClick: 'DialogController.onOk()' } } },
        { base: 'Button', geometry: { id: 'cancelButton', anchors: { right: 'parent.right', bottom: 'parent.bottom' }, width: 72, marginRight: 8 }, style: { text: 'Cancel' }, behavior: { events: { onClick: 'DialogController.onCancel()' } } }
]}
]
};
}

```

<div id="ch-9-6"></div>

# 9.6 Walidator (błędy/ostrzeżenia)

**Blokujące (❌):** brak `@onEnter/@onEscape`; brak przycisków w `footer` lub brak mapowania OK/Escape; dzieci niedozwolone w `titlebar/footer` (listy/edytory/scroll); `*Window` w `content`; sprzeczne kotwice; brak `tr()`; zasoby spoza `data/`.

**Ostrzeżenia (⚠️):** brak auto‑fit w poziomie po dokowaniu; nieparzyste marginesy/spacing.

<div id="ch-9-7"></div>

# 9.7 Przykłady i edge‑cases

- Prompt z `TextEdit`: pole w `content` + mapowanie Enter/Escape na OK/Cancel.
- Długi tekst: `MultilineTextEdit` + **VerticalScrollBar** (sibling) i wrapping label z leadem.
- Dialog‑potwierdzenie otwierany z MiniWindow: fokus od razu na OK; Escape zamyka bez skutków ubocznych.

---

# 10. Titlebar
- [10.1 Ikona, tytuł, przyciski](#ch-10-1)
- [10.2 Slot i dozwolone dzieci](#ch-10-2)
- [10.3 Drag‑move i fokus](#ch-10-3)
- [10.4 Blueprint OTUI (STRICT)](#ch-10-4)
- [10.5 Preset TS (warianty back/pin)](#ch-10-5)
- [10.6 Walidator](#ch-10-6)
- [10.7 Integracja (Lua glue)](#ch-10-7)

<div id="ch-10-1"></div>

# 10.1 Ikona, tytuł, przyciski

**Titlebar** to pasek nagłówka okna. Typowe elementy:
- **Ikona** (`UIWidget` z obrazem) — opcjonalna z lewej.
- **Tytuł** (`Label`) — `text-auto-resize: true`, wyrównanie do lewej.
- **Przyciski** (`Button`) — po prawej: **minimize**, **close**, opcjonalnie **back**, **pin**.
- Wysokość stała (np. 20 px); tło/kolor zgodne z motywem.

<div id="ch-10-2"></div>

# 10.2 Slot i dozwolone dzieci

- Titlebar jest **wydzielonym `UIWidget`** (slot) wewnątrz okna (`*Window`).
- Dozwolone dzieci: `Label`, `Button`, `UIWidget` (ikona).
- Zakazane: listy, edytory, ScrollBary i inne okna.
- Przyciski powinny mieć jednolite szerokości (16–20 px) i kotwice do prawej krawędzi.

<div id="ch-10-3"></div>

# 10.3 Drag‑move i fokus

- Obszar przeciągania może obejmować cały `titlebar` (obsługa po stronie klienta/kontrolera).
- Klik w tytuł/puste pole nie powinien zabierać fokusu kluczowym elementom w `content`.
- Skróty dla przycisków można zmapować w `@onSetup`/Lua.

<div id="ch-10-4"></div>

# 10.4 Blueprint OTUI (STRICT)

```otui
TitlebarWidget < UIWidget
  id: titlebar
  anchors.left: parent.left
  anchors.right: parent.right
  anchors.top: parent.top
  height: 20

  background-color: #00000066

  Label
    id: title
    anchors.left: parent.left
    anchors.verticalCenter: parent.verticalCenter
    margin-left: 6
    text-auto-resize: true
    !text: tr('Title')
    font: verdana-11px-rounded

  Button
    id: minimizeBtn
    anchors.right: closeBtn.left
    anchors.verticalCenter: parent.verticalCenter
    width: 16
    !text: tr('-')

  Button
    id: closeBtn
    anchors.right: parent.right
    anchors.verticalCenter: parent.verticalCenter
    width: 16
    !text: tr('x')
```

<div id="ch-10-5"></div>

# 10.5 Preset TS (warianty back/pin)

```ts
export function presetTitlebar(opts?: { withBack?: boolean; withPin?: boolean; }): WidgetNode {
  const children: WidgetNode[] = [
    { base: 'Label', geometry: { id: 'title', anchors: { left: 'parent.left', verticalCenter: 'parent.verticalCenter' }, marginLeft: 6 }, style: { textAutoResize: true, text: 'Title', font: 'verdana-11px-rounded' } },
    { base: 'Button', geometry: { id: 'minimizeBtn', anchors: { right: 'closeBtn.left', verticalCenter: 'parent.verticalCenter' }, width: 16 }, style: { text: '-' } },
    { base: 'Button', geometry: { id: 'closeBtn', anchors: { right: 'parent.right', verticalCenter: 'parent.verticalCenter' }, width: 16 }, style: { text: 'x' } }
];
  if (opts?.withPin) {
    children.splice(2,0,{ base: 'Button', geometry: { id: 'pinBtn', anchors: { right: 'minimizeBtn.left', verticalCenter: 'parent.verticalCenter' }, width: 20 }, style: { text: '*' } });
}
  if (opts?.withBack) {
    children.unshift({ base: 'Button', geometry: { id: 'backBtn', anchors: { right: children[0]?.geometry?.id ? `${children[0].geometry!.id}.left` : 'minimizeBtn.left', verticalCenter: 'parent.verticalCenter' }, width: 20 }, style: { text: '<' } });
}
  return {
    base: 'TitlebarWidget', extends: 'UIWidget',
    geometry: { id: 'titlebar', anchors: { left: 'parent.left', right: 'parent.right', top: 'parent.top' }, height: 20 },
    style: { backgroundColor: '#00000066' },
    children
};
}
```

<div id="ch-10-6"></div>

# 10.6 Walidator
- ❌ Dzieci spoza dozwolonego zestawu (lista/edytory/scroll).
- ❌ Brak `minimize`/`close` tam, gdzie wymagane (MiniWindow/Container/Dialog).
- ❌ Niepoprawne kotwice (przyciski bez powiązań do prawej krawędzi).
- ⚠️ Brak `back`/`pin` w wariantach wymaganych projektowo.
- ⚠️ Nieparzyste marginesy i niespójne szerokości przycisków.

<div id="ch-10-7"></div>

# 10.7 Integracja (Lua glue)

```lua
TitlebarController = {}

function TitlebarController.onMinimize()
  local content = rootWidget:recursiveGetChildById('content')
  local footer  = rootWidget:recursiveGetChildById('footer')
  if not content then return end
  local show = not content:isVisible()
  content:setVisible(show)
  if footer then footer:setVisible(show) end
end

function TitlebarController.onClose()
  local owner = rootWidget:recursiveGetChildById('miniWindow') or rootWidget:recursiveGetChildById('containerWindow') or rootWidget:recursiveGetChildById('dialog')
  if owner then owner:hide() end
end

function TitlebarController.onBack()
  if ContainerController and ContainerController.onBack then
    ContainerController.onBack()
  end
end

function TitlebarController.onTogglePin()
  -- przełącz stan przypięcia; szczegóły zależne od projektu
end
```

---

# 11. Toolbar
- [11.1 Rola i struktura](#ch-11-1)
- [11.2 Dozwolone dzieci](#ch-11-2)
- [11.3 Geometria i styl](#ch-11-3)
- [11.4 Stany i zdarzenia](#ch-11-4)
- [11.5 Blueprint OTUI (STRICT)](#ch-11-5)
- [11.6 Preset TS (serializer‑ready)](#ch-11-6)
- [11.7 Walidator](#ch-11-7)
- [11.8 Przykłady i edge‑cases](#ch-11-8)

<div id="ch-11-1"></div>
# 11.1 Rola i struktura
**Toolbar** to pasek akcji, zwykle pod `titlebar` lub w `header`. Zawiera grupy przycisków i separatory.

<div id="ch-11-2"></div>
# 11.2 Dozwolone dzieci
Dozwolone: `Button` (akcje/toggle), `UIWidget` jako separator lub ikona. Niedozwolone: listy, edytory, ScrollBary i okna.

<div id="ch-11-3"></div>
# 11.3 Geometria i styl
Wysokość stała (np. 20–24). Anchors lewo‑prawo do rodzica. Tło półprzezroczyste lub obraz motywu. Jednolite odstępy między grupami.

<div id="ch-11-4"></div>
# 11.4 Stany i zdarzenia
Przyciski mogą mieć stany `$on/$!on` (toggle). Zdarzenia `@onClick`. Klawiszowe skróty wiąż w `@onSetup` okna.

<div id="ch-11-5"></div>

# 11.5 Blueprint OTUI (STRICT)
```otui
ToolbarWidget < UIWidget
  id: toolbar
  anchors.left: parent.left
  anchors.right: parent.right
  anchors.top: parent.top
  height: 20

  background-color: #00000044

  Button
    id: action1
    anchors.left: parent.left
    anchors.verticalCenter: parent.verticalCenter
    width: 60
    !text: tr('Action')

  UIWidget
    id: sep1
    anchors.left: action1.right
    anchors.verticalCenter: parent.verticalCenter
    margin-left: 6
    width: 1
    height: 12
    background-color: #ffffff33

  Button
    id: toggle1
    anchors.left: sep1.right
    anchors.verticalCenter: parent.verticalCenter
    margin-left: 6
    width: 60
    !text: tr('Toggle')

    $on:
      background-color: #ffffff22

    $!on:
      background-color: alpha
```

<div id="ch-11-6"></div>

# 11.6 Preset TS (serializer‑ready)
```ts
export function presetToolbar(): WidgetNode {
  return {
    base: 'ToolbarWidget', extends: 'UIWidget',
    geometry: { id: 'toolbar', anchors: { left: 'parent.left', right: 'parent.right', top: 'parent.top' }, height: 20 },
    style: { backgroundColor: '#00000044' },
    children: [
      { base: 'Button', geometry: { id: 'action1', anchors: { left: 'parent.left', verticalCenter: 'parent.verticalCenter' }, width: 60 }, style: { text: 'Action' } },
      { base: 'UIWidget', geometry: { id: 'sep1', anchors: { left: 'action1.right', verticalCenter: 'parent.verticalCenter' }, marginLeft: 6, width: 1, height: 12 }, style: { backgroundColor: '#ffffff33' } },
      { base: 'Button', geometry: { id: 'toggle1', anchors: { left: 'sep1.right', verticalCenter: 'parent.verticalCenter' }, marginLeft: 6, width: 60 }, style: { text: 'Toggle' }, behavior: { states: { on: { backgroundColor: '#ffffff22' }, off: { backgroundColor: 'alpha' } } } }
]
};
}
```

<div id="ch-11-7"></div>

# 11.7 Walidator
❌ Listy/edytory/scroll w Toolbar. ❌ Brak wysokości. ❌ Nieparzyste marginesy lub nierówne szerokości w grupie. ⚠️ Brak skrótów dla akcji o wysokiej częstotliwości.

<div id="ch-11-8"></div>

# 11.8 Przykłady i edge‑cases

Lewa grupa akcji + prawa grupa statusów; wariant kompaktowy 16 px wysokości; tryb toggle dla filtrów danych.

---

# 12. Panel / GroupBox
- [12.1 Rola i struktura](#ch-12-1)
- [12.2 Dozwolone dzieci](#ch-12-2)
- [12.3 Geometria i styl](#ch-12-3)
- [12.4 Stany i zdarzenia](#ch-12-4)
- [12.5 Blueprinty OTUI (STRICT)](#ch-12-5)
- [12.6 Presety TS](#ch-12-6)
- [12.7 Walidator](#ch-12-7)
- [12.8 Przykłady i edge‑cases](#ch-12-8)

<div id="ch-12-1"></div>

# 12.1 Rola i struktura

**Panel** to podstawowy kontener sekcji. **GroupBox** to panel z nagłówkiem i ramką/separatorem.

<div id="ch-12-2"></div>

# 12.2 Dozwolone dzieci

Dozwolone: wszystkie elementy „panelowe” (Label, Button, TextEdit, MultilineTextEdit, TextList, ComboBox, CheckBox, ProgressBar, TabBar, Splitter, VerticalScrollBar, HorizontalSeparator, UIWidget). Niedozwolone: okna (`*Window`).

<div id="ch-12-3"></div>
# 12.3 Geometria i styl
Anchors zgodne z układem rodzica. Marginesy i padding parzyste. Tło transparentne lub obraz/kolor sekcji. GroupBox ma label nagłówka oraz obramowanie lub separator pod tytułem.

<div id="ch-12-4"></div>
# 12.4 Stany i zdarzenia
Zwykle brak stanów na samym Panelu; stany stosuj na dzieciach. Zdarzenia klikalne tylko, jeśli Panel pełni rolę przyciskopodobną.

<div id="ch-12-5"></div>

# 12.5 Blueprinty OTUI (STRICT)

```otui
Panel
  id: panel
  anchors.left: parent.left
  anchors.right: parent.right
  anchors.top: parent.top
  height: 100

  background-color: alpha

  Label
    id: caption
    anchors.left: parent.left
    anchors.top: parent.top
    margin-left: 6
    margin-top: 6
    !text: tr('Panel')
    font: verdana-11px-rounded

  UIWidget
    id: body
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: caption.bottom
    anchors.bottom: parent.bottom
    padding: 6

    background-color: alpha
```

```otui
GroupBox < UIWidget
  id: group
  anchors.left: parent.left
  anchors.right: parent.right
  anchors.top: parent.top
  height: 120

  background-color: alpha

  Label
    id: header
    anchors.left: parent.left
    anchors.top: parent.top
    margin-left: 6
    margin-top: 4
    !text: tr('Group')
    font: verdana-11px-rounded

  UIWidget
    id: separator
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: header.bottom
    margin-top: 4
    height: 1
    background-color: #ffffff33

  UIWidget
    id: content
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: separator.bottom
    anchors.bottom: parent.bottom
    padding: 6

    background-color: alpha
```

<div id="ch-12-6"></div>

# 12.6 Presety TS

```ts
export function presetPanel(): WidgetNode {
  return {
    base: 'Panel',
    geometry: { id: 'panel', anchors: { left: 'parent.left', right: 'parent.right', top: 'parent.top' }, height: 100 },
    style: { backgroundColor: 'alpha' },
    children: [
      { base: 'Label', geometry: { id: 'caption', anchors: { left: 'parent.left', top: 'parent.top' }, marginLeft: 6, marginTop: 6 }, style: { text: 'Panel', font: 'verdana-11px-rounded' } },
      { base: 'UIWidget', geometry: { id: 'body', anchors: { left: 'parent.left', right: 'parent.right', top: 'caption.bottom', bottom: 'parent.bottom' }, padding: 6 }, style: { backgroundColor: 'alpha' } }
]
};
}

export function presetGroupBox(): WidgetNode {
  return {
    base: 'GroupBox', extends: 'UIWidget',
    geometry: { id: 'group', anchors: { left: 'parent.left', right: 'parent.right', top: 'parent.top' }, height: 120 },
    style: { backgroundColor: 'alpha' },
    children: [
      { base: 'Label', geometry: { id: 'header', anchors: { left: 'parent.left', top: 'parent.top' }, marginLeft: 6, marginTop: 4 }, style: { text: 'Group', font: 'verdana-11px-rounded' } },
      { base: 'UIWidget', geometry: { id: 'separator', anchors: { left: 'parent.left', right: 'parent.right', top: 'header.bottom' }, marginTop: 4, height: 1 }, style: { backgroundColor: '#ffffff33' } },
      { base: 'UIWidget', geometry: { id: 'content', anchors: { left: 'parent.left', right: 'parent.right', top: 'separator.bottom', bottom: 'parent.bottom' }, padding: 6 }, style: { backgroundColor: 'alpha' } }
]
};
}
```

<div id="ch-12-7"></div>

# 12.7 Walidator

❌ Okna (`*Window`) jako dzieci. ❌ Brak obszaru treści w GroupBox. ❌ Sprzeczne kotwice. ❌ Brak `tr()` w nagłówkach. ⚠️ Nieparzyste marginesy/padding. ⚠️ Brak auto‑fit przy dokowaniu.

<div id="ch-12-8"></div>

# 12.8 Przykłady i edge‑cases

Panel z formularzem i przyciskami akcji w dolnym rogu; GroupBox z wieloma polami i czytelnym separatorem; warianty z tłem obrazkowym.

---

# 13. TabBar / TabWidget
- [13.1 Rola i struktura](#ch-13-1)
- [13.2 Dozwolone dzieci](#ch-13-2)
- [13.3 Geometria i styl](#ch-13-3)
- [13.4 Stany i zdarzenia](#ch-13-4)
- [13.5 Blueprinty OTUI (STRICT)](#ch-13-5)
- [13.6 Presety TS](#ch-13-6)
- [13.7 Walidator](#ch-13-7)
- [13.8 Przykłady i edge‑cases](#ch-13-8)

<div id="ch-13-1"></div>
# 13.1 Rola i struktura
**TabBar** zawiera przyciski zakładek. **TabWidget** lub dedykowany `UIWidget` jest kontenerem treści zakładki. TabBar i treść są rodzeństwem w drzewie.

<div id="ch-13-2"></div>
# 13.2 Dozwolone dzieci
TabBar: `Button` dla każdej zakładki, ewentualne separatory. Treść zakładki: dowolne elementy panelowe. Niedozwolone: okna w treści, ScrollBar w TabBarze.

<div id="ch-13-3"></div>
# 13.3 Geometria i styl
TabBar u góry, rozciągnięty poziomo. Content poniżej, zakotwiczony do TabBar `top: tabBar.bottom`. Stałe wysokości przycisków.

<div id="ch-13-4"></div>
# 13.4 Stany i zdarzenia
Aktywna zakładka może mieć `$on`. Zdarzenie zmiany zakładki mapowane do kontrolera (np. `TabsController.onTabChange(index)`), ewentualnie `@onClick` na przycisku zakładki.

<div id="ch-13-5"></div>
# 13.5 Blueprinty OTUI (STRICT)

```otui
TabBarWidget < UIWidget
  id: tabBar
  anchors.left: parent.left
  anchors.right: parent.right
  anchors.top: parent.top
  height: 20

  background-color: #00000044

  Button
    id: tab1
    anchors.left: parent.left
    anchors.verticalCenter: parent.verticalCenter
    width: 60
    !text: tr('Tab 1')

    $on:
      background-color: #ffffff22

    $!on:
      background-color: alpha

  Button
    id: tab2
    anchors.left: tab1.right
    anchors.verticalCenter: parent.verticalCenter
    margin-left: 4
    width: 60
    !text: tr('Tab 2')
```

```otui
TabContent < UIWidget
  id: tabContent
  anchors.left: parent.left
  anchors.right: parent.right
  anchors.top: tabBar.bottom
  anchors.bottom: parent.bottom

  background-color: alpha
```

<div id="ch-13-6"></div>

# 13.6 Presety TS

```ts
export function presetTabs(): WidgetNode[] {
  const tabBar: WidgetNode = {
    base: 'TabBarWidget', extends: 'UIWidget',
    geometry: { id: 'tabBar', anchors: { left: 'parent.left', right: 'parent.right', top: 'parent.top' }, height: 20 },
    style: { backgroundColor: '#00000044' },
    children: [
      { base: 'Button', geometry: { id: 'tab1', anchors: { left: 'parent.left', verticalCenter: 'parent.verticalCenter' }, width: 60 }, style: { text: 'Tab 1' }, behavior: { states: { on: { backgroundColor: '#ffffff22' }, off: { backgroundColor: 'alpha' } } } },
      { base: 'Button', geometry: { id: 'tab2', anchors: { left: 'tab1.right', verticalCenter: 'parent.verticalCenter' }, marginLeft: 4, width: 60 }, style: { text: 'Tab 2' } }
]
};
  const content: WidgetNode = {
    base: 'TabContent', extends: 'UIWidget',
    geometry: { id: 'tabContent', anchors: { left: 'parent.left', right: 'parent.right', top: 'tabBar.bottom', bottom: 'parent.bottom' } },
    style: { backgroundColor: 'alpha' }
};
  return [tabBar, content];
}
```

<div id="ch-13-7"></div>

# 13.7 Walidator

❌ Treść upakowana do TabBar zamiast do dedykowanego kontenera. ❌ Brak aktywnej zakładki. ❌ Sprzeczne kotwice. ❌ Brak `tr()` w etykietach. ⚠️ Brak mechanizmu zmiany zakładki w kontrolerze.

<div id="ch-13-8"></div>

# 13.8 Przykłady i edge‑cases

Dwie zakładki z różnymi panelami treści; adaptacja do małej szerokości przez skrótowe etykiety; synchronizacja aktywności z kontrolerem i stanem `$on` na przycisku.

---

# 14. Splitter

- [14.1 Rola i struktura](#ch-14-1)
- [14.2 Dozwolone dzieci](#ch-14-2)
- [14.3 Geometria i styl](#ch-14-3)
- [14.4 Stany i zdarzenia](#ch-14-4)
- [14.5 Blueprinty OTUI (STRICT) – poziomy/pionowy](#ch-14-5)
- [14.6 Presety TS](#ch-14-6)
- [14.7 Walidator](#ch-14-7)
- [14.8 Przykłady i edge‑cases](#ch-14-8)
- [14.9 Splitter — grip i persystencja](#ch-14-9)

<div id="ch-14-1"></div>
# 14.1 Rola i struktura
**Splitter** dzieli obszar na dwie części (panele) z regulowanym podziałem. Stosowany do układów „lista ↔ szczegóły”, „nawigacja ↔ treść”.

<div id="ch-14-2"></div>
# 14.2 Dozwolone dzieci
Dopuszczalne są **dokładnie dwa panele** (np. `UIWidget`/`Panel`). Dodatkowe elementy (np. overlay „grip”) mogą być zastosowane tylko jako **lekki overlay** niebędący panelem (walidator traktuje je osobno).

<div id="ch-14-3"></div>
# 14.3 Geometria i styl
- Wariant **poziomy**: lewy panel kotwiczony do lewej, prawy do prawej; granica pomiędzy panelami.
- Wariant **pionowy**: górny panel do góry, dolny do dołu.
- **Min‑size** paneli: wymagana; zapewnij, by podział nie „zgniatał” dzieci poniżej minimalnych rozmiarów.
- Tło zwykle transparentne; granicę można sygnalizować wąskim paskiem.

<div id="ch-14-4"></div>
# 14.4 Stany i zdarzenia
- Zdarzenia resize i drag „gripa” implementuje kontroler (Lua) lub logika klienta.
- Stany wizualne (hover/drag) można realizować `$focus`/`$on` na panelu/gripie.

<div id="ch-14-5"></div>

# 14.5 Blueprinty OTUI (STRICT) – poziomy/pionowy

**Poziomy (Left/Right)**
```otui
Splitter < UIWidget
  id: split
  anchors.left: parent.left
  anchors.right: parent.right
  anchors.top: parent.top
  anchors.bottom: parent.bottom

  UIWidget
    id: leftPane
    anchors.left: parent.left
    anchors.top: parent.top
    anchors.bottom: parent.bottom
    width: 160

  UIWidget
    id: rightPane
    anchors.left: leftPane.right
    anchors.right: parent.right
    anchors.top: parent.top
    anchors.bottom: parent.bottom
```

**Pionowy (Top/Bottom)**
```otui
Splitter < UIWidget
  id: splitV
  anchors.left: parent.left
  anchors.right: parent.right
  anchors.top: parent.top
  anchors.bottom: parent.bottom

  UIWidget
    id: topPane
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: parent.top
    height: 140

  UIWidget
    id: bottomPane
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: topPane.bottom
    anchors.bottom: parent.bottom
```

<div id="ch-14-6"></div>

# 14.6 Presety TS
```ts
export function presetSplitterHorizontal(): WidgetNode {
  return {
    base: 'Splitter', extends: 'UIWidget',
    geometry: { id: 'split', anchors: { left: 'parent.left', right: 'parent.right', top: 'parent.top', bottom: 'parent.bottom' } },
    children: [
      { base: 'UIWidget', geometry: { id: 'leftPane', anchors: { left: 'parent.left', top: 'parent.top', bottom: 'parent.bottom' }, width: 160 } },
      { base: 'UIWidget', geometry: { id: 'rightPane', anchors: { left: 'leftPane.right', right: 'parent.right', top: 'parent.top', bottom: 'parent.bottom' } } }
]
};
}

export function presetSplitterVertical(): WidgetNode {
  return {
    base: 'Splitter', extends: 'UIWidget',
    geometry: { id: 'splitV', anchors: { left: 'parent.left', right: 'parent.right', top: 'parent.top', bottom: 'parent.bottom' } },
    children: [
      { base: 'UIWidget', geometry: { id: 'topPane', anchors: { left: 'parent.left', right: 'parent.right', top: 'parent.top' }, height: 140 } },
      { base: 'UIWidget', geometry: { id: 'bottomPane', anchors: { left: 'parent.left', right: 'parent.right', top: 'topPane.bottom', bottom: 'parent.bottom' } } }
]
};
}
```

<div id="ch-14-7"></div>

# 14.7 Walidator
❌ ≠2 paneli. ❌ Sprzeczne kotwice (np. oba panele mają sztywne szerokości i jednocześnie rozciągnięcie). ❌ Brak min‑size przy wymaganym „grip” zachowaniu. ⚠️ Brak parzystych marginesów. ⚠️ Brak auto‑fit do rodzica.

<div id="ch-14-8"></div>

# 14.8 Przykłady i edge‑cases
Lewy panel: lista; prawy: szczegóły. Górny: log, dolny: konsola. Zapamiętywanie podziału w ustawieniach modułu (kontroler Lua).

<div id="ch-14-9"></div>

# 14.9 Splitter — grip i persystencja
- **Grip (hitbox)**: zapewnij obszar chwytu o grubości **6–8 px** na granicy paneli (wizualnie 1–2 px linia, reszta transparentny hitbox).
- **Min‑size paneli**: egzekwuj `min-width/min-height` paneli (np. 120 px) — podział nie może ich naruszyć.
- **Tryb klawiatury**: `Ctrl+←/→` (poziomy) lub `Ctrl+↑/↓` (pionowy) do krokowej zmiany podziału (np. 16 px).
- **Persystencja**: zapisuj **ratio** (0..1) lub **px** w ustawieniach modułu i odtwarzaj przy inicjalizacji.
- **Blueprint grip (overlay, STRICT)**:

```otui
UIWidget
  id: grip
  anchors.left: leftPane.right
  anchors.top: parent.top
  anchors.bottom: parent.bottom
  width: 8
  background-color: alpha
```

> `grip` jest **overlayem**, nie trzecim panelem (walidator nie liczy go jako dziecka Splittera).

---

# 15. TextList / ListRow

- [15.1 Rola i struktura](#ch-15-1)
- [15.2 Dozwolone dzieci](#ch-15-2)
- [15.3 Geometria i styl](#ch-15-3)
- [15.4 Scroll pairing](#ch-15-4)
- [15.5 Stany i zdarzenia](#ch-15-5)
- [15.6 Blueprinty OTUI (STRICT)](#ch-15-6)
- [15.7 Presety TS](#ch-15-7)
- [15.8 Walidator](#ch-15-8)
- [15.9 Przykłady i edge‑cases](#ch-15-9)
- [15.10 TextList — nawigacja klawiaturą i ensureVisible](#ch-15-10)

<div id="ch-15-1"></div>
# 15.1 Rola i struktura
**TextList** prezentuje listę pozycji przewijalną w pionie. Wiersze są reprezentowane jako lekkie `UIWidget` (np. `ListRow`) osadzane w kontenerze listy.

<div id="ch-15-2"></div>
# 15.2 Dozwolone dzieci
Wewnątrz listy: tylko wiersze (`UIWidget`/custom row). Zakazane: okna, ScrollBar jako dziecko (ScrollBar jest **siblingiem** listy).

<div id="ch-15-3"></div>

# 15.3 Geometria i styl

- Listę kotwicz do dostępnego obszaru (`anchors.fill: parent` lub do `scroll.left`).
- Wysokość wiersza min. ~14 px (zalecenie) dla czytelności.
- Podświetlenie wiersza przez stany (`$focus`/`$on`) lub kolory tła.

<div id="ch-15-4"></div>

# 15.4 Scroll pairing

**VerticalScrollBar** jest **siblingiem**: dokowany po prawej; lista kotwiczy `right: scroll.left`. `step` powinien odpowiadać wysokości wiersza.

<div id="ch-15-5"></div>

# 15.5 Stany i zdarzenia
- Zdarzenia: `@onClick` na wiersz (zaznaczenie), opcjonalny `@onSetup` do bindów strzałek/PageUp/Down.
- Fokus: po otwarciu ustaw na listę lub pierwszy wiersz; upewnij się, że wybrany wiersz jest widoczny (logika kontrolera).

<div id="ch-15-6"></div>

# 15.6 Blueprinty OTUI (STRICT)

**Lista ze scrollem**
```otui
UIWidget
  id: listContainer
  anchors.left: parent.left
  anchors.right: scroll.left
  anchors.top: parent.top
  anchors.bottom: parent.bottom

  TextList
    id: items
    anchors.fill: parent
```

**Scroll**
```otui
VerticalScrollBar
  id: scroll
  anchors.right: parent.right
  anchors.top: parent.top
  anchors.bottom: parent.bottom
  step: 16
```

**Wiersz listy (uniwersalny)**
```otui
ListRow < UIWidget
  id: row
  height: 16

  Label
    id: caption
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.verticalCenter: parent.verticalCenter
    margin-left: 4
    text-auto-resize: true
    !text: tr('Item')
    font: verdana-11px-monochrome

  $focus:
    background-color: #ffffff11

  $on:
    background-color: #ffffff22
```

<div id="ch-15-7"></div>

# 15.7 Presety TS
```ts
export function presetTextListWithScroll(): WidgetNode[] {
  const listContainer: WidgetNode = {
    base: 'UIWidget',
    geometry: { id: 'listContainer', anchors: { left: 'parent.left', right: 'scroll.left', top: 'parent.top', bottom: 'parent.bottom' } },
    children: [
      { base: 'TextList', geometry: { id: 'items', anchors: { fill: 'parent' } } }
]
};
  const scroll: WidgetNode = {
    base: 'VerticalScrollBar',
    geometry: { id: 'scroll', anchors: { right: 'parent.right', top: 'parent.top', bottom: 'parent.bottom' } },
    behavior: { props: { step: 16 } }
};
  return [listContainer, scroll];
}

export function presetListRow(): WidgetNode {
  return {
    base: 'ListRow', extends: 'UIWidget',
    geometry: { id: 'row', height: 16 },
    children: [
      { base: 'Label', geometry: { id: 'caption', anchors: { left: 'parent.left', right: 'parent.right', verticalCenter: 'parent.verticalCenter' }, marginLeft: 4 }, style: { textAutoResize: true, text: 'Item', font: 'verdana-11px-monochrome' } }
],
    behavior: { states: { focus: { backgroundColor: '#ffffff11' }, on: { backgroundColor: '#ffffff22' } } }
};
}
```

<div id="ch-15-8"></div>

# 15.8 Walidator

❌ ScrollBar jako dziecko listy. ❌ Lista bez pary scrolla przy overflow lub błędne kotwice pary. ❌ `tr()` pominięte w etykietach. ⚠️ Zbyt mała wysokość wiersza (nieczytelność). ⚠️ Brak bindów klawiatury.

<div id="ch-15-9"></div>

# 15.9 Przykłady i edge‑cases

Lista postaci (row = imię + poziom), lista logów (row z ikoną i timestampem). „Ensure visible” przy zmianie wyboru. Paging klawiaturą (PageUp/Down).

<div id="ch-15-10"></div>

# 15.10 TextList — nawigacja klawiaturą i ensureVisible

- **Strzałki**: ↑/↓ wybór sąsiedniego wiersza.
- **PageUp/Down**: skok o `pageSize` (wysokość kontenera / wysokość wiersza).
- **Home/End**: pierwszy/ostatni wiersz.
- **Enter/Escape**: potwierdzenie/anulowanie zgodnie z logiką okna.
- **ensureVisible**: po zmianie wyboru kontroler przewija listę tak, by wybrany wiersz był w pełni widoczny.
- **Multi‑select (opcjonalnie)**: `Shift` = zakres, `Ctrl` = pojedyncze przełączanie — tylko jeśli projekt to wymaga; w `.otui` bez zmian, logika w kontrolerze.

---

# 16. Label / UILabel

- [16.1 Rola i struktura](#ch-16-1)
- [16.2 Właściwości tekstu](#ch-16-2)
- [16.3 Geometria i styl](#ch-16-3)
- [16.4 Stany i zdarzenia](#ch-16-4)
- [16.5 Blueprinty OTUI (STRICT)](#ch-16-5)
- [16.6 Presety TS](#ch-16-6)
- [16.7 Walidator](#ch-16-7)
- [16.8 Przykłady i edge‑cases](#ch-16-8)
- [16.9 Label — pomiar tekstu, elipsyzacja, DPI/scale](#ch-16-9)

<div id="ch-16-1"></div>

# 16.1 Rola i struktura

**Label/UILabel** to nieinteraktywny element tekstowy do podpisów, tytułów i statusów. `UILabel` może służyć jako wariant nazwowy z gotowym stylem; oba mają te same podstawowe właściwości tekstowe.

<div id="ch-16-2"></div>

# 16.2 Właściwości tekstu

- `!text: tr('...')` — jedyne dozwolone źródło stałych napisów (STRICT).
- `text-wrap: true|false` — zawijanie.
- `text-auto-resize: true|false` — dopasowanie do treści.
- `text-align: left|center|right` — wyrównanie.
- `text-offset: X Y` — przesunięcie.
- `font: <nazwa>` — z `data/fonts/`.
- `color: #AARRGGBB`.

<div id="ch-16-3"></div>

# 16.3 Geometria i styl

- Anchors do rodzica lub sąsiadów; często `anchors.left/right: parent` przy statusach.
- Używaj parzystych marginesów (snapping 2 px).
- Tło zwykle `alpha`.

<div id="ch-16-4"></div>

# 16.4 Stany i zdarzenia

- Label nie jest klikany; zdarzenia zwykle pomijamy.
- Stany `$on/$!on/$focus` możesz wykorzystać do zmiany koloru lub wyeksponowania (np. błędy/ostrzeżenia), nie geometrii.

<div id="ch-16-5"></div>

# 16.5 Blueprinty OTUI (STRICT)

**Nagłówek sekcji**
```otui
Label
  id: header
  anchors.left: parent.left
  anchors.right: parent.right
  text-auto-resize: true
  !text: tr('Section')
  font: verdana-11px-rounded
```

**Status wielowierszowy**
```otui
Label
  id: status
  anchors.left: parent.left
  anchors.right: parent.right
  text-wrap: true
  !text: tr('This is a long message that can wrap.')
  font: verdana-11px-monochrome
```

<div id="ch-16-6"></div>

# 16.6 Presety TS
```ts
export function presetLabelHeader(): WidgetNode {
  return {
    base: 'Label',
    geometry: { id: 'header', anchors: { left: 'parent.left', right: 'parent.right' } },
    style: { textAutoResize: true, text: 'Section', font: 'verdana-11px-rounded' }
};
}

export function presetLabelStatus(): WidgetNode {
  return {
    base: 'Label',
    geometry: { id: 'status', anchors: { left: 'parent.left', right: 'parent.right' } },
    style: { textWrap: true, text: 'This is a long message that can wrap.', font: 'verdana-11px-monochrome' }
};
}
```

<div id="ch-16-7"></div>

# 16.7 Walidator

❌ Brak `tr()` w `!text`. ❌ Zasoby fontu spoza `data/`. ⚠️ Nieparzyste marginesy. ⚠️ Nadużywanie `text-auto-resize` przy wąskich układach (ryzyko overflow).

<div id="ch-16-8"></div>

# 16.8 Przykłady i edge‑cases

Nagłówki w `titlebar` i w treści; statusy z `text-wrap: true`; komunikaty ostrzegawcze kolorem w `$on`.

<div id="ch-16-9"></div>

# 16.9 Label — pomiar tekstu, elipsyzacja, DPI/scale
- **Pomiar**: unikaj twardych szerokości dla długich etykiet; preferuj `text-wrap: true` lub `text-auto-resize: true` (gdy bezpieczne).
- **Elipsyzacja**: stosuj tylko przy stałych szerokościach; zapewnij tooltip z pełnym tekstem (kontroler).
- **DPI/Scale**: testuj metryki fontu (line-height, kerning) w skalach 1.0/1.25/1.5; utrzymuj snapping 2 px.

---

# 17. Button

- [17.1 Rola i struktura](#ch-17-1)
- [17.2 Właściwości i minimalne rozmiary](#ch-17-2)
- [17.3 Geometria i styl](#ch-17-3)
- [17.4 Stany i zdarzenia](#ch-17-4)
- [17.5 Blueprinty OTUI (STRICT)](#ch-17-5)
- [17.6 Presety TS](#ch-17-6)
- [17.7 Walidator](#ch-17-7)
- [17.8 Przykłady i edge‑cases](#ch-17-8)
- [17.9 Button — hover/disabled i dostępność](#ch-17-9)

<div id="ch-17-1"></div>

# 17.1 Rola i struktura

**Button** wyzwala akcje (`@onClick`). Może działać jako chwilowy przycisk, przełącznik (toggle) lub przycisk paskowy (tytuł/toolbar). Zwykle bez dzieci — tekst ustawiany bezpośrednio przez `!text`.

<div id="ch-17-2"></div>

# 17.2 Właściwości i minimalne rozmiary

- `!text: tr('...')` — etykieta.
- Zalecane minimum rozmiaru: **≥16×16** (kompakt) lub szersze dla etykiet tekstowych (np. 60–72 px).
- Opcjonalnie `font`, `color`, `background-color`.

<div id="ch-17-3"></div>

# 17.3 Geometria i styl

- Kotwice do krawędzi rodzica lub sąsiadów (często do prawej w `footer`/`titlebar`).
- Parzyste marginesy; wysokości zgodne ze stylem paska (np. 20 px w titlebar/toolbar).
- Tekst przez `!text` (STRICT), bez wewnętrznego `Label`.

<div id="ch-17-4"></div>

# 17.4 Stany i zdarzenia

- `@onClick: Controller.fn()` — podstawowe zdarzenie.
- `$on/$!on` — dla trybu **toggle** (zmiana tła/koloru/napisu).
- `$focus` — podświetlenie przy fokusie klawiatury.
- Skróty klawiszowe mapuj w `@onSetup` okna lub w Lua.

<div id="ch-17-5"></div>

# 17.5 Blueprinty OTUI (STRICT)

**Standardowy przycisk**
```otui
Button
  id: ok
  width: 64
  !text: tr('Ok')
```

**Toggle (On/Off)**
```otui
Button
  id: toggle
  width: 72
  !text: tr('Off')

  $on:
    !text: tr('On')
    background-color: #ffffff22

  $!on:
    !text: tr('Off')
    background-color: alpha
```

**Ikonowy (tytuł/toolbar)**
```otui
Button
  id: closeBtn
  width: 16
  !text: tr('x')
```

<div id="ch-17-6"></div>

# 17.6 Presety TS
```ts
export function presetButton(label = 'Ok', id = 'ok', width = 64): WidgetNode {
  return {
    base: 'Button',
    geometry: { id, width },
    style: { text: label }
};
}

export function presetToggle(labelOff = 'Off', labelOn = 'On', id = 'toggle', width = 72): WidgetNode {
  return {
    base: 'Button',
    geometry: { id, width },
    style: { text: labelOff },
    behavior: { states: { on: { text: labelOn, backgroundColor: '#ffffff22' }, off: { text: labelOff, backgroundColor: 'alpha' } } }
};
}
```

<div id="ch-17-7"></div>

# 17.7 Walidator
❌ Brak `tr()` w etykiecie. ❌ Zbyt mały rozmiar (mniej niż 16×16). ❌ Wewnętrzne dzieci (Label) zamiast `!text`. ⚠️ Niespójne szerokości w grupie. ⚠️ Brak skrótów dla akcji często używanych.

<div id="ch-17-8"></div>

# 17.8 Przykłady i edge‑cases

Przyciski OK/Cancel w `footer`; ikonowe 16 px w `titlebar`; toggle dla filtrów narzędzi. Zmiana etykiety w `$on/$!on` bez modyfikacji geometrii.

<div id="ch-17-9"></div>

# 17.9 Button — hover/disabled i dostępność
- **$hover**: feedback najechania (kolor/tło), bez zmiany geometrii.
- **$disabled**: pełna nieinteraktywność; zachowaj kontrast etykiety ≥ WCAG AA.
- **Hitbox**: min. **16×16**; dla tekstowych szerokość wg etykiety (≥60 px).
- **Skróty**: najczęstsze akcje zbinduj w `@onSetup`.

**Przykład (STRICT)**
```otui
Button
  id: action
  width: 64
  !text: tr('Run')

  $hover:
    background-color: #ffffff11

  $disabled:
    color: #ffffff66
    background-color: alpha
```

---

# 18. CheckBox
- [18.1 Rola i struktura](#ch-18-1)
- [18.2 Właściwości](#ch-18-2)
- [18.3 Geometria i styl](#ch-18-3)
- [18.4 Stany i zdarzenia](#ch-18-4)
- [18.5 Blueprinty OTUI (STRICT)](#ch-18-5)
- [18.6 Presety TS](#ch-18-6)
- [18.7 Walidator](#ch-18-7)
- [18.8 Przykłady i edge‑cases](#ch-18-8)
- [18.9 CheckBox — tri‑state i offset etykiety](#ch-18-9)

<div id="ch-18-1"></div>

# 18.1 Rola i struktura
**CheckBox** to przełącznik boolean z wbudowaną etykietą tekstową po prawej. Nie posiada dzieci. Wariant **RoundCheckBox** to styl okrągły.

<div id="ch-18-2"></div>

# 18.2 Właściwości
- `!text: tr('...')` — etykieta.
- `text-align`, `text-offset` — pozycjonowanie tekstu względem pola.
- `image-source`, `image-rect`/`image-clip`, `image-color` — grafika stanu.
- `cursor`, `change-cursor-image` — zachowanie kursora.
- `enabled: true|false` — stan dostępności.

<div id="ch-18-3"></div>

# 18.3 Geometria i styl
- Typowy rozmiar pola: **16×16**; etykieta po prawej poprzez `text-offset` (np. `18 1`).
- Kotwice do układu rodzica; parzyste marginesy.
- Kolory/obrazy zgodnie z motywem.

<div id="ch-18-4"></div>

# 18.4 Stany i zdarzenia
- Stany: `$checked`, `$!checked`, `$hover`, `$disabled` (możliwe kombinacje, np. `$hover !disabled`).
- Zdarzenia: `@onClick` → przełączanie stanu; skrót klawiszowy mapuj w `@onSetup` lub Lua.

<div id="ch-18-5"></div>

# 18.5 Blueprinty OTUI (STRICT)
**Kwadratowy CheckBox**
```otui
CheckBox < UICheckBox
  id: accept
  size: 16 16
  text-align: left
  text-offset: 18 1
  !text: tr('Accept')
  color: #dfdfdf
  image-color: #dfdfdfff
  image-rect: 0 0 15 15
  image-source: /images/ui/checkbox
  change-cursor-image: true
  cursor: pointer

  $hover !disabled:
    color: #ffffff

  $checked:
    color: #ffffff

  $disabled:
    color: #dfdfdf88
    image-color: #dfdfdf88
```

**RoundCheckBox (okrągły)**
```otui
RoundCheckBox < CheckBox
  id: rcheck
  image-source: /images/ui/checkbox_round

  $first:
    margin-top: 2

  $!first:
    margin-top: 5
```

<div id="ch-18-6"></div>

# 18.6 Presety TS
```ts
export function presetCheckBox(id = 'accept', label = 'Accept'): WidgetNode {
  return {
    base: 'CheckBox', extends: 'UICheckBox',
    geometry: { id, size: [16,16] },
    style: { textAlign: 'left', textOffset: [18,1], text: label, color: '#dfdfdf', imageColor: '#dfdfdfff', imageRect: [0,0,15,15], imageSource: '/images/ui/checkbox', cursor: 'pointer', changeCursorImage: true }
};
}

export function presetRoundCheckBox(id = 'rcheck', label = 'Option'): WidgetNode {
  return {
    base: 'RoundCheckBox', extends: 'CheckBox',
    geometry: { id, size: [16,16] },
    style: { textAlign: 'left', textOffset: [18,1], text: label, imageSource: '/images/ui/checkbox_round' }
};
}
```

<div id="ch-18-7"></div>

# 18.7 Walidator
❌ Dzieci wewnątrz CheckBox. ❌ Brak `tr()` w etykiecie. ❌ Zbyt mały rozmiar pola (<16×16). ❌ Niespójne kotwice. ⚠️ Brak kursora „pointer”. ⚠️ Nieparzyste marginesy/offset.

<div id="ch-18-8"></div>

# 18.8 Przykłady i edge‑cases
Listy opcji w Panel/GroupBox; pierwszy element z mniejszym marginesem górnym (`$first`). Tryb globalnego włączania/wyłączania grupy kontrolek.

<div id="ch-18-9"></div>

# 18.9 CheckBox — tri‑state i offset etykiety
- **Tri‑state (opcjonalnie)**: jeżeli projekt wymaga stanu „nieokreślony”, zdefiniuj stan logiczny (np. `$indeterminate`) i nadaj mu własną ikonę/tło; przełączanie cykliczne: `unchecked → checked → indeterminate`.
- **Offset etykiety**: utrzymuj `text-offset` tak, by tekst nie nachodził na pole (np. ≥18 px przy polu 16×16).

**Przykład (STRICT)**

```otui
CheckBox
  id: opt
  size: 16 16
  text-offset: 18 1
  !text: tr('Option')

  $indeterminate:
    image-source: /images/ui/checkbox_indet
```

---

# 19. TextEdit / PasswordTextEdit / MultilineTextEdit
- [19.1 Rola i struktura](#ch-19-1)
- [19.2 Właściwości tekstowe](#ch-19-2)
- [19.3 Geometria i styl](#ch-19-3)
- [19.4 Scroll pairing (Multiline)](#ch-19-4)
- [19.5 Stany i zdarzenia](#ch-19-5)
- [19.6 Blueprinty OTUI (STRICT)](#ch-19-6)
- [19.7 Presety TS](#ch-19-7)
- [19.8 Walidator](#ch-19-8)
- [19.9 Przykłady i edge‑cases](#ch-19-9)
- [19.10 TextEdit/Multiline — IME, paste i filtry wejścia](#ch-19-10)
- [19.11 Multiline — zaznaczenie, line‑height i pixels‑scroll](#ch-19-11)

<div id="ch-19-1"></div>

# 19.1 Rola i struktura
- **TextEdit** — jedno‑wierszowe pole tekstowe.
- **PasswordTextEdit** — jak TextEdit, ale treść maskowana.
- **MultilineTextEdit** — wielowierszowe z obsługą zawijania i przewijania.

<div id="ch-19-2"></div>

# 19.2 Właściwości tekstowe
- `placeholder: '...'` oraz `placeholder-color: #AARRGGBB` — tekst i kolor placeholdera.
- `text-wrap: true|false` — zawijanie (dot. Multiline).
- `font`, `color` — styl tekstu.

<div id="ch-19-3"></div>

# 19.3 Geometria i styl

- Kotwicz do dostępnego obszaru; przy Multiline: zapewnij wysokość i padding.
- Parzyste marginesy; tło transparentne lub panelowe.

<div id="ch-19-4"></div>

# 19.4 Scroll pairing (Multiline)

- **VerticalScrollBar** jako **sibling**.
- W Multiline ustaw: `vertical-scrollbar: <idScrolla>`.
- Kotwice: Multiline `left/top/bottom` do parenta, `right` do `scroll.left`; Scroll `right/top/bottom` do parenta.
- `step` scrolla dopasuj do wysokości wiersza (np. 16) i użyj `pixels-scroll: true` gdy wymagane.

<div id="ch-19-5"></div>

# 19.5 Stany i zdarzenia

- `@onEnter` (zatwierdzenie w TextEdit), `@onEscape` (anulowanie), `@onSetup` (bindy).
- Fokus klawiatury na wejściu; kontroler może zarządzać przełączaniem fokusu.

<div id="ch-19-6"></div>

# 19.6 Blueprinty OTUI (STRICT)

**TextEdit (placeholder)**
```otui
TextEdit
  id: name
  anchors.left: parent.left
  anchors.right: parent.right
  height: 20
  placeholder: Name
  placeholder-color: #00000077
  font: verdana-11px-monochrome
```

**PasswordTextEdit**
```otui
PasswordTextEdit
  id: password
  anchors.left: parent.left
  anchors.right: parent.right
  height: 20
  placeholder: Password
  placeholder-color: #00000077
  font: verdana-11px-monochrome
```

**MultilineTextEdit + VerticalScrollBar**
```otui
MultilineTextEdit
  id: text
  anchors.top: scroll.top
  anchors.left: parent.left
  anchors.right: scroll.left
  anchors.bottom: scroll.bottom
  vertical-scrollbar: scroll
  text-wrap: true

VerticalScrollBar
  id: scroll
  anchors.top: parent.top
  anchors.bottom: parent.bottom
  anchors.right: parent.right
  step: 16
  pixels-scroll: true
```

<div id="ch-19-7"></div>

# 19.7 Presety TS
```ts
export function presetTextEdit(id = 'name', placeholder = 'Name'): WidgetNode {
  return {
    base: 'TextEdit',
    geometry: { id, anchors: { left: 'parent.left', right: 'parent.right' }, height: 20 },
    style: { placeholder, placeholderColor: '#00000077', font: 'verdana-11px-monochrome' }
};
}

export function presetPasswordEdit(id = 'password', placeholder = 'Password'): WidgetNode {
  return {
    base: 'PasswordTextEdit',
    geometry: { id, anchors: { left: 'parent.left', right: 'parent.right' }, height: 20 },
    style: { placeholder, placeholderColor: '#00000077', font: 'verdana-11px-monochrome' }
};
}

export function presetMultilineWithScroll(idText = 'text', idScroll = 'scroll'): WidgetNode[] {
  const text: WidgetNode = {
    base: 'MultilineTextEdit',
    geometry: { id: idText, anchors: { top: `${idScroll}.top`, left: 'parent.left', right: `${idScroll}.left`, bottom: `${idScroll}.bottom` } },
    style: { textWrap: true },
    behavior: { props: { verticalScrollbar: idScroll } }
};
  const scroll: WidgetNode = {
    base: 'VerticalScrollBar',
    geometry: { id: idScroll, anchors: { top: 'parent.top', bottom: 'parent.bottom', right: 'parent.right' } },
    behavior: { props: { step: 16, pixelsScroll: true } }
};
  return [text, scroll];
}
```

<div id="ch-19-8"></div>

# 19.8 Walidator
❌ `vertical-scrollbar` wskazuje nieistniejący `id`. ❌ ScrollBar jako dziecko MultilineTextEdit. ❌ Sprzeczne kotwice (fill + krawędzie). ❌ Brak placeholdera tam, gdzie wymagany UX‑owo. ⚠️ Zbyt mała wysokość w Multiline. ⚠️ Brak `pixels-scroll` dla precyzyjnego przewijania.

<div id="ch-19-9"></div>

# 19.9 Przykłady i edge‑cases
Pole loginu z placeholderem i Password z maskowaniem; edytor logów z Multiline + scroll i `text-wrap: true`; walidacja Enter/Escape w kontrolerze.

<div id="ch-19-10"></div>

# 19.10 TextEdit/Multiline — IME, paste i filtry wejścia
- **IME**: pola powinny poprawnie akceptować kompozycję IME; nie nadpisuj w kontrolerze zdarzeń, które przerywają kompozycję.
- **Paste**: obsłuż `Ctrl+V`/`Shift+Insert`; opcjonalne czyszczenie wklejanego tekstu (np. biała lista znaków).
- **Filtry**: waliduj w kontrolerze (regex, max długość) — bez modyfikowania `.otui`.

<div id="ch-19-11"></div>

# 19.11 Multiline — zaznaczenie, line‑height i pixels‑scroll
- **Selection**: zapewnij widoczny kolor zaznaczenia zgodny z motywem.
- **Line‑height**: dopasuj przewijanie do metryk fontu; `step` scrollbar'a ≈ wysokość linii (np. 16).
- **pixels‑scroll**: włącz dla precyzyjnych edytorów (logi/kod) — płynne przewijanie bez „skoków”.

---

# 20. ComboBox

- [20.1 Rola i struktura](#ch-20-1)
- [20.2 Właściwości i menu](#ch-20-2)
- [20.3 Geometria i styl](#ch-20-3)
- [20.4 Zdarzenia i stany](#ch-20-4)
- [20.5 Blueprint OTUI (STRICT)](#ch-20-5)
- [20.6 Presety TS](#ch-20-6)
- [20.7 Walidator](#ch-20-7)
- [20.8 Przykłady i edge‑cases](#ch-20-8)

<div id="ch-20-1"></div>

# 20.1 Rola i struktura

**ComboBox** to selektor pojedynczej opcji. Posiada **wewnętrzne menu** (lista opcji) zarządzane przez klienta — **nie dodawaj** ręcznie dzieci w `.otui`.

<div id="ch-20-2"></div>

# 20.2 Właściwości i menu

- `current-index: N` lub `current-text: '...'` — wybrana pozycja (jedno źródło prawdy w czasie eksportu).
- `menu-height: H` — maksymalna wysokość rozwiniętego menu (px).
- `menu-scroll-step: S` — krok przewijania menu (px).
- `placeholder: '...'` — tekst gdy nic nie wybrano.
- Teksty opcji przechodzą przez mechanizm tłumaczeń na poziomie logiki (nie dodawaj jako dzieci w OTUI).

<div id="ch-20-3"></div>

# 20.3 Geometria i styl

- Szerokość stała lub `anchors.left/right: parent`.
- Minimalna wysokość ~20 px.
- Tło zgodne z motywem; strzałka rozwijania po prawej (render klienta/skinu).

<div id="ch-20-4"></div>

# 20.4 Zdarzenia i stany

- `@onOptionChange: Controller.fn(index, text)` — zmiana wyboru.
- `$focus` — podświetlenie fokusowanej kontrolki.
- `$disabled` — wygląd nieaktywny.

<div id="ch-20-5"></div>

# 20.5 Blueprint OTUI (STRICT)

```otui
ComboBox
  id: combo
  anchors.left: parent.left
  anchors.right: parent.right
  height: 20
  placeholder: Select
  menu-height: 120
  menu-scroll-step: 16

  @onOptionChange: ComboController.onChange(index, text)
```

<div id="ch-20-6"></div>

# 20.6 Presety TS

```ts
export function presetComboBox(id = 'combo', placeholder = 'Select'): WidgetNode {
  return {
    base: 'ComboBox',
    geometry: { id, anchors: { left: 'parent.left', right: 'parent.right' }, height: 20 },
    style: { placeholder, menuHeight: 120, menuScrollStep: 16 },
    behavior: { events: { onOptionChange: 'ComboController.onChange(index, text)' } }
};
}
```

<div id="ch-20-7"></div>

# 20.7 Walidator

❌ Dzieci „opcji” dodane ręcznie do ComboBox w `.otui`. ❌ Sprzeczne kotwice (`fill` + krawędzie). ❌ Brak wysokości. ⚠️ `menu-height` zbyt małe dla przewijania. ⚠️ Brak mapowania `onOptionChange` w projekcie.

<div id="ch-20-8"></div>

# 20.8 Przykłady i edge‑cases

Selektor postaci; filtr w narzędziowym MiniWindow; zmiana dostępności (`$disabled`) przy braku danych; placeholder gdy brak wyboru.

---

# 21. ProgressBar
- [21.1 Rola i zakres](#ch-21-1)
- [21.2 Właściwości i styl](#ch-21-2)
- [21.3 Geometria](#ch-21-3)
- [21.4 Blueprint OTUI (STRICT)](#ch-21-4)
- [21.5 Presety TS](#ch-21-5)
- [21.6 Walidator](#ch-21-6)
- [21.7 Przykłady i edge‑cases](#ch-21-7)

<div id="ch-21-1"></div>

# 21.1 Rola i zakres
**ProgressBar** prezentuje postęp w zakresie. **Nie** posiada dzieci — jeśli potrzebujesz opisu, użyj zewnętrznego `Label`.

<div id="ch-21-2"></div>

# 21.2 Właściwości i styl
- `minimum: 0`, `maximum: 100`, `value: 0..100`.
- Warianty skórek: kolor tła i wypełnienia; opcjonalne „gradienty” (jeśli motyw wspiera).
- Możliwy tryb indeterminate (projektowy) — sygnalizowany animacją po stronie klienta.

<div id="ch-21-3"></div>

# 21.3 Geometria
- Kotwicz w poziomie do rodzica; wysokość ~14–18 px.
- Parzyste marginesy; zachowaj min‑width dla czytelności.

<div id="ch-21-4"></div>

# 21.4 Blueprint OTUI (STRICT)
```otui
ProgressBar
  id: progress
  anchors.left: parent.left
  anchors.right: parent.right
  height: 16
  minimum: 0
  maximum: 100
  value: 0
```

<div id="ch-21-5"></div>

# 21.5 Presety TS
```ts
export function presetProgressBar(id = 'progress', min = 0, max = 100, value = 0): WidgetNode {
  return {
    base: 'ProgressBar',
    geometry: { id, anchors: { left: 'parent.left', right: 'parent.right' }, height: 16 },
    behavior: { props: { minimum: min, maximum: max, value } }
};
}
```

<div id="ch-21-6"></div>

# 21.6 Walidator
❌ Dzieci wewnątrz ProgressBar. ❌ `value` poza zakresem `minimum..maximum`. ⚠️ Zbyt mała wysokość. ⚠️ Brak kotwic w poziomie (słaba czytelność).

<div id="ch-21-7"></div>

# 21.7 Przykłady i edge‑cases
Status w `StaticMainWindow`; pasek ładowania w panelu z etykietą obok (`Label`). Tryb „nieokreślony” w overlay statusu.


---

# 22. ScrollBar (Vertical/Horizontal)
- [22.1 Rola i parowanie](#ch-22-1)
- [22.2 Właściwości](#ch-22-2)
- [22.3 Geometria i dokowanie](#ch-22-3)
- [22.4 Blueprinty OTUI (STRICT)](#ch-22-4)
- [22.5 Presety TS](#ch-22-5)
- [22.6 Walidator](#ch-22-6)
- [22.7 Przykłady i edge‑cases](#ch-22-7)

<div id="ch-22-1"></div>

# 22.1 Rola i parowanie

**ScrollBar** jest **rodzeństwem** przewijanej treści (lista/Multiline). Parowany poprzez dokowanie i kotwice treści do krawędzi scrolla.

<div id="ch-22-2"></div>

# 22.2 Właściwości

- `step: N` — skok przewijania (px, dostosuj do wysokości wiersza/slotu).
- `pixels-scroll: true|false` — tryb przewijania pikselowego.
- (Opcj.) `minimum/maximum/value` — gdy scroll sterowany programowo (projektowo).

<div id="ch-22-3"></div>

# 22.3 Geometria i dokowanie

- **Vertical**: `anchors.right/top/bottom: parent`; przewijana treść: `right: scroll.left`.
- **Horizontal**: `anchors.left/right/bottom: parent`; przewijana treść: `bottom: hscroll.top`.
- Szerokość (V) ~12–16 px; wysokość (H) ~12–16 px. Parzyste marginesy.

<div id="ch-22-4"></div>

# 22.4 Blueprinty OTUI (STRICT)

**VerticalScrollBar**
```otui
VerticalScrollBar
  id: scroll
  anchors.right: parent.right
  anchors.top: parent.top
  anchors.bottom: parent.bottom
  step: 16
  pixels-scroll: true
```

**HorizontalScrollBar**
```otui
HorizontalScrollBar
  id: hscroll
  anchors.left: parent.left
  anchors.right: parent.right
  anchors.bottom: parent.bottom
  step: 16
  pixels-scroll: true
```

<div id="ch-22-5"></div>

# 22.5 Presety TS
```ts
export function presetVScroll(id = 'scroll', step = 16, pixels = true): WidgetNode {
  return {
    base: 'VerticalScrollBar',
    geometry: { id, anchors: { right: 'parent.right', top: 'parent.top', bottom: 'parent.bottom' } },
    behavior: { props: { step, pixelsScroll: pixels } }
};
}

export function presetHScroll(id = 'hscroll', step = 16, pixels = true): WidgetNode {
  return {
    base: 'HorizontalScrollBar',
    geometry: { id, anchors: { left: 'parent.left', right: 'parent.right', bottom: 'parent.bottom' } },
    behavior: { props: { step, pixelsScroll: pixels } }
};
}
```

<div id="ch-22-6"></div>

# 22.6 Walidator
❌ ScrollBar jako dziecko listy/Multiline. ❌ Brak parowania (treść nie kotwiczy się do scrolla). ❌ `step` niedopasowany do rozmiaru wiersza (szarpane przewijanie). ⚠️ Brak `pixels-scroll` przy drobnym tekście.

<div id="ch-22-7"></div>

# 22.7 Przykłady i edge‑cases

Lista z wierszem 18 px → `step: 18`; edytor tekstu z delikatnym przewijaniem (`pixels-scroll: true`); układ podwójny (V+H) w panelu z danymi tabelarycznymi.

---

# 23. HorizontalSeparator

- [23.1 Rola i ograniczenia](#ch-23-1)
- [23.2 Geometria i styl](#ch-23-2)
- [23.3 Blueprint OTUI (STRICT)](#ch-23-3)
- [23.4 Preset TS](#ch-23-4)
- [23.5 Walidator](#ch-23-5)
- [23.6 Przykłady i edge‑cases](#ch-23-6)

<div id="ch-23-1"></div>

# 23.1 Rola i ograniczenia

**HorizontalSeparator** to cienka linia dzieląca sekcje. **Nie posiada dzieci** i nie jest interaktywny.

<div id="ch-23-2"></div>

# 23.2 Geometria i styl

- Kotwice: najczęściej `left/right: parent`, wysokość `1` lub `2` px.
- Marginesy: parzyste `margin-top/bottom` dla rytmu layoutu.
- Styl: `background-color` (przezroczystość mile widziana).

<div id="ch-23-3"></div>

# 23.3 Blueprint OTUI (STRICT)
```otui
HorizontalSeparator
  id: sep
  anchors.left: parent.left
  anchors.right: parent.right
  height: 1
  background-color: #ffffff33
```

<div id="ch-23-4"></div>

# 23.4 Preset TS
```ts
export function presetHorizontalSeparator(id = 'sep', height = 1): WidgetNode {
  return {
    base: 'HorizontalSeparator',
    geometry: { id, anchors: { left: 'parent.left', right: 'parent.right' }, height },
    style: { backgroundColor: '#ffffff33' }
};
}
```

<div id="ch-23-5"></div>

# 23.5 Walidator

❌ Dzieci w separatorze. ⚠️ Wysokość > 2 px bez uzasadnienia stylistycznego. ⚠️ Nieparzyste marginesy.

<div id="ch-23-6"></div>

# 23.6 Przykłady i edge‑cases

Separator pod nagłówkiem GroupBox; cienka linia w Toolbarze między grupami akcji.

---

# 24. StatusOverlay
- [24.1 Rola i struktura](#ch-24-1)
- [24.2 Geometria i styl](#ch-24-2)
- [24.3 Stany i zdarzenia](#ch-24-3)
- [24.4 Blueprint OTUI (STRICT)](#ch-24-4)
- [24.5 Preset TS](#ch-24-5)
- [24.6 Walidator](#ch-24-6)
- [24.7 Przykłady i edge‑cases](#ch-24-7)

<div id="ch-24-1"></div>

# 24.1 Rola i struktura

**StatusOverlay** to lekka warstwa informacyjna nad treścią. Typowo: `Label` (komunikat), opcj. `ProgressBar`, opcj. `Button` Cancel.

<div id="ch-24-2"></div>

# 24.2 Geometria i styl

- Overlay kotwiczy się do całego rodzica: `anchors.fill: parent`.
- Tło półprzezroczyste (np. `#00000055`) lub `alpha`.
- Kafelek środka (panel) wycentrowany pion/poziom przez `anchors.centerIn: parent` lub równoważne kotwice.

<div id="ch-24-3"></div>

# 24.3 Stany i zdarzenia

- `@onClick` przy Cancel.
- Widoczność sterowana przez kontroler (show/hide).
- Brak złożonych dzieci — overlay jest lekki.

<div id="ch-24-4"></div>

# 24.4 Blueprint OTUI (STRICT)
```otui
StatusOverlay < UIWidget
  id: overlay
  anchors.fill: parent
  background-color: #00000055

  UIWidget
    id: panel
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.verticalCenter: parent.verticalCenter
    width: 220
    padding: 8
    background-color: #00000099

    Label
      id: msg
      anchors.left: parent.left
      anchors.right: parent.right
      text-wrap: true
      !text: tr('Working...')
      font: verdana-11px-monochrome

    ProgressBar
      id: progress
      anchors.left: parent.left
      anchors.right: parent.right
      anchors.top: msg.bottom
      margin-top: 6
      height: 16

    Button
      id: cancel
      anchors.top: progress.bottom
      anchors.right: parent.right
      margin-top: 6
      width: 64
      !text: tr('Cancel')
```

<div id="ch-24-5"></div>

# 24.5 Preset TS
```ts
export function presetStatusOverlay(label = 'Working...'): WidgetNode {
  return {
    base: 'StatusOverlay', extends: 'UIWidget',
    geometry: { id: 'overlay', anchors: { fill: 'parent' } },
    style: { backgroundColor: '#00000055' },
    children: [
      { base: 'UIWidget', geometry: { id: 'panel', anchors: { horizontalCenter: 'parent.horizontalCenter', verticalCenter: 'parent.verticalCenter' }, width: 220, padding: 8 }, style: { backgroundColor: '#00000099' }, children: [
        { base: 'Label', geometry: { id: 'msg', anchors: { left: 'parent.left', right: 'parent.right' } }, style: { textWrap: true, text: label, font: 'verdana-11px-monochrome' } },
        { base: 'ProgressBar', geometry: { id: 'progress', anchors: { left: 'parent.left', right: 'parent.right', top: 'msg.bottom' }, marginTop: 6, height: 16 } },
        { base: 'Button', geometry: { id: 'cancel', anchors: { top: 'progress.bottom', right: 'parent.right' }, marginTop: 6, width: 64 }, style: { text: 'Cancel' } }
]}
]
};
}
```

<div id="ch-24-6"></div>

# 24.6 Walidator

❌ Overlay z nadmiarem dzieci (złożone układy). ❌ Brak `tr()` w komunikacie. ⚠️ Brak kontrastu (czytelność). ⚠️ Panel bez wyśrodkowania.

<div id="ch-24-7"></div>

# 24.7 Przykłady i edge‑cases

Overlay ładowania zasobów; tryb indeterminate ProgressBar; anulowanie długiej operacji.

---

# 25. Macierze dozwolonych dzieci (global)

- [25.1 Tabele macierzowe per komponent i slot](#ch-25-1)
- [25.2 Reguły globalne](#ch-25-2)

<div id="ch-25-1"></div>

# 25.1 Tabele macierzowe per komponent i slot

| Parent/Slot | Dopuszczone dzieci | Niedozwolone / Uwagi |
|---|---|---|
| **MainWindow/StaticMainWindow** | elementy panelowe (Label, Button, TextEdit, Multiline, TextList, ComboBox, CheckBox, ProgressBar, VerticalScrollBar, HorizontalSeparator, TabBar, Splitter, UIWidget, Panel) | `*Window` jako dzieci — ✖ |
| **MiniWindow.titlebar** | Label, Button, UIWidget (ikona) | Scroll, listy, edytory — ✖ |
| **MiniWindow.content** | elementy panelowe (w tym TextList/Multiline, Panel, Grid, ProgressBar) | `*Window` — ✖; Scroll tylko w parze |
| **MiniWindow.footer** | Button, Label | Listy/edytory — ✖ |
| **ContainerWindow.titlebar** | Button (back/pin/min/close), Label, UIWidget (ikona) | Scroll/listy/edytory — ✖ |
| **ContainerWindow.content** | SlotWidget/UIWidget, Label, Button, VerticalScrollBar (dock right) | `*Window` — ✖ |
| **DialogWindow.titlebar** | Label | Scroll/listy/edytory — ✖ |
| **DialogWindow.content** | Label, TextEdit, Multiline, ComboBox, CheckBox, ProgressBar | `*Window` — ✖ |
| **DialogWindow.footer** | Button | — |
| **Panel/GroupBox/UIWidget** | elementy panelowe | `*Window` — ✖ |
| **TabBar** | Button (zakładki) | Treści panelowe w TabBar — ✖ |
| **TabContent** | elementy panelowe | — |
| **Splitter** | dokładnie 2 panele (UIWidget/Panel) | ≠2 dzieci — ✖ |
| **TextList** | wiersze (UIWidget/ListRow) | Scroll jako **sibling** |
| **MultilineTextEdit** | — | Scroll jako **sibling** |
| **ComboBox** | — (menu wewnętrzne) | Ręczne „opcje” — ✖ |
| **ProgressBar** | — | Brak dzieci |
| **HorizontalSeparator** | — | Brak dzieci |
| **StatusOverlay** | Label, ProgressBar, Button (Cancel) | Złożone układy — ✖ |

<div id="ch-25-2"></div>

# 25.2 Reguły globalne
- ScrollBar zawsze **sibling** przewijanej treści.
- `*Window` nigdy **nie** jest dzieckiem innego okna w slotach treści.
- `titlebar/footer` to obszary **bez** list/edytorów/scrolla.
- Parzyste marginesy i spacing; snapping 2 px.
- Wymuszone przyciski w oknach: MiniWindow (min/close), Container (back + min/close), Dialog (OK/Cancel w footerze).
- Wszystkie napisy przez `tr()`; zasoby tylko z `data/`.

---

# 26. Walidacja i auto‑naprawy (global)

- [26.1 Błędy blokujące](#ch-26-1)
- [26.2 Ostrzeżenia](#ch-26-2)
- [26.3 Auto‑naprawy deterministyczne](#ch-26-3)
- [26.4 Pipeline walidatora](#ch-26-4)

<div id="ch-26-1"></div>

# 26.1 Błędy blokujące (❌)

- STRICT: komentarze, taby, CRLF/BOM, złe wcięcia (≠2 sp.), kolejność atrybutów niekanoniczna.
- Sprzeczne kotwice (`fill` + krawędzie).
- Niedozwolone dzieci w slotach/parentach.
- Samotny ScrollBar lub przewijana treść bez pary i dokowania.
- Brak wymaganych przycisków okna (Mini/Container/Dialog).
- `tr()` pominięte dla stałych napisów; zasoby spoza `data/`.

<div id="ch-26-2"></div>

# 26.2 Ostrzeżenia (⚠️)

- Nieparzyste marginesy/spacing.
- Brak auto‑fit width przy dokowaniu okna.
- `step` scrolla niepasujący do wysokości wiersza/slotu.
- Brak skrótów Enter/Escape/strzałek tam, gdzie UX tego wymaga.

<div id="ch-26-3"></div>

# 26.3 Auto‑naprawy deterministyczne

1) Normalizacja końców linii na LF, usunięcie BOM/tabów/trailing spaces.
2) Wcięcia → 2 sp.
3) Porządkowanie atrybutów: **GEOMETRIA → STYL → ZACHOWANIE**.
4) Wstawienie brakujących slotów (np. `content/footer` w MiniWindow).
5) Parowanie ScrollBar z listą/Multiline (dokowanie + kotwice).
6) Usunięcie `width` gdy istnieje `anchors.left/right: parent` (auto‑fit).
7) Snapping marginesów/spacing do wartości parzystych.

<div id="ch-26-4"></div>

# 26.4 Pipeline walidatora
```
parse → normalize(STRICT) → validateStructure(macierze) → validateAnchors → validateI18n → validateResources → validatePairs(scroll) → autofix → re‑serialize → diff
```
Wynik: `{ errors: [...], warnings: [...], fixes: [...] }` + zaktualizowany dokument.

---

# 27. Parser/Serializer OTUI → AST (TypeScript)
- [27.1 Tokenizacja i INDENT/DEDENT](#ch-27-1)
- [27.2 Kształt AST](#ch-27-2)
- [27.3 Algorytm parsowania](#ch-27-3)
- [27.4 Serializacja i `ensureStrictOtui()`](#ch-27-4)
- [27.5 Błędy/ostrzeżenia/pozycje](#ch-27-5)
- [27.6 Testy round‑trip (goldeny)](#ch-27-6)

<div id="ch-27-1"></div>

# 27.1 Tokenizacja i INDENT/DEDENT

Tokeny: `IDENT`, `NUMBER`, `STRING` (pojedyncze `'...'` dla `!text`), `SYMBOL` (`:`, `<`, `>`, `$`, `@`, `&`), `NEWLINE`, `INDENT`, `DEDENT`. Wcięcie = **2 spacje**.

<div id="ch-27-2"></div>

# 27.2 Kształt AST
```ts
export type AstNode = {
  kind: 'Widget'|'Prop'|'Event'|'State'|'MetaFn';
  name?: string;
  extends?: string;
  props?: Record<string,string>;
  event?: string;
  state?: '$on'|'$!on'|'$focus'|'$checked'|'$disabled'|'$hover'|string;
  metaName?: string;
  metaBody?: string;
  children?: AstNode[];
  loc?: { line: number; col: number };
};
```

<div id="ch-27-3"></div>

# 27.3 Algorytm parsowania

1) Liniowo skanuj, budując stos INDENT/DEDENT.
2) Linia `X < Y` → węzeł `Widget` z dziedziczeniem.
3) Linia `key: value` → `Prop` (właściwości GEOMETRIA/STYL/ZACHOWANIE).
4) Blok `@on...:` → `Event`; blok `$...:` → `State`; blok `&name:` → `MetaFn`.
5) Dołączaj dzieci wg wcięć; zachowuj `loc` do raportów.

<div id="ch-27-4"></div>

# 27.4 Serializacja i `ensureStrictOtui()`

- Emisja w kolejności **GEOMETRIA → STYL → ZACHOWANIE**.
- `style.text` → `!text: tr('...')`; zdarzenia → `@on...`; stany → `$...`.
- `ensureStrictOtui(text)` usuwa BOM/taby, normalizuje LF, wcięcia (2 sp.), atrybuty i kolejność bloków.

<div id="ch-27-5"></div>

# 27.5 Błędy/ostrzeżenia/pozycje

Struktura raportu:
```ts
export type LintIssue = { kind: 'error'|'warning'; code: string; message: string; loc?: { line: number; col: number } };
```
Przykłady: `E_STRICT_TABS`, `E_SLOT_CHILD_FORBIDDEN`, `E_ANCHORS_CONFLICT`, `E_SCROLL_PAIR_MISSING`, `W_MARGIN_ODD`.

<div id="ch-27-6"></div>

# 27.6 Testy round‑trip (goldeny)

- Dla **MiniWindow**, **ContainerWindow**, **Dialog**: `parse → serialize → parse` i porównanie AST (bez strat).
- Testy porządkowania atrybutów, stanów i zdarzeń; testy auto‑napraw (deterministyczny diff).

---

# 28. Import/Export i round‑trip (edytor ↔ plik ↔ Lua)

- [28.1 Import z `.otui`](#ch-28-1)
- [28.2 Import z bloków w Lua (`@OTUI_BEGIN/END`)](#ch-28-2)
- [28.3 Eksport do `.otui` + aktualizacja bloku w Lua](#ch-28-3)
- [28.4 Runtime: tylko pliki](#ch-28-4)

<div id="ch-28-1"></div>

# 28.1 Import z `.otui`

- Wczytaj plik, `ensureStrictOtui()`, `parseOtui()` → AST.
- Walidacja + auto‑naprawy; prezentacja ostrzeżeń przed edycją.

<div id="ch-28-2"></div>

# 28.2 Import z bloków w Lua (`@OTUI_BEGIN/END`)

W kodzie Lua przechowuj **czysty STRICT OTUI** w stringu wielowierszowym, a **markery** trzymaj poza stringiem:

```lua
-- @OTUI_BEGIN miniwindow
local UI = [[
MiniWindow
  id: miniWindow
  width: 200
]]
-- @OTUI_END miniwindow
```

Edytor odnajduje sekcję po nazwie, wycina **dokładnie** zawartość stringa i traktuje ją jak `.otui`.

<div id="ch-28-3"></div>

# 28.3 Eksport do `.otui` + aktualizacja bloku w Lua

- Serializuj do pliku `.otui` (kanoniczny zapis).
- Jeśli w Lua istnieje sekcja `@OTUI_BEGIN/END`, **zastąp** wyłącznie środek stringa nowym STRICT OTUI (bez zmiany markerów i otaczającego kodu).
- Generuj stub `local win = g_ui.displayUI('file')` do użycia w runtime.

<div id="ch-28-4"></div>

# 28.4 Runtime: tylko pliki

W OTClient v8 UI jest ładowane kanonicznie z plików: `g_ui.displayUI('...')`. Import/edycja „from string” służy **wyłącznie** edytorowi i utrzymaniu kodu — nie do produkcyjnego ładowania w kliencie.

---

# 29. Biblioteka presetów (gotowe szablony)
- [29.1 Presety okien](#ch-29-1)
- [29.2 Presety komponentów](#ch-29-2)
- [29.3 Warianty tematyczne](#ch-29-3)
- [29.4 Rejestr presetów i wersjonowanie](#ch-29-4)
- [29.5 Zasady rozszerzania](#ch-29-5)

<div id="ch-29-1"></div>

# 29.1 Presety okien

**Preset: MinimalMiniWindow**
```otui
MiniWindow < MainWindow
  id: mini
  anchors.left: parent.left
  anchors.right: parent.right
  height: 160

  background-color: alpha

  UIWidget
    id: titlebar
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: parent.top
    height: 20

    background-color: #00000066

    Label
      id: title
      anchors.left: parent.left
      anchors.verticalCenter: parent.verticalCenter
      margin-left: 6
      text-auto-resize: true
      !text: tr('Tool')
      font: verdana-11px-rounded

    Button
      id: minimizeBtn
      anchors.right: closeBtn.left
      anchors.verticalCenter: parent.verticalCenter
      width: 16
      !text: tr('-')

    Button
      id: closeBtn
      anchors.right: parent.right
      anchors.verticalCenter: parent.verticalCenter
      width: 16
      !text: tr('x')

  UIWidget
    id: content
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: titlebar.bottom
    anchors.bottom: footer.top
    padding: 6

    background-color: alpha

  UIWidget
    id: footer
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.bottom: parent.bottom
    height: 28

    background-color: #00000033
```

**Preset: ContainerLootWindow**
```otui
ContainerWindow < MainWindow
  id: loot
  anchors.left: parent.left
  anchors.right: parent.right
  height: 220

  background-color: alpha

  UIWidget
    id: titlebar
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: parent.top
    height: 20

    background-color: #00000066

    Label
      id: title
      anchors.left: parent.left
      anchors.verticalCenter: parent.verticalCenter
      margin-left: 6
      text-auto-resize: true
      !text: tr('Loot')
      font: verdana-11px-rounded

    Button
      id: backBtn
      anchors.right: pinBtn.left
      anchors.verticalCenter: parent.verticalCenter
      width: 20
      !text: tr('<')

    Button
      id: pinBtn
      anchors.right: minimizeBtn.left
      anchors.verticalCenter: parent.verticalCenter
      width: 20
      !text: tr('*')

    Button
      id: minimizeBtn
      anchors.right: closeBtn.left
      anchors.verticalCenter: parent.verticalCenter
      width: 16
      !text: tr('-')

    Button
      id: closeBtn
      anchors.right: parent.right
      anchors.verticalCenter: parent.verticalCenter
      width: 16
      !text: tr('x')

  UIWidget
    id: content
    anchors.left: parent.left
    anchors.right: scroll.left
    anchors.top: titlebar.bottom
    anchors.bottom: parent.bottom
    padding: 6

    background-color: alpha

    UIWidget
      id: grid
      anchors.left: parent.left
      anchors.top: parent.top
      width: 1
      height: 1

  VerticalScrollBar
    id: scroll
    anchors.right: parent.right
    anchors.top: titlebar.bottom
    anchors.bottom: parent.bottom
    step: 36
```

**Preset: ConfirmDialog**
```otui
DialogWindow < MainWindow
  id: confirm
  width: 300
  height: 140

  background-color: alpha

  UIWidget
    id: titlebar
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: parent.top
    height: 20

    background-color: #00000066

    Label
      id: title
      anchors.left: parent.left
      anchors.verticalCenter: parent.verticalCenter
      margin-left: 6
      text-auto-resize: true
      !text: tr('Confirm')
      font: verdana-11px-rounded

  UIWidget
    id: content
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: titlebar.bottom
    anchors.bottom: footer.top
    padding: 8

    background-color: alpha

    Label
      id: message
      anchors.left: parent.left
      anchors.right: parent.right
      text-wrap: true
      !text: tr('Are you sure?')
      font: verdana-11px-monochrome

  UIWidget
    id: footer
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.bottom: parent.bottom
    height: 32

    background-color: #00000033

    Button
      id: okButton
      anchors.right: cancelButton.left
      anchors.bottom: parent.bottom
      width: 72
      margin-right: 8
      !text: tr('Ok')

    Button
      id: cancelButton
      anchors.right: parent.right
      anchors.bottom: parent.bottom
      width: 72
      margin-right: 8
      !text: tr('Cancel')
```

<div id="ch-29-2"></div>

# 29.2 Presety komponentów

**TitlebarTool**
```otui
TitlebarWidget < UIWidget
  id: titlebar
  anchors.left: parent.left
  anchors.right: parent.right
  anchors.top: parent.top
  height: 20

  background-color: #00000066

  Label
    id: title
    anchors.left: parent.left
    anchors.verticalCenter: parent.verticalCenter
    margin-left: 6
    text-auto-resize: true
    !text: tr('Title')
    font: verdana-11px-rounded

  Button
    id: minimizeBtn
    anchors.right: closeBtn.left
    anchors.verticalCenter: parent.verticalCenter
    width: 16
    !text: tr('-')

  Button
    id: closeBtn
    anchors.right: parent.right
    anchors.verticalCenter: parent.verticalCenter
    width: 16
    !text: tr('x')
```

**ToolbarBasic**
```otui
ToolbarWidget < UIWidget
  id: toolbar
  anchors.left: parent.left
  anchors.right: parent.right
  anchors.top: parent.top
  height: 20

  background-color: #00000044

  Button
    id: action1
    anchors.left: parent.left
    anchors.verticalCenter: parent.verticalCenter
    width: 60
    !text: tr('Action')
```

**PanelForm**
```otui
Panel
  id: form
  anchors.left: parent.left
  anchors.right: parent.right
  anchors.top: parent.top
  height: 120

  background-color: alpha

  UIWidget
    id: body
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: parent.top
    anchors.bottom: parent.bottom
    padding: 6

    background-color: alpha
```

<div id="ch-29-3"></div>

# 29.3 Warianty tematyczne
- **Narzędzie**: tła półprzezroczyste, kompaktowe wysokości (20 px titlebar/toolbar), marginesy 6 px.
- **Kontener**: widoczne przyciski `back/pin`, spacing slotów 4 px, slot 36×36.
- **Dialog**: padding 8 px, przyciski 72 px, wysokość 32 px w footer.

<div id="ch-29-4"></div>

# 29.4 Rejestr presetów i wersjonowanie
- **Registry (TS)** trzyma wpisy: `id`, `title`, `base`, `version`, `factory()`.
- Stabilne **slug‑i** presetów (np. `mini/minimal`, `container/loot`, `dialog/confirm`).
- Zmiany łamiące → nowy `version`, poprzedni nadal dostępny.

```ts
export type PresetEntry = { id: string; version: string; title: string; factory: () => WidgetNode|WidgetNode[] };
export const PRESETS: PresetEntry[] = [
  { id: 'mini/minimal', version: '1.0.0', title: 'Minimal MiniWindow', factory: presetMiniMinimal },
  { id: 'container/loot', version: '1.0.0', title: 'Container Loot', factory: presetContainerLoot },
  { id: 'dialog/confirm', version: '1.0.0', title: 'Confirm Dialog', factory: presetDialogConfirm }
];
```

<div id="ch-29-5"></div>

# 29.5 Zasady rozszerzania
- Rozszerzaj przez **dziedziczenie** (`X < Y`) lub przez preset TS, nigdy przez ad‑hoc dzieci naruszające macierze.
- Zachowuj STRICT OTUI przy eksporcie; nie duplikuj semantyki okna w stanach.

---

# 30. Testy wizualne i regresja

- [30.1 Snapshoty 1:1](#ch-30-1)
- [30.2 DPI / font metrics / skalowanie](#ch-30-2)
- [30.3 Dostępność (kontrast, czytelność)](#ch-30-3)
- [30.4 Golden diff i tolerancje](#ch-30-4)
- [30.5 Pipeline testów](#ch-30-5)

<div id="ch-30-1"></div>

# 30.1 Snapshoty 1:1

- Generuj obraz referencyjny dla każdego preset/blueprintu po eksporcie `.otui`.
- Porównuj piksel‑po‑pikselu z goldenem; rozbijaj różnice na heatmapę.

<div id="ch-30-2"></div>

# 30.2 DPI / font metrics / skalowanie

- Testuj na stałych DPI (np. 96) oraz wariantach skali (1.0, 1.25, 1.5).
- Weryfikuj metryki fontu: wysokość linii, kerning; nie dopuszczaj driftu między wersjami.

<div id="ch-30-3"></div>

# 30.3 Dostępność (kontrast, czytelność)

- Sprawdzaj minimalne kontrasty tekst/tło.
- Minimalne rozmiary hitboxów (≥16×16).
- Zawijanie i elipsyzacja długich tekstów.

<div id="ch-30-4"></div>

# 30.4 Golden diff i tolerancje

- Tolerancja szumu renderera ≤0.5% pikseli.
- Każda różnica > tolerancji wymaga akceptacji lub rollbacku presetów/stylów.

<div id="ch-30-5"></div>

# 30.5 Pipeline testów
```
for each preset → serialize(STRICT) → export .otui → render snapshot → compare with golden → report
```
Raport: lista różnic, heatmapy, log walidatora (STRUCT/anchors/macierze).

---

# 31. Słownik i indeks

- [31.1 Słownik (A–Z)](#ch-31-1)
- [31.2 Indeks rozdziałów](#ch-31-2)

<div id="ch-31-1"></div>

# 31.1 Słownik (A–Z)

- **Anchors** — kotwice położenia i rozmiaru względem krawędzi/obiektów.
- **AST** — abstrakcyjne drzewo składniowe reprezentujące OTUI w edytorze.
- **Blueprint** — kanoniczny szablon OTUI komponentu/okna.
- **Grid (edytorowy)** — siatka pomocnicza w edytorze, nie istnieje w OTUI.
- **Layout‑owner** — rodzic definiujący sloty/obszary i reguły dokowania.
- **Macierz dzieci** — tabela dozwolonych dzieci per parent/slot.
- **Preset** — gotowy zestaw węzłów przygotowanych do użycia jako wzorzec.
- **Round‑trip** — import → edycja → eksport bez utraty semantyki.
- **Scroll pairing** — reguły łączenia treści przewijanej ze ScrollBarem jako rodzeństwem.
- **STRICT OTUI** — format: LF, 2 spacje, brak komentarzy/tabów, kolejność atrybutów.

<div id="ch-31-2"></div>

# 31.2 Indeks rozdziałów

- **Okna**: 5–9
- **Organizacja**: 10–14
- **Dane/edycja**: 15–20
- **Wskaźniki/scroll**: 21–22
- **Warstwy i separatory**: 23–24
- **Reguły i walidacja**: 25–26
- **AST/IO**: 27–28
- **Presety**: 29
- **Testy**: 30
- **Słownik**: 31

---


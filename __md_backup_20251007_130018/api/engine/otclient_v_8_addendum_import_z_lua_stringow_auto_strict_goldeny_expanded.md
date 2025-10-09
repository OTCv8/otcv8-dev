# OTClient v8 — Addendum: Import z Lua‑stringów (AUTO‑STRICT) + Goldeny (Expanded)

**Cel:** Dostarczyć kompletne, wdrażalne uzupełnienie do Part 4:  
A) **Import z Lua‑stringów do AST** (AUTO‑STRICT, aktualizacja *in‑place*),  
B) **Rozszerzona biblioteka goldenów** (round‑trip 1:1),  
C) **Runner z obsługą profili** (`game_bot`, `client`, …).

---
# # Spis treści
- [A. Import z Lua‑stringów → AST (AUTO‑STRICT)](#a-import)
  - [A.1 Wykrywanie bloków: zmienne i kotwice komentarzowe](#a-1)
  - [A.2 API ekstrakcji i podmiany (TypeScript)](#a-2)
  - [A.3 Polityka AUTO‑STRICT i błędy importu](#a-3)
  - [A.4 Przepływ IDE (import → edycja → eksport do Lua/plik)](#a-4)
- [B. Goldeny (expanded)](#b-goldens)
  - [B.1 Indeks JSON (nazwy → opis)](#b-1)
  - [B.2 Wybrane goldeny (STRICT OTUI)](#b-2)
- [C. Runner round‑trip + walidacja profili](#c-runner)

---

<div id="a-import"></div>
# # A. Import z Lua‑stringów → AST (AUTO‑STRICT)

<div id="a-1"></div>
# # # A.1 Wykrywanie bloków: zmienne i kotwice komentarzowe
**Obsługiwane formy:**
1) **Zmienna**: `local <Name>_OTUI = [[ ... ]]` — preferowana w kodzie źródłowym.  
2) **Kotwice**: `-- @OTUI_BEGIN name=<name>` … `-- @OTUI_END name=<name>` — czytelny marker w Lua.

**Regexy (TS, `gms`):**
```ts
export const RX_VAR = /(^|\n)\s*local\s+([A-Za-z0-9_]+)_OTUI\s*=\s*\[\[([\s\S]*?)\]\]/gms;
export const RX_TAG = /(^|\n)\s*--\s*@OTUI_BEGIN\s+name=([A-Za-z0-9_]+)[^\n]*\n([\s\S]*?)\n\s*--\s*@OTUI_END\s+name=\2/gms;
```
> **STRICT OTUI** wewnątrz bloków: brak tabów/komentarzy/BOM; wcięcia 2 sp.; kolejność atrybutów GEOMETRIA→STYL→ZACHOWANIE.

<div id="a-2"></div>
# # # A.2 API ekstrakcji i podmiany (TypeScript)
```ts
export interface LuaOtuiBlock { name: string; otui: string; start: number; end: number; kind: 'var'|'tag' }

export function extractLuaOtuiBlocks(lua: string): LuaOtuiBlock[] {
  const out: LuaOtuiBlock[] = [];
  const push = (m: RegExpExecArray, kind: 'var'|'tag', nameIdx: number, bodyIdx: number) => {
    out.push({ name: m[nameIdx], otui: m[bodyIdx], start: m.index!, end: m.index! + m[0].length, kind });
};
  let mv: RegExpExecArray | null; const rxv = new RegExp(RX_VAR);
  while ((mv = rxv.exec(lua))) push(mv, 'var', 2, 3);
  let mt: RegExpExecArray | null; const rxt = new RegExp(RX_TAG);
  while ((mt = rxt.exec(lua))) push(mt, 'tag', 2, 3);
  return out;
}

export function replaceLuaOtuiBlock(lua: string, name: string, newOtuiStrict: string): string {
  const byVar = new RegExp(RX_VAR);
  const byTag = new RegExp(RX_TAG);
  const replVar = lua.replace(byVar, (full, pre, n, body) => (n===name ? `${pre}local ${n}_OTUI = [[\n${newOtuiStrict}\n]]` : full));
  if (replVar !== lua) return replVar;
  return lua.replace(byTag, (full, pre, n, body) => (n===name ? `${pre}-- @OTUI_BEGIN name=${n}\n${newOtuiStrict}\n-- @OTUI_END name=${n}` : full));
}
```

<div id="a-3"></div>
# # # A.3 Polityka AUTO‑STRICT i błędy importu
- **AUTO‑STRICT:** `ensureStrictOtui(text)` przed `parseOtui()`; jeśli zmieni treść → `W:STRICT` (propozycja auto‑zapisania).  
- **Błędy importu:**
  - `E:LUA‑DUP` — więcej niż jeden blok o tej samej nazwie w pliku.  
  - `E:LUA‑NOUPD` — brak bloku do podmiany.  
  - `E:STRICT` — komentarze/taby/BOM wewnątrz bloku OTUI.  
  - `E:PARSE` — niepoprawny OTUI po `ensureStrictOtui()`.

<div id="a-4"></div>
# # # A.4 Przepływ IDE (import → edycja → eksport do Lua/plik)
1. **Import**: odczytaj plik Lua → `extractLuaOtuiBlocks()` → wybór bloku → `ensureStrictOtui()` → `parseOtui()` → edycja w IDE.  
2. **Eksport**: `serializeAst()` → `ensureStrictOtui()` → `replaceLuaOtuiBlock()` (Lua) **oraz** zapis do `.otui` (kanoniczny runtime).  
3. **Walidacja profilu**: `validateAst(ast, { profile: 'game_bot' })` przed zapisem; blokujące `E:BLK` przerywają zapis.

---

<div id="b-goldens"></div>
# # B. Goldeny (expanded)

<div id="b-1"></div>
# # # B.1 Indeks JSON (nazwy → opis)
```json
[
  {"name":"mainwindow_basic","desc":"MainWindow + content (fill)"},
  {"name":"staticmain_basic","desc":"StaticMainWindow + content"},
  {"name":"miniwindow_basic","desc":"MiniWindow z titlebar/content/footer"},
  {"name":"container_basic","desc":"ContainerWindow z titlebar + content"},
  {"name":"dialog_basic","desc":"DialogWindow z footer OK/Cancel"},
  {"name":"textlist_with_scroll","desc":"TextList + VerticalScrollBar (pairing)"},
  {"name":"multiline_with_scroll","desc":"MultilineTextEdit + VerticalScrollBar (pairing)"},
  {"name":"splitter_two_panels","desc":"Splitter z dwojgiem dzieci"},
  {"name":"status_overlay_basic","desc":"StatusOverlay (Label+Progress+Cancel)"},
  {"name":"tabbar_tabwidget_pair","desc":"TabBar + TabWidget (para)"},
  {"name":"toolbar_basic","desc":"Toolbar z dwiema akcjami i separatorem"},
  {"name":"titlebar_buttons_set","desc":"Titlebar z tytułem i przyciskami close/min"},
  {"name":"groupbox_form_basic","desc":"GroupBox z headerem i contentem"},
  {"name":"tabbed_miniwindow","desc":"MiniWindow z TabBar + TabWidget"},
  {"name":"combobox_basic","desc":"ComboBox (szerokość stała)"},
  {"name":"checkbox_basic","desc":"CheckBox (wariant podstawowy)"},
  {"name":"progressbar_basic","desc":"ProgressBar (rozmiar minimalny)"},
  {"name":"label_wrap_basic","desc":"Label z text-wrap"},
  {"name":"panel_with_padding","desc":"Panel (anchors.fill + padding)"},
  {"name":"textlist_with_hscroll","desc":"TextList + HorizontalScrollBar (dok do dołu)"},
  {"name":"login_screen_basic","desc":"StaticMainWindow – prosty ekran logowania"}
]
```

<div id="b-2"></div>
# # # B.2 Wybrane goldeny (STRICT OTUI)
**`toolbar_basic`**
```otui
Toolbar
  id: tools
  size: 200 22

  Button
    id: action1
    width: 20
    !text: tr('A')

  HorizontalSeparator
    id: sep
    size: 2 20

  Button
    id: action2
    width: 20
    !text: tr('B')
```

**`titlebar_buttons_set`**
```otui
Titlebar
  id: tb
  size: 200 20

  Label
    id: title
    anchors.left: parent.left
    anchors.verticalCenter: parent.verticalCenter
    margin-left: 6
    text-auto-resize: true
    !text: tr('Title')

  Button
    id: closeBtn
    anchors.right: parent.right
    anchors.verticalCenter: parent.verticalCenter
    width: 16
    !text: tr('x')
```

**`groupbox_form_basic`**
```otui
GroupBox
  id: group
  size: 220 120

  UIWidget
    id: header
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: parent.top
    height: 18

    Label
      id: caption
      anchors.left: parent.left
      anchors.verticalCenter: parent.verticalCenter
      margin-left: 6
      text-auto-resize: true
      !text: tr('Group')

  UIWidget
    id: content
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: header.bottom
    anchors.bottom: parent.bottom
    padding: 6
```

**`tabbed_miniwindow`**
```otui
MiniWindow < MainWindow
  id: mini
  size: 280 200
  background-color: alpha

  UIWidget
    id: titlebar
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: parent.top
    height: 20

  UIWidget
    id: content
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: titlebar.bottom
    anchors.bottom: parent.bottom
    padding: 6

    TabBar
      id: tabbar
      anchors.left: parent.left
      anchors.right: parent.right
      anchors.top: parent.top
      height: 22

      Button
        id: tab1
        width: 60
        !text: tr('Tab 1')

      Button
        id: tab2
        anchors.left: tab1.right
        width: 60
        !text: tr('Tab 2')

    TabWidget
      id: tabcontent
      anchors.left: parent.left
      anchors.right: parent.right
      anchors.top: tabbar.bottom
      anchors.bottom: parent.bottom
```

**`textlist_with_hscroll`**
```otui
UIWidget
  id: wrap
  size: 240 120

  TextList
    id: list
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: parent.top
    anchors.bottom: hscroll.top

  HorizontalScrollBar
    id: hscroll
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.bottom: parent.bottom
    step: 8
```

**`login_screen_basic`** (podgląd)
```otui
StaticMainWindow
  id: smw_login
  size: 320 240
  background-color: alpha

  UIWidget
    id: content
    anchors.fill: parent
    padding: 6

    Label
      id: lbl_user
      anchors.left: parent.left
      anchors.top: parent.top
      !text: tr('Username:')

    TextEdit
      id: edit_user
      anchors.left: parent.left
      anchors.top: lbl_user.bottom
      width: 160

    Label
      id: lbl_pass
      anchors.left: parent.left
      anchors.top: edit_user.bottom
      margin-top: 6
      !text: tr('Password:')

    PasswordTextEdit
      id: edit_pass
      anchors.left: parent.left
      anchors.top: lbl_pass.bottom
      width: 160

    Button
      id: btn_login
      anchors.left: parent.left
      anchors.top: edit_pass.bottom
      margin-top: 8
      width: 80
      !text: tr('Log In')
```

---

<div id="c-runner"></div>
# # C. Runner round‑trip + walidacja profili
```ts
export interface GoldenCase { name: string; otui?: string }
export interface GoldenIO { read(path: string): string; write(path: string, data: string): void }
export interface GoldenReport { passed: string[]; failed: Array<{name: string; reason: string}> }

export function runGoldenSuite(cases: GoldenCase[], io: GoldenIO, opts?: { profile?: 'game_bot'|'client'|string }): GoldenReport {
  const passed: string[] = []; const failed: Array<{name:string;reason:string}> = [];
  for (const c of cases) {
    try {
      const otuiIn = c.otui ?? io.read(`tests/goldens/otui/${c.name}.otui`);
      const strict = ensureStrictOtui(otuiIn);
      const ast = parseOtui(strict);
      const issues = validateAst(ast, { profile: opts?.profile });
      const blocking = issues.filter(i => i.severity === 'error');
      if (blocking.length) throw new Error(`validation failed: ${blocking.map(i=>i.code).join(',')}`);
      const out = ensureStrictOtui(serializeAst(ast));
      if (out !== strict) throw new Error('round-trip mismatch');
      passed.push(c.name);
    } catch (e:any) { failed.push({ name: c.name, reason: String(e?.message || e) }); }
}
  return { passed, failed };
}
```

> **Notatka:** Ten addendum nie zmienia zasad bazowych; integruj gotowe sekcje A–C z Twoim pipeline’em IDE oraz CI.

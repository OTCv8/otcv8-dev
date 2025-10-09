# Parser & Schemas (MASTER): **AST + JSON Schema** dla **OTClient Studio**

> Cel dokumentu: dostarczyć **kompletne, operacyjne** specyfikacje parserów (Lua‑Lite, OTUI/OTML) oraz **kontrakty walidacyjne** (JSON Schema) dla artefaktów narzędzia: `api.json`, `project-index.json`, `otui-rules.json`, `templates.json`, `docstrings.json`, `assets-map.json`, `.studio/config.json`, a także **schemat linii logu NDJSON**. Wszystko w formie gotowej do bezpośredniej implementacji (TypeScript/Node) i automatycznej walidacji.

---
# # 0) Założenia ogólne
- **Deterministyczność:** Emisja AST/indeksów musi być deterministyczna (stabilne sortowanie kluczy, list po `loc.start.offset`).
- **Lokalizacja (`loc`):** Każdy węzeł ma `loc`:
```json
{"file":"/abs/path.lua","start":{"offset":123,"line":5,"column":10},"end":{"offset":140,"line":5,"column":27}}
```
- **Identyfikator węzła (`id`)**: opcjonalny, `sha1(file + start.offset + type)`.
- **Tolerant parsing:** Parser nie przerywa na pierwszy błąd; emituje `errors[]` i możliwie pełne AST.
- **Kody błędów:** prefiksowane domeną (`LUA_`, `OTUI_`, `OTMOD_`, `GEN_`). Sekcja 7.

---
# # 1) OTUI/OTML — Gramatyka i AST
# # # 1.1 Gramatyka (EBNF – praktyczna)
```
File        := (Decl | Comment)*
Decl        := Type ("<" Base ">")? Spacing? "{" Body "}"
Body        := (KV | Decl | Comment)*
KV          := Key Spacing? ":" Spacing? Value
Type        := Ident
Base        := Ident
Key         := Ident
Value       := String | Number | Bool | Ident | Array | Object
Array       := "[" (Value ("," Value)*)? "]"
Object      := "{" (KV ("," KV)*)? "}"
Comment     := /#.*$/
Ident       := /[A-Za-z_][A-Za-z0-9_\-]*/
String      := '"' (\\.|[^"\\])* '"' | '\'' (\\.|[^'\\])* '\''
Number      := /[-+]?[0-9]+(\.[0-9]+)?/
Bool        := "true" | "false"
```
# # # 1.2 AST OTUI — JSON Schema
```json
{
  "$id": "https://schemas.otc.studio/otui-ast.schema.json",
  "$schema": "https://json-schema.org/draft/2020-12/schema",
  "title": "OTUI AST",
  "type": "object",
  "required": ["type", "loc", "body"],
  "properties": {
    "type": {"const": "OTUIFile"},
    "loc": {"$ref": "#/definitions/Loc"},
    "errors": {"type": "array", "items": {"$ref": "#/definitions/ParseError"}},
    "body": {
      "type": "array",
      "items": {"$ref": "#/definitions/Node"}
}
},
  "definitions": {
    "Loc": {
      "type": "object",
      "required": ["file","start","end"],
      "properties": {
        "file": {"type": "string"},
        "start": {"$ref": "#/definitions/Pos"},
        "end": {"$ref": "#/definitions/Pos"}
}
},
    "Pos": {
      "type": "object",
      "required": ["offset","line","column"],
      "properties": {
        "offset": {"type": "integer", "minimum": 0},
        "line": {"type": "integer", "minimum": 1},
        "column": {"type": "integer", "minimum": 1}
}
},
    "ParseError": {
      "type": "object",
      "required": ["code","message","loc"],
      "properties": {
        "code": {"type": "string"},
        "message": {"type": "string"},
        "loc": {"$ref": "#/definitions/Loc"}
}
},
    "Node": {
      "oneOf": [
        {"$ref": "#/definitions/Decl"},
        {"$ref": "#/definitions/KV"}
]
},
    "Decl": {
      "type": "object",
      "required": ["type","name","loc","body"],
      "properties": {
        "type": {"const": "Decl"},
        "name": {"type": "string"},
        "base": {"type": ["string","null"]},
        "id": {"type": ["string","null"]},
        "loc": {"$ref": "#/definitions/Loc"},
        "body": {
          "type": "array",
          "items": {"$ref": "#/definitions/Node"}
}
}
},
    "KV": {
      "type": "object",
      "required": ["type","key","value","loc"],
      "properties": {
        "type": {"const": "KV"},
        "key": {"type": "string"},
        "value": {"$ref": "#/definitions/Value"},
        "category": {"type": ["string","null"], "enum": ["GEOMETRY","STYLE","BEHAVIOR",null]},
        "loc": {"$ref": "#/definitions/Loc"}
}
},
    "Value": {
      "oneOf": [
        {"$ref": "#/definitions/StringLiteral"},
        {"$ref": "#/definitions/NumberLiteral"},
        {"$ref": "#/definitions/BooleanLiteral"},
        {"$ref": "#/definitions/Identifier"},
        {"$ref": "#/definitions/ArrayLiteral"},
        {"$ref": "#/definitions/ObjectLiteral"}
]
},
    "StringLiteral": {"type":"object","required":["type","value","loc"],"properties":{"type":{"const":"StringLiteral"},"value":{"type":"string"},"loc":{"$ref":"#/definitions/Loc"}}},
    "NumberLiteral": {"type":"object","required":["type","value","loc"],"properties":{"type":{"const":"NumberLiteral"},"value":{"type":"number"},"loc":{"$ref":"#/definitions/Loc"}}},
    "BooleanLiteral": {"type":"object","required":["type","value","loc"],"properties":{"type":{"const":"BooleanLiteral"},"value":{"type":"boolean"},"loc":{"$ref":"#/definitions/Loc"}}},
    "Identifier": {"type":"object","required":["type","name","loc"],"properties":{"type":{"const":"Identifier"},"name":{"type":"string"},"loc":{"$ref":"#/definitions/Loc"}}},
    "ArrayLiteral": {"type":"object","required":["type","elements","loc"],"properties":{"type":{"const":"ArrayLiteral"},"elements":{"type":"array","items":{"$ref":"#/definitions/Value"}},"loc":{"$ref":"#/definitions/Loc"}}},
    "ObjectLiteral": {"type":"object","required":["type","properties","loc"],"properties":{"type":{"const":"ObjectLiteral"},"properties":{"type":"array","items":{"$ref":"#/definitions/KV"}},"loc":{"$ref":"#/definitions/Loc"}}}
}
}
```
# # # 1.3 Kategoryzacja atrybutów (lint)
- **GEOMETRY:** `x,y,width,height,anchors,margin,padding,min-width,max-width,min-height,max-height`
- **STYLE:** `font,color,image,style,opacity,icon,background,spacing`
- **BEHAVIOR:** `id,focusable,draggable,enabled,visible,onClick,onText,tooltip`
> Lista jest rozszerzalna per projekt (`otui-rules.json`).
# # # 1.4 Przykład AST (OTUI)
Wejście:
```otui
MainWindow < UIWidget {
  id: main
  width: 300
  text: "Hello"
}
```
Szkic wyjścia (skrócony):
```json
{
  "type":"OTUIFile","loc":{"file":"/p/ui/main.otui","start":{"offset":0,"line":1,"column":1},"end":{"offset":55,"line":5,"column":2}},
  "errors":[],
  "body":[
    {"type":"Decl","name":"MainWindow","base":"UIWidget","loc":{...},"body":[
      {"type":"KV","key":"id","category":"BEHAVIOR","value":{"type":"Identifier","name":"main","loc":{...}},"loc":{...}},
      {"type":"KV","key":"width","category":"GEOMETRY","value":{"type":"NumberLiteral","value":300,"loc":{...}},"loc":{...}},
      {"type":"KV","key":"text","category":"STYLE","value":{"type":"StringLiteral","value":"Hello","loc":{...}},"loc":{...}}
]}
]
}
```

---
# # 2) Lua‑Lite — AST i zakres parsera
> Celem jest lekki AST do potrzeb IDE (symbole, funkcje, wywołania, literały, tabele). Nie jest to pełna interpretacja Lua.
# # # 2.1 Zakres tokenów/węzłów
- **Węzły:** `Chunk, LocalStatement, Assignment, FunctionDecl, CallStatement, CallExpr, Identifier, StringLiteral, NumberLiteral, BooleanLiteral, NilLiteral, TableConstructor, TableField, ReturnStatement, IfStatement (nagłówki), DoBlock (prosty)`.
- **Pomijane:** złożone metatablice, goto/label (oznacz jako `UnknownNode`).
# # # 2.2 Lua‑Lite AST — JSON Schema
```json
{
  "$id": "https://schemas.otc.studio/lua-lite-ast.schema.json",
  "$schema": "https://json-schema.org/draft/2020-12/schema",
  "title": "Lua-Lite AST",
  "type": "object",
  "required": ["type","loc","body"],
  "properties": {
    "type": {"const": "Chunk"},
    "loc": {"$ref": "#/definitions/Loc"},
    "errors": {"type":"array","items":{"$ref":"#/definitions/ParseError"}},
    "body": {"type":"array","items":{"$ref":"#/definitions/Stmt"}}
},
  "definitions": {
    "Loc": {"type":"object","required":["file","start","end"],"properties":{"file":{"type":"string"},"start":{"$ref":"#/definitions/Pos"},"end":{"$ref":"#/definitions/Pos"}}},
    "Pos": {"type":"object","required":["offset","line","column"],"properties":{"offset":{"type":"integer","minimum":0},"line":{"type":"integer","minimum":1},"column":{"type":"integer","minimum":1}}},
    "ParseError": {"type":"object","required":["code","message","loc"],"properties":{"code":{"type":"string"},"message":{"type":"string"},"loc":{"$ref":"#/definitions/Loc"}}},

    "Stmt": {"oneOf":[
      {"$ref":"#/definitions/LocalStatement"},
      {"$ref":"#/definitions/Assignment"},
      {"$ref":"#/definitions/FunctionDecl"},
      {"$ref":"#/definitions/CallStatement"},
      {"$ref":"#/definitions/ReturnStatement"},
      {"$ref":"#/definitions/IfStatement"},
      {"$ref":"#/definitions/DoBlock"}
    ]},

    "Expr": {"oneOf":[
      {"$ref":"#/definitions/Identifier"},
      {"$ref":"#/definitions/StringLiteral"},
      {"$ref":"#/definitions/NumberLiteral"},
      {"$ref":"#/definitions/BooleanLiteral"},
      {"$ref":"#/definitions/NilLiteral"},
      {"$ref":"#/definitions/CallExpr"},
      {"$ref":"#/definitions/TableConstructor"}
    ]},

    "Identifier": {"type":"object","required":["type","name","loc"],"properties":{"type":{"const":"Identifier"},"name":{"type":"string"},"loc":{"$ref":"#/definitions/Loc"}}},
    "StringLiteral": {"type":"object","required":["type","value","loc"],"properties":{"type":{"const":"StringLiteral"},"value":{"type":"string"},"loc":{"$ref":"#/definitions/Loc"}}},
    "NumberLiteral": {"type":"object","required":["type","value","loc"],"properties":{"type":{"const":"NumberLiteral"},"value":{"type":"number"},"loc":{"$ref":"#/definitions/Loc"}}},
    "BooleanLiteral": {"type":"object","required":["type","value","loc"],"properties":{"type":{"const":"BooleanLiteral"},"value":{"type":"boolean"},"loc":{"$ref":"#/definitions/Loc"}}},
    "NilLiteral": {"type":"object","required":["type","loc"],"properties":{"type":{"const":"NilLiteral"},"loc":{"$ref":"#/definitions/Loc"}}},

    "LocalStatement": {"type":"object","required":["type","names","values","loc"],"properties":{"type":{"const":"LocalStatement"},"names":{"type":"array","items":{"$ref":"#/definitions/Identifier"}},"values":{"type":"array","items":{"$ref":"#/definitions/Expr"}},"loc":{"$ref":"#/definitions/Loc"}}},
    "Assignment": {"type":"object","required":["type","targets","values","loc"],"properties":{"type":{"const":"Assignment"},"targets":{"type":"array","items":{"$ref":"#/definitions/Expr"}},"values":{"type":"array","items":{"$ref":"#/definitions/Expr"}},"loc":{"$ref":"#/definitions/Loc"}}},
    "FunctionDecl": {"type":"object","required":["type","name","params","body","loc"],"properties":{"type":{"const":"FunctionDecl"},"name":{"$ref":"#/definitions/Expr"},"params":{"type":"array","items":{"$ref":"#/definitions/Identifier"}},"body":{"type":"array","items":{"$ref":"#/definitions/Stmt"}},"loc":{"$ref":"#/definitions/Loc"}}},
    "CallStatement": {"type":"object","required":["type","expression","loc"],"properties":{"type":{"const":"CallStatement"},"expression":{"$ref":"#/definitions/CallExpr"},"loc":{"$ref":"#/definitions/Loc"}}},
    "CallExpr": {"type":"object","required":["type","callee","args","method","loc"],"properties":{"type":{"const":"CallExpr"},"callee":{"$ref":"#/definitions/Expr"},"args":{"type":"array","items":{"$ref":"#/definitions/Expr"}},"method":{"type":["string","null"]},"loc":{"$ref":"#/definitions/Loc"}}},
    "TableConstructor": {"type":"object","required":["type","fields","loc"],"properties":{"type":{"const":"TableConstructor"},"fields":{"type":"array","items":{"$ref":"#/definitions/TableField"}},"loc":{"$ref":"#/definitions/Loc"}}},
    "TableField": {"type":"object","required":["type","key","value","loc"],"properties":{"type":{"const":"TableField"},"key":{"oneOf":[{"$ref":"#/definitions/Identifier"},{"$ref":"#/definitions/StringLiteral"},{"$ref":"#/definitions/NumberLiteral"},{"type":"null"}]},"value":{"$ref":"#/definitions/Expr"},"loc":{"$ref":"#/definitions/Loc"}}},
    "ReturnStatement": {"type":"object","required":["type","arguments","loc"],"properties":{"type":{"const":"ReturnStatement"},"arguments":{"type":"array","items":{"$ref":"#/definitions/Expr"}},"loc":{"$ref":"#/definitions/Loc"}}},
    "IfStatement": {"type":"object","required":["type","clauses","loc"],"properties":{"type":{"const":"IfStatement"},"clauses":{"type":"array","items":{"$ref":"#/definitions/IfClause"}},"loc":{"$ref":"#/definitions/Loc"}}},
    "IfClause": {"type":"object","required":["type","test","consequent","loc"],"properties":{"type":{"const":"IfClause"},"test":{"$ref":"#/definitions/Expr"},"consequent":{"type":"array","items":{"$ref":"#/definitions/Stmt"}},"loc":{"$ref":"#/definitions/Loc"}}},
    "DoBlock": {"type":"object","required":["type","body","loc"],"properties":{"type":{"const":"DoBlock"},"body":{"type":"array","items":{"$ref":"#/definitions/Stmt"}},"loc":{"$ref":"#/definitions/Loc"}}}
}
}
```
# # # 2.3 Mapowanie zdarzeń/symboli istotnych dla OTClient/vBot
- Wykrywanie `g_ui.loadUI("…")` → relacja `lua_to_otui`.
- Wykrywanie `dofile("…")`/`require("…")` → relacja `includes`.
- Heurystyki vBot: identyfikuj wywołania `macro(`, callbacki `onTextMessage`, `onCreatureHealth`, itp. → taguj w indeksie jako `botSymbols`.

---
# # 3) Kontrakty walidacji artefaktów (JSON Schema)
# # # 3.1 `resources/api.json`
```json
{
  "$id": "https://schemas.otc.studio/api.schema.json",
  "$schema": "https://json-schema.org/draft/2020-12/schema",
  "title": "API Catalogue",
  "type": "object",
  "required": ["$schemaVersion","functions","events","objects"],
  "properties": {
    "$schemaVersion": {"type":"integer","minimum":1},
    "generatedAt": {"type":"string","format":"date-time"},
    "functions": {
      "type":"array",
      "uniqueItems": true,
      "items": {
        "type":"object",
        "required":["name","module","params","returns","description"],
        "properties": {
          "name": {"type":"string","pattern":"^[A-Za-z_][A-Za-z0-9_\.:]*$"},
          "module": {"type":"string"},
          "params": {"type":"array","items":{"type":"object","required":["name","type"],"properties":{"name":{"type":"string"},"type":{"type":"string"},"optional":{"type":"boolean"}}}},
          "returns": {"type":"array","items":{"type":"object","required":["type"],"properties":{"type":{"type":"string"}}}},
          "description": {"type":"string"},
          "examples": {"type":"array","items":{"type":"string"}},
          "since": {"type":"string"},
          "deprecated": {"type":"boolean"}
}
}
},
    "events": {"type":"array","items":{"type":"object","required":["name","target","payload"],"properties":{"name":{"type":"string"},"target":{"type":"string"},"payload":{"type":"array","items":{"type":"object","required":["name","type"],"properties":{"name":{"type":"string"},"type":{"type":"string"}}}},"description":{"type":"string"}}}},
    "objects": {"type":"array","items":{"type":"object","required":["name","description"],"properties":{"name":{"type":"string"},"members":{"type":"array","items":{"oneOf":[{"type":"string"},{"type":"object"}]}},"description":{"type":"string"}}}}
}
}
```
# # # 3.2 `project-index.json`
```json
{
  "$id": "https://schemas.otc.studio/project-index.schema.json",
  "$schema": "https://json-schema.org/draft/2020-12/schema",
  "title": "Project Index",
  "type": "object",
  "required": ["$schemaVersion","root","files","symbols","relations"],
  "properties": {
    "$schemaVersion": {"type":"integer","minimum":1},
    "root": {"type":"string"},
    "files": {"type":"object","required":["lua","otui","otmod"],"properties":{"lua":{"type":"array","items":{"type":"string"}},"otui":{"type":"array","items":{"type":"string"}},"otmod":{"type":"array","items":{"type":"string"}}}},
    "symbols": {"type":"object","properties":{"functions":{"type":"object","additionalProperties":{"type":"array","items":{"type":"string"}}},"widgets":{"type":"object","additionalProperties":{"type":"array","items":{"type":"string"}}},"botSymbols":{"type":"object","additionalProperties":{"type":"array","items":{"type":"string"}}}}},
    "relations": {"type":"object","properties":{"lua_to_otui":{"type":"array","items":{"type":"object","required":["lua","otui","via"],"properties":{"lua":{"type":"string"},"otui":{"type":"string"},"via":{"type":"string"}}}},"includes":{"type":"array","items":{"type":"object","required":["from","to","via"],"properties":{"from":{"type":"string"},"to":{"type":"string"},"via":{"type":"string"}}}}}}
}
}
```
# # # 3.3 `otui-rules.json`
```json
{
  "$id": "https://schemas.otc.studio/otui-rules.schema.json",
  "$schema": "https://json-schema.org/draft/2020-12/schema",
  "title": "OTUI Lint Rules",
  "type": "object",
  "required": ["$schemaVersion","rules"],
  "properties": {
    "$schemaVersion": {"type":"integer","minimum":1},
    "rules": {"type":"array","items":{"type":"object","required":["id","description","fixable"],"properties":{"id":{"type":"string"},"description":{"type":"string"},"fixable":{"type":"boolean"}}}}
}
}
```
# # # 3.4 `templates.json`
```json
{
  "$id": "https://schemas.otc.studio/templates.schema.json",
  "$schema": "https://json-schema.org/draft/2020-12/schema",
  "title": "Generator Templates",
  "type": "object",
  "required": ["$schemaVersion"],
  "properties": {
    "$schemaVersion": {"type":"integer","minimum":1}
},
  "additionalProperties": {
    "type": "object",
    "required": ["title","files","checklist"],
    "properties": {
      "title": {"type":"string"},
      "files": {"type":"array","items":{"type":"object","required":["path","contents"],"properties":{"path":{"type":"string"},"contents":{"type":"string"}}}},
      "checklist": {"type":"array","items":{"type":"string"}}
}
}
}
```
# # # 3.5 `docstrings.json`
```json
{
  "$id": "https://schemas.otc.studio/docstrings.schema.json",
  "$schema": "https://json-schema.org/draft/2020-12/schema",
  "title": "Docstrings Index",
  "type": "object",
  "required": ["$schemaVersion","entries"],
  "properties": {
    "$schemaVersion": {"type":"integer","minimum":1},
    "entries": {"type":"array","items":{"type":"object","required":["file","line","symbol"],"properties":{"file":{"type":"string"},"line":{"type":"integer","minimum":1},"symbol":{"type":"string"},"params":{"type":"array","items":{"type":"object","required":["name","type"],"properties":{"name":{"type":"string"},"type":{"type":"string"}}}},"returns":{"type":"array","items":{"type":"object","required":["type"],"properties":{"type":{"type":"string"}}}},"comment":{"type":"string"}}}}
}
}
```
# # # 3.6 `assets-map.json`
```json
{
  "$id": "https://schemas.otc.studio/assets-map.schema.json",
  "$schema": "https://json-schema.org/draft/2020-12/schema",
  "title": "Assets Map",
  "type": "object",
  "required": ["$schemaVersion","assets"],
  "properties": {
    "$schemaVersion": {"type":"integer","minimum":1},
    "assets": {"type":"object","properties":{"images":{"type":"array","items":{"type":"string"}},"fonts":{"type":"array","items":{"type":"string"}},"styles":{"type":"array","items":{"type":"string"}}}}
}
}
```
# # # 3.7 `.studio/config.json`
```json
{
  "$id": "https://schemas.otc.studio/studio-config.schema.json",
  "$schema": "https://json-schema.org/draft/2020-12/schema",
  "title": "Studio Config",
  "type": "object",
  "required": ["$schemaVersion","projectRoot","apiPath","otuiRulesPath","templatesPath","logPath","ignore"],
  "properties": {
    "$schemaVersion": {"type":"integer","minimum":1},
    "projectRoot": {"type":"string"},
    "apiPath": {"type":"string"},
    "otuiRulesPath": {"type":"string"},
    "templatesPath": {"type":"string"},
    "logPath": {"type":"string"},
    "ignore": {"type":"array","items":{"type":"string"}}
}
}
```
# # # 3.8 `ndjson` (schemat pojedynczej linii logu)
```json
{
  "$id": "https://schemas.otc.studio/log-line.schema.json",
  "$schema": "https://json-schema.org/draft/2020-12/schema",
  "title": "Log Line (NDJSON)",
  "type": "object",
  "required": ["ts","level","msg"],
  "properties": {
    "ts": {"type":"string","format":"date-time"},
    "level": {"type":"string","enum":["DEBUG","INFO","WARN","ERROR"]},
    "tag": {"type":["string","null"]},
    "file": {"type":["string","null"]},
    "line": {"type":["integer","null"],"minimum":1},
    "msg": {"type":"string"},
    "meta": {"type":["object","array","string","number","boolean","null"]}
}
}
```

---
# # 4) Kontrakty IPC (Parser Service)
**Kanały:**
- `parser:otui:parse` → req: `{path | content}` → res: `OTUIFile` (AST) + `errors[]`.
- `parser:lua:parse` → req: `{path | content}` → res: `Chunk` (AST) + `errors[]`.
- `parser:scan:index` → req: `{root}` → res: `project-index.json`.
- `parser:docstrings` → req: `{files[]}` → res: `docstrings.json`.

**Błędy:** `{code,msg,loc?}`; kody wg §7.

---
# # 5) Reguły walidacji i jakości
- **JSON Schema gates:** każda emisja `*.json` walidowana przed zapisem; błąd = rollback.
- **Stabilne sortowanie:** listy sortuj po `loc.start.offset` lub alfabetycznie (klucze obiektów alfabetycznie).
- **Backupy:** przy auto‑fix zapisz `*.bak` + diff.
- **Hash indeksu:** `sha1(size+mtime)` dla cache inkrementalnego.

---
# # 6) Test vectors (próbki wejścia/wyjścia)
# # # 6.1 OTUI proste
Wejście `main.otui`:
```otui
Window < UIWidget {
  id: root
  width: 320
  text: "Title"
}
```
Oczekiwany AST: zgodny ze schematem §1.2 (sprawdź kategorie: id→BEHAVIOR, width→GEOMETRY, text→STYLE).
# # # 6.2 Lua‑Lite — symbole
Wejście `client.lua`:
```lua
local M = {}
function M.reload()
  g_modules.reloadModules()
end
M.init = function()
  g_ui.loadUI('ui/main.otui')
end
return M
```
Oczekiwane relacje: `lua_to_otui[0].otui == 'ui/main.otui'`; wykryta funkcja `M.reload` + wywołanie `g_modules.reloadModules`.
# # # 6.3 `api.json` – walidacja
Ziarno z dokumentu MASTER musi przejść `api.schema.json`; nazwy funkcji zgodne z regex.

---
# # 7) Kody błędów i odzyskiwanie
- **LUA_001**: nieoczekiwany token → pomiń do `;`/końca linii/bloku.
- **LUA_101**: niezamknięta lista argumentów → zamknij heurystycznie przy `)` najbliższym.
- **OTUI_001**: niezamknięty blok `{` → domknij na końcu pliku, dodaj ParseError.
- **OTUI_101**: niepoprawny literał → potraktuj jako `Identifier` i zarejestruj błąd.
- **OTMOD_001**: brak `name` → błąd twardy (blokuj generator).
- **GEN_500**: błąd I/O → spróbuj ponownie raz, potem fail.

---
# # 8) Wydajność i limity
- AST do 2 MB pliku w < 200 ms (cel); duże pliki: tryb „big-file” (bez części analiz).
- Indeks projektu 5k plików: < 5 s z cache, < 30 s zimny start.
- Zużycie pamięci: < 500 MB dla indeksu 5k plików.

---
# # 9) Checklisty wdrożeniowe (dla tej warstwy)
- [ ] Zaimplementowane parsery (OTUI, Lua‑Lite) zgodnie z §1 i §2.
- [ ] Emisja AST z `loc`, `errors`, deterministycznym sortem.
- [ ] JSON Schemy z §3 włączone w walidację przed zapisem.
- [ ] IPC z §4 – kontrakty pokryte testami kontraktowymi.
- [ ] Test vectors z §6 – zielone snapshoty AST i indeksów.
- [ ] Pomiar czasu/zużycia pamięci – w normie §8.

---
# # 10) Noty
- Reguła `tr()` dla statycznych tekstów w OTUI bywa zależna od bazy – przewidziana jako **opcja** w `otui-rules.json`.
- Schematy wykorzystują Draft 2020‑12; możliwa migracja wstecz do Draft‑07 (wymaga drobnych zmian słowników).

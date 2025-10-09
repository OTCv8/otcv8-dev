---
doc_id: "lua-spec-78955f7be725"
source_path: "client_textedit/textedit.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:04Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: textedit.lua"
summary: "Dokumentacja modułu Lua dla client_textedit/textedit.lua"
tags: ["lua", "module", "otclient"]
---

# client_textedit/textedit.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla textedit.

## Functions

### `init()`

### `terminate()`

### `destroyWindow()`

### `show(text, options, callback)`

also works as show(text, callback)

**Parametry:**

- `text`
- `options`
- `callback`

### `callback(newText)`

**Parametry:**

- `newText`

### `window.onDestroy()`

### `window.examples.onOptionChange(widget, option, data)`

**Parametry:**

- `widget`
- `option`
- `data`

### `window.text.onTextChange(widget, text)`

**Parametry:**

- `widget`
- `text`

### `hide()`

### `edit(...)`

**Parametry:**

- `...`

### `singlelineEditor(text, callback)`

legacy

**Parametry:**

- `text`
- `callback`

### `multilineEditor(description, text, callback)`

legacy

**Parametry:**

- `description`
- `text`
- `callback`

## Events/Callbacks

### `importStyle`

**Wywołanie:** `g_ui.importStyle('textedit')`

### `g_game`

**Wywołanie:** `connect(g_game, { onGameEnd = destroyWindow })`

### `g_game`

**Wywołanie:** `disconnect(g_game, { onGameEnd = destroyWindow })`

### `createWidget`

**Wywołanie:** `window = g_ui.createWidget('MultilineTextEditWindow', rootWidget)`

### `createWidget`

**Wywołanie:** `window = g_ui.createWidget('SinglelineTextEditWindow', rootWidget)`

### `umber`

**Wywołanie:** `local value = tonumber(text)`

### `eFunc`

**Wywołanie:** `doneFunc()`

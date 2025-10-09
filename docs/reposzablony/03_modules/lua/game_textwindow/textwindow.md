---
doc_id: "lua-spec-b5637be6685a"
source_path: "game_textwindow/textwindow.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:06Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: textwindow.lua"
summary: "Dokumentacja modułu Lua dla game_textwindow/textwindow.lua"
tags: ["lua", "module", "otclient"]
---

# game_textwindow/textwindow.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla textwindow.

## Globals/Exports

### `windows`

### `windows`

## Functions

### `init()`

### `terminate()`

### `destroyWindows()`

### `onGameEditText(id, itemId, maxLength, text, writer, time)`

**Parametry:**

- `id`
- `itemId`
- `maxLength`
- `text`
- `writer`
- `time`

### `destroy()`

### `onGameEditList(id, doorId, text)`

**Parametry:**

- `id`
- `doorId`
- `text`

### `destroy()`

## Events/Callbacks

### `importStyle`

**Wywołanie:** `g_ui.importStyle('textwindow')`

### `g_game`

**Wywołanie:** `connect(g_game, { onEditText = onGameEditText,`

### `g_game`

**Wywołanie:** `disconnect(g_game, { onEditText = onGameEditText,`

### `GameEditText`

**Wywołanie:** `function onGameEditText(id, itemId, maxLength, text, writer, time)`

### `createWidget`

**Wywołanie:** `local textWindow = g_ui.createWidget('TextWindow', rootWidget)`

### `GameEditList`

**Wywołanie:** `function onGameEditList(id, doorId, text)`

### `createWidget`

**Wywołanie:** `local textWindow = g_ui.createWidget('TextWindow', rootWidget)`

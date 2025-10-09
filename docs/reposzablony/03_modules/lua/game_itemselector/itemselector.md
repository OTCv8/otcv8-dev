---
doc_id: "lua-spec-6c499c16de95"
source_path: "game_itemselector/itemselector.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: itemselector.lua"
summary: "Dokumentacja modułu Lua dla game_itemselector/itemselector.lua"
tags: ["lua", "module", "otclient"]
---

# game_itemselector/itemselector.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla itemselector.

## Functions

### `init()`

### `terminate()`

### `destroyWindow()`

### `show(itemWidget)`

**Parametry:**

- `itemWidget`

### `window.itemId.onValueChange(widget, value)`

**Parametry:**

- `widget`
- `value`

### `window.itemCount.onValueChange(widget, value)`

**Parametry:**

- `widget`
- `value`

### `hide()`

## Events/Callbacks

### `importStyle`

**Wywołanie:** `g_ui.importStyle('itemselector')`

### `g_game`

**Wywołanie:** `connect(g_game, { onGameEnd = destroyWindow })`

### `g_game`

**Wywołanie:** `disconnect(g_game, { onGameEnd = destroyWindow })`

### `createWidget`

**Wywołanie:** `local window = g_ui.createWidget('ItemSelectorWindow', rootWidget)`

### `eFunc`

**Wywołanie:** `doneFunc()`

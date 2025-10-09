---
doc_id: "lua-spec-4a089d5a9ebd"
source_path: "client_terminal/commands.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:04Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: commands.lua"
summary: "Dokumentacja modułu Lua dla client_terminal/commands.lua"
tags: ["lua", "module", "otclient"]
---

# client_terminal/commands.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla commands.

## Functions

### `pcolored(text, color)`

**Parametry:**

- `text`
- `color`

### `draw_debug_boxes()`

### `hide_map()`

### `show_map()`

### `pingBack(ping)`

**Parametry:**

- `ping`

### `ping()`

### `clear()`

### `ls(path)`

**Parametry:**

- `path`

### `about_version()`

### `about_graphics()`

### `about_modules()`

## Events/Callbacks

### `setDebugBoxesDrawing`

**Wywołanie:** `g_ui.setDebugBoxesDrawing(not g_ui.isDrawingDebugBoxes())`

### `g_game`

**Wywołanie:** `disconnect(g_game, 'onPingBack', pingBack)`

### `g_game`

**Wywołanie:** `connect(g_game, 'onPingBack', pingBack)`

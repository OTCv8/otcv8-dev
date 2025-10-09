---
doc_id: "lua-spec-90089c7d714d"
source_path: "game_bot/functions/icon.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: icon.lua"
summary: "Dokumentacja modułu Lua dla game_bot/functions/icon.lua"
tags: ["lua", "module", "otclient"]
---

# game_bot/functions/icon.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla icon.

## Functions

### `context.addIcon(id, options, callback)`

**Parametry:**

- `id`
- `options`
- `callback`

### `widget.setOn(val)`

**Parametry:**

- `val`

### `widget.onClick(widget)`

**Parametry:**

- `widget`

### `widget.onDragEnter(widget, mousePos)`

**Parametry:**

- `widget`
- `mousePos`

### `widget.onDragMove(widget, mousePos, moved)`

**Parametry:**

- `widget`
- `mousePos`
- `moved`

### `widget.onDragLeave(widget, pos)`

**Parametry:**

- `widget`
- `pos`

### `widget.onGeometryChange(widget)`

**Parametry:**

- `widget`

### `widget.onMouseRelease()`

## Events/Callbacks

### `createWidget`

**Wywołanie:** `local widget = g_ui.createWidget("BotIcon", panel)`

### `Click`

**Wywołanie:** `widget:onClick()`

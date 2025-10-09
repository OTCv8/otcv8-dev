---
doc_id: "lua-spec-4e3045898c98"
source_path: "client_mobile/mobile.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:04Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: mobile.lua"
summary: "Dokumentacja modułu Lua dla client_mobile/mobile.lua"
tags: ["lua", "module", "otclient"]
---

# client_mobile/mobile.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla mobile.

## Functions

### `init()`

public functions

### `terminate()`

### `hide()`

### `show()`

### `online()`

### `offline()`

### `onMouseMove(widget, pos, offset)`

**Parametry:**

- `widget`
- `pos`
- `offset`

### `onMousePress(widget, pos, button)`

**Parametry:**

- `widget`
- `pos`
- `button`

### `onMouseRelease(widget, pos, button)`

**Parametry:**

- `widget`
- `pos`
- `button`

### `updateCursor()`

### `onKeypadTouchMove(widget, pos, offset)`

**Parametry:**

- `widget`
- `pos`
- `offset`

### `onKeypadTouchPress(widget, pos, button)`

**Parametry:**

- `widget`
- `pos`
- `button`

### `onKeypadTouchRelease(widget, pos, button)`

**Parametry:**

- `widget`
- `pos`
- `button`

### `executeWalk()`

## Events/Callbacks

### `displayUI`

**Wywołanie:** `overlay = g_ui.displayUI('mobile')`

### `overlay`

**Wywołanie:** `connect(overlay, {`

### `keypad`

**Wywołanie:** `connect(keypad, {`

### `g_game`

**Wywołanie:** `connect(g_game, {`

### `line`

**Wywołanie:** `online()`

### `overlay`

**Wywołanie:** `disconnect(overlay, {`

### `keypad`

**Wywołanie:** `disconnect(keypad, {`

### `g_game`

**Wywołanie:** `disconnect(g_game, {`

### `line`

**Wywołanie:** `function online()`

### `MouseMove`

**Wywołanie:** `function onMouseMove(widget, pos, offset)`

### `MousePress`

**Wywołanie:** `function onMousePress(widget, pos, button)`

### `MouseRelease`

**Wywołanie:** `function onMouseRelease(widget, pos, button)`

### `KeypadTouchMove`

**Wywołanie:** `function onKeypadTouchMove(widget, pos, offset)`

### `KeypadTouchPress`

**Wywołanie:** `function onKeypadTouchPress(widget, pos, button)`

### `KeypadTouchRelease`

**Wywołanie:** `function onKeypadTouchRelease(widget, pos, button)`

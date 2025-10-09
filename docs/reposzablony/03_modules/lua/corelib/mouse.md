---
doc_id: "lua-spec-74e910974875"
source_path: "corelib/mouse.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: mouse.lua"
summary: "Dokumentacja modułu Lua dla corelib/mouse.lua"
tags: ["lua", "module", "otclient"]
---

# corelib/mouse.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla mouse.

## Functions

### `g_mouse.bindAutoPress(widget, callback, delay, button)`

@docclass

**Parametry:**

- `widget`
- `callback`
- `delay`
- `button`

### `g_mouse.bindPressMove(widget, callback)`

**Parametry:**

- `widget`
- `callback`

### `g_mouse.bindPress(widget, callback, button)`

**Parametry:**

- `widget`
- `callback`
- `button`

## Events/Callbacks

### `widget`

**Wywołanie:** `connect(widget, { onMousePress = function(widget, mousePos, mouseButton)`

### `widget`

**Wywołanie:** `connect(widget, { onMouseMove = function(widget, mousePos, mouseMoved)`

### `widget`

**Wywołanie:** `connect(widget, { onMousePress = function(widget, mousePos, mouseButton)`

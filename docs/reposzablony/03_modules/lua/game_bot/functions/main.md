---
doc_id: "lua-spec-88592461e4e3"
source_path: "game_bot/functions/main.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: main.lua"
summary: "Dokumentacja modułu Lua dla game_bot/functions/main.lua"
tags: ["lua", "module", "otclient"]
---

# game_bot/functions/main.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla main.

## Functions

### `context.macro(timeout, name, hotkey, callback, parent)`

MAIN BOT FUNCTION macro(timeout, callback) macro(timeout, name, callback) macro(timeout, name, callback, parent) macro(timeout, name, hotkey, callback) macro(timeout, name, hotkey, callback, parent)

**Parametry:**

- `timeout`
- `name`
- `hotkey`
- `callback`
- `parent`

### `macro.isOn()`

### `macro.isOff()`

### `macro.toggle(widget)`

**Parametry:**

- `widget`

### `macro.setOn(val)`

**Parametry:**

- `val`

### `macro.setOff(val)`

**Parametry:**

- `val`

### `macro.callback(macro)`

**Parametry:**

- `macro`

### `context.hotkey(keys, name, callback, parent, single)`

hotkey(keys, callback) hotkey(keys, name, callback) hotkey(keys, name, callback, parent)

**Parametry:**

- `keys`
- `name`
- `callback`
- `parent`
- `single`

### `hotkeyData.callback()`

### `context.singlehotkey(keys, name, callback, parent)`

singlehotkey(keys, callback) singlehotkey(keys, name, callback) singlehotkey(keys, name, callback, parent)

**Parametry:**

- `keys`
- `name`
- `callback`
- `parent`

### `context.schedule(timeout, callback)`

schedule(timeout, callback)

**Parametry:**

- `timeout`
- `callback`

### `context.delay(duration)`

delay(duration) -- block execution of current macro/hotkey/callback for x milliseconds

**Parametry:**

- `duration`

## Events/Callbacks

### `event`

**Wywołanie:** `-- schedule(timeout, callback)`

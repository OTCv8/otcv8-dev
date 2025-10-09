---
doc_id: "lua-spec-16fc7712f2f9"
source_path: "game_bot/functions/config.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: config.lua"
summary: "Dokumentacja modułu Lua dla game_bot/functions/config.lua"
tags: ["lua", "module", "otclient"]
---

# game_bot/functions/config.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla config.

## Functions

### `Config.exist(dir)`

**Parametry:**

- `dir`

### `Config.create(dir)`

**Parametry:**

- `dir`

### `Config.list(dir)`

**Parametry:**

- `dir`

### `Config.parse(data)`

load config from string insteaf of file

**Parametry:**

- `data`

### `Config.load(dir, name)`

**Parametry:**

- `dir`
- `name`

### `Config.loadRaw(dir, name)`

**Parametry:**

- `dir`
- `name`

### `Config.save(dir, name, value, forcedExtension)`

**Parametry:**

- `dir`
- `name`
- `value`
- `forcedExtension`

### `Config.remove(dir, name)`

**Parametry:**

- `dir`
- `name`

### `Config.setup(dir, widget, configExtension, callback)`

setup is used for BotConfig widget not done yet

**Parametry:**

- `dir`
- `widget`
- `configExtension`
- `callback`

### `widget.list.onOptionChange(widget)`

**Parametry:**

- `widget`

### `widget.switch.onClick()`

### `widget.add.onClick()`

### `widget.edit.onClick()`

### `widget.remove.onClick()`

### `isOn()`

### `isOff()`

### `setOn(val)`

**Parametry:**

- `val`

### `setOff(val)`

**Parametry:**

- `val`

### `save(data)`

**Parametry:**

- `data`

### `getActiveConfigName()`

## Events/Callbacks

### `tents`

**Wywołanie:** `local data = g_resources.readFileContents(file)`

### `fig`

**Wywołanie:** `context.error("Invalid json config (" .. name .. "): " .. result)`

### `tents`

**Wywołanie:** `return table.decodeStringPairList(g_resources.readFileContents(file))`

### `fig`

**Wywołanie:** `context.error("Invalid cfg config (" .. name .. "): " .. result)`

### `tents`

**Wywołanie:** `return g_resources.readFileContents(file)`

### `tents`

**Wywołanie:** `return g_resources.readFileContents(file)`

### `tents`

**Wywołanie:** `g_resources.writeFileContents(file .. ".cfg", table.encodeStringPairList(value))`

### `tents`

**Wywołanie:** `g_resources.writeFileContents(file .. ".json", json.encode(value, 2))`

### `tents`

**Wywołanie:** `g_resources.writeFileContents(file, json.encode({}))`

### `tents`

**Wywołanie:** `g_resources.writeFileContents(file, "")`

### `firmationWindow`

**Wywołanie:** `context.UI.ConfirmationWindow("Config removal", "Do you want to remove config " .. name .. " from " .. dir .. "?", function()`

### `Click`

**Wywołanie:** `widget.switch:onClick()`

### `Click`

**Wywołanie:** `widget.switch:onClick()`

### `Click`

**Wywołanie:** `widget.switch:onClick()`

### `Click`

**Wywołanie:** `widget.switch:onClick()`

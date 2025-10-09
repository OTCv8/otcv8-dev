---
doc_id: "lua-spec-cf14b70cc25f"
source_path: "game_bot/default_configs/vBot_4.8/cavebot/config.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: config.lua"
summary: "Dokumentacja modułu Lua dla game_bot/default_configs/vBot_4.8/cavebot/config.lua"
tags: ["lua", "module", "otclient"]
---

# game_bot/default_configs/vBot_4.8/cavebot/config.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla config.

## Functions

### `CaveBot.Config.setup()`

### `CaveBot.Config.show()`

### `CaveBot.Config.hide()`

### `CaveBot.Config.onConfigChange(configName, isEnabled, configData)`

**Parametry:**

- `configName`
- `isEnabled`
- `configData`

### `CaveBot.Config.save()`

### `CaveBot.Config.add(id, title, defaultValue)`

**Parametry:**

- `id`
- `title`
- `defaultValue`

### `setter(value)`

**Parametry:**

- `value`

### `panel.value.onTextChange(widget, newValue)`

**Parametry:**

- `widget`
- `newValue`

### `setter(value)`

**Parametry:**

- `value`

### `panel.value.onClick(widget)`

**Parametry:**

- `widget`

### `CaveBot.Config.get(id)`

**Parametry:**

- `id`

### `CaveBot.Config.set(id, value)`

**Parametry:**

- `id`
- `value`

## Events/Callbacks

### `umber`

**Wywołanie:** `newValue = tonumber(newValue)`

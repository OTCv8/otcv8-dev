---
doc_id: "lua-spec-0082e124ef2d"
source_path: "game_bot/panels/looting.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: looting.lua"
summary: "Dokumentacja modułu Lua dla game_bot/panels/looting.lua"
tags: ["lua", "module", "otclient"]
---

# game_bot/panels/looting.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla looting.

## Globals/Exports

### `items`

### `itemsByKey`

### `containers`

### `commands`

## Functions

### `Panels.Looting(parent)`

**Parametry:**

- `parent`

### `refreshConfig(focusIndex)`

**Parametry:**

- `focusIndex`

### `ui.config.onOptionChange(widget)`

**Parametry:**

- `widget`

### `ui.enableButton.onClick()`

### `ui.add.onClick()`

### `ui.edit.onClick()`

### `ui.remove.onClick()`

## Events/Callbacks

### `fig`

**Wywołanie:** `refreshConfig(focusIndex)`

### `umber`

**Wywołanie:** `local commandAsNumber = tonumber(command)`

### `umber`

**Wywołanie:** `local textAsNumber = tonumber(text)`

### `createWidget`

**Wywołanie:** `local widget = g_ui.createWidget("BotItem", ui.items)`

### `figName`

**Wywołanie:** `local name = getConfigName(config)`

### `fig`

**Wywołanie:** `parseConfig(context.storage.looting.configs[context.storage.looting.activeConfig])`

### `fig`

**Wywołanie:** `context.saveConfig()`

### `fig`

**Wywołanie:** `refreshConfig()`

### `fig`

**Wywołanie:** `refreshConfig()`

### `fig`

**Wywołanie:** `refreshConfig()`

### `fig`

**Wywołanie:** `refreshConfig()`

### `fig`

**Wywołanie:** `refreshConfig()`

### `fig`

**Wywołanie:** `refreshConfig()`

### `ContainerOpen`

**Wywołanie:** `context.onContainerOpen(function(container, prevContainer)`

### `tainers`

**Wywołanie:** `for containerId, container in pairs(g_game.getContainers()) do`

### `tainerItem`

**Wywołanie:** `local containerItem = container:getContainerItem()`

### `tainer`

**Wywołanie:** `if item and item:isContainer() and containers[item:getId()] ~= nil then`

### `tainer`

**Wywołanie:** `if item:isContainer() then`

### `tainer`

**Wywołanie:** `if item:isContainer() and containers[item:getId()] ~= nil then`

### `event`

if more than 1 container, open them in new window

**Wywołanie:** `context.schedule(delay, function()`

### `event`

**Wywołanie:** `context.schedule(delay, function()`

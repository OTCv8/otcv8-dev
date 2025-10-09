---
doc_id: "lua-spec-1bdb6e57afcb"
source_path: "game_bot/panels/waypoints.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: waypoints.lua"
summary: "Dokumentacja modułu Lua dla game_bot/panels/waypoints.lua"
tags: ["lua", "module", "otclient"]
---

# game_bot/panels/waypoints.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla waypoints.

## Globals/Exports

### `commands`

## Functions

### `Panels.Waypoints(parent)`

**Parametry:**

- `parent`

### `ui.config.onOptionChange(widget)`

**Parametry:**

- `widget`

### `ui.enableButton.onClick()`

### `ui.add.onClick()`

### `ui.edit.onClick()`

### `ui.remove.onClick()`

### `ui.wGoto.onClick()`

### `ui.wUse.onClick()`

### `ui.wUseWith.onClick()`

### `ui.wWait.onClick()`

### `ui.wSay.onClick()`

### `ui.wNpc.onClick()`

### `ui.wLabel.onClick()`

### `ui.wFollow.onClick()`

### `ui.wFunction.onClick()`

### `ui.recording.onClick()`

### `enable()`

### `disable()`

### `refresh()`

### `wait(peroid)`

**Parametry:**

- `peroid`

### `waitTo(timepoint)`

**Parametry:**

- `timepoint`

### `gotoLabel(name)`

**Parametry:**

- `name`

## Events/Callbacks

### `createWidget`

**Wywołanie:** `local label = g_ui.createWidget("CaveBotLabel", ui.list)`

### `figName`

**Wywołanie:** `local name = getConfigName(config)`

### `fig`

**Wywołanie:** `parseConfig(context.storage.cavebot.configs[context.storage.cavebot.activeConfig])`

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

### `PlayerPositionChange`

**Wywołanie:** `context.onPlayerPositionChange(function(newPos, oldPos)`

### `fig`

**Wywołanie:** `refreshConfig(true)`

### `Use`

**Wywołanie:** `context.onUse(function(pos, itemId, stackPos, subType)`

### `fig`

**Wywołanie:** `refreshConfig(true)`

### `UseWith`

**Wywołanie:** `context.onUseWith(function(pos, itemId, target, subType)`

### `fig`

**Wywołanie:** `refreshConfig(true)`

### `fig`

**Wywołanie:** `refreshConfig(true)`

### `fig`

**Wywołanie:** `refreshConfig(true)`

### `fig`

**Wywołanie:** `refreshConfig(true)`

### `fig`

**Wywołanie:** `refreshConfig(true)`

### `fig`

**Wywołanie:** `refreshConfig(true)`

### `fig`

**Wywołanie:** `refreshConfig(true)`

### `fig`

**Wywołanie:** `refreshConfig(true)`

### `fig`

**Wywołanie:** `refreshConfig(true)`

### `fig`

**Wywołanie:** `refreshConfig(true)`

### `fig`

**Wywołanie:** `refreshConfig(true)`

### `fig`

**Wywołanie:** `refreshConfig()`

### `fig`

**Wywołanie:** `refreshConfig()`

### `fig`

**Wywołanie:** `refreshConfig()`

### `fig`

**Wywołanie:** `refreshConfig()`

### `ContainerOpen`

**Wywołanie:** `context.onContainerOpen(function(container)`

### `umber`

**Wywołanie:** `position = {x=tonumber(matches[1][2]), y=tonumber(matches[1][3]), z=tonumber(matches[1][4])}`

### `umber`

**Wywołanie:** `local position = {x=tonumber(matches[1][2]), y=tonumber(matches[1][3]), z=tonumber(matches[1][4])}`

### `umber`

**Wywołanie:** `local itemId = tonumber(matches[1][2])`

### `umber`

**Wywołanie:** `local position = {x=tonumber(matches[1][3]), y=tonumber(matches[1][4]), z=tonumber(matches[1][5])}`

### `umber`

**Wywołanie:** `waitTo = context.now + tonumber(command.text)`

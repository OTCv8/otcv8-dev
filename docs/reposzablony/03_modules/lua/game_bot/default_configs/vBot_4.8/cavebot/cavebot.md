---
doc_id: "lua-spec-5b98e0b394dc"
source_path: "game_bot/default_configs/vBot_4.8/cavebot/cavebot.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: cavebot.lua"
summary: "Dokumentacja modułu Lua dla game_bot/default_configs/vBot_4.8/cavebot/cavebot.lua"
tags: ["lua", "module", "otclient"]
---

# game_bot/default_configs/vBot_4.8/cavebot/cavebot.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla cavebot.

## Functions

### `ui.showEditor.onClick()`

ui callbacks

### `ui.showConfig.onClick()`

### `CaveBot.isOn()`

public function, you can use them in your scripts

### `CaveBot.isOff()`

### `CaveBot.setOn(val)`

**Parametry:**

- `val`

### `CaveBot.setOff(val)`

**Parametry:**

- `val`

### `CaveBot.getCurrentProfile()`

### `CaveBot.lastReachedLabel()`

### `CaveBot.gotoNextWaypointInRange()`

### `reverseTable(t, max)`

**Parametry:**

- `t`
- `max`

### `rpairs(t)`

**Parametry:**

- `t`

### `CaveBot.gotoFirstPreviousReachableWaypoint()`

### `CaveBot.getFirstWaypointBeforeLabel(label)`

**Parametry:**

- `label`

### `CaveBot.getPreviousLabel()`

### `CaveBot.getNextLabel()`

### `CaveBot.setCurrentProfile(name)`

**Parametry:**

- `name`

### `CaveBot.delay(value)`

**Parametry:**

- `value`

### `CaveBot.gotoLabel(label)`

**Parametry:**

- `label`

### `CaveBot.save()`

### `CaveBotList()`

## Events/Callbacks

### `fig`

ui

**Wywołanie:** `local configWidget = UI.Config()`

### `Allowed`

**Wywołanie:** `if TargetBot and TargetBot.isActive() and not TargetBot.isCaveBotActionAllowed() then`

### `ConfigChange`

**Wywołanie:** `callbacks.onConfigChange(name, enabled, result[extension])`

### `ConfigChange`

**Wywołanie:** `CaveBot.Config.onConfigChange(name, enabled, cavebotConfig)`

### `umber`

**Wywołanie:** `local pos = {x = tonumber(re[1][2]), y = tonumber(re[1][3]), z = tonumber(re[1][4])}`

### `umber`

**Wywołanie:** `local pos = {x = tonumber(re[1][2]), y = tonumber(re[1][3]), z = tonumber(re[1][4])}`

### `umber`

**Wywołanie:** `local pos = {x = tonumber(re[1][2]), y = tonumber(re[1][3]), z = tonumber(re[1][4])}`

### `umber`

**Wywołanie:** `local pos = {x = tonumber(re[1][2]), y = tonumber(re[1][3]), z = tonumber(re[1][4])}`

### `Save`

**Wywołanie:** `local ext_data = callbacks.onSave()`

---
doc_id: "lua-spec-e071b2ef0d7a"
source_path: "game_bot/default_configs/cavebot_1.3/cavebot/actions.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: actions.lua"
summary: "Dokumentacja modułu Lua dla game_bot/default_configs/cavebot_1.3/cavebot/actions.lua"
tags: ["lua", "module", "otclient"]
---

# game_bot/default_configs/cavebot_1.3/cavebot/actions.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla actions.

## Functions

### `CaveBot.addAction(action, value, focus)`

it adds an action widget to list

**Parametry:**

- `action`
- `value`
- `focus`

### `widget.onDoubleClick(cwidget)`

**Parametry:**

- `cwidget`

### `CaveBot.editAction(widget, action, value)`

it updates existing widget, you should call CaveBot.save() later

**Parametry:**

- `widget`
- `action`
- `value`

### `CaveBot.registerAction(action, color, callback)`

**Parametry:**

- `action`
- `color`
- `callback`

## Events/Callbacks

### `event`

**Wywołanie:** `schedule(20, function() -- schedule to have correct focus`

### `umber`

**Wywołanie:** `CaveBot.delay(tonumber(value))`

### `umber`

**Wywołanie:** `local precision = tonumber(pos[1][5])`

### `umber`

**Wywołanie:** `pos = {x=tonumber(pos[1][2]), y=tonumber(pos[1][3]), z=tonumber(pos[1][4])}`

### `umber`

**Wywołanie:** `local itemid = tonumber(value)`

### `umber`

**Wywołanie:** `pos = {x=tonumber(pos[1][2]), y=tonumber(pos[1][3]), z=tonumber(pos[1][4])}`

### `umber`

**Wywołanie:** `local itemid = tonumber(pos[1][2])`

### `umber`

**Wywołanie:** `pos = {x=tonumber(pos[1][3]), y=tonumber(pos[1][4]), z=tonumber(pos[1][5])}`

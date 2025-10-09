---
doc_id: "lua-spec-a3874119534a"
source_path: "game_bot/default_configs/cavebot_1.3/cavebot/walking.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: walking.lua"
summary: "Dokumentacja modułu Lua dla game_bot/default_configs/cavebot_1.3/cavebot/walking.lua"
tags: ["lua", "module", "otclient"]
---

# game_bot/default_configs/cavebot_1.3/cavebot/walking.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla walking.

## Globals/Exports

### `expectedDirs`

### `walkPath`

### `walkPath`

some other walk action is taking place (for example use on ladder), wait

## Functions

### `CaveBot.resetWalking()`

### `CaveBot.doWalking()`

### `CaveBot.walkTo(dest, maxDist, params)`

**Parametry:**

- `dest`
- `maxDist`
- `params`

## Events/Callbacks

### `PlayerPositionChange`

called when player position has been changed (step has been confirmed by server)

**Wywołanie:** `onPlayerPositionChange(function(newPos, oldPos)`

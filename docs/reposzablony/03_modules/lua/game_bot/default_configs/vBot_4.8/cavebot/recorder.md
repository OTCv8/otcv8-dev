---
doc_id: "lua-spec-ba756d5f38af"
source_path: "game_bot/default_configs/vBot_4.8/cavebot/recorder.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: recorder.lua"
summary: "Dokumentacja modułu Lua dla game_bot/default_configs/vBot_4.8/cavebot/recorder.lua"
tags: ["lua", "module", "otclient"]
---

# game_bot/default_configs/vBot_4.8/cavebot/recorder.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla recorder.

## Functions

### `setup()`

### `addPosition(pos)`

**Parametry:**

- `pos`

### `addStairs(pos)`

**Parametry:**

- `pos`

### `CaveBot.Recorder.isOn()`

### `CaveBot.Recorder.enable()`

### `CaveBot.Recorder.disable()`

## Events/Callbacks

### `PlayerPositionChange`

**Wywołanie:** `onPlayerPositionChange(function(newPos, oldPos)`

### `Use`

**Wywołanie:** `onUse(function(pos, itemId, stackPos, subType)`

### `UseWith`

**Wywołanie:** `onUseWith(function(pos, itemId, target, subType)`

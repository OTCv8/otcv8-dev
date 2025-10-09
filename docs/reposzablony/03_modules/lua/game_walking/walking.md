---
doc_id: "lua-spec-4dde195958eb"
source_path: "game_walking/walking.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:06Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: walking.lua"
summary: "Dokumentacja modułu Lua dla game_walking/walking.lua"
tags: ["lua", "module", "otclient"]
---

# game_walking/walking.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla walking.

## Globals/Exports

### `smartWalkDirs`

### `turnKeys`

### `smartWalkDirs`

## Functions

### `init()`

### `terminate()`

### `bindKeys()`

### `unbindKeys()`

### `enableWSAD()`

### `disableWSAD()`

### `bindWalkKey(key, dir)`

**Parametry:**

- `key`
- `dir`

### `unbindWalkKey(key)`

**Parametry:**

- `key`

### `bindTurnKey(key, dir)`

**Parametry:**

- `key`
- `dir`

### `unbindTurnKey(key)`

**Parametry:**

- `key`

### `stopSmartWalk()`

### `changeWalkDir(dir, pop)`

**Parametry:**

- `dir`
- `pop`

### `smartWalk(dir, ticks)`

**Parametry:**

- `dir`
- `ticks`

### `canChangeFloorDown(pos)`

**Parametry:**

- `pos`

### `canChangeFloorUp(pos)`

**Parametry:**

- `pos`

### `onPositionChange(player, newPos, oldPos)`

**Parametry:**

- `player`
- `newPos`
- `oldPos`

### `onWalk(player, newPos, oldPos)`

**Parametry:**

- `player`
- `newPos`
- `oldPos`

### `onTeleport(player, newPos, oldPos)`

**Parametry:**

- `player`
- `newPos`
- `oldPos`

### `onWalkFinish(player)`

**Parametry:**

- `player`

### `onCancelWalk(player)`

**Parametry:**

- `player`

### `walk(dir, ticks)`

**Parametry:**

- `dir`
- `ticks`

### `turn(dir, repeated)`

**Parametry:**

- `dir`
- `repeated`

### `checkTurn()`

## Events/Callbacks

### `g_game`

**Wywołanie:** `connect(g_game, { onTeleport = onTeleport })`

### `LocalPlayer`

**Wywołanie:** `connect(LocalPlayer, {`

### `g_game`

**Wywołanie:** `disconnect(g_game, { onTeleport = onTeleport })`

### `LocalPlayer`

**Wywołanie:** `disconnect(LocalPlayer, {`

### `PositionChange`

**Wywołanie:** `function onPositionChange(player, newPos, oldPos)`

### `Walk`

**Wywołanie:** `function onWalk(player, newPos, oldPos)`

### `Teleport`

**Wywołanie:** `function onTeleport(player, newPos, oldPos)`

### `WalkFinish`

**Wywołanie:** `function onWalkFinish(player)`

### `event`

**Wywołanie:** `autoWalkEvent = addEvent(function() if nextWalkDir ~= nil then walk(nextWalkDir, 0) end end, false)`

### `CancelWalk`

**Wywołanie:** `function onCancelWalk(player)`

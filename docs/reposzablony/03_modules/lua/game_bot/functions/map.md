---
doc_id: "lua-spec-5a976f941d4b"
source_path: "game_bot/functions/map.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: map.lua"
summary: "Dokumentacja modułu Lua dla game_bot/functions/map.lua"
tags: ["lua", "module", "otclient"]
---

# game_bot/functions/map.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla map.

## Globals/Exports

### `params`

### `params`

## Functions

### `context.getMapView()`

### `context.zoomIn()`

### `context.zoomOut()`

### `context.getSpectators(param1, param2)`

**Parametry:**

- `param1`
- `param2`

### `context.getCreatureById(id, multifloor)`

**Parametry:**

- `id`
- `multifloor`

### `context.getCreatureByName(name, multifloor)`

**Parametry:**

- `name`
- `multifloor`

### `context.getPlayerByName(name, multifloor)`

**Parametry:**

- `name`
- `multifloor`

### `context.findAllPaths(start, maxDist, params)`

**Parametry:**

- `start`
- `maxDist`
- `params`

### `context.translateAllPathsToPath(paths, destPos)`

**Parametry:**

- `paths`
- `destPos`

### `context.findPath(startPos, destPos, maxDist, params)`

**Parametry:**

- `startPos`
- `destPos`
- `maxDist`
- `params`

### `context.autoWalk(destination, maxDist, params)`

also works as autoWalk(dirs) where dirs is a list eg.: {1,2,3,0,1,1,2,}

**Parametry:**

- `destination`
- `maxDist`
- `params`

### `context.getTileUnderCursor()`

### `context.canShoot(pos, distance)`

**Parametry:**

- `pos`
- `distance`

### `context.isTrapped(creature)`

**Parametry:**

- `creature`

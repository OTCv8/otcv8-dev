---
doc_id: "lua-spec-d525a200b2f2"
source_path: "game_bot/functions/player_inventory.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: player_inventory.lua"
summary: "Dokumentacja modułu Lua dla game_bot/functions/player_inventory.lua"
tags: ["lua", "module", "otclient"]
---

# game_bot/functions/player_inventory.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla player_inventory.

## Functions

### `context.getInventoryItem(slot)`

**Parametry:**

- `slot`

### `context.getHead()`

### `context.getNeck()`

### `context.getBack()`

### `context.getBody()`

### `context.getRight()`

### `context.getLeft()`

### `context.getLeg()`

### `context.getFeet()`

### `context.getFinger()`

### `context.getAmmo()`

### `context.getPurse()`

### `context.getContainers()`

### `context.getContainer(index)`

**Parametry:**

- `index`

### `context.moveToSlot(item, slot, count)`

**Parametry:**

- `item`
- `slot`
- `count`

## Events/Callbacks

### `tainers`

**Wywołanie:** `context.getContainers = function() return g_game.getContainers() end`

### `tainer`

**Wywołanie:** `context.getContainer = function(index) return g_game.getContainer(index) end`

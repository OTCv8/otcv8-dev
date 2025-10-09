---
doc_id: "lua-spec-b3adf3434315"
source_path: "game_bot/functions/npc.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: npc.lua"
summary: "Dokumentacja modułu Lua dla game_bot/functions/npc.lua"
tags: ["lua", "module", "otclient"]
---

# game_bot/functions/npc.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla npc.

## Functions

### `context.NPC.talk(text)`

**Parametry:**

- `text`

### `context.NPC.isTrading()`

### `context.NPC.getSellItems()`

### `context.NPC.getBuyItems()`

### `context.NPC.getSellQuantity(item)`

**Parametry:**

- `item`

### `context.NPC.canTradeItem(item)`

**Parametry:**

- `item`

### `context.NPC.sell(item, count, ignoreEquipped)`

**Parametry:**

- `item`
- `count`
- `ignoreEquipped`

### `context.NPC.buy(item, count, ignoreCapacity, withBackpack)`

**Parametry:**

- `item`
- `count`
- `ignoreCapacity`
- `withBackpack`

### `context.NPC.sellAll()`

### `context.NPC.closeTrade()`

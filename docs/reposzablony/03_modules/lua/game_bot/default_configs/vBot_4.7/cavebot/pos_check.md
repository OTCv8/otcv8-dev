---
doc_id: "lua-spec-199764b4fcc3"
source_path: "game_bot/default_configs/vBot_4.7/cavebot/pos_check.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: pos_check.lua"
summary: "Dokumentacja modułu Lua dla game_bot/default_configs/vBot_4.7/cavebot/pos_check.lua"
tags: ["lua", "module", "otclient"]
---

# game_bot/default_configs/vBot_4.7/cavebot/pos_check.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla pos_check.

## Functions

### `CaveBot.Extensions.PosCheck.setup()`

### `value()`

## Events/Callbacks

### `umber`

**Wywołanie:** `tilePos.x = tonumber(data[3])`

### `umber`

**Wywołanie:** `tilePos.y = tonumber(data[4])`

### `umber`

**Wywołanie:** `tilePos.z = tonumber(data[5])`

### `umber`

**Wywołanie:** `elseif (tilePos.z == player:getPosition().z) and (getDistanceBetween(player:getPosition(), tilePos) <= tonumber(data[2])) then`

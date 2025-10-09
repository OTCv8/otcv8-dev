---
doc_id: "lua-spec-6d08f8b678f7"
source_path: "game_bot/default_configs/vBot_4.7/cavebot/supply_check.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: supply_check.lua"
summary: "Dokumentacja modułu Lua dla game_bot/default_configs/vBot_4.7/cavebot/supply_check.lua"
tags: ["lua", "module", "otclient"]
---

# game_bot/default_configs/vBot_4.7/cavebot/supply_check.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla supply_check.

## Globals/Exports

### `time`

### `refillTime`

## Functions

### `setCaveBotData(hunting)`

**Parametry:**

- `hunting`

### `CaveBot.Extensions.SupplyCheck.setup()`

### `value()`

## Events/Callbacks

### `umber`

**Wywołanie:** `pos = {x = tonumber(data[2]), y = tonumber(data[3]), z = tonumber(data[4])}`

### `alData`

**Wywołanie:** `local supplyInfo = Supplies.getAdditionalData()`

### `umber`

**Wywołanie:** `elseif (supplyInfo.stamina.enabled and stamina() < tonumber(supplyInfo.stamina.value)) then`

### `umber`

**Wywołanie:** `elseif (supplyInfo.capacity.enabled and freecap() < tonumber(supplyInfo.capacity.value)) then`

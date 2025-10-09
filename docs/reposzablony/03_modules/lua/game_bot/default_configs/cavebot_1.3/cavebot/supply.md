---
doc_id: "lua-spec-11e343f903f7"
source_path: "game_bot/default_configs/cavebot_1.3/cavebot/supply.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: supply.lua"
summary: "Dokumentacja modułu Lua dla game_bot/default_configs/cavebot_1.3/cavebot/supply.lua"
tags: ["lua", "module", "otclient"]
---

# game_bot/default_configs/cavebot_1.3/cavebot/supply.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla supply.

## Functions

### `CaveBot.Extensions.Supply.setup()`

first function called, here you should setup your UI

### `CaveBot.Extensions.Supply.onConfigChange(configName, isEnabled, configData)`

called when cavebot config changes, configData is a table but it can be nil

**Parametry:**

- `configName`
- `isEnabled`
- `configData`

### `CaveBot.Extensions.Supply.onSave()`

called when cavebot is saving config, should return table or nil

**Zwraca:** table or nil

### `CaveBot.Extensions.Supply.run(retries, prev)`

bellow add you custom functions this function can be used in cavebot function waypoint as: return Supply.run(retries, prev) there are 2 useful parameters - retries (number) and prev (true/false), check actions.lua to learn more

**Parametry:**

- `retries`
- `prev`

**Zwraca:** Supply

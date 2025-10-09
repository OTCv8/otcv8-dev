---
doc_id: "lua-spec-1841cf906477"
source_path: "game_bot/default_configs/cavebot_1.3/cavebot/depositer.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: depositer.lua"
summary: "Dokumentacja modułu Lua dla game_bot/default_configs/cavebot_1.3/cavebot/depositer.lua"
tags: ["lua", "module", "otclient"]
---

# game_bot/default_configs/cavebot_1.3/cavebot/depositer.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla depositer.

## Functions

### `CaveBot.Extensions.Depositer.setup()`

first function called, here you should setup your UI

### `CaveBot.Extensions.Depositer.onConfigChange(configName, isEnabled, configData)`

called when cavebot config changes, configData is a table but it can be nil

**Parametry:**

- `configName`
- `isEnabled`
- `configData`

### `CaveBot.Extensions.Depositer.onSave()`

called when cavebot is saving config, should return table or nil

**Zwraca:** table or nil

### `CaveBot.Extensions.Depositer.run(retries, prev)`

bellow add you custom functions this function can be used in cavebot function waypoint as: return Depositer.run(retries, prev) there are 2 useful parameters - retries (number) and prev (true/false), check actions.lua to learn more

**Parametry:**

- `retries`
- `prev`

**Zwraca:** Depositer

---
doc_id: "lua-spec-900f5c43559c"
source_path: "game_bot/default_configs/cavebot_1.3/cavebot/extension_template.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: extension_template.lua"
summary: "Dokumentacja modułu Lua dla game_bot/default_configs/cavebot_1.3/cavebot/extension_template.lua"
tags: ["lua", "module", "otclient"]
---

# game_bot/default_configs/cavebot_1.3/cavebot/extension_template.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla extension_template.

## Functions

### `CaveBot.Extensions.Example.setup()`

setup is called automaticly when cavebot is ready

### `ui.onTextChange()`

### `CaveBot.Extensions.Example.onConfigChange(configName, isEnabled, configData)`

called when cavebot config changes, configData is a table but it can also be nil

**Parametry:**

- `configName`
- `isEnabled`
- `configData`

### `CaveBot.Extensions.Example.onSave()`

called when cavebot is saving config (so when CaveBot.save() is called), should return table or nil

**Zwraca:** table or nil

### `CaveBot.Extensions.Example.run(retries, prev)`

bellow add you custom functions to be used in cavebot function action an example: return Example.run(retries, prev) there are 2 useful parameters - retries (number) and prev (true/false), check actions.lua and example_functions.lua to learn more

**Parametry:**

- `retries`
- `prev`

**Zwraca:** Example

## Events/Callbacks

### `umber`

**Wywołanie:** `local how_many_times = tonumber(value)`

### `fig`

**Wywołanie:** `-- called when cavebot is saving config (so when CaveBot.save() is called), should return table or nil`

## Examples

### -- an example: return Example.run(retries, prev)

```lua
there are 2 useful parameters - retries (number) and prev (true/false), check actions.lua and example_functions.lua to learn more
```

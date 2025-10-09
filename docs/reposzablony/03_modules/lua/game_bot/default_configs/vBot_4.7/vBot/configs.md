---
doc_id: "lua-spec-178d88a766ab"
source_path: "game_bot/default_configs/vBot_4.7/vBot/configs.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: configs.lua"
summary: "Dokumentacja modułu Lua dla game_bot/default_configs/vBot_4.7/vBot/configs.lua"
tags: ["lua", "module", "otclient"]
---

# game_bot/default_configs/vBot_4.7/vBot/configs.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla configs.

## Globals/Exports

### `HealBotConfig`

### `AttackBotConfig`

### `SuppliesConfig`

## Functions

### `vBotConfigSave(file)`

**Parametry:**

- `file`

## Events/Callbacks

### `tents`

**Wywołanie:** `return json.decode(g_resources.readFileContents(healBotFile))`

### `Error`

**Wywołanie:** `return onError("Error while reading config file (" .. healBotFile .. "). To fix this problem you can delete HealBot.json. Details: " .. result)`

### `tents`

**Wywołanie:** `return json.decode(g_resources.readFileContents(attackBotFile))`

### `Error`

**Wywołanie:** `return onError("Error while reading config file (" .. attackBotFile .. "). To fix this problem you can delete HealBot.json. Details: " .. result)`

### `tents`

**Wywołanie:** `return json.decode(g_resources.readFileContents(suppliesFile))`

### `Error`

**Wywołanie:** `return onError("Error while reading config file (" .. suppliesFile .. "). To fix this problem you can delete HealBot.json. Details: " .. result)`

### `figSave`

**Wywołanie:** `function vBotConfigSave(file)`

### `Error`

**Wywołanie:** `return onError("Error while saving config. it won't be saved. Details: " .. result)`

### `Error`

**Wywołanie:** `return onError("config file is too big, above 100MB, it won't be saved")`

### `tents`

**Wywołanie:** `g_resources.writeFileContents(configFile, result)`

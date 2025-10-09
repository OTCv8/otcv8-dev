---
doc_id: "lua-spec-a7fc9e30d9b6"
source_path: "game_bot/default_configs/vBot_4.8/cavebot/depositor.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: depositor.lua"
summary: "Dokumentacja modułu Lua dla game_bot/default_configs/vBot_4.8/cavebot/depositor.lua"
tags: ["lua", "module", "otclient"]
---

# game_bot/default_configs/vBot_4.8/cavebot/depositor.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla depositor.

## Functions

### `resetCache()`

### `CaveBot.Extensions.Depositor.setup()`

## Events/Callbacks

### `tainers`

**Wywołanie:** `for i, container in ipairs(getContainers()) do`

### `tainers`

**Wywołanie:** `CaveBot.CloseAllLootContainers()`

### `tainers`

**Wywołanie:** `local lootContainers = CaveBot.GetLootContainers()`

### `tainers`

**Wywołanie:** `for _, container in ipairs(getContainers()) do`

### `tainerItem`

**Wywołanie:** `local cId = container:getContainerItem():getId()`

### `tainers`

**Wywołanie:** `CaveBot.CloseAllLootContainers()`

### `tainerByName`

prep time and stashing

**Wywołanie:** `destination = destination or getContainerByName("Depot chest")`

### `tainers`

**Wywołanie:** `for _, container in pairs(getContainers()) do`

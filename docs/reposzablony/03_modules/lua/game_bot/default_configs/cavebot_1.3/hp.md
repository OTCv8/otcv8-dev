---
doc_id: "lua-spec-2fa16a334cd9"
source_path: "game_bot/default_configs/cavebot_1.3/hp.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: hp.lua"
summary: "Dokumentacja modułu Lua dla game_bot/default_configs/cavebot_1.3/hp.lua"
tags: ["lua", "module", "otclient"]
---

# game_bot/default_configs/cavebot_1.3/hp.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla hp.

## Events/Callbacks

### `tainer`

**Wywołanie:** `if thing and thing:isFluidContainer() then`

### `tainer`

**Wywołanie:** `local foodContainer = UI.Container(function(widget, items)`

### `tainers`

search for food in containers

**Wywołanie:** `for _, container in pairs(g_game.getContainers()) do`

### `tainers`

**Wywołanie:** `local containers = g_game.getContainers()`

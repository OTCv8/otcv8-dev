---
doc_id: "lua-spec-c63f76ff0ade"
source_path: "game_bot/default_configs/vBot_4.8/vBot/exeta.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: exeta.lua"
summary: "Dokumentacja modułu Lua dla game_bot/default_configs/vBot_4.8/vBot/exeta.lua"
tags: ["lua", "module", "otclient"]
---

# game_bot/default_configs/vBot_4.8/vBot/exeta.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla exeta.

## Events/Callbacks

### `CreatureHealthPercentChange`

**Wywołanie:** `onCreatureHealthPercentChange(function(creature, healthPercent)`

### `Active`

**Wywołanie:** `if modules.game_cooldown.isGroupCooldownIconActive(3) then return end`

### `sters`

**Wywołanie:** `if getMonsters(1) >= 1 and getPlayers(6) > 0 then`

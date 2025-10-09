---
doc_id: "lua-spec-8cdd6d117fd1"
source_path: "game_bot/default_configs/vBot_4.8/cavebot/stand_lure.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: stand_lure.lua"
summary: "Dokumentacja modułu Lua dla game_bot/default_configs/vBot_4.8/cavebot/stand_lure.lua"
tags: ["lua", "module", "otclient"]
---

# game_bot/default_configs/vBot_4.8/cavebot/stand_lure.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla stand_lure.

## Functions

### `modPos(dir)`

**Parametry:**

- `dir`

### `reset(delay)`

**Parametry:**

- `delay`

### `CaveBot.Extensions.StandLure.setup()`

### `value()`

### `onChildFocusChange(widget, newChild, oldChild)`

**Parametry:**

- `widget`
- `newChild`
- `oldChild`

## Events/Callbacks

### `umber`

**Wywołanie:** `local pos = {x = tonumber(data[1]), y = tonumber(data[2]), z = tonumber(data[3])}`

### `umber`

**Wywołanie:** `local delayTime = data[4] and tonumber(data[4]) or 1000`

### `ster`

**Wywołanie:** `if creature:isMonster() and (hppc and hppc > 0) and (oldTibia or creature:getType() < 3) then`

### `event`

**Wywołanie:** `schedule(5, function() -- delay because cavebot.lua is loaded after this file`

### `CaveBotList()`

**Wywołanie:** `modules.game_bot.connect(CaveBotList(), {`

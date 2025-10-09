---
doc_id: "lua-spec-363506968800"
source_path: "game_bot/default_configs/vBot_4.8/targetbot/target.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: target.lua"
summary: "Dokumentacja modułu Lua dla game_bot/default_configs/vBot_4.8/targetbot/target.lua"
tags: ["lua", "module", "otclient"]
---

# game_bot/default_configs/vBot_4.8/targetbot/target.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla target.

## Functions

### `ui.editor.debug.onClick()`

### `ui.editor.buttons.add.onClick()`

setup ui

### `ui.editor.buttons.edit.onClick()`

### `ui.editor.buttons.remove.onClick()`

### `TargetBot.isActive()`

public function, you can use them in your scripts

### `TargetBot.isCaveBotActionAllowed()`

### `TargetBot.setStatus(text)`

**Parametry:**

- `text`

### `TargetBot.getStatus()`

### `TargetBot.isOn()`

### `TargetBot.isOff()`

### `TargetBot.setOn(val)`

**Parametry:**

- `val`

### `TargetBot.setOff(val)`

**Parametry:**

- `val`

### `TargetBot.getCurrentProfile()`

### `TargetBot.setCurrentProfile(name)`

**Parametry:**

- `name`

### `TargetBot.delay(value)`

**Parametry:**

- `value`

### `TargetBot.save()`

### `TargetBot.allowCaveBot(time)`

**Parametry:**

- `time`

### `TargetBot.disableLuring()`

### `TargetBot.enableLuring()`

### `TargetBot.Danger()`

### `TargetBot.lootStatus()`

### `TargetBot.saySpell(text, delay)`

**Parametry:**

- `text`
- `delay`

### `TargetBot.sayAttackSpell(text, delay)`

**Parametry:**

- `text`
- `delay`

### `TargetBot.useItem(item, subType, target, delay)`

**Parametry:**

- `item`
- `subType`
- `target`
- `delay`

### `TargetBot.useAttackItem(item, subType, target, delay)`

**Parametry:**

- `item`
- `subType`
- `target`
- `delay`

### `TargetBot.canLure()`

## Events/Callbacks

### `fig`

ui

**Wywołanie:** `local configWidget = UI.Config()`

### `ster`

**Wywołanie:** `if spec:isMonster() then`

### `ster`

**Wywołanie:** `if creature:isMonster() and (oldTibia or creature:getType() < 3) and path then`

### `figs`

**Wywołanie:** `TargetBot.Creature.resetConfigs()`

### `fig`

**Wywołanie:** `TargetBot.Creature.addConfig(value)`

### `fig`

**Wywołanie:** `TargetBot.Creature.addConfig(newConfig, true)`

### `figsCache`

**Wywołanie:** `TargetBot.Creature.resetConfigsCache()`

### `figsCache`

**Wywołanie:** `TargetBot.Creature.resetConfigsCache()`

### `tainer`

**Wywołanie:** `if not thing or not thing:isFluidContainer() then`

### `tainer`

**Wywołanie:** `if not thing or not thing:isFluidContainer() then`

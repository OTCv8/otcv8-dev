---
doc_id: "lua-spec-b3c8664b5ae0"
source_path: "game_bot/panels/attacking.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: attacking.lua"
summary: "Dokumentacja modułu Lua dla game_bot/panels/attacking.lua"
tags: ["lua", "module", "otclient"]
---

# game_bot/panels/attacking.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla attacking.

## Globals/Exports

### `commands`

### `monsters`

## Functions

### `Panels.MonsterEditor(monster, config, callback, parent)`

**Parametry:**

- `monster`
- `config`
- `callback`
- `parent`

### `window.priority.onValueChange(scroll, value)`

**Parametry:**

- `scroll`
- `value`

### `window.danger.onValueChange(scroll, value)`

**Parametry:**

- `scroll`
- `value`

### `window.maxDistance.onValueChange(scroll, value)`

**Parametry:**

- `scroll`
- `value`

### `window.distance.onValueChange(scroll, value)`

**Parametry:**

- `scroll`
- `value`

### `window.minHealth.onValueChange(scroll, value)`

**Parametry:**

- `scroll`
- `value`

### `window.maxHealth.onValueChange(scroll, value)`

**Parametry:**

- `scroll`
- `value`

### `window.attack.onClick(widget)`

**Parametry:**

- `widget`

### `window.ignore.onClick(widget)`

**Parametry:**

- `widget`

### `window.avoid.onClick(widget)`

**Parametry:**

- `widget`

### `window.keepDistance.onClick(widget)`

**Parametry:**

- `widget`

### `window.avoidAttacks.onClick(widget)`

**Parametry:**

- `widget`

### `window.chase.onClick(widget)`

**Parametry:**

- `widget`

### `window.loot.onClick(widget)`

**Parametry:**

- `widget`

### `window.monstersOnly.onClick(widget)`

**Parametry:**

- `widget`

### `window.dontWalk.onClick(widget)`

**Parametry:**

- `widget`

### `Panels.Attacking(parent)`

**Parametry:**

- `parent`

### `refreshConfig(scrollDown)`

**Parametry:**

- `scrollDown`

### `ui.config.onOptionChange(widget)`

**Parametry:**

- `widget`

### `ui.enableButton.onClick()`

### `ui.add.onClick()`

### `ui.edit.onClick()`

### `ui.remove.onClick()`

### `ui.mAdd.onClick()`

### `ui.mEdit.onClick()`

### `ui.mRemove.onClick()`

## Events/Callbacks

### `getRootWidget`

**Wywołanie:** `local otherWindow = g_ui.getRootWidget():getChildById('monsterEditor')`

### `getRootWidget`

**Wywołanie:** `]], g_ui.getRootWidget())`

### `fig`

**Wywołanie:** `refreshConfig()`

### `createWidget`

**Wywołanie:** `local label = g_ui.createWidget("CaveBotLabel", ui.list)`

### `figName`

**Wywołanie:** `local name = getConfigName(config)`

### `fig`

**Wywołanie:** `parseConfig(context.storage.attacking.configs[context.storage.attacking.activeConfig])`

### `fig`

**Wywołanie:** `context.saveConfig()`

### `fig`

**Wywołanie:** `refreshConfig()`

### `fig`

**Wywołanie:** `refreshConfig()`

### `fig`

**Wywołanie:** `refreshConfig()`

### `fig`

**Wywołanie:** `refreshConfig()`

### `fig`

**Wywołanie:** `refreshConfig()`

### `sterEditor`

**Wywołanie:** `Panels.MonsterEditor("", {}, function(name, config)`

### `fig`

**Wywołanie:** `createNewConfig()`

### `sterEditor`

**Wywołanie:** `Panels.MonsterEditor(monsterWidget:getText(), monsters[monsterWidget:getText()], function(name, config)`

### `fig`

**Wywołanie:** `createNewConfig()`

### `fig`

**Wywołanie:** `createNewConfig()`

### `fig`

**Wywołanie:** `refreshConfig()`

### `figPassingConditions`

**Wywołanie:** `if isConfigPassingConditions(monster, monsters[name]) then`

### `figPassingConditions`

**Wywołanie:** `if isConfigPassingConditions(monster, monsters[name .. i]) then`

### `figPassingConditions`

**Wywołanie:** `if not hasConfig and isConfigPassingConditions(monster, monsters["*"]) then`

### `sterConfig`

**Wywołanie:** `local config = getMonsterConfig(monster)`

### `sterConfig`

**Wywołanie:** `local config = getMonsterConfig(monster)`

### `tainer`

**Wywołanie:** `if not topItem or not topItem:isContainer() then`

### `CreatureDisappear`

**Wywołanie:** `context.onCreatureDisappear(function(creature)`

### `ster`

**Wywołanie:** `if not creature:isMonster() then`

### `sterConfig`

**Wywołanie:** `local config = getMonsterConfig(creature)`

### `tainer`

**Wywołanie:** `if not topItem or not topItem:isContainer() then`

### `ContainerOpen`

**Wywołanie:** `context.onContainerOpen(function(container, prevContainer)`

### `ster`

**Wywołanie:** `if spec:isMonster() or (spec:isPlayer() and not spec:isLocalPlayer()) then`

### `sterDanger`

**Wywołanie:** `danger = danger + calculateMonsterDanger(spec)`

### `Zone`

**Wywołanie:** `if #monsters == 0 or context.isInProtectionZone() then`

### `sterConfig`

**Wywołanie:** `local config = getMonsterConfig(target)`

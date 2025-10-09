---
doc_id: "lua-spec-3b5b2db56128"
source_path: "game_topbar/topbar.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:06Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: topbar.lua"
summary: "Dokumentacja modułu Lua dla game_topbar/topbar.lua"
tags: ["lua", "module", "otclient"]
---

# game_topbar/topbar.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla topbar.

## Globals/Exports

### `Icons`

### `settings`

## Functions

### `init()`

### `terminate()`

### `setupTopBar()`

### `topBar.onMouseRelease(widget, mousePos, mouseButton)`

**Parametry:**

- `widget`
- `mousePos`
- `mouseButton`

### `refresh(profileChange)`

**Parametry:**

- `profileChange`

### `refreshVisibleBars()`

### `setSkillsLayout()`

### `offline()`

### `toggleIcon(bitChanged)`

**Parametry:**

- `bitChanged`

### `loadIcon(bitChanged)`

**Parametry:**

- `bitChanged`

### `onHealthChange(localPlayer, health, maxHealth)`

**Parametry:**

- `localPlayer`
- `health`
- `maxHealth`

### `onManaChange(localPlayer, mana, maxMana)`

**Parametry:**

- `localPlayer`
- `mana`
- `maxMana`

### `onLevelChange(localPlayer, value, percent)`

**Parametry:**

- `localPlayer`
- `value`
- `percent`

### `onStatesChange(localPlayer, now, old)`

**Parametry:**

- `localPlayer`
- `now`
- `old`

### `show()`

### `setupSkillPanel(id, parent, experience, defaultOff)`

**Parametry:**

- `id`
- `parent`
- `experience`
- `defaultOff`

### `widget.onGeometryChange()`

breakers

### `menu(mouseButton)`

**Parametry:**

- `mouseButton`

### `setupSkills()`

### `toggleSkillPanel(id)`

**Parametry:**

- `id`

### `setSkillValue(id, value)`

**Parametry:**

- `id`
- `value`

### `setSkillPercent(id, percent, tooltip)`

**Parametry:**

- `id`
- `percent`
- `tooltip`

### `setSkillBase(id, value, baseValue)`

**Parametry:**

- `id`
- `value`
- `baseValue`

### `onMagicLevelChange(localPlayer, magiclevel, percent)`

**Parametry:**

- `localPlayer`
- `magiclevel`
- `percent`

### `onBaseMagicLevelChange(localPlayer, baseMagicLevel)`

**Parametry:**

- `localPlayer`
- `baseMagicLevel`

### `onSkillChange(localPlayer, id, level, percent)`

**Parametry:**

- `localPlayer`
- `id`
- `level`
- `percent`

### `onBaseSkillChange(localPlayer, id, baseLevel)`

**Parametry:**

- `localPlayer`
- `id`
- `baseLevel`

### `save()`

### `load()`

## Events/Callbacks

### `LocalPlayer`

**Wywołanie:** `connect(LocalPlayer, {`

### `g_game`

**Wywołanie:** `connect(g_game, {onGameStart = refresh, onGameEnd = offline})`

### `LocalPlayer`

**Wywołanie:** `disconnect(LocalPlayer, {`

### `g_game`

**Wywołanie:** `disconnect(g_game, {onGameStart = refresh, onGameEnd = offline})`

### `loadUI`

**Wywołanie:** `topBar = topBar or g_ui.loadUI('topbar', topPanel)`

### `LevelChange`

**Wywołanie:** `onLevelChange(player, player:getLevel(), player:getLevelPercent())`

### `HealthChange`

**Wywołanie:** `onHealthChange(player, player:getHealth(), player:getMaxHealth())`

### `ManaChange`

**Wywołanie:** `onManaChange(player, player:getMana(), player:getMaxMana())`

### `MagicLevelChange`

**Wywołanie:** `onMagicLevelChange(player, player:getMagicLevel(), player:getMagicLevelPercent())`

### `StatesChange`

**Wywołanie:** `onStatesChange(player, player:getStates(), 0)`

### `HealthChange`

**Wywołanie:** `onHealthChange(player, player:getHealth(), player:getMaxHealth())`

### `ManaChange`

**Wywołanie:** `onManaChange(player, player:getMana(), player:getMaxMana())`

### `LevelChange`

**Wywołanie:** `onLevelChange(player, player:getLevel(), player:getLevelPercent())`

### `SkillChange`

**Wywołanie:** `onSkillChange(player, i, player:getSkillLevel(i), player:getSkillLevelPercent(i))`

### `BaseSkillChange`

**Wywołanie:** `onBaseSkillChange(player, i, player:getSkillBaseLevel(i))`

### `StatesChange`

**Wywołanie:** `if player then onStatesChange(player, 0, player:getStates()) end`

### `createWidget`

**Wywołanie:** `local icon = g_ui.createWidget('ConditionWidget', content)`

### `HealthChange`

**Wywołanie:** `function onHealthChange(localPlayer, health, maxHealth)`

### `ManaChange`

**Wywołanie:** `function onManaChange(localPlayer, mana, maxMana)`

### `LevelChange`

**Wywołanie:** `function onLevelChange(localPlayer, value, percent)`

### `StatesChange`

**Wywołanie:** `function onStatesChange(localPlayer, now, old)`

### `createWidget`

**Wywołanie:** `local widget = g_ui.createWidget('SkillPanel', parent)`

### `createWidget`

**Wywołanie:** `local menu = g_ui.createWidget('PopupMenu')`

### `MagicLevelChange`

**Wywołanie:** `function onMagicLevelChange(localPlayer, magiclevel, percent)`

### `BaseMagicLevelChange`

**Wywołanie:** `onBaseMagicLevelChange(localPlayer, localPlayer:getBaseMagicLevel())`

### `BaseMagicLevelChange`

**Wywołanie:** `function onBaseMagicLevelChange(localPlayer, baseMagicLevel)`

### `SkillChange`

**Wywołanie:** `function onSkillChange(localPlayer, id, level, percent)`

### `BaseSkillChange`

**Wywołanie:** `function onBaseSkillChange(localPlayer, id, baseLevel)`

### `Error`

**Wywołanie:** `return onError(`

### `Error`

**Wywołanie:** `return onError(`

### `tents`

**Wywołanie:** `g_resources.writeFileContents(settingsFile, result)`

### `tents`

**Wywołanie:** `return json.decode(g_resources.readFileContents(settingsFile))`

### `Error`

**Wywołanie:** `return onError(`

---
doc_id: "lua-spec-118fb208bfa6"
source_path: "game_healthinfo/healthinfo.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: healthinfo.lua"
summary: "Dokumentacja modułu Lua dla game_healthinfo/healthinfo.lua"
tags: ["lua", "module", "otclient"]
---

# game_healthinfo/healthinfo.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla healthinfo.

## Globals/Exports

### `Icons`

## Functions

### `init()`

### `terminate()`

### `toggle()`

### `toggleIcon(bitChanged)`

**Parametry:**

- `bitChanged`

### `loadIcon(bitChanged)`

**Parametry:**

- `bitChanged`

### `offline()`

### `onMiniWindowClose()`

hooked events

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

### `onSoulChange(localPlayer, soul)`

**Parametry:**

- `localPlayer`
- `soul`

### `onFreeCapacityChange(player, freeCapacity)`

**Parametry:**

- `player`
- `freeCapacity`

### `onStatesChange(localPlayer, now, old)`

**Parametry:**

- `localPlayer`
- `now`
- `old`

### `hideLabels()`

personalization functions

### `hideExperience()`

### `setHealthTooltip(tooltip)`

**Parametry:**

- `tooltip`

### `setManaTooltip(tooltip)`

**Parametry:**

- `tooltip`

### `setExperienceTooltip(tooltip)`

**Parametry:**

- `tooltip`

### `onOverlayGeometryChange()`

## Events/Callbacks

### `LocalPlayer`

**Wywołanie:** `connect(LocalPlayer, { onHealthChange = onHealthChange,`

### `g_game`

**Wywołanie:** `connect(g_game, { onGameEnd = offline })`

### `loadUI`

**Wywołanie:** `healthInfoWindow = g_ui.loadUI('healthinfo', modules.game_interface.getRightPanel())`

### `createWidget`

**Wywołanie:** `overlay = g_ui.createWidget('HealthOverlay', modules.game_interface.getMapPanel())`

### `overlay`

**Wywołanie:** `connect(overlay, { onGeometryChange = onOverlayGeometryChange })`

### `HealthChange`

**Wywołanie:** `onHealthChange(localPlayer, localPlayer:getHealth(), localPlayer:getMaxHealth())`

### `ManaChange`

**Wywołanie:** `onManaChange(localPlayer, localPlayer:getMana(), localPlayer:getMaxMana())`

### `LevelChange`

**Wywołanie:** `onLevelChange(localPlayer, localPlayer:getLevel(), localPlayer:getLevelPercent())`

### `StatesChange`

**Wywołanie:** `onStatesChange(localPlayer, localPlayer:getStates(), 0)`

### `SoulChange`

**Wywołanie:** `onSoulChange(localPlayer, localPlayer:getSoul())`

### `FreeCapacityChange`

**Wywołanie:** `onFreeCapacityChange(localPlayer, localPlayer:getFreeCapacity())`

### `LocalPlayer`

**Wywołanie:** `disconnect(LocalPlayer, { onHealthChange = onHealthChange,`

### `g_game`

**Wywołanie:** `disconnect(g_game, { onGameEnd = offline })`

### `overlay`

**Wywołanie:** `disconnect(overlay, { onGeometryChange = onOverlayGeometryChange })`

### `createWidget`

**Wywołanie:** `local icon = g_ui.createWidget('ConditionWidget', content)`

### `MiniWindowClose`

hooked events

**Wywołanie:** `function onMiniWindowClose()`

### `HealthChange`

**Wywołanie:** `function onHealthChange(localPlayer, health, maxHealth)`

### `ManaChange`

**Wywołanie:** `function onManaChange(localPlayer, mana, maxMana)`

### `LevelChange`

**Wywołanie:** `function onLevelChange(localPlayer, value, percent)`

### `SoulChange`

**Wywołanie:** `function onSoulChange(localPlayer, soul)`

### `FreeCapacityChange`

**Wywołanie:** `function onFreeCapacityChange(player, freeCapacity)`

### `StatesChange`

**Wywołanie:** `function onStatesChange(localPlayer, now, old)`

### `OverlayGeometryChange`

**Wywołanie:** `function onOverlayGeometryChange()`

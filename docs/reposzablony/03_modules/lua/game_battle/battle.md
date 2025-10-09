---
doc_id: "lua-spec-7212715a7cb0"
source_path: "game_battle/battle.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: battle.lua"
summary: "Dokumentacja modułu Lua dla game_battle/battle.lua"
tags: ["lua", "module", "otclient"]
---

# game_battle/battle.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla battle.

## Globals/Exports

### `battleButtons`

### `battleButtons`

### `settings`

### `settings`

### `settings`

### `ages`

## Functions

### `init()`

### `terminate()`

### `toggle()`

### `onMiniWindowClose()`

### `getSortType()`

### `setSortType(state)`

**Parametry:**

- `state`

### `getSortOrder()`

### `setSortOrder(state)`

**Parametry:**

- `state`

### `isSortAsc()`

### `isSortDesc()`

### `isHidingFilters()`

### `setHidingFilters(state)`

**Parametry:**

- `state`

### `hideFilterPanel()`

### `showFilterPanel()`

### `toggleFilterPanel()`

### `onChangeSortType(comboBox, option, value)`

**Parametry:**

- `comboBox`
- `option`
- `value`

### `onChangeSortOrder(comboBox, option, value)`

**Parametry:**

- `comboBox`
- `option`
- `value`

### `updateBattleList()`

functions

### `checkCreatures()`

### `doCreatureFitFilters(creature)`

**Parametry:**

- `creature`

### `getDistanceBetween(p1, p2)`

**Parametry:**

- `p1`
- `p2`

### `sortCreatures(creatures)`

**Parametry:**

- `creatures`

### `onBattleButtonMouseRelease(self, mousePosition, mouseButton)`

other functions

**Parametry:**

- `self`
- `mousePosition`
- `mouseButton`

### `onBattleButtonHoverChange(battleButton, hovered)`

**Parametry:**

- `battleButton`
- `hovered`

### `onPlayerPositionChange(creature, newPos, oldPos)`

**Parametry:**

- `creature`
- `newPos`
- `oldPos`

### `updateSquare()`

## Events/Callbacks

### `importStyle`

**Wywołanie:** `g_ui.importStyle('battlebutton')`

### `loadUI`

**Wywołanie:** `battleWindow = g_ui.loadUI('battle', modules.game_interface.getRightPanel())`

### `createWidget`

**Wywołanie:** `mouseWidget = g_ui.createWidget('UIButton')`

### `tentMinimumHeight`

**Wywołanie:** `battleWindow:setContentMinimumHeight(80)`

### `ByData`

**Wywołanie:** `sortTypeBox:setCurrentOptionByData(getSortType())`

### `ByData`

**Wywołanie:** `sortOrderBox:setCurrentOptionByData(getSortOrder())`

### `createWidget`

**Wywołanie:** `local battleButton = g_ui.createWidget('BattleButton', battlePanel)`

### `LocalPlayer`

**Wywołanie:** `connect(LocalPlayer, {`

### `Creature`

**Wywołanie:** `connect(Creature, {`

### `g_game`

**Wywołanie:** `connect(g_game, {`

### `LocalPlayer`

**Wywołanie:** `disconnect(LocalPlayer, {`

### `Creature`

**Wywołanie:** `disconnect(Creature, {`

### `g_game`

**Wywołanie:** `disconnect(g_game, {`

### `MiniWindowClose`

**Wywołanie:** `function onMiniWindowClose()`

### `ChangeSortType`

**Wywołanie:** `function onChangeSortType(comboBox, option, value)`

### `ChangeSortOrder`

**Wywołanie:** `function onChangeSortOrder(comboBox, option, value)`

### `BattleButtonHoverChange`

**Wywołanie:** `onBattleButtonHoverChange(battleButtons[1], true)`

### `ster`

**Wywołanie:** `elseif hideMonsters and creature:isMonster() then`

### `BattleButtonMouseRelease`

other functions

**Wywołanie:** `function onBattleButtonMouseRelease(self, mousePosition, mouseButton)`

### `BattleButtonHoverChange`

**Wywołanie:** `function onBattleButtonHoverChange(battleButton, hovered)`

### `PlayerPositionChange`

**Wywołanie:** `function onPlayerPositionChange(creature, newPos, oldPos)`

### `event`

**Wywołanie:** `addEvent(checkCreatures)`

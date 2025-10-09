---
doc_id: "lua-spec-095295b1367f"
source_path: "game_inventory/inventory.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: inventory.lua"
summary: "Dokumentacja modułu Lua dla game_inventory/inventory.lua"
tags: ["lua", "module", "otclient"]
---

# game_inventory/inventory.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla inventory.

## Globals/Exports

### `Icons`

### `lastCombatControls`

## Functions

### `init()`

### `purseButton.onClick()`

### `terminate()`

### `toggleAdventurerStyle(hasBlessing)`

**Parametry:**

- `hasBlessing`

### `refresh()`

### `toggle()`

### `onMiniWindowClose()`

### `onInventoryChange(player, slot, item, oldItem)`

hooked events

**Parametry:**

- `player`
- `slot`
- `item`
- `oldItem`

### `onBlessingsChange(player, blessings, oldBlessings)`

**Parametry:**

- `player`
- `blessings`
- `oldBlessings`

### `update()`

controls

### `check()`

### `online()`

### `offline()`

### `onSetFightMode(self, selectedFightButton)`

**Parametry:**

- `self`
- `selectedFightButton`

### `onSetChaseMode(self, checked)`

**Parametry:**

- `self`
- `checked`

### `onSetSafeFight(self, checked)`

**Parametry:**

- `self`
- `checked`

### `onSetSafeFight2(self)`

**Parametry:**

- `self`

### `onSetPVPMode(self, selectedPVPButton)`

**Parametry:**

- `self`
- `selectedPVPButton`

### `onMountButtonClick(self, mousePos)`

**Parametry:**

- `self`
- `mousePos`

### `onOutfitChange(localPlayer, outfit, oldOutfit)`

**Parametry:**

- `localPlayer`
- `outfit`
- `oldOutfit`

### `getPVPBoxByMode(mode)`

**Parametry:**

- `mode`

### `toggleIcon(bitChanged)`

status

**Parametry:**

- `bitChanged`

### `loadIcon(bitChanged)`

**Parametry:**

- `bitChanged`

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

## Events/Callbacks

### `LocalPlayer`

**Wywołanie:** `connect(LocalPlayer, {`

### `g_game`

**Wywołanie:** `connect(g_game, { onGameStart = refresh })`

### `loadUI`

**Wywołanie:** `inventoryWindow = g_ui.loadUI('inventory', modules.game_interface.getRightPanel())`

### `fightModeRadioGroup`

**Wywołanie:** `connect(fightModeRadioGroup, { onSelectionChange = onSetFightMode })`

### `chaseModeButton`

**Wywołanie:** `connect(chaseModeButton, { onCheckChange = onSetChaseMode })`

### `safeFightButton`

**Wywołanie:** `connect(safeFightButton, { onCheckChange = onSetSafeFight })`

### `buttonPvp`

**Wywołanie:** `connect(buttonPvp, { onClick = onSetSafeFight2 })`

### `g_game`

**Wywołanie:** `connect(g_game, {`

### `LocalPlayer`

**Wywołanie:** `connect(LocalPlayer, { onOutfitChange = onOutfitChange })`

### `line`

**Wywołanie:** `online()`

### `LocalPlayer`

**Wywołanie:** `connect(LocalPlayer, { onStatesChange = onStatesChange,`

### `LocalPlayer`

**Wywołanie:** `disconnect(LocalPlayer, {`

### `g_game`

**Wywołanie:** `disconnect(g_game, { onGameStart = refresh })`

### `g_game`

**Wywołanie:** `disconnect(g_game, {`

### `LocalPlayer`

**Wywołanie:** `disconnect(LocalPlayer, { onOutfitChange = onOutfitChange })`

### `LocalPlayer`

controls end status

**Wywołanie:** `disconnect(LocalPlayer, { onStatesChange = onStatesChange,`

### `InventoryChange`

**Wywołanie:** `onInventoryChange(player, i, player:getInventoryItem(i))`

### `InventoryChange`

**Wywołanie:** `onInventoryChange(player, i, nil)`

### `SoulChange`

**Wywołanie:** `onSoulChange(player, player:getSoul())`

### `FreeCapacityChange`

**Wywołanie:** `onFreeCapacityChange(player, player:getFreeCapacity())`

### `StatesChange`

**Wywołanie:** `onStatesChange(player, player:getStates(), 0)`

### `MiniWindowClose`

**Wywołanie:** `function onMiniWindowClose()`

### `InventoryChange`

hooked events

**Wywołanie:** `function onInventoryChange(player, slot, item, oldItem)`

### `BlessingsChange`

**Wywołanie:** `function onBlessingsChange(player, blessings, oldBlessings)`

### `line`

**Wywołanie:** `function online()`

### `SetFightMode`

**Wywołanie:** `function onSetFightMode(self, selectedFightButton)`

### `SetChaseMode`

**Wywołanie:** `function onSetChaseMode(self, checked)`

### `SetSafeFight`

**Wywołanie:** `function onSetSafeFight(self, checked)`

### `SetSafeFight2`

**Wywołanie:** `function onSetSafeFight2(self)`

### `SetSafeFight`

**Wywołanie:** `onSetSafeFight(self, not safeFightButton:isChecked())`

### `SetPVPMode`

**Wywołanie:** `function onSetPVPMode(self, selectedPVPButton)`

### `MountButtonClick`

**Wywołanie:** `function onMountButtonClick(self, mousePos)`

### `OutfitChange`

**Wywołanie:** `function onOutfitChange(localPlayer, outfit, oldOutfit)`

### `createWidget`

**Wywołanie:** `local icon = g_ui.createWidget('ConditionWidget', conditionPanel)`

### `SoulChange`

**Wywołanie:** `function onSoulChange(localPlayer, soul)`

### `FreeCapacityChange`

**Wywołanie:** `function onFreeCapacityChange(player, freeCapacity)`

### `StatesChange`

**Wywołanie:** `function onStatesChange(localPlayer, now, old)`

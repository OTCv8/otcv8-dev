---
doc_id: "lua-spec-a65096d19065"
source_path: "game_bot/default_configs/vBot_4.8/vBot/extras.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: extras.lua"
summary: "Dokumentacja modułu Lua dla game_bot/default_configs/vBot_4.8/vBot/extras.lua"
tags: ["lua", "module", "otclient"]
---

# game_bot/default_configs/vBot_4.8/vBot/extras.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla extras.

## Globals/Exports

### `candidates`

## Functions

### `extrasWindow.closeButton.onClick(widget)`

**Parametry:**

- `widget`

### `extrasWindow.onGeometryChange(widget, old, new)`

**Parametry:**

- `widget`
- `old`
- `new`

### `widget.onClick()`

### `widget.item.onItemChange(widget)`

**Parametry:**

- `widget`

### `widget.textEdit.onTextChange(widget,text)`

**Parametry:**

- `widget`
- `text`

### `widget.scroll.onValueChange(scroll, value)`

**Parametry:**

- `scroll`
- `value`

### `checkForDoors(pos)`

**Parametry:**

- `pos`

### `checkPlayers()`

### `openNextLootContainer()`

### `forceMarked(creature)`

**Parametry:**

- `creature`

## Events/Callbacks

### `ValueChange`

**Wywołanie:** `widget.scroll.onValueChange(widget.scroll, widget.scroll:getValue())`

### `Talk`

**Wywołanie:** `onTalk(function(name, level, mode, text, channelId, pos)`

### `AddThing`

**Wywołanie:** `onAddThing(function(tile, thing)`

### `RemoveThing`

**Wywołanie:** `onRemoveThing(function(tile, thing)`

### `event`

**Wywołanie:** `schedule(50, function() turn(dir) end)`

### `tainer`

**Wywołanie:** `if item and item:isContainer() then`

### `Talk`

**Wywołanie:** `onTalk(function(name, level, mode, text, channelId, pos)`

### `KeyPress`

**Wywołanie:** `onKeyPress(function(keys)`

### `TextMessage`

**Wywołanie:** `onTextMessage(function(mode,text)`

### `event`

**Wywołanie:** `schedule(2000, function()`

### `UseWith`

**Wywołanie:** `onUseWith(function(pos, itemId, target, subType)`

### `event`

**Wywołanie:** `schedule(50, function()`

### `RemoveThing`

**Wywołanie:** `onRemoveThing(function(tile, thing)`

### `AddThing`

**Wywołanie:** `onAddThing(function(tile, thing)`

### `KeyDown`

**Wywołanie:** `onKeyDown(function(keys)`

### `KeyPress`

**Wywołanie:** `onKeyPress(function(keys)`

### `event`

**Wywołanie:** `schedule(500, function()`

### `PlayerPositionChange`

**Wywołanie:** `onPlayerPositionChange(function(x,y)`

### `event`

**Wywołanie:** `schedule(20, function() checkPlayers() end)`

### `CreatureAppear`

**Wywołanie:** `onCreatureAppear(function(creature)`

### `TextMessage`

**Wywołanie:** `onTextMessage(function(mode, text)`

### `tainer`

**Wywołanie:** `local function openNextLootContainer()`

### `tainers`

**Wywołanie:** `local containers = getContainers()`

### `tainers`

**Wywołanie:** `local lootCotaniersIds = CaveBot.GetLootContainers()`

### `tainerItem`

**Wywołanie:** `local cId = container:getContainerItem():getId()`

### `tainerIsFull`

**Wywołanie:** `if containerIsFull(container) then`

### `ContainerOpen`

**Wywołanie:** `onContainerOpen(function(container, previousContainer)`

### `event`

**Wywołanie:** `schedule(100, function()`

### `tainer`

**Wywołanie:** `openNextLootContainer()`

### `AddItem`

**Wywołanie:** `onAddItem(function(container, slot, item, oldItem)`

### `event`

**Wywołanie:** `schedule(100, function()`

### `tainer`

**Wywołanie:** `openNextLootContainer()`

### `event`

**Wywołanie:** `return schedule(333, function() forceMarked(creature) end)`

### `AttackingCreatureChange`

**Wywołanie:** `onAttackingCreatureChange(function(newCreature, oldCreature)`

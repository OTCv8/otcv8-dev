---
doc_id: "lua-spec-e44876b10d9d"
source_path: "game_bot/default_configs/cavebot_1.3/targetbot/looting.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: looting.lua"
summary: "Dokumentacja modułu Lua dla game_bot/default_configs/cavebot_1.3/targetbot/looting.lua"
tags: ["lua", "module", "otclient"]
---

# game_bot/default_configs/cavebot_1.3/targetbot/looting.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla looting.

## Globals/Exports

### `itemsById`

### `containersById`

## Functions

### `TargetBot.Looting.setup()`

### `ui.everyItem.onClick()`

### `ui.maxDangerPanel.value.onTextChange()`

### `ui.minCapacityPanel.value.onTextChange()`

### `TargetBot.Looting.onItemsUpdate()`

### `TargetBot.Looting.onContainersUpdate()`

### `TargetBot.Looting.update(data)`

**Parametry:**

- `data`

### `TargetBot.Looting.save(data)`

**Parametry:**

- `data`

### `TargetBot.Looting.updateItemsAndContainers()`

### `TargetBot.Looting.getStatus()`

### `TargetBot.Looting.process(targets, dangerLevel)`

**Parametry:**

- `targets`
- `dangerLevel`

### `TargetBot.Looting.getLootContainers(containers)`

**Parametry:**

- `containers`

### `TargetBot.Looting.lootContainer(lootContainers, container)`

**Parametry:**

- `lootContainers`
- `container`

### `TargetBot.Looting.lootItem(lootContainers, item)`

**Parametry:**

- `lootContainers`
- `item`

## Events/Callbacks

### `tainer`

**Wywołanie:** `UI.Container(TargetBot.Looting.onItemsUpdate, true, nil, ui.items)`

### `tainer`

**Wywołanie:** `UI.Container(TargetBot.Looting.onContainersUpdate, true, nil, ui.containers)`

### `umber`

**Wywołanie:** `local value = tonumber(ui.maxDangerPanel.value:getText())`

### `umber`

**Wywołanie:** `local value = tonumber(ui.minCapacityPanel.value:getText())`

### `tainers`

**Wywołanie:** `TargetBot.Looting.updateItemsAndContainers()`

### `tainers`

**Wywołanie:** `TargetBot.Looting.updateItemsAndContainers()`

### `tainers`

**Wywołanie:** `TargetBot.Looting.updateItemsAndContainers()`

### `umber`

**Wywołanie:** `data['maxDanger'] = tonumber(ui.maxDangerPanel.value:getText())`

### `umber`

**Wywołanie:** `data['minCapacity'] = tonumber(ui.minCapacityPanel.value:getText())`

### `umber`

**Wywołanie:** `if dangerLevel > tonumber(ui.maxDangerPanel.value:getText()) then`

### `umber`

**Wywołanie:** `if player:getFreeCapacity() < tonumber(ui.minCapacityPanel.value:getText()) then`

### `tainers`

**Wywołanie:** `local containers = g_game.getContainers()`

### `tainers`

**Wywołanie:** `local lootContainers = TargetBot.Looting.getLootContainers(containers)`

### `tainer`

**Wywołanie:** `TargetBot.Looting.lootContainer(lootContainers, container)`

### `tainer`

**Wywołanie:** `if not container or not container:isContainer() then`

### `tainerItem`

**Wywołanie:** `openedContainersById[container:getContainerItem():getId()] = 1`

### `tainerItem`

**Wywołanie:** `if containersById[container:getContainerItem():getId()] and not container.lootContainer then`

### `tainer`

**Wywołanie:** `if item:isContainer() and containersById[item:getId()] then`

### `tainerItem`

**Wywołanie:** `if not containersById[container:getContainerItem():getId()] and not container.lootContainer then`

### `tainer`

**Wywołanie:** `if item:isContainer() and containersById[item:getId()] then`

### `tainer`

**Wywołanie:** `if item and item:isContainer() and not openedContainersById[item:getId()] then`

### `tainer`

**Wywołanie:** `if item:isContainer() and not itemsById[item:getId()] then`

### `tainer`

**Wywołanie:** `elseif itemsById[item:getId()] or (ui.everyItem:isOn() and not item:isContainer()) then`

### `ContainerOpen`

**Wywołanie:** `onContainerOpen(function(container, previousContainer)`

### `tainerItem`

**Wywołanie:** `if container:getContainerItem():getId() == waitingForContainer then`

### `CreatureDisappear`

**Wywołanie:** `onCreatureDisappear(function(creature)`

### `ster`

**Wywołanie:** `if not creature:isMonster() then return end`

### `tainer`

**Wywołanie:** `schedule(20, function() -- check in 20ms if there's container (dead body) on that tile`

### `tainer`

**Wywołanie:** `if not container or not container:isContainer() then return end`

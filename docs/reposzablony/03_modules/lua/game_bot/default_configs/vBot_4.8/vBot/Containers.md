---
doc_id: "lua-spec-788a916317b2"
source_path: "game_bot/default_configs/vBot_4.8/vBot/Containers.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: Containers.lua"
summary: "Dokumentacja modułu Lua dla game_bot/default_configs/vBot_4.8/vBot/Containers.lua"
tags: ["lua", "module", "otclient"]
---

# game_bot/default_configs/vBot_4.8/vBot/Containers.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla Containers.

## Globals/Exports

### `items`

## Functions

### `findItemsInArray(t, tfind)`

**Parametry:**

- `t`
- `tfind`

### `reopenBackpacks()`

### `contListWindow.onGeometryChange(widget, old, new)`

**Parametry:**

- `widget`
- `old`
- `new`

### `renameContui.editContList.onClick(widget)`

**Parametry:**

- `widget`

### `renameContui.reopenCont.onClick(widget)`

**Parametry:**

- `widget`

### `renameContui.minimiseCont.onClick(widget)`

**Parametry:**

- `widget`

### `renameContui.title.onClick(widget)`

**Parametry:**

- `widget`

### `contListWindow.closeButton.onClick(widget)`

**Parametry:**

- `widget`

### `contListWindow.purse.onClick(widget)`

**Parametry:**

- `widget`

### `contListWindow.sort.onClick(widget)`

**Parametry:**

- `widget`

### `contListWindow.forceOpen.onClick(widget)`

**Parametry:**

- `widget`

### `contListWindow.lootBag.onClick(widget)`

**Parametry:**

- `widget`

### `refreshSortList(k, t)`

**Parametry:**

- `k`
- `t`

### `label.onMouseRelease()`

### `label.enabled.onClick(widget)`

**Parametry:**

- `widget`

### `label.remove.onClick(widget)`

**Parametry:**

- `widget`

### `label.state.onClick(widget)`

**Parametry:**

- `widget`

### `label.openNext.onClick(widget)`

**Parametry:**

- `widget`

### `contListWindow.addItem.onClick(widget)`

**Parametry:**

- `widget`

### `nameContainersOnLogin()`

### `moveItem(item, destination)`

**Parametry:**

- `item`
- `destination`

### `properTable(t)`

**Parametry:**

- `t`

## Events/Callbacks

### `loadUIFromString`

**Wywołanie:** `g_ui.loadUIFromString([[`

### `tainers`

**Wywołanie:** `for i, container in pairs(g_game.getContainers()) do`

### `tainer`

**Wywołanie:** `if item:isContainer() and item:getId() == id then`

### `tainers`

**Wywołanie:** `for _, container in pairs(g_game.getContainers()) do g_game.close(container) end`

### `event`

**Wywołanie:** `schedule(500, function()`

### `event`

**Wywołanie:** `schedule(delay, function()`

### `tainer`

**Wywołanie:** `openContainer(lstBPs[i])`

### `getRootWidget`

**Wywołanie:** `rootWidget = g_ui.getRootWidget()`

### `tainers`

**Wywołanie:** `for i, container in ipairs(getContainers()) do`

### `tentHeight`

**Wywołanie:** `containerWindow:setContentHeight(34)`

### `tainer`

**Wywołanie:** `UI.Container(function()`

### `createWidget`

**Wywołanie:** `local label = g_ui.createWidget("BackpackName", contListWindow.itemList)`

### `tNames`

**Wywołanie:** `refreshContNames(id)`

### `tNames`

**Wywołanie:** `refreshContNames()`

### `ContainerOpen`

**Wywołanie:** `onContainerOpen(function(container, previousContainer)`

### `tentHeight`

**Wywołanie:** `containerWindow:setContentHeight(34)`

### `tainerItem`

**Wywołanie:** `if entry.enabled and string.find(container:getContainerItem():getId(), entry.item) then`

### `event`

**Wywołanie:** `schedule(time, function()`

### `tainersOnLogin`

**Wywołanie:** `local function nameContainersOnLogin()`

### `tainers`

**Wywołanie:** `for i, container in ipairs(getContainers()) do`

### `tainerItem`

**Wywołanie:** `if entry.enabled and string.find(container:getContainerItem():getId(), entry.item) then`

### `tainersOnLogin`

**Wywołanie:** `nameContainersOnLogin()`

### `tainers`

**Wywołanie:** `for _, container in pairs(getContainers()) do`

### `tainerItem`

**Wywołanie:** `local cId = container:getContainerItem():getId()`

### `tainerByItem`

**Wywołanie:** `local destination = getContainerByItem(dId, true)`

### `tainerIsFull`

**Wywołanie:** `if destination and not containerIsFull(destination) then`

### `tainerByItem`

**Wywołanie:** `local container = getContainerByItem(dId)`

### `tainerByItem`

**Wywołanie:** `if config.purse and config.forceOpen and not getContainerByItem(23396) then`

### `tainerByItem`

**Wywołanie:** `if config.lootBag and config.forceOpen and not getContainerByItem(23721) then`

### `tainerByItem`

**Wywołanie:** `g_game.open(findItem(23721), getContainerByItem(23396))`

### `ContainerOpen`

**Wywołanie:** `onContainerOpen(function(container, previousContainer)`

### `AddItem`

**Wywołanie:** `onAddItem(function(container, slot, item, oldItem)`

### `PlayerInventoryChange`

**Wywołanie:** `onPlayerInventoryChange(function(slot, item, oldItem)`

### `ContainerClose`

**Wywołanie:** `onContainerClose(function(container)`

---
doc_id: "lua-spec-3eb8e3fe6442"
source_path: "game_containers/containers.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: containers.lua"
summary: "Dokumentacja modułu Lua dla game_containers/containers.lua"
tags: ["lua", "module", "otclient"]
---

# game_containers/containers.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla containers.

## Functions

### `init()`

### `terminate()`

### `reloadContainers()`

### `clean()`

### `markStart()`

### `destroy(container)`

**Parametry:**

- `container`

### `refreshContainerItems(container)`

**Parametry:**

- `container`

### `toggleContainerPages(containerWindow, hasPages)`

**Parametry:**

- `containerWindow`
- `hasPages`

### `refreshContainerPages(container)`

**Parametry:**

- `container`

### `prevPageButton.onClick()`

### `nextPageButton.onClick()`

### `pagePanel.onMouseWheel(widget, mousePos, mouseWheel)`

**Parametry:**

- `widget`
- `mousePos`
- `mouseWheel`

### `onContainerOpen(container, previousContainer)`

**Parametry:**

- `container`
- `previousContainer`

### `containerWindow.onClose()`

### `containerWindow.onDrop(container, widget, mousePos)`

**Parametry:**

- `container`
- `widget`
- `mousePos`

### `containerWindow.onMouseRelease(widget, mousePos, mouseButton)`

**Parametry:**

- `widget`
- `mousePos`
- `mouseButton`

### `upButton.onClick()`

### `onContainerClose(container)`

**Parametry:**

- `container`

### `onContainerChangeSize(container, size)`

**Parametry:**

- `container`
- `size`

### `onContainerUpdateItem(container, slot, item, oldItem)`

**Parametry:**

- `container`
- `slot`
- `item`
- `oldItem`

## Events/Callbacks

### `Container`

**Wywołanie:** `connect(Container, { onOpen = onContainerOpen,`

### `g_game`

**Wywołanie:** `connect(g_game, {`

### `tainers`

**Wywołanie:** `reloadContainers()`

### `Container`

**Wywołanie:** `disconnect(Container, { onOpen = onContainerOpen,`

### `g_game`

**Wywołanie:** `disconnect(g_game, {`

### `tainers`

**Wywołanie:** `function reloadContainers()`

### `tainers`

**Wywołanie:** `for _,container in pairs(g_game.getContainers()) do`

### `ContainerOpen`

**Wywołanie:** `onContainerOpen(container)`

### `tainers`

**Wywołanie:** `for containerid,container in pairs(g_game.getContainers()) do`

### `tainerItems`

**Wywołanie:** `function refreshContainerItems(container)`

### `tainerPages`

**Wywołanie:** `refreshContainerPages(container)`

### `tainerPages`

**Wywołanie:** `function toggleContainerPages(containerWindow, hasPages)`

### `tainerPages`

**Wywołanie:** `function refreshContainerPages(container)`

### `tainer`

**Wywołanie:** `prevPageButton.onClick = function() g_game.seekInContainer(container:getId(), container:getFirstIndex() - container:getCapacity()) end`

### `tainer`

**Wywołanie:** `nextPageButton.onClick = function() g_game.seekInContainer(container:getId(), container:getFirstIndex() + container:getCapacity()) end`

### `Click`

**Wywołanie:** `return prevPageButton.onClick()`

### `Click`

**Wywołanie:** `return nextPageButton.onClick()`

### `ContainerOpen`

**Wywołanie:** `function onContainerOpen(container, previousContainer)`

### `tainerPanel`

**Wywołanie:** `containerWindow = g_ui.createWidget('ContainerWindow', modules.game_interface.getContainerPanel())`

### `Drop`

**Wywołanie:** `child:onDrop(widget, mousePos, true)`

### `tainer`

**Wywołanie:** `if item:isContainer() then`

### `tainerItem`

**Wywołanie:** `containerItemWidget:setItem(container:getContainerItem())`

### `createWidget`

**Wywołanie:** `local itemWidget = g_ui.createWidget('Item', containerPanel)`

### `tainerPages`

**Wywołanie:** `toggleContainerPages(containerWindow, container:hasPages())`

### `tainerPages`

**Wywołanie:** `refreshContainerPages(container)`

### `tentMinimumHeight`

**Wywołanie:** `containerWindow:setContentMinimumHeight(cellSize.height)`

### `tentMaximumHeight`

**Wywołanie:** `containerWindow:setContentMaximumHeight(cellSize.height*layout:getNumLines())`

### `tentHeight`

**Wywołanie:** `containerWindow:setContentHeight(filledLines*cellSize.height)`

### `ContainerClose`

**Wywołanie:** `function onContainerClose(container)`

### `ContainerChangeSize`

**Wywołanie:** `function onContainerChangeSize(container, size)`

### `tainerItems`

**Wywołanie:** `refreshContainerItems(container)`

### `ContainerUpdateItem`

**Wywołanie:** `function onContainerUpdateItem(container, slot, item, oldItem)`

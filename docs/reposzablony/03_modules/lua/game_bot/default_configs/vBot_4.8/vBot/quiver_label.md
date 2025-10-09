---
doc_id: "lua-spec-1df8c8687bbe"
source_path: "game_bot/default_configs/vBot_4.8/vBot/quiver_label.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: quiver_label.lua"
summary: "Dokumentacja modułu Lua dla game_bot/default_configs/vBot_4.8/vBot/quiver_label.lua"
tags: ["lua", "module", "otclient"]
---

# game_bot/default_configs/vBot_4.8/vBot/quiver_label.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla quiver_label.

## Functions

### `getQuiverAmount()`

## Events/Callbacks

### `loadUIFromString`

**Wywołanie:** `label = label or g_ui.loadUIFromString([[`

### `tainer`

**Wywołanie:** `local isQuiverEquipped = getRight() and getRight():isContainer() or false`

### `tainerByItem`

**Wywołanie:** `local quiver = isQuiverEquipped and getContainerByItem(getRight():getId())`

### `ContainerOpen`

**Wywołanie:** `onContainerOpen(function(container, previousContainer)`

### `ContainerClose`

**Wywołanie:** `onContainerClose(function(container)`

### `AddItem`

**Wywołanie:** `onAddItem(function(container, slot, item, oldItem)`

### `RemoveItem`

**Wywołanie:** `onRemoveItem(function(container, slot, item)`

### `ContainerUpdateItem`

**Wywołanie:** `onContainerUpdateItem(function(container, slot, item, oldItem)`

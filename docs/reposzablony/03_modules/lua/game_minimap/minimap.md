---
doc_id: "lua-spec-67dd918e479a"
source_path: "game_minimap/minimap.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: minimap.lua"
summary: "Dokumentacja modułu Lua dla game_minimap/minimap.lua"
tags: ["lua", "module", "otclient"]
---

# game_minimap/minimap.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla minimap.

## Functions

### `init()`

### `terminate()`

### `toggle()`

### `onMiniWindowClose()`

### `online()`

### `offline()`

### `loadMap()`

### `saveMap()`

### `updateCameraPosition()`

### `toggleFullMap()`

## Events/Callbacks

### `loadUI`

**Wywołanie:** `minimapWindow = g_ui.loadUI('minimap', modules.game_interface.getRightPanel())`

### `tentMinimumHeight`

**Wywołanie:** `minimapWindow:setContentMinimumHeight(64)`

### `g_game`

**Wywołanie:** `connect(g_game, {`

### `LocalPlayer`

**Wywołanie:** `connect(LocalPlayer, {`

### `line`

**Wywołanie:** `online()`

### `g_game`

**Wywołanie:** `disconnect(g_game, {`

### `LocalPlayer`

**Wywołanie:** `disconnect(LocalPlayer, {`

### `MiniWindowClose`

**Wywołanie:** `function onMiniWindowClose()`

### `line`

**Wywołanie:** `function online()`

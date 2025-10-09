---
doc_id: "lua-spec-e7fdf0e11b66"
source_path: "client_topmenu/topmenu.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:04Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: topmenu.lua"
summary: "Dokumentacja modułu Lua dla client_topmenu/topmenu.lua"
tags: ["lua", "module", "otclient"]
---

# client_topmenu/topmenu.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla topmenu.

## Functions

### `addButton(id, description, icon, callback, panel, toggle, front, index)`

private functions

**Parametry:**

- `id`
- `description`
- `icon`
- `callback`
- `panel`
- `toggle`
- `front`
- `index`

### `button.onMouseRelease(widget, mousePos, mouseButton)`

**Parametry:**

- `widget`
- `mousePos`
- `mouseButton`

### `init()`

public functions

### `terminate()`

### `online()`

### `offline()`

### `updateFps()`

### `updatePing(ping)`

**Parametry:**

- `ping`

### `setPingVisible(enable)`

**Parametry:**

- `enable`

### `setFpsVisible(enable)`

**Parametry:**

- `enable`

### `addLeftButton(id, description, icon, callback, front, index)`

**Parametry:**

- `id`
- `description`
- `icon`
- `callback`
- `front`
- `index`

### `addLeftToggleButton(id, description, icon, callback, front, index)`

**Parametry:**

- `id`
- `description`
- `icon`
- `callback`
- `front`
- `index`

### `addRightButton(id, description, icon, callback, front, index)`

**Parametry:**

- `id`
- `description`
- `icon`
- `callback`
- `front`
- `index`

### `addRightToggleButton(id, description, icon, callback, front, index)`

**Parametry:**

- `id`
- `description`
- `icon`
- `callback`
- `front`
- `index`

### `addLeftGameButton(id, description, icon, callback, front, index)`

**Parametry:**

- `id`
- `description`
- `icon`
- `callback`
- `front`
- `index`

### `addLeftGameToggleButton(id, description, icon, callback, front, index)`

**Parametry:**

- `id`
- `description`
- `icon`
- `callback`
- `front`
- `index`

### `addRightGameButton(id, description, icon, callback, front, index)`

**Parametry:**

- `id`
- `description`
- `icon`
- `callback`
- `front`
- `index`

### `addRightGameToggleButton(id, description, icon, callback, front, index)`

**Parametry:**

- `id`
- `description`
- `icon`
- `callback`
- `front`
- `index`

### `showGameButtons()`

### `hideGameButtons()`

### `getButton(id)`

**Parametry:**

- `id`

### `getTopMenu()`

### `toggle()`

### `hide()`

### `show()`

### `updateStatus()`

## Events/Callbacks

### `createWidget`

**Wywołanie:** `button = g_ui.createWidget(class)`

### `tainsPoint`

**Wywołanie:** `if widget:containsPoint(mousePos) and mouseButton ~= MouseMidButton and mouseButton ~= MouseTouch then`

### `g_game`

**Wywołanie:** `connect(g_game, { onGameStart = online,`

### `createWidget`

**Wywołanie:** `topMenu = g_ui.createWidget('TopMenu', g_ui.getRootWidget())`

### `g_game`

**Wywołanie:** `disconnect(g_game, { onGameStart = online,`

### `line`

**Wywołanie:** `function online()`

### `s`

**Wywołanie:** `showGameButtons()`

### `event`

**Wywołanie:** `addEvent(function()`

### `s`

**Wywołanie:** `hideGameButtons()`

### `s`

**Wywołanie:** `function showGameButtons()`

### `s`

**Wywołanie:** `modules.game_buttons.takeButtons(topMenu.leftGameButtonsPanel:getChildren())`

### `s`

**Wywołanie:** `modules.game_buttons.takeButtons(topMenu.rightGameButtonsPanel:getChildren())`

### `s`

**Wywołanie:** `function hideGameButtons()`

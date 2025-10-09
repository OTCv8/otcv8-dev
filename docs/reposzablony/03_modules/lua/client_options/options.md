---
doc_id: "lua-spec-67d43fab30c3"
source_path: "client_options/options.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:04Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: options.lua"
summary: "Dokumentacja modułu Lua dla client_options/options.lua"
tags: ["lua", "module", "otclient"]
---

# client_options/options.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla options.

## Functions

### `init()`

### `terminate()`

### `setup()`

### `toggle()`

### `show()`

### `hide()`

### `toggleDisplays()`

### `toggleOption(key)`

**Parametry:**

- `key`

### `setOption(key, value, force)`

**Parametry:**

- `key`
- `value`
- `force`

### `getOption(key)`

**Parametry:**

- `key`

### `addTab(name, panel, icon)`

**Parametry:**

- `name`
- `panel`
- `icon`

### `addButton(name, func, icon)`

**Parametry:**

- `name`
- `func`
- `icon`

### `online()`

hide/show

### `offline()`

### `setLightOptionsVisibility(value)`

classic view graphics

**Parametry:**

- `value`

## Events/Callbacks

### `displayUI`

**Wywołanie:** `optionsWindow = g_ui.displayUI('options')`

### `tentWidget`

**Wywołanie:** `optionsTabBar:setContentWidget(optionsWindow:getChildById('optionsTabContent'))`

### `loadUI`

**Wywołanie:** `generalPanel = g_ui.loadUI('game')`

### `loadUI`

**Wywołanie:** `interfacePanel = g_ui.loadUI('interface')`

### `loadUI`

**Wywołanie:** `consolePanel = g_ui.loadUI('console')`

### `loadUI`

**Wywołanie:** `graphicsPanel = g_ui.loadUI('graphics')`

### `loadUI`

**Wywołanie:** `audioPanel = g_ui.loadUI('audio')`

### `createWidget`

**Wywołanie:** `extrasPanel = g_ui.createWidget('OptionPanel')`

### `createWidget`

**Wywołanie:** `local extrasButton = g_ui.createWidget('OptionCheckBox')`

### `loadUI`

**Wywołanie:** `customPanel = g_ui.loadUI('custom')`

### `event`

**Wywołanie:** `addEvent(function() setup() end)`

### `g_game`

**Wywołanie:** `connect(g_game, { onGameStart = online,`

### `g_game`

**Wywołanie:** `disconnect(g_game, { onGameStart = online,`

### `line`

**Wywołanie:** `online()`

### `event`

**Wywołanie:** `addEvent(function()`

### `ProfileChange`

**Wywołanie:** `modules.client_profiles.onProfileChange()`

### `line`

hide/show

**Wywołanie:** `function online()`

### `sVisibility`

**Wywołanie:** `setLightOptionsVisibility(not g_game.getFeature(GameForceLight))`

### `sVisibility`

**Wywołanie:** `setLightOptionsVisibility(true)`

### `sVisibility`

classic view graphics

**Wywołanie:** `function setLightOptionsVisibility(value)`

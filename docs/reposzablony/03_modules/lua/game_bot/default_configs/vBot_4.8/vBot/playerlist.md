---
doc_id: "lua-spec-e1b428253b1b"
source_path: "game_bot/default_configs/vBot_4.8/vBot/playerlist.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: playerlist.lua"
summary: "Dokumentacja modułu Lua dla game_bot/default_configs/vBot_4.8/vBot/playerlist.lua"
tags: ["lua", "module", "otclient"]
---

# game_bot/default_configs/vBot_4.8/vBot/playerlist.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla playerlist.

## Globals/Exports

### `enemyList`

### `friendList`

### `blackList`

### `CachedFriends`

### `CachedEnemies`

## Functions

### `clearCachedPlayers()`

functions

### `ListWindow.settings.Members.onClick(widget)`

**Parametry:**

- `widget`

### `ListWindow.settings.Outfit.onClick(widget)`

**Parametry:**

- `widget`

### `ListWindow.settings.NeutralsAreEnemy.onClick(widget)`

**Parametry:**

- `widget`

### `ListWindow.settings.Highlight.onClick(widget)`

**Parametry:**

- `widget`

### `ListWindow.settings.AutoAdd.onClick(widget)`

**Parametry:**

- `widget`

### `label.remove.onClick()`

### `label.onMouseRelease(widget, mousePos, mouseButton)`

**Parametry:**

- `widget`
- `mousePos`
- `mouseButton`

### `tabButton.onStyleApply(widget)`

**Parametry:**

- `widget`

### `addButton.onClick()`

callbacks

### `label.remove.onClick()`

### `label.onMouseRelease(widget, mousePos, mouseButton)`

**Parametry:**

- `widget`
- `mousePos`
- `mouseButton`

### `nameTab.onKeyPress(widget, keyCode, keyboardModifiers)`

**Parametry:**

- `widget`
- `keyCode`
- `keyboardModifiers`

### `addBlackListPlayer(name)`

**Parametry:**

- `name`

### `label.remove.onClick()`

### `label.onMouseRelease(widget, mousePos, mouseButton)`

**Parametry:**

- `widget`
- `mousePos`
- `mouseButton`

## Events/Callbacks

### `getRootWidget`

**Wywołanie:** `rootWidget = g_ui.getRootWidget()`

### `tentWidget`

**Wywołanie:** `TabBar:setContentWidget(ListWindow.tmpTabContent)`

### `createWidget`

**Wywołanie:** `local listPanel = g_ui.createWidget("tPanel") -- Creates Panel`

### `createWidget`

**Wywołanie:** `local menu = g_ui.createWidget('PopupMenu')`

### `createWidget`

**Wywołanie:** `local menu = g_ui.createWidget('PopupMenu')`

### `Click`

**Wywołanie:** `addButton.onClick()`

### `createWidget`

**Wywołanie:** `local menu = g_ui.createWidget('PopupMenu')`

### `TextMessage`

**Wywołanie:** `onTextMessage(function(mode,text)`

### `CreatureAppear`

**Wywołanie:** `onCreatureAppear(function(creature)`

### `PlayerPositionChange`

**Wywołanie:** `onPlayerPositionChange(function(x,y)`

### `event`

**Wywołanie:** `schedule(20, function()`

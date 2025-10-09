---
doc_id: "lua-spec-c4f15911d1b6"
source_path: "game_playertrade/playertrade.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:06Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: playertrade.lua"
summary: "Dokumentacja modułu Lua dla game_playertrade/playertrade.lua"
tags: ["lua", "module", "otclient"]
---

# game_playertrade/playertrade.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla playertrade.

## Functions

### `init()`

### `terminate()`

### `createTrade()`

### `tradeWindow.onClose()`

### `fillTrade(name, items, counter)`

**Parametry:**

- `name`
- `items`
- `counter`

### `itemWidget.onClick()`

### `onGameOwnTrade(name, items)`

**Parametry:**

- `name`
- `items`

### `onGameCounterTrade(name, items)`

**Parametry:**

- `name`
- `items`

### `onGameCloseTrade()`

## Events/Callbacks

### `importStyle`

**Wywołanie:** `g_ui.importStyle('tradewindow')`

### `g_game`

**Wywołanie:** `connect(g_game, { onOwnTrade = onGameOwnTrade,`

### `g_game`

**Wywołanie:** `disconnect(g_game, { onOwnTrade = onGameOwnTrade,`

### `createWidget`

**Wywołanie:** `tradeWindow = g_ui.createWidget('TradeWindow', modules.game_interface.getRightPanel())`

### `createWidget`

**Wywołanie:** `local itemWidget = g_ui.createWidget('Item', tradeContainer)`

### `GameOwnTrade`

**Wywołanie:** `function onGameOwnTrade(name, items)`

### `GameCounterTrade`

**Wywołanie:** `function onGameCounterTrade(name, items)`

### `GameCloseTrade`

**Wywołanie:** `function onGameCloseTrade()`

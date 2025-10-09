---
doc_id: "lua-spec-6da9dbbe13fc"
source_path: "client_background/background.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:04Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: background.lua"
summary: "Dokumentacja modułu Lua dla client_background/background.lua"
tags: ["lua", "module", "otclient"]
---

# client_background/background.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla background.

## Functions

### `init()`

public functions

### `terminate()`

### `hide()`

### `show()`

### `hideVersionLabel()`

### `setVersionText(text)`

**Parametry:**

- `text`

### `getBackground()`

## Events/Callbacks

### `displayUI`

**Wywołanie:** `background = g_ui.displayUI('background')`

### `event`

**Wywołanie:** `addEvent(function() g_effects.fadeIn(clientVersionLabel, 1500) end)`

### `g_game`

**Wywołanie:** `connect(g_game, { onGameStart = hide })`

### `g_game`

**Wywołanie:** `connect(g_game, { onGameEnd = show })`

### `g_game`

**Wywołanie:** `disconnect(g_game, { onGameStart = hide })`

### `g_game`

**Wywołanie:** `disconnect(g_game, { onGameEnd = show })`

### `Label`

**Wywołanie:** `function hideVersionLabel()`

### `Text`

**Wywołanie:** `function setVersionText(text)`

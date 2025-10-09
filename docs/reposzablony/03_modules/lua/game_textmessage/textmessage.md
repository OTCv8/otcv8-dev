---
doc_id: "lua-spec-47b0d9a92548"
source_path: "game_textmessage/textmessage.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:06Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: textmessage.lua"
summary: "Dokumentacja modułu Lua dla game_textmessage/textmessage.lua"
tags: ["lua", "module", "otclient"]
---

# game_textmessage/textmessage.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla textmessage.

## Globals/Exports

### `none`

## Functions

### `init()`

### `terminate()`

### `calculateVisibleTime(text)`

**Parametry:**

- `text`

### `displayMessage(mode, text)`

**Parametry:**

- `mode`
- `text`

### `displayPrivateMessage(text)`

**Parametry:**

- `text`

### `displayStatusMessage(text)`

**Parametry:**

- `text`

### `displayFailureMessage(text)`

**Parametry:**

- `text`

### `displayGameMessage(text)`

**Parametry:**

- `text`

### `displayBroadcastMessage(text)`

**Parametry:**

- `text`

### `clearMessages()`

## Events/Callbacks

### `g_game`

**Wywołanie:** `connect(g_game, 'onGameEnd', clearMessages)`

### `loadUI`

**Wywołanie:** `messagesPanel = g_ui.loadUI('textmessage', modules.game_interface.getRootPanel())`

### `g_game`

**Wywołanie:** `disconnect(g_game, 'onGameEnd', clearMessages)`

### `AutoWalkFail`

**Wywołanie:** `function LocalPlayer:onAutoWalkFail(player)`

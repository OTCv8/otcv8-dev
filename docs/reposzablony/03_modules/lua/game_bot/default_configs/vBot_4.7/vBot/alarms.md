---
doc_id: "lua-spec-7968138203b0"
source_path: "game_bot/default_configs/vBot_4.7/vBot/alarms.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: alarms.lua"
summary: "Dokumentacja modułu Lua dla game_bot/default_configs/vBot_4.7/vBot/alarms.lua"
tags: ["lua", "module", "otclient"]
---

# game_bot/default_configs/vBot_4.7/vBot/alarms.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla alarms.

## Functions

### `ui.title.onClick(widget)`

**Parametry:**

- `widget`

### `alarmsWindow.closeButton.onClick(widget)`

**Parametry:**

- `widget`

### `alarmsWindow.playerAttack.onClick(widget)`

**Parametry:**

- `widget`

### `alarmsWindow.playerDetected.onClick(widget)`

**Parametry:**

- `widget`

### `alarmsWindow.playerDetectedLogout.onClick(widget)`

**Parametry:**

- `widget`

### `alarmsWindow.creatureDetected.onClick(widget)`

**Parametry:**

- `widget`

### `alarmsWindow.healthBelow.onClick(widget)`

**Parametry:**

- `widget`

### `alarmsWindow.healthValue.onValueChange(scroll, value)`

**Parametry:**

- `scroll`
- `value`

### `alarmsWindow.manaBelow.onClick(widget)`

**Parametry:**

- `widget`

### `alarmsWindow.manaValue.onValueChange(scroll, value)`

**Parametry:**

- `scroll`
- `value`

### `alarmsWindow.privateMessage.onClick(widget)`

**Parametry:**

- `widget`

### `alarmsWindow.ignoreFriends.onClick(widget)`

**Parametry:**

- `widget`

### `alarmsWindow.warnBoss.onClick(widget)`

**Parametry:**

- `widget`

### `alarmsWindow.bossName.onTextChange(widget, text)`

**Parametry:**

- `widget`
- `text`

### `alarmsWindow.warnMessage.onClick(widget)`

**Parametry:**

- `widget`

### `alarmsWindow.messageText.onTextChange(widget, text)`

**Parametry:**

- `widget`
- `text`

### `ui.alerts.onClick(widget)`

**Parametry:**

- `widget`

## Events/Callbacks

### `getRootWidget`

**Wywołanie:** `rootWidget = g_ui.getRootWidget()`

### `TextMessage`

**Wywołanie:** `onTextMessage(function(mode, text)`

### `Talk`

**Wywołanie:** `onTalk(function(name, level, mode, text, channelId, pos)`

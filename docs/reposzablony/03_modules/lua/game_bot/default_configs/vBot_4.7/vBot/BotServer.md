---
doc_id: "lua-spec-48db9f7aef93"
source_path: "game_bot/default_configs/vBot_4.7/vBot/BotServer.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: BotServer.lua"
summary: "Dokumentacja modułu Lua dla game_bot/default_configs/vBot_4.7/vBot/BotServer.lua"
tags: ["lua", "module", "otclient"]
---

# game_bot/default_configs/vBot_4.7/vBot/BotServer.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla BotServer.

## Functions

### `botServerWindow.Data.Channel.onTextChange(widget, text)`

**Parametry:**

- `widget`
- `text`

### `botServerWindow.Data.Random.onClick(widget)`

**Parametry:**

- `widget`

### `botServerWindow.Features.Feature1.onClick(widget)`

**Parametry:**

- `widget`

### `botServerWindow.Features.Feature2.onClick(widget)`

**Parametry:**

- `widget`

### `botServerWindow.Features.Feature3.onClick(widget)`

**Parametry:**

- `widget`

### `botServerWindow.Features.Feature4.onClick(widget)`

**Parametry:**

- `widget`

### `botServerWindow.Features.Feature5.onClick(widget)`

**Parametry:**

- `widget`

### `botServerWindow.Features.Broadcast.onClick(widget)`

**Parametry:**

- `widget`

### `updateStatusText()`

### `ui.botServer.onClick(widget)`

**Parametry:**

- `widget`

### `botServerWindow.closeButton.onClick(widget)`

**Parametry:**

- `widget`

## Events/Callbacks

### `getRootWidget`

**Wywołanie:** `rootWidget = g_ui.getRootWidget()`

### `createWidget`

**Wywołanie:** `botServerWindow = g_ui.createWidget('BotServerWindow', rootWidget)`

### `AddThing`

**Wywołanie:** `onAddThing(function(tile, thing)`

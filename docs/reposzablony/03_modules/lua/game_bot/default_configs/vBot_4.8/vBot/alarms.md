---
doc_id: "lua-spec-49ee023848f9"
source_path: "game_bot/default_configs/vBot_4.8/vBot/alarms.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: alarms.lua"
summary: "Dokumentacja modułu Lua dla game_bot/default_configs/vBot_4.8/vBot/alarms.lua"
tags: ["lua", "module", "otclient"]
---

# game_bot/default_configs/vBot_4.8/vBot/alarms.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla alarms.

## Functions

### `ui.title.onClick(widget)`

**Parametry:**

- `widget`

### `ui.alerts.onClick()`

### `addAlarm(id, title, defaultValue, alarmType, parent, tooltip)`

type

**Parametry:**

- `id`
- `title`
- `defaultValue`
- `alarmType`
- `parent`
- `tooltip`

### `widget.tick.onClick()`

### `widget.value.onValueChange(widget, value)`

**Parametry:**

- `widget`
- `value`

### `widget.text.onTextChange(widget, newText)`

**Parametry:**

- `widget`
- `newText`

### `alarm(file, windowText)`

**Parametry:**

- `file`
- `windowText`

## Events/Callbacks

### `TextMessage`

damage taken & custom message

**Wywołanie:** `onTextMessage(function(mode, text)`

### `Talk`

default & private message

**Wywołanie:** `onTalk(function(name, level, mode, text, channelId, pos)`

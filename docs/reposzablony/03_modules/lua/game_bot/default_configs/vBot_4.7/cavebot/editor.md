---
doc_id: "lua-spec-545f9d94a5e3"
source_path: "game_bot/default_configs/vBot_4.7/cavebot/editor.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: editor.lua"
summary: "Dokumentacja modułu Lua dla game_bot/default_configs/vBot_4.7/cavebot/editor.lua"
tags: ["lua", "module", "otclient"]
---

# game_bot/default_configs/vBot_4.7/cavebot/editor.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla editor.

## Functions

### `CaveBot.Editor.registerAction(action, text, params)`

also works as registerAction(action, params), then text == action params are options for text editor or function to be executed when clicked you have many examples how to use it bellow

**Parametry:**

- `action`
- `text`
- `params`

### `button.onClick()`

### `CaveBot.Editor.setup()`

### `value()`

### `value()`

### `value()`

### `ui.autoRecording.onClick()`

### `CaveBot.Editor.show()`

### `CaveBot.Editor.hide()`

### `CaveBot.Editor.edit(action, value, callback)`

**Parametry:**

- `action`
- `value`
- `callback`

## Events/Callbacks

### `DoubleClick`

**Wywołanie:** `action.onDoubleClick(action)`

### `PlayerPositionChange`

callbacks

**Wywołanie:** `onPlayerPositionChange(function(pos)`

---
doc_id: "lua-spec-eac639c70a50"
source_path: "game_bot/default_configs/cavebot_1.3/cavebot/cavebot.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: cavebot.lua"
summary: "Dokumentacja modułu Lua dla game_bot/default_configs/cavebot_1.3/cavebot/cavebot.lua"
tags: ["lua", "module", "otclient"]
---

# game_bot/default_configs/cavebot_1.3/cavebot/cavebot.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla cavebot.

## Functions

### `ui.showEditor.onClick()`

ui callbacks

### `ui.showConfig.onClick()`

### `CaveBot.isOn()`

public function, you can use them in your scripts

### `CaveBot.isOff()`

### `CaveBot.setOn(val)`

**Parametry:**

- `val`

### `CaveBot.setOff(val)`

**Parametry:**

- `val`

### `CaveBot.delay(value)`

**Parametry:**

- `value`

### `CaveBot.gotoLabel(label)`

**Parametry:**

- `label`

### `CaveBot.save()`

## Events/Callbacks

### `fig`

ui

**Wywołanie:** `local configWidget = UI.Config()`

### `Allowed`

**Wywołanie:** `if TargetBot and TargetBot.isActive() and not TargetBot.isCaveBotActionAllowed() then`

### `ConfigChange`

**Wywołanie:** `callbacks.onConfigChange(name, enabled, result[extension])`

### `ConfigChange`

**Wywołanie:** `CaveBot.Config.onConfigChange(name, enabled, cavebotConfig)`

### `Save`

**Wywołanie:** `local ext_data = callbacks.onSave()`

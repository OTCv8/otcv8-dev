---
doc_id: "lua-spec-17518fea261c"
source_path: "game_bot/functions/ui_legacy.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: ui_legacy.lua"
summary: "Dokumentacja modułu Lua dla game_bot/functions/ui_legacy.lua"
tags: ["lua", "module", "otclient"]
---

# game_bot/functions/ui_legacy.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla ui_legacy.

## Functions

### `context.createWidget(name, parent)`

DO NOT USE THIS CODE. IT'S ONLY HERE FOR BACKWARD COMPATIBILITY, MAY BE REMOVED IN THE FUTURE

**Parametry:**

- `name`
- `parent`

### `context.setupUI(otml, parent)`

**Parametry:**

- `otml`
- `parent`

### `context.importStyle(otml)`

**Parametry:**

- `otml`

### `context.addTab(name)`

**Parametry:**

- `name`

### `context.setDefaultTab(name)`

**Parametry:**

- `name`

### `context.addSwitch(id, text, onClickCallback, parent)`

**Parametry:**

- `id`
- `text`
- `onClickCallback`
- `parent`

### `context.addButton(id, text, onClickCallback, parent)`

**Parametry:**

- `id`
- `text`
- `onClickCallback`
- `parent`

### `context.addLabel(id, text, parent)`

**Parametry:**

- `id`
- `text`
- `parent`

### `context.addTextEdit(id, text, onTextChangeCallback, parent)`

**Parametry:**

- `id`
- `text`
- `onTextChangeCallback`
- `parent`

### `context.addSeparator(id, parent)`

**Parametry:**

- `id`
- `parent`

### `context._addMacroSwitch(name, keys, parent)`

**Parametry:**

- `name`
- `keys`
- `parent`

### `context._addHotkeySwitch(name, keys, parent)`

**Parametry:**

- `name`
- `keys`
- `parent`

## Events/Callbacks

### `createWidget`

**Wywołanie:** `g_ui.createWidget(name, parent)`

### `loadUIFromString`

**Wywołanie:** `local widget = g_ui.loadUIFromString(otml, parent)`

### `importStyle`

**Wywołanie:** `return g_ui.importStyle(context.configDir .. "/" .. otml)`

### `importStyleFromString`

**Wywołanie:** `return g_ui.importStyleFromString(otml)`

### `createWidget`

**Wywołanie:** `local newTab = context.tabs:addTab(name, g_ui.createWidget('BotPanel')).tabPanel.content`

### `t`

**Wywołanie:** `tab:setFont('small-9px')`

### `createWidget`

**Wywołanie:** `local switch = g_ui.createWidget('BotSwitch', parent)`

### `createWidget`

**Wywołanie:** `local button = g_ui.createWidget('BotButton', parent)`

### `createWidget`

**Wywołanie:** `local label = g_ui.createWidget('BotLabel', parent)`

### `createWidget`

**Wywołanie:** `local widget = g_ui.createWidget('BotTextEdit', parent)`

### `createWidget`

**Wywołanie:** `local separator = g_ui.createWidget('BotSeparator', parent)`

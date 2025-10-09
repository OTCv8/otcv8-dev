---
doc_id: "lua-spec-69eeb05d5d64"
source_path: "game_bot/functions/ui_elements.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: ui_elements.lua"
summary: "Dokumentacja modułu Lua dla game_bot/functions/ui_elements.lua"
tags: ["lua", "module", "otclient"]
---

# game_bot/functions/ui_elements.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla ui_elements.

## Globals/Exports

### `params`

## Functions

### `UI.Button(text, callback, parent)`

**Parametry:**

- `text`
- `callback`
- `parent`

### `UI.Config(parent)`

**Parametry:**

- `parent`

### `UI.Container(callback, unique, parent, widget)`

call :setItems(table) to set items, call :getItems() to get them unique if true, won't allow duplicates callback (can be nil) gets table with new item list, eg: {{id=2160, count=1}, {id=268, count=100}, {id=269, count=20}}

**Parametry:**

- `callback`
- `unique`
- `parent`
- `widget`

### `widget.setItems(self, items)`

**Parametry:**

- `self`
- `items`

### `widget.getItems()`

### `UI.DualScrollPanel(params, callback, parent)`

**Parametry:**

- `params`
- `callback`
- `parent`

### `widget.title.onClick()`

### `widget.text.onTextChange(widget, text)`

**Parametry:**

- `widget`
- `text`

### `widget.scroll1.onValueChange(scroll, value)`

**Parametry:**

- `scroll`
- `value`

### `widget.scroll2.onValueChange(scroll, value)`

**Parametry:**

- `scroll`
- `value`

### `UI.DualScrollItemPanel(params, callback, parent)`

**Parametry:**

- `params`
- `callback`
- `parent`

### `widget.title.onClick()`

### `widget.item.onItemChange()`

### `widget.scroll1.onValueChange(scroll, value)`

**Parametry:**

- `scroll`
- `value`

### `widget.scroll2.onValueChange(scroll, value)`

**Parametry:**

- `scroll`
- `value`

### `UI.Label(text, parent)`

**Parametry:**

- `text`
- `parent`

### `UI.Separator(parent)`

**Parametry:**

- `parent`

### `UI.TextEdit(text, callback, parent)`

**Parametry:**

- `text`
- `callback`
- `parent`

### `UI.TwoItemsAndSlotPanel(params, callback, parent)`

**Parametry:**

- `params`
- `callback`
- `parent`

### `widget.title.onClick()`

### `widget.slot.onOptionChange()`

### `widget.item1.onItemChange()`

### `widget.item2.onItemChange()`

### `UI.DualLabel(left, right, params, parent)`

**Parametry:**

- `left`
- `right`
- `params`
- `parent`

### `UI.LabelAndTextEdit(params, callback, parent)`

**Parametry:**

- `params`
- `callback`
- `parent`

### `widget.right.onTextChange(widget, text)`

**Parametry:**

- `widget`
- `text`

### `UI.SwitchAndButton(params, callbackSwitch, callbackButton, callback, parent)`

**Parametry:**

- `params`
- `callbackSwitch`
- `callbackButton`
- `callback`
- `parent`

### `widget.left.onClick()`

### `widget.right.onClick()`

## Events/Callbacks

### `createWidget`

**Wywołanie:** `local widget = g_ui.createWidget("BotItem", widget.items)`

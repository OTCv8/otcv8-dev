---
doc_id: "lua-spec-3bac31007fcb"
source_path: "game_bot/panels/healing.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: healing.lua"
summary: "Dokumentacja modułu Lua dla game_bot/panels/healing.lua"
tags: ["lua", "module", "otclient"]
---

# game_bot/panels/healing.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla healing.

## Functions

### `Panels.Haste(parent)`

**Parametry:**

- `parent`

### `Panels.ManaShield(parent)`

**Parametry:**

- `parent`

### `Panels.AntiParalyze(parent)`

**Parametry:**

- `parent`

### `Panels.Health(parent)`

**Parametry:**

- `parent`

### `ui.title.onClick(widget)`

**Parametry:**

- `widget`

### `ui.text.onTextChange(widget, text)`

**Parametry:**

- `widget`
- `text`

### `ui.scroll1.onValueChange(scroll, value)`

**Parametry:**

- `scroll`
- `value`

### `ui.scroll2.onValueChange(scroll, value)`

**Parametry:**

- `scroll`
- `value`

### `Panels.HealthItem(parent)`

**Parametry:**

- `parent`

### `ui.title.onClick(widget)`

**Parametry:**

- `widget`

### `ui.item.onItemChange(widget)`

**Parametry:**

- `widget`

### `ui.scroll1.onValueChange(scroll, value)`

**Parametry:**

- `scroll`
- `value`

### `ui.scroll2.onValueChange(scroll, value)`

**Parametry:**

- `scroll`
- `value`

### `Panels.Mana(parent)`

**Parametry:**

- `parent`

### `ui.title.onClick(widget)`

**Parametry:**

- `widget`

### `ui.item.onItemChange(widget)`

**Parametry:**

- `widget`

### `ui.scroll1.onValueChange(scroll, value)`

**Parametry:**

- `scroll`
- `value`

### `ui.scroll2.onValueChange(scroll, value)`

**Parametry:**

- `scroll`
- `value`

### `Panels.Equip(parent)`

**Parametry:**

- `parent`

### `ui.title.onClick(widget)`

**Parametry:**

- `widget`

### `ui.item1.onItemChange(widget)`

**Parametry:**

- `widget`

### `ui.item2.onItemChange(widget)`

**Parametry:**

- `widget`

### `ui.slot.onOptionChange(widget)`

**Parametry:**

- `widget`

### `Panels.Eating(parent)`

**Parametry:**

- `parent`

### `ui.title.onClick(widget)`

**Parametry:**

- `widget`

## Events/Callbacks

### `createWidget`

**Wywołanie:** `local ui = g_ui.createWidget("DualScrollPanel", parent)`

### `createWidget`

**Wywołanie:** `local ui = g_ui.createWidget("DualScrollItemPanel", parent)`

### `createWidget`

**Wywołanie:** `local ui = g_ui.createWidget("DualScrollItemPanel", parent)`

### `createWidget`

**Wywołanie:** `local ui = g_ui.createWidget("TwoItemsAndSlotPanel", parent)`

### `createWidget`

**Wywołanie:** `local ui = g_ui.createWidget("ItemsPanel", parent)`

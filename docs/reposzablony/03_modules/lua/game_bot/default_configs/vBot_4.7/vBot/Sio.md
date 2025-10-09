---
doc_id: "lua-spec-a166cd58090b"
source_path: "game_bot/default_configs/vBot_4.7/vBot/Sio.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: Sio.lua"
summary: "Dokumentacja modułu Lua dla game_bot/default_configs/vBot_4.7/vBot/Sio.lua"
tags: ["lua", "module", "otclient"]
---

# game_bot/default_configs/vBot_4.7/vBot/Sio.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla Sio.

## Functions

### `ui.title.onClick(widget)`

**Parametry:**

- `widget`

### `ui.editList.onClick(widget)`

**Parametry:**

- `widget`

### `sioListWindow.spellName.onTextChange(widget, text)`

**Parametry:**

- `widget`
- `text`

### `sioListWindow.spell.onClick(widget)`

**Parametry:**

- `widget`

### `sioListWindow.item.onClick(widget)`

**Parametry:**

- `widget`

### `sioListWindow.exuraSio.onClick(widget)`

**Parametry:**

- `widget`

### `sioListWindow.exuraGranSio.onClick(widget)`

**Parametry:**

- `widget`

### `sioListWindow.exuraMasRes.onClick(widget)`

**Parametry:**

- `widget`

### `sioListWindow.vocation.ED.onClick(widget)`

**Parametry:**

- `widget`

### `sioListWindow.vocation.MS.onClick(widget)`

**Parametry:**

- `widget`

### `sioListWindow.vocation.EK.onClick(widget)`

**Parametry:**

- `widget`

### `sioListWindow.vocation.RP.onClick(widget)`

**Parametry:**

- `widget`

### `sioListWindow.Distance.onValueChange(scroll, value)`

**Parametry:**

- `scroll`
- `value`

### `sioListWindow.minMana.onValueChange(scroll, value)`

**Parametry:**

- `scroll`
- `value`

### `sioListWindow.minFriendHp.onValueChange(scroll, value)`

**Parametry:**

- `scroll`
- `value`

### `sioListWindow.itemId.onItemChange(widget)`

**Parametry:**

- `widget`

### `sioListWindow.closeButton.onClick(widget)`

**Parametry:**

- `widget`

### `isValid(name)`

**Parametry:**

- `name`

## Events/Callbacks

### `getRootWidget`

**Wywołanie:** `rootWidget = g_ui.getRootWidget()`

### `Active`

**Wywołanie:** `if modules.game_cooldown.isGroupCooldownIconActive(2) then return end`

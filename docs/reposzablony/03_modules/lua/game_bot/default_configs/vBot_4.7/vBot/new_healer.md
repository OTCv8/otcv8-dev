---
doc_id: "lua-spec-7d8f7d87c230"
source_path: "game_bot/default_configs/vBot_4.7/vBot/new_healer.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: new_healer.lua"
summary: "Dokumentacja modułu Lua dla game_bot/default_configs/vBot_4.7/vBot/new_healer.lua"
tags: ["lua", "module", "otclient"]
---

# game_bot/default_configs/vBot_4.7/vBot/new_healer.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla new_healer.

## Globals/Exports

### `customPlayers`

### `vocations`

### `groups`

## Functions

### `ui.title.onClick(widget)`

**Parametry:**

- `widget`

### `ui.edit.onClick()`

### `widget.remove.onClick()`

### `customList.playerList.onDoubleClick()`

### `clearFields()`

### `capitalFistLetter(str)`

**Parametry:**

- `str`

### `customList.addPanel.add.onClick()`

### `widget.remove.onClick()`

### `validate(widget, category)`

**Parametry:**

- `widget`
- `category`

### `targetSettings.vocations.box.knights.onClick(widget)`

**Parametry:**

- `widget`

### `targetSettings.vocations.box.paladins.onClick(widget)`

**Parametry:**

- `widget`

### `targetSettings.vocations.box.druids.onClick(widget)`

**Parametry:**

- `widget`

### `targetSettings.vocations.box.sorcerers.onClick(widget)`

**Parametry:**

- `widget`

### `targetSettings.groups.box.friends.onClick(widget)`

**Parametry:**

- `widget`

### `targetSettings.groups.box.party.onClick(widget)`

**Parametry:**

- `widget`

### `targetSettings.groups.box.guild.onClick(widget)`

**Parametry:**

- `widget`

### `targetSettings.groups.box.botserver.onClick(widget)`

**Parametry:**

- `widget`

### `widget.scroll.onValueChange(scroll, value)`

**Parametry:**

- `scroll`
- `value`

### `widget.item.onItemChange(widget)`

**Parametry:**

- `widget`

### `setCrementalButtons()`

priority and toggles

### `widget.increment.onClick()`

### `widget.decrement.onClick()`

### `widget.enabled.onClick()`

### `widget.onDoubleClick()`

### `widget.onTextChange(widget,text)`

**Parametry:**

- `widget`
- `text`

### `friendHealerAction(spec, targetsInRange)`

**Parametry:**

- `spec`
- `targetsInRange`

## Events/Callbacks

### `umber`

**Wywołanie:** `local health = tonumber(customList.addPanel.health:getText())`

### `s`

priority and toggles

**Wywołanie:** `local function setCrementalButtons()`

### `s`

**Wywołanie:** `setCrementalButtons()`

### `s`

**Wywołanie:** `setCrementalButtons()`

### `event`

**Wywołanie:** `schedule(50, function()`

### `s`

**Wywołanie:** `setCrementalButtons()`

### `Active`

**Wywołanie:** `if action.strong and health <= strongHeal and not modules.game_cooldown.isCooldownIconActive(101) then`

### `Active`

**Wywołanie:** `if modules.game_cooldown.isGroupCooldownIconActive(2) then return end`

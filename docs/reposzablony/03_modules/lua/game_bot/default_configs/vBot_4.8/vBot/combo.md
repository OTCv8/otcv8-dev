---
doc_id: "lua-spec-7567a8b1a01c"
source_path: "game_bot/default_configs/vBot_4.8/vBot/combo.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: combo.lua"
summary: "Dokumentacja modułu Lua dla game_bot/default_configs/vBot_4.8/vBot/combo.lua"
tags: ["lua", "module", "otclient"]
---

# game_bot/default_configs/vBot_4.8/vBot/combo.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla combo.

## Functions

### `ui.title.onClick(widget)`

**Parametry:**

- `widget`

### `ui.combos.onClick(widget)`

**Parametry:**

- `widget`

### `comboWindow.actions.attackItem.onItemChange(widget)`

**Parametry:**

- `widget`

### `comboWindow.actions.commandsToggle.onClick(widget)`

**Parametry:**

- `widget`

### `comboWindow.server.botServerToggle.onClick(widget)`

**Parametry:**

- `widget`

### `comboWindow.server.Triggers.onClick(widget)`

**Parametry:**

- `widget`

### `comboWindow.server.targetServerLeaderToggle.onClick(widget)`

**Parametry:**

- `widget`

### `comboWindow.closeButton.onClick(widget)`

buttons

**Parametry:**

- `widget`

### `comboWindow.actions.followLeader.onOptionChange(widget)`

**Parametry:**

- `widget`

### `comboWindow.actions.attackLeaderTarget.onOptionChange(widget)`

**Parametry:**

- `widget`

### `comboWindow.trigger.onSayToggle.onClick(widget)`

**Parametry:**

- `widget`

### `comboWindow.trigger.onShootToggle.onClick(widget)`

**Parametry:**

- `widget`

### `comboWindow.trigger.onCastToggle.onClick(widget)`

**Parametry:**

- `widget`

### `comboWindow.actions.followLeaderToggle.onClick(widget)`

**Parametry:**

- `widget`

### `comboWindow.actions.attackLeaderTargetToggle.onClick(widget)`

**Parametry:**

- `widget`

### `comboWindow.actions.attackSpellToggle.onClick(widget)`

**Parametry:**

- `widget`

### `comboWindow.actions.attackItemToggle.onClick(widget)`

**Parametry:**

- `widget`

### `comboWindow.trigger.onSayLeader.onTextChange(widget, text)`

**Parametry:**

- `widget`
- `text`

### `comboWindow.trigger.onShootLeader.onTextChange(widget, text)`

**Parametry:**

- `widget`
- `text`

### `comboWindow.trigger.onCastLeader.onTextChange(widget, text)`

**Parametry:**

- `widget`
- `text`

### `comboWindow.trigger.onSayPhrase.onTextChange(widget, text)`

**Parametry:**

- `widget`
- `text`

### `comboWindow.actions.attackSpell.onTextChange(widget, text)`

**Parametry:**

- `widget`
- `text`

### `comboWindow.server.botServerLeader.onTextChange(widget, text)`

**Parametry:**

- `widget`
- `text`

### `comboWindow.server.partyButton.onClick(widget)`

**Parametry:**

- `widget`

## Events/Callbacks

### `getRootWidget`

**Wywołanie:** `rootWidget = g_ui.getRootWidget()`

### `Click`

**Wywołanie:** `child:onClick()`

### `TextMessage`

**Wywołanie:** `onTextMessage(function(mode, text)`

### `Talk`

**Wywołanie:** `onTalk(function(name, level, mode, text, channelId, pos)`

### `Missle`

**Wywołanie:** `onMissle(function(missle)`

### `CreaturePositionChange`

**Wywołanie:** `onCreaturePositionChange(function(creature, oldPos, newPos)`

### `UseWith`

**Wywołanie:** `onUseWith(function(pos, itemId, target, subType)`

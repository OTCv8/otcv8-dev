---
doc_id: "lua-spec-f6925c562ac8"
source_path: "game_imbuing/imbuing.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: imbuing.lua"
summary: "Dokumentacja modułu Lua dla game_imbuing/imbuing.lua"
tags: ["lua", "module", "otclient"]
---

# game_imbuing/imbuing.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla imbuing.

## Functions

### `init()`

### `groupsCombo.onOptionChange(widget)`

**Parametry:**

- `widget`

### `imbueLevelsCombo.onOptionChange(widget)`

**Parametry:**

- `widget`

### `protectionBtn.onClick()`

### `setProtection(value)`

**Parametry:**

- `value`

### `terminate()`

### `resetSlots()`

### `selectSlot(widget, slotId, activeSlot)`

**Parametry:**

- `widget`
- `slotId`
- `activeSlot`

### `clearImbue.clear.onClick()`

### `emptyImbue.imbue.onClick()`

### `onImbuementWindow(itemId, slots, activeSlots, imbuements, needItems)`

**Parametry:**

- `itemId`
- `slots`
- `activeSlots`
- `imbuements`
- `needItems`

### `slot.onClick(widget)`

**Parametry:**

- `widget`

### `activeSlotBtn.onClick(widget)`

**Parametry:**

- `widget`

### `onResourceBalance(type, balance)`

**Parametry:**

- `type`
- `balance`

### `onCloseImbuementWindow()`

### `hide()`

### `show()`

### `toggle()`

## Events/Callbacks

### `g_game`

**Wywołanie:** `connect(g_game, {`

### `displayUI`

**Wywołanie:** `imbuingWindow = g_ui.displayUI('imbuing')`

### `OptionChange`

**Wywołanie:** `imbueLevelsCombo.onOptionChange(imbueLevelsCombo) -- update options`

### `g_game`

**Wywołanie:** `disconnect(g_game, {`

### `ImbuementWindow`

**Wywołanie:** `function onImbuementWindow(itemId, slots, activeSlots, imbuements, needItems)`

### `ResourceBalance`

**Wywołanie:** `function onResourceBalance(type, balance)`

### `CloseImbuementWindow`

**Wywołanie:** `function onCloseImbuementWindow()`

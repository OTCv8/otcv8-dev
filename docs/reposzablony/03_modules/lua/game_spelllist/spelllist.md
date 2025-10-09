---
doc_id: "lua-spec-0b49eaac84d6"
source_path: "game_spelllist/spelllist.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:06Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: spelllist.lua"
summary: "Dokumentacja modułu Lua dla game_spelllist/spelllist.lua"
tags: ["lua", "module", "otclient"]
---

# game_spelllist/spelllist.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla spelllist.

## Functions

### `getSpelllistProfile()`

### `setSpelllistProfile(name)`

**Parametry:**

- `name`

### `online()`

### `offline()`

### `init()`

### `terminate()`

### `initializeSpelllist()`

### `changeSpelllistProfile(oldProfile)`

**Parametry:**

- `oldProfile`

### `updateSpelllist()`

### `updateSpellInformation(widget)`

**Parametry:**

- `widget`

### `toggle()`

### `toggleFilter(widget, selectedWidget)`

**Parametry:**

- `widget`
- `selectedWidget`

### `resizeWindow()`

### `resetWindow()`

## Events/Callbacks

### `line`

**Wywołanie:** `function online()`

### `g_game`

**Wywołanie:** `connect(g_game, { onGameStart = online,`

### `displayUI`

**Wywołanie:** `spelllistWindow = g_ui.displayUI('spelllist', modules.game_interface.getRightPanel())`

### `line`

**Wywołanie:** `online()`

### `g_game`

**Wywołanie:** `disconnect(g_game, { onGameStart = online,`

### `spellList`

**Wywołanie:** `disconnect(spellList, { onChildFocusChange = function(self, focusedChild)`

### `createWidget`

**Wywołanie:** `local tmpLabel = g_ui.createWidget('SpellListLabel', spellList)`

### `umber`

**Wywołanie:** `local iconId = tonumber(info.icon)`

### `spellList`

**Wywołanie:** `connect(spellList, { onChildFocusChange = function(self, focusedChild)`

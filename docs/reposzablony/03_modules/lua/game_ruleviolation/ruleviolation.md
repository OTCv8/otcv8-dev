---
doc_id: "lua-spec-b015f38d0485"
source_path: "game_ruleviolation/ruleviolation.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:06Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: ruleviolation.lua"
summary: "Dokumentacja modułu Lua dla game_ruleviolation/ruleviolation.lua"
tags: ["lua", "module", "otclient"]
---

# game_ruleviolation/ruleviolation.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla ruleviolation.

## Globals/Exports

### `rvreasons`

### `rvactions`

## Functions

### `init()`

### `terminate()`

### `hasWindowAccess()`

### `loadReasons()`

### `show(target, statement)`

**Parametry:**

- `target`
- `statement`

### `hide()`

### `onSelectReason(reasonLabel, focused)`

**Parametry:**

- `reasonLabel`
- `focused`

### `report()`

### `clearForm()`

## Events/Callbacks

### `g_game`

**Wywołanie:** `connect(g_game, { onGMActions = loadReasons })`

### `displayUI`

**Wywołanie:** `ruleViolationWindow = g_ui.displayUI('ruleviolation')`

### `s`

**Wywołanie:** `loadReasons()`

### `g_game`

**Wywołanie:** `disconnect(g_game, { onGMActions = loadReasons })`

### `s`

**Wywołanie:** `function loadReasons()`

### `s`

**Wywołanie:** `local actions = g_game.getGMActions()`

### `createWidget`

**Wywołanie:** `local label = g_ui.createWidget('RVListLabel', reasonsTextList)`

### `SelectReason`

**Wywołanie:** `function onSelectReason(reasonLabel, focused)`

### `createWidget`

**Wywołanie:** `local label = g_ui.createWidget('RVListLabel', actionsTextList)`

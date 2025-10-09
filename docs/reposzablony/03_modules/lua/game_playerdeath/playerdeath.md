---
doc_id: "lua-spec-0658674906b4"
source_path: "game_playerdeath/playerdeath.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:06Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: playerdeath.lua"
summary: "Dokumentacja modułu Lua dla game_playerdeath/playerdeath.lua"
tags: ["lua", "module", "otclient"]
---

# game_playerdeath/playerdeath.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla playerdeath.

## Functions

### `init()`

### `terminate()`

### `reset()`

### `display(deathType, penalty)`

**Parametry:**

- `deathType`
- `penalty`

### `displayDeadMessage()`

### `openWindow(deathType, penalty)`

**Parametry:**

- `deathType`
- `penalty`

## Events/Callbacks

### `importStyle`

**Wywołanie:** `g_ui.importStyle('deathwindow')`

### `g_game`

**Wywołanie:** `connect(g_game, { onDeath = display,`

### `g_game`

**Wywołanie:** `disconnect(g_game, { onDeath = display,`

### `createWidget`

**Wywołanie:** `deathWindow = g_ui.createWidget('DeathWindow', rootWidget)`

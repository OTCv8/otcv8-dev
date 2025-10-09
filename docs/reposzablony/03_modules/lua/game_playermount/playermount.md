---
doc_id: "lua-spec-c80af26ca9b4"
source_path: "game_playermount/playermount.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:06Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: playermount.lua"
summary: "Dokumentacja modułu Lua dla game_playermount/playermount.lua"
tags: ["lua", "module", "otclient"]
---

# game_playermount/playermount.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla playermount.

## Functions

### `init()`

### `terminate()`

### `online()`

### `offline()`

### `toggleMount()`

### `mount()`

### `dismount()`

## Events/Callbacks

### `g_game`

**Wywołanie:** `connect(g_game, {`

### `line`

**Wywołanie:** `if g_game.isOnline() then online() end`

### `g_game`

**Wywołanie:** `disconnect(g_game, {`

### `line`

**Wywołanie:** `function online()`

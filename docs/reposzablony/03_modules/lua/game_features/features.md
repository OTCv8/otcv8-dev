---
doc_id: "lua-spec-668fb85d7a1e"
source_path: "game_features/features.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: features.lua"
summary: "Dokumentacja modułu Lua dla game_features/features.lua"
tags: ["lua", "module", "otclient"]
---

# game_features/features.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla features.

## Functions

### `init()`

### `terminate()`

### `updateFeatures(version)`

**Parametry:**

- `version`

## Events/Callbacks

### `g_game`

**Wywołanie:** `connect(g_game, { onClientVersionChange = updateFeatures })`

### `g_game`

**Wywołanie:** `disconnect(g_game, { onClientVersionChange = updateFeatures })`

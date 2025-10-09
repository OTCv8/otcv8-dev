---
doc_id: "lua-spec-2814b99c006e"
source_path: "game_bot/functions/script_loader.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: script_loader.lua"
summary: "Dokumentacja modułu Lua dla game_bot/functions/script_loader.lua"
tags: ["lua", "module", "otclient"]
---

# game_bot/functions/script_loader.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla script_loader.

## Functions

### `context.loadScript(path, onLoadCallback)`

**Parametry:**

- `path`
- `onLoadCallback`

### `context.loadRemoteScript(url, onLoadCallback)`

**Parametry:**

- `url`
- `onLoadCallback`

## Events/Callbacks

### `tents`

**Wywołanie:** `assert(load(g_resources.readFileContents(path), path, nil, context))()`

### `LoadCallback`

**Wywołanie:** `onLoadCallback()`

### `LoadCallback`

**Wywołanie:** `onLoadCallback()`

---
doc_id: "lua-spec-2795502d59fd"
source_path: "client/client.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:04Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: client.lua"
summary: "Dokumentacja modułu Lua dla client/client.lua"
tags: ["lua", "module", "otclient"]
---

# client/client.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla client.

## Functions

### `setMusic(filename)`

**Parametry:**

- `filename`

### `reloadScripts()`

### `startup()`

### `init()`

### `terminate()`

### `exit()`

### `onGameStart()`

### `onGameEnd()`

## Events/Callbacks

### `g_game`

Play startup music (The Silver Tree, by Mattias Westlund) musicChannel:enqueue(musicFilename, 3)

**Wywołanie:** `connect(g_game, { onGameStart = function() if musicChannel ~= nil then musicChannel:stop(3) end end })`

### `g_game`

**Wywołanie:** `connect(g_game, { onGameEnd = function()`

### `g_app`

**Wywołanie:** `connect(g_app, { onRun = startup,`

### `g_game`

**Wywołanie:** `connect(g_game, { onGameStart = onGameStart,`

### `g_app`

**Wywołanie:** `disconnect(g_app, { onRun = startup,`

### `g_game`

**Wywołanie:** `disconnect(g_game, { onGameStart = onGameStart,`

### `GameStart`

**Wywołanie:** `function onGameStart()`

### `GameEnd`

**Wywołanie:** `function onGameEnd()`

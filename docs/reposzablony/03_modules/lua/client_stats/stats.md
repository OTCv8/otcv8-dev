---
doc_id: "lua-spec-637b85f6d25c"
source_path: "client_stats/stats.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:04Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: stats.lua"
summary: "Dokumentacja modułu Lua dla client_stats/stats.lua"
tags: ["lua", "module", "otclient"]
---

# client_stats/stats.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla stats.

## Globals/Exports

### `fps`

### `ping`

### `stats`

### `slow`

### `proxy`

### `fps`

### `ping`

## Functions

### `init()`

### `terminate()`

### `onClose()`

### `toggle()`

### `monitor()`

### `sendStats()`

### `update()`

## Events/Callbacks

### `displayUI`

**Wywołanie:** `statsWindow = g_ui.displayUI('stats')`

### `Close`

**Wywołanie:** `function onClose()`

### `itor`

**Wywołanie:** `function monitor()`

### `ds`

**Wywołanie:** `uptime = g_clock.seconds(),`

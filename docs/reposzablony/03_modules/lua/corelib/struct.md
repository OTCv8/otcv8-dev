---
doc_id: "lua-spec-e435bac5c953"
source_path: "corelib/struct.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: struct.lua"
summary: "Dokumentacja modułu Lua dla corelib/struct.lua"
tags: ["lua", "module", "otclient"]
---

# corelib/struct.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla struct.

## Globals/Exports

### `Struct`

## Functions

### `Struct.pack(format, ...)`

**Parametry:**

- `format`
- `...`

### `Struct.unpack(format, stream)`

**Parametry:**

- `format`
- `stream`

## Events/Callbacks

### `umber`

**Wywołanie:** `local val = tonumber(table.remove(vars, 1))`

### `cat`

**Wywołanie:** `table.insert(stream, string.reverse(table.concat(bytes)))`

### `cat`

**Wywołanie:** `table.insert(stream, table.concat(bytes))`

### `umber`

**Wywołanie:** `local val = tonumber(table.remove(vars, 1))`

### `cat`

**Wywołanie:** `table.insert(stream, string.reverse(table.concat(bytes)))`

### `cat`

**Wywołanie:** `table.insert(stream, table.concat(bytes))`

### `umber`

**Wywołanie:** `local length = tonumber(n)`

### `cat`

**Wywołanie:** `return table.concat(stream)`

### `cat`

**Wywołanie:** `local str = table.concat(bytes)`

### `umber`

**Wywołanie:** `table.insert(vars, stream:sub(iterator, iterator + tonumber(n)))`

### `umber`

**Wywołanie:** `iterator = iterator + tonumber(n)`

---
doc_id: "lua-spec-bf953c00555e"
source_path: "corelib/table.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: table.lua"
summary: "Dokumentacja modułu Lua dla corelib/table.lua"
tags: ["lua", "module", "otclient"]
---

# corelib/table.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla table.

## Functions

### `table.dump(t, depth)`

@docclass table

**Parametry:**

- `t`
- `depth`

### `table.clear(t)`

**Parametry:**

- `t`

### `table.copy(t)`

**Parametry:**

- `t`

### `table.recursivecopy(t)`

**Parametry:**

- `t`

### `table.selectivecopy(t, keys)`

**Parametry:**

- `t`
- `keys`

### `table.merge(t, src)`

**Parametry:**

- `t`
- `src`

### `table.find(t, value, lowercase)`

**Parametry:**

- `t`
- `value`
- `lowercase`

### `table.findbykey(t, key, lowercase)`

**Parametry:**

- `t`
- `key`
- `lowercase`

### `table.contains(t, value, lowercase)`

**Parametry:**

- `t`
- `value`
- `lowercase`

### `table.findkey(t, key)`

**Parametry:**

- `t`
- `key`

### `table.haskey(t, key)`

**Parametry:**

- `t`
- `key`

### `table.removevalue(t, value)`

**Parametry:**

- `t`
- `value`

### `table.popvalue(value)`

**Parametry:**

- `value`

### `table.compare(t, other)`

**Parametry:**

- `t`
- `other`

### `table.empty(t)`

**Parametry:**

- `t`

### `table.permute(t, n, count)`

**Parametry:**

- `t`
- `n`
- `count`

### `table.findbyfield(t, fieldname, fieldvalue)`

**Parametry:**

- `t`
- `fieldname`
- `fieldvalue`

### `table.size(t)`

**Parametry:**

- `t`

### `table.tostring(t)`

**Parametry:**

- `t`

### `table.collect(t, func)`

**Parametry:**

- `t`
- `func`

### `table.equals(t, comp)`

**Parametry:**

- `t`
- `comp`

### `table.equal(t1,t2,ignore_mt)`

**Parametry:**

- `t1`
- `t2`
- `ignore_mt`

### `table.isList(t)`

**Parametry:**

- `t`

### `table.isStringList(t)`

**Parametry:**

- `t`

### `table.isStringPairList(t)`

**Parametry:**

- `t`

### `table.encodeStringPairList(t)`

**Parametry:**

- `t`

### `table.decodeStringPairList(l)`

**Parametry:**

- `l`

## Events/Callbacks

### `tains`

**Wywołanie:** `function table.contains(t, value, lowercase)`

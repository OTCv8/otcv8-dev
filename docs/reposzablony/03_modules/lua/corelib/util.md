---
doc_id: "lua-spec-69338591335a"
source_path: "corelib/util.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: util.lua"
summary: "Dokumentacja modułu Lua dla corelib/util.lua"
tags: ["lua", "module", "otclient"]
---

# corelib/util.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla util.

## Functions

### `print(...)`

@docfuncs @{

**Parametry:**

- `...`

### `pinfo(msg)`

**Parametry:**

- `msg`

### `perror(msg)`

**Parametry:**

- `msg`

### `pwarning(msg)`

**Parametry:**

- `msg`

### `pdebug(msg)`

**Parametry:**

- `msg`

### `fatal(msg)`

**Parametry:**

- `msg`

### `exit()`

### `quit()`

### `connect(object, arg1, arg2, arg3)`

**Parametry:**

- `object`
- `arg1`
- `arg2`
- `arg3`

### `disconnect(object, arg1, arg2)`

**Parametry:**

- `object`
- `arg1`
- `arg2`

### `newclass(name)`

**Parametry:**

- `name`

### `class.internalCreate()`

### `class.getClassName()`

### `extends(base, name)`

**Parametry:**

- `base`
- `name`

### `derived.internalCreate()`

### `derived.getClassName()`

### `runinsandbox(func, ...)`

**Parametry:**

- `func`
- `...`

### `loadasmodule(name, file)`

**Parametry:**

- `name`
- `file`

### `module_loader(modname)`

**Parametry:**

- `modname`

### `import(table)`

**Parametry:**

- `table`

### `export(what, key)`

**Parametry:**

- `what`
- `key`

### `unexport(key)`

**Parametry:**

- `key`

### `getfsrcpath(depth)`

**Parametry:**

- `depth`

### `resolvepath(filePath, depth)`

**Parametry:**

- `filePath`
- `depth`

### `toboolean(v)`

**Parametry:**

- `v`

### `fromboolean(boolean)`

**Parametry:**

- `boolean`

### `booleantonumber(boolean)`

**Parametry:**

- `boolean`

### `numbertoboolean(number)`

**Parametry:**

- `number`

### `protectedcall(func, ...)`

**Parametry:**

- `func`
- `...`

### `signalcall(param, ...)`

**Parametry:**

- `param`
- `...`

### `tr(s, ...)`

**Parametry:**

- `s`
- `...`

### `getOppositeAnchor(anchor)`

**Parametry:**

- `anchor`

### `makesingleton(obj)`

**Parametry:**

- `obj`

### `comma_value(amount)`

**Parametry:**

- `amount`

## Events/Callbacks

### `object`

**Wywołanie:** `function connect(object, arg1, arg2, arg3)`

### `object`

**Wywołanie:** `function disconnect(object, arg1, arg2)`

### `umber`

**Wywołanie:** `function booleantonumber(boolean)`

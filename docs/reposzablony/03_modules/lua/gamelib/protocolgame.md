---
doc_id: "lua-spec-70b9af59649b"
source_path: "gamelib/protocolgame.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:06Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: protocolgame.lua"
summary: "Dokumentacja modułu Lua dla gamelib/protocolgame.lua"
tags: ["lua", "module", "otclient"]
---

# gamelib/protocolgame.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla protocolgame.

## Functions

### `ProtocolGame.registerOpcode(opcode, callback)`

**Parametry:**

- `opcode`
- `callback`

### `ProtocolGame.unregisterOpcode(opcode)`

**Parametry:**

- `opcode`

### `ProtocolGame.registerExtendedOpcode(opcode, callback)`

**Parametry:**

- `opcode`
- `callback`

### `ProtocolGame.unregisterExtendedOpcode(opcode)`

**Parametry:**

- `opcode`

### `ProtocolGame.registerExtendedJSONOpcode(opcode, callback)`

**Parametry:**

- `opcode`
- `callback`

### `ProtocolGame.unregisterExtendedJSONOpcode(opcode)`

**Parametry:**

- `opcode`

## Events/Callbacks

### `Opcode`

**Wywołanie:** `function ProtocolGame:onOpcode(opcode, msg)`

### `ExtendedOpcode`

**Wywołanie:** `function ProtocolGame:onExtendedOpcode(opcode, buffer)`

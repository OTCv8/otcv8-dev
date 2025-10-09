---
doc_id: "lua-spec-c07aac91ec1f"
source_path: "corelib/json.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: json.lua"
summary: "Dokumentacja modułu Lua dla corelib/json.lua"
tags: ["lua", "module", "otclient"]
---

# corelib/json.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla json.

## Globals/Exports

### `stack`

## Functions

### `make_indent(state)`

**Parametry:**

- `state`

### `escape_char(c)`

**Parametry:**

- `c`

### `encode_nil()`

### `encode_table(val, state)`

**Parametry:**

- `val`
- `state`

### `encode_string(val)`

**Parametry:**

- `val`

### `encode_number(val)`

**Parametry:**

- `val`

### `encode(val, state)`

**Parametry:**

- `val`
- `state`

### `json.encode(val, indent)`

**Parametry:**

- `val`
- `indent`

### `create_set(...)`

**Parametry:**

- `...`

### `next_char(str, idx, set, negate)`

**Parametry:**

- `str`
- `idx`
- `set`
- `negate`

### `decode_error(str, idx, msg)`

**Parametry:**

- `str`
- `idx`
- `msg`

### `codepoint_to_utf8(n)`

**Parametry:**

- `n`

### `parse_unicode_escape(s)`

**Parametry:**

- `s`

### `parse_string(str, i)`

**Parametry:**

- `str`
- `i`

### `parse_number(str, i)`

**Parametry:**

- `str`
- `i`

### `parse_literal(str, i)`

**Parametry:**

- `str`
- `i`

### `parse_array(str, i)`

**Parametry:**

- `str`
- `i`

### `parse_object(str, i)`

**Parametry:**

- `str`
- `i`

### `parse(str, idx)`

**Parametry:**

- `str`
- `idx`

### `json.decode(str)`

**Parametry:**

- `str`

## Events/Callbacks

### `cat`

**Wywołanie:** `return open_bracket .. table.concat(res, comma) .. close_bracket`

### `cat`

**Wywołanie:** `return open_brace .. table.concat(res, comma) .. close_brace`

### `umber`

**Wywołanie:** `local n1 = tonumber( s:sub(3, 6),  16 )`

### `umber`

**Wywołanie:** `local n2 = tonumber( s:sub(9, 12), 16 )`

### `umber`

**Wywołanie:** `local n = tonumber(s)`

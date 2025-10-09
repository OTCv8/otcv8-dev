---
doc_id: "lua-spec-b333dbf856d6"
source_path: "corelib/ui/effects.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: effects.lua"
summary: "Dokumentacja modułu Lua dla corelib/ui/effects.lua"
tags: ["lua", "module", "otclient"]
---

# corelib/ui/effects.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla effects.

## Globals/Exports

### `g_effects`

@docclass

## Functions

### `g_effects.fadeIn(widget, time, elapsed)`

**Parametry:**

- `widget`
- `time`
- `elapsed`

### `g_effects.fadeOut(widget, time, elapsed)`

**Parametry:**

- `widget`
- `time`
- `elapsed`

### `g_effects.cancelFade(widget)`

**Parametry:**

- `widget`

### `g_effects.startBlink(widget, duration, interval, clickCancel)`

**Parametry:**

- `widget`
- `duration`
- `interval`
- `clickCancel`

### `g_effects.stopBlink(widget)`

**Parametry:**

- `widget`

## Events/Callbacks

### `widget`

**Wywołanie:** `connect(widget, { onClick = g_effects.stopBlink })`

### `widget`

**Wywołanie:** `disconnect(widget, { onClick = g_effects.stopBlink })`

---
doc_id: "cpp-api-ad82cb38ea0e"
source_path: "framework/core/clock.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: clock.h"
summary: "Dokumentacja API C++ dla framework/core/clock.h"
tags: ["cpp", "api", "otclient"]
---

# framework/core/clock.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu clock.

## Classes/Structs

### Klasa: `Clock`

| Member | Brief | Signature |
|--------|-------|-----------|
| `update` |  | `void update()` |
| `micros` |  | `ticks_t micros() { return m_currentMicros; }` |
| `millis` |  | `ticks_t millis() { return m_currentMillis; }` |
| `seconds` |  | `float seconds() { return m_currentSeconds; }` |
| `realMicros` |  | `ticks_t realMicros()` |
| `realMillis` |  | `ticks_t realMillis()` |

## Functions

### `update`

**Sygnatura:** `void update()`

### `micros`

**Sygnatura:** `ticks_t micros() { return m_currentMicros; }`

### `millis`

**Sygnatura:** `ticks_t millis() { return m_currentMillis; }`

### `seconds`

**Sygnatura:** `float seconds() { return m_currentSeconds; }`

### `realMicros`

**Sygnatura:** `ticks_t realMicros()`

### `realMillis`

**Sygnatura:** `ticks_t realMillis()`

## Class Diagram

Zobacz: [../diagrams/clock.mmd](../diagrams/clock.mmd)

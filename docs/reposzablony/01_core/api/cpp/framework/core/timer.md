---
doc_id: "cpp-api-5b416470c8d9"
source_path: "framework/core/timer.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: timer.h"
summary: "Dokumentacja API C++ dla framework/core/timer.h"
tags: ["cpp", "api", "otclient"]
---

# framework/core/timer.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu timer.

## Classes/Structs

### Klasa: `Timer`

| Member | Brief | Signature |
|--------|-------|-----------|
| `restart` |  | `void restart()` |
| `stop` |  | `void stop() { m_stopped = true; }` |
| `adjust` |  | `void adjust(ticks_t value) { m_startTicks += value; }` |
| `startTicks` |  | `ticks_t startTicks() { return m_startTicks; }` |
| `ticksElapsed` |  | `ticks_t ticksElapsed()` |
| `timeElapsed` |  | `float timeElapsed() { return ticksElapsed()/1000.0f; }` |
| `running` |  | `bool running() { return !m_stopped; }` |

## Functions

### `restart`

**Sygnatura:** `void restart()`

### `stop`

**Sygnatura:** `void stop() { m_stopped = true; }`

### `adjust`

**Sygnatura:** `void adjust(ticks_t value) { m_startTicks += value; }`

### `startTicks`

**Sygnatura:** `ticks_t startTicks() { return m_startTicks; }`

### `ticksElapsed`

**Sygnatura:** `ticks_t ticksElapsed()`

### `timeElapsed`

**Sygnatura:** `float timeElapsed() { return ticksElapsed()/1000.0f; }`

### `running`

**Sygnatura:** `bool running() { return !m_stopped; }`

## Class Diagram

Zobacz: [../diagrams/timer.mmd](../diagrams/timer.mmd)

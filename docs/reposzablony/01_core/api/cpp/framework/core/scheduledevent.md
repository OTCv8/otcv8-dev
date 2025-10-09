---
doc_id: "cpp-api-2860aafc4f2c"
source_path: "framework/core/scheduledevent.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: scheduledevent.h"
summary: "Dokumentacja API C++ dla framework/core/scheduledevent.h"
tags: ["cpp", "api", "otclient"]
---

# framework/core/scheduledevent.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu scheduledevent.

## Classes/Structs

### Klasa: `ScheduledEvent`

| Member | Brief | Signature |
|--------|-------|-----------|
| `execute` |  | `void execute()` |
| `nextCycle` |  | `bool nextCycle()` |
| `ticks` |  | `int ticks() { return m_ticks; }` |
| `remainingTicks` |  | `int remainingTicks() { return m_ticks - g_clock.millis(); }` |
| `delay` |  | `int delay() { return m_delay; }` |
| `cyclesExecuted` |  | `int cyclesExecuted() { return m_cyclesExecuted; }` |
| `maxCycles` |  | `int maxCycles() { return m_maxCycles; }` |

### Struktura: `lessScheduledEvent`

## Functions

### `execute`

**Sygnatura:** `void execute()`

### `nextCycle`

**Sygnatura:** `bool nextCycle()`

### `ticks`

**Sygnatura:** `int ticks() { return m_ticks; }`

### `remainingTicks`

**Sygnatura:** `int remainingTicks() { return m_ticks - g_clock.millis(); }`

### `delay`

**Sygnatura:** `int delay() { return m_delay; }`

### `cyclesExecuted`

**Sygnatura:** `int cyclesExecuted() { return m_cyclesExecuted; }`

### `maxCycles`

**Sygnatura:** `int maxCycles() { return m_maxCycles; }`

### `operator`

**Sygnatura:** `bool operator()(const ScheduledEventPtr& a, const ScheduledEventPtr& b) {`

## Class Diagram

Zobacz: [../diagrams/scheduledevent.mmd](../diagrams/scheduledevent.mmd)

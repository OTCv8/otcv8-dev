---
doc_id: "cpp-api-06e099fcbefb"
source_path: "framework/core/eventdispatcher.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: eventdispatcher.h"
summary: "Dokumentacja API C++ dla framework/core/eventdispatcher.h"
tags: ["cpp", "api", "otclient"]
---

# framework/core/eventdispatcher.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu eventdispatcher.

## Classes/Structs

### Klasa: `EventDispatcher`

| Member | Brief | Signature |
|--------|-------|-----------|
| `shutdown` |  | `void shutdown()` |
| `poll` |  | `void poll()` |
| `addEventEx` |  | `EventPtr addEventEx(const std::string& function, const std::function<void()>& callback, bool pushFront = false)` |
| `scheduleEventEx` |  | `ScheduledEventPtr scheduleEventEx(const std::string& function, const std::function<void()>& callback, int delay)` |
| `cycleEventEx` |  | `ScheduledEventPtr cycleEventEx(const std::string& function, const std::function<void()>& callback, int delay)` |
| `isBotSafe` |  | `bool isBotSafe() { return m_botSafe; }` |

## Functions

### `shutdown`

**Sygnatura:** `void shutdown()`

### `poll`

**Sygnatura:** `void poll()`

### `addEventEx`

**Sygnatura:** `EventPtr addEventEx(const std::string& function, const std::function<void()>& callback, bool pushFront = false)`

### `scheduleEventEx`

**Sygnatura:** `ScheduledEventPtr scheduleEventEx(const std::string& function, const std::function<void()>& callback, int delay)`

### `cycleEventEx`

**Sygnatura:** `ScheduledEventPtr cycleEventEx(const std::string& function, const std::function<void()>& callback, int delay)`

### `isBotSafe`

**Sygnatura:** `bool isBotSafe() { return m_botSafe; }`

## Class Diagram

Zobacz: [../diagrams/eventdispatcher.mmd](../diagrams/eventdispatcher.mmd)

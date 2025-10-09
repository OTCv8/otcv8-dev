---
doc_id: "cpp-api-010bd97ac7fb"
source_path: "framework/core/event.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: event.h"
summary: "Dokumentacja API C++ dla framework/core/event.h"
tags: ["cpp", "api", "otclient"]
---

# framework/core/event.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu event.

## Classes/Structs

### Klasa: `Event`

| Member | Brief | Signature |
|--------|-------|-----------|
| `execute` |  | `virtual void execute()` |
| `cancel` |  | `void cancel()` |
| `isCanceled` |  | `bool isCanceled() { return m_canceled; }` |
| `isExecuted` |  | `bool isExecuted() { return m_executed; }` |
| `isBotSafe` |  | `bool isBotSafe() { return m_botSafe; }` |
| `m_function` |  | `std::string m_function` |
| `m_callback` |  | `std::function<void()> m_callback` |
| `m_canceled` |  | `bool m_canceled` |
| `m_executed` |  | `bool m_executed` |
| `m_botSafe` |  | `bool m_botSafe` |

## Functions

### `cancel`

**Sygnatura:** `void cancel()`

### `isCanceled`

**Sygnatura:** `bool isCanceled() { return m_canceled; }`

### `isExecuted`

**Sygnatura:** `bool isExecuted() { return m_executed; }`

### `isBotSafe`

**Sygnatura:** `bool isBotSafe() { return m_botSafe; }`

## Class Diagram

Zobacz: [../diagrams/event.mmd](../diagrams/event.mmd)

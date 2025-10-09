---
doc_id: "cpp-api-707143c128f4"
source_path: "framework/stdext/time.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: time.h"
summary: "Dokumentacja API C++ dla framework/stdext/time.h"
tags: ["cpp", "api", "otclient"]
---

# framework/stdext/time.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu time.

## Namespaces

### `stdext`

## Classes/Structs

### Struktura: `timer`

## Functions

### `time`

**Sygnatura:** `ticks_t time()`

### `millis`

**Sygnatura:** `ticks_t millis()`

### `micros`

**Sygnatura:** `ticks_t micros()`

### `millisleep`

**Sygnatura:** `void millisleep(size_t ms)`

### `microsleep`

**Sygnatura:** `void microsleep(size_t us)`

### `elapsed_seconds`

**Sygnatura:** `float elapsed_seconds() { return (float)((stdext::micros() - m_start)/1000000.0); }`

### `elapsed_millis`

**Sygnatura:** `ticks_t elapsed_millis() { return (stdext::micros() - m_start)/1000; }`

### `elapsed_micros`

**Sygnatura:** `ticks_t elapsed_micros() { return stdext::micros() - m_start; }`

### `restart`

**Sygnatura:** `void restart(int shift = 0) { m_start = stdext::micros() - shift; }`

## Class Diagram

Zobacz: [../diagrams/time.mmd](../diagrams/time.mmd)

---
doc_id: "cpp-api-6a08fc7f280c"
source_path: "framework/graphics/graph.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: graph.h"
summary: "Dokumentacja API C++ dla framework/graphics/graph.h"
tags: ["cpp", "api", "otclient"]
---

# framework/graphics/graph.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu graph.

## Classes/Structs

### Klasa: `Graph`

| Member | Brief | Signature |
|--------|-------|-----------|
| `draw` |  | `void draw(const Rect& dest)` |
| `clear` |  | `void clear()` |
| `addValue` |  | `void addValue(int value, bool ignoreSmallValues = false)` |

## Enums

### `GraphType`

**Wartości:**

- `GRAPH_TOTAL_FRAME_TIME`
- `GRAPH_CPU_FRAME_TIME`
- `GRAPH_GPU_CALLS`
- `GRAPH_GPU_DRAWS`
- `GRAPH_PROCESSING_POLL`
- `GRAPH_GRAPHICS_POLL`
- `GRAPH_DISPATCHER_EVENTS`
- `GRAPH_GRAPHICS_EVENTS`
- `GRAPH_LATENCY`
- `GRAPH_LAST`

## Functions

### `draw`

**Sygnatura:** `void draw(const Rect& dest)`

### `clear`

**Sygnatura:** `void clear()`

### `addValue`

**Sygnatura:** `void addValue(int value, bool ignoreSmallValues = false)`

## Class Diagram

Zobacz: [../diagrams/graph.mmd](../diagrams/graph.mmd)

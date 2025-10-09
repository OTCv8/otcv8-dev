---
doc_id: "cpp-api-f151a320a562"
source_path: "framework/input/mouse.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: mouse.h"
summary: "Dokumentacja API C++ dla framework/input/mouse.h"
tags: ["cpp", "api", "otclient"]
---

# framework/input/mouse.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu mouse.

## Classes/Structs

### Klasa: `Mouse`

| Member | Brief | Signature |
|--------|-------|-----------|
| `init` |  | `void init()` |
| `terminate` |  | `void terminate()` |
| `loadCursors` |  | `void loadCursors(std::string filename)` |
| `addCursor` |  | `void addCursor(const std::string& name, const std::string& file, const Point& hotSpot)` |
| `pushCursor` |  | `void pushCursor(const std::string& name)` |
| `popCursor` |  | `void popCursor(const std::string& name)` |
| `isCursorChanged` |  | `bool isCursorChanged()` |
| `isPressed` |  | `bool isPressed(Fw::MouseButton mouseButton)` |

## Functions

### `init`

**Sygnatura:** `void init()`

### `terminate`

**Sygnatura:** `void terminate()`

### `loadCursors`

**Sygnatura:** `void loadCursors(std::string filename)`

### `addCursor`

**Sygnatura:** `void addCursor(const std::string& name, const std::string& file, const Point& hotSpot)`

### `pushCursor`

**Sygnatura:** `void pushCursor(const std::string& name)`

### `popCursor`

**Sygnatura:** `void popCursor(const std::string& name)`

### `isCursorChanged`

**Sygnatura:** `bool isCursorChanged()`

### `isPressed`

**Sygnatura:** `bool isPressed(Fw::MouseButton mouseButton)`

## Class Diagram

Zobacz: [../diagrams/mouse.mmd](../diagrams/mouse.mmd)

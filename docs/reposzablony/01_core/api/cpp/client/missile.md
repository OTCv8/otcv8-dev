---
doc_id: "cpp-api-d46c57cdf137"
source_path: "client/missile.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: missile.h"
summary: "Dokumentacja API C++ dla client/missile.h"
tags: ["cpp", "api", "otclient"]
---

# client/missile.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu missile.

## Classes/Structs

### Klasa: `Missile`

| Member | Brief | Signature |
|--------|-------|-----------|
| `draw` |  | `void draw(const Point& dest, bool animate = true, LightView* lightView = nullptr)` |
| `setId` |  | `void setId(uint32 id)` |
| `setPath` |  | `void setPath(const Position& fromPosition, const Position& toPosition)` |
| `getId` |  | `uint32 getId() { return m_id; }` |
| `asMissile` |  | `MissilePtr asMissile() { return static_self_cast<Missile>(); }` |
| `isMissile` |  | `bool isMissile() { return true; }` |
| `getSource` |  | `Position getSource() { return m_source; }` |
| `getDestination` |  | `Position getDestination() { return m_destination; }` |

## Functions

### `draw`

**Sygnatura:** `void draw(const Point& dest, bool animate = true, LightView* lightView = nullptr)`

### `setId`

**Sygnatura:** `void setId(uint32 id)`

### `setPath`

**Sygnatura:** `void setPath(const Position& fromPosition, const Position& toPosition)`

### `getId`

**Sygnatura:** `uint32 getId() { return m_id; }`

### `asMissile`

**Sygnatura:** `MissilePtr asMissile() { return static_self_cast<Missile>(); }`

### `isMissile`

**Sygnatura:** `bool isMissile() { return true; }`

### `getSource`

**Sygnatura:** `Position getSource() { return m_source; }`

### `getDestination`

**Sygnatura:** `Position getDestination() { return m_destination; }`

## Class Diagram

Zobacz: [../diagrams/missile.mmd](../diagrams/missile.mmd)

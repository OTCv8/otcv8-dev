---
doc_id: "cpp-api-bdc98bcb66f3"
source_path: "client/lightview.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: lightview.h"
summary: "Dokumentacja API C++ dla client/lightview.h"
tags: ["cpp", "api", "otclient"]
---

# client/lightview.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu lightview.

## Classes/Structs

### Struktura: `TileLight`

### Klasa: `LightView`

| Member | Brief | Signature |
|--------|-------|-----------|
| `addLight` |  | `inline void addLight(const Point& pos, const Light& light)` |
| `addLight` |  | `return addLight(pos, light.color, light.intensity)` |
| `addLight` |  | `void addLight(const Point& pos, uint8_t color, uint8_t intensity)` |
| `setFieldBrightness` |  | `void setFieldBrightness(const Point& pos, size_t start, uint8_t color)` |
| `size` |  | `size_t size() { return m_lights.size(); }` |
| `draw` |  | `void draw() override` |

## Functions

### `addLight`

**Sygnatura:** `inline void addLight(const Point& pos, const Light& light)`

### `addLight`

**Sygnatura:** `return addLight(pos, light.color, light.intensity)`

### `addLight`

**Sygnatura:** `void addLight(const Point& pos, uint8_t color, uint8_t intensity)`

### `setFieldBrightness`

**Sygnatura:** `void setFieldBrightness(const Point& pos, size_t start, uint8_t color)`

### `size`

**Sygnatura:** `size_t size() { return m_lights.size(); }`

### `draw`

**Sygnatura:** `void draw() override`

## Class Diagram

Zobacz: [../diagrams/lightview.mmd](../diagrams/lightview.mmd)

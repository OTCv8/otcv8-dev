---
doc_id: "cpp-api-3d0b98a5b098"
source_path: "framework/graphics/colorarray.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: colorarray.h"
summary: "Dokumentacja API C++ dla framework/graphics/colorarray.h"
tags: ["cpp", "api", "otclient"]
---

# framework/graphics/colorarray.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu colorarray.

## Classes/Structs

### Klasa: `ColorArray`

| Member | Brief | Signature |
|--------|-------|-----------|
| `addColor` |  | `inline void addColor(float r, float g, float b, float a) { m_buffer << r << g << b << a; }` |
| `addColor` |  | `inline void addColor(const Color& c) { addColor(c.rF(), c.gF(), c.bF(), c.aF()); }` |
| `clear` |  | `void clear() { m_buffer.reset(); }` |
| `colorCount` |  | `int colorCount() const { return m_buffer.size() / 4; }` |
| `count` |  | `int count() const { return m_buffer.size() / 4; }` |
| `size` |  | `int size() const { return m_buffer.size(); }` |

## Functions

### `addColor`

**Sygnatura:** `inline void addColor(float r, float g, float b, float a) { m_buffer << r << g << b << a; }`

### `addColor`

**Sygnatura:** `inline void addColor(const Color& c) { addColor(c.rF(), c.gF(), c.bF(), c.aF()); }`

### `clear`

**Sygnatura:** `void clear() { m_buffer.reset(); }`

### `colorCount`

**Sygnatura:** `int colorCount() const { return m_buffer.size() / 4; }`

### `count`

**Sygnatura:** `int count() const { return m_buffer.size() / 4; }`

### `size`

**Sygnatura:** `int size() const { return m_buffer.size(); }`

## Class Diagram

Zobacz: [../diagrams/colorarray.mmd](../diagrams/colorarray.mmd)

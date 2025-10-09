---
doc_id: "cpp-api-05388e2c61fb"
source_path: "framework/graphics/drawcache.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: drawcache.h"
summary: "Dokumentacja API C++ dla framework/graphics/drawcache.h"
tags: ["cpp", "api", "otclient"]
---

# framework/graphics/drawcache.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu drawcache.

## Classes/Structs

### Klasa: `DrawCache`

## Functions

### `draw`

**Sygnatura:** `void draw()`

### `bind`

**Sygnatura:** `void bind()`

### `release`

**Sygnatura:** `void release()`

### `hasSpace`

**Sygnatura:** `bool hasSpace(int size) {`

### `getSize`

**Sygnatura:** `inline int getSize() { return m_size; }`

### `addRect`

**Sygnatura:** `void addRect(const Rect& dest, const Color& color)`

### `addTexturedRect`

**Sygnatura:** `void addTexturedRect(const Rect& dest, const Rect& src, const Color& color)`

### `addCoords`

**Sygnatura:** `void addCoords(CoordsBuffer& coords, const Color& color)`

### `addTexturedCoords`

**Sygnatura:** `void addTexturedCoords(CoordsBuffer& coords, const Point& offset, const Color& color)`

### `addRectRaw`

**Sygnatura:** `inline void addRectRaw(float* dest, const Rect& rect)`

### `addColorRaw`

**Sygnatura:** `inline void addColorRaw(const Color& color, int count)`

## Class Diagram

Zobacz: [../diagrams/drawcache.mmd](../diagrams/drawcache.mmd)

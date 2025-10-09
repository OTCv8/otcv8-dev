---
doc_id: "cpp-api-a8a8f3bf71ec"
source_path: "framework/graphics/vertexarray.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: vertexarray.h"
summary: "Dokumentacja API C++ dla framework/graphics/vertexarray.h"
tags: ["cpp", "api", "otclient"]
---

# framework/graphics/vertexarray.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu vertexarray.

## Classes/Structs

### Klasa: `VertexArray`

| Member | Brief | Signature |
|--------|-------|-----------|
| `m_hardwareBuffer` |  | `delete m_hardwareBuffer` |
| `addVertex` |  | `inline void addVertex(float x, float y) { m_buffer << x << y; }` |
| `addTriangle` |  | `inline void addTriangle(const Point& a, const Point& b, const Point& c) {` |
| `addRect` |  | `inline void addRect(const Rect& rect)` |
| `top` |  | `float top = rect.top()` |
| `right` |  | `float right = rect.right() + 1` |
| `bottom` |  | `float bottom = rect.bottom() + 1` |
| `left` |  | `float left = rect.left()` |
| `addRect` |  | `inline void addRect(const RectF& rect)` |
| `top` |  | `float top = rect.top()` |
| `right` |  | `float right = rect.right() + 1.f` |
| `bottom` |  | `float bottom = rect.bottom() + 1.f` |
| `left` |  | `float left = rect.left()` |
| `addQuad` |  | `inline void addQuad(const Rect& rect) {` |
| `top` |  | `float top = rect.top()` |
| `right` |  | `float right = rect.right()+1` |
| `bottom` |  | `float bottom = rect.bottom()+1` |
| `left` |  | `float left = rect.left()` |
| `addUpsideDownQuad` |  | `inline void addUpsideDownQuad(const Rect& rect) {` |
| `top` |  | `float top = rect.top()` |
| `right` |  | `float right = rect.right()+1` |
| `bottom` |  | `float bottom = rect.bottom()+1` |
| `left` |  | `float left = rect.left()` |
| `clear` |  | `void clear() { m_buffer.reset(); }` |
| `vertexCount` |  | `int vertexCount() const { return m_buffer.size() / 2; }` |
| `size` |  | `int size() const { return m_buffer.size(); }` |
| `cache` |  | `void cache()` |
| `isCached` |  | `bool isCached() { return m_hardwareBuffer != nullptr; }` |

## Functions

### `addVertex`

**Sygnatura:** `inline void addVertex(float x, float y) { m_buffer << x << y; }`

### `addTriangle`

**Sygnatura:** `inline void addTriangle(const Point& a, const Point& b, const Point& c) {`

### `addRect`

**Sygnatura:** `inline void addRect(const Rect& rect)`

### `addRect`

**Sygnatura:** `inline void addRect(const RectF& rect)`

### `addQuad`

**Sygnatura:** `inline void addQuad(const Rect& rect) {`

### `addUpsideDownQuad`

**Sygnatura:** `inline void addUpsideDownQuad(const Rect& rect) {`

### `clear`

**Sygnatura:** `void clear() { m_buffer.reset(); }`

### `vertexCount`

**Sygnatura:** `int vertexCount() const { return m_buffer.size() / 2; }`

### `size`

**Sygnatura:** `int size() const { return m_buffer.size(); }`

### `cache`

**Sygnatura:** `void cache()`

### `isCached`

**Sygnatura:** `bool isCached() { return m_hardwareBuffer != nullptr; }`

## Class Diagram

Zobacz: [../diagrams/vertexarray.mmd](../diagrams/vertexarray.mmd)

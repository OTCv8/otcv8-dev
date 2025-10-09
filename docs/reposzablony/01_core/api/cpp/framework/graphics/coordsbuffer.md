---
doc_id: "cpp-api-e91dbaf7748f"
source_path: "framework/graphics/coordsbuffer.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: coordsbuffer.h"
summary: "Dokumentacja API C++ dla framework/graphics/coordsbuffer.h"
tags: ["cpp", "api", "otclient"]
---

# framework/graphics/coordsbuffer.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu coordsbuffer.

## Classes/Structs

### Klasa: `CoordsBuffer`

| Member | Brief | Signature |
|--------|-------|-----------|
| `clear` |  | `void clear() {` |
| `addTriangle` |  | `void addTriangle(const Point& a, const Point& b, const Point& c) {` |
| `addRect` |  | `void addRect(const Rect& dest) {` |
| `addRect` |  | `void addRect(const Rect& dest, const Rect& src)` |
| `addRect` |  | `void addRect(const RectF& dest, const RectF& src)` |
| `addQuad` |  | `void addQuad(const Rect& dest, const Rect& src) {` |
| `addUpsideDownQuad` |  | `void addUpsideDownQuad(const Rect& dest, const Rect& src) {` |
| `addBoudingRect` |  | `void addBoudingRect(const Rect& dest, int innerLineWidth)` |
| `addRepeatedRects` |  | `void addRepeatedRects(const Rect& dest, const Rect& src)` |
| `getVertexCount` |  | `int getVertexCount() { return m_vertexArray->vertexCount(); }` |
| `getTextureCoordCount` |  | `int getTextureCoordCount() { return m_textureCoordArray->vertexCount(); }` |
| `unlock` |  | `void unlock(bool clear = false)` |
| `cache` |  | `void cache()` |
| `getTextureRect` |  | `Rect getTextureRect()` |

## Functions

### `clear`

**Sygnatura:** `void clear() {`

### `addTriangle`

**Sygnatura:** `void addTriangle(const Point& a, const Point& b, const Point& c) {`

### `addRect`

**Sygnatura:** `void addRect(const Rect& dest) {`

### `addRect`

**Sygnatura:** `void addRect(const Rect& dest, const Rect& src)`

### `addRect`

**Sygnatura:** `void addRect(const RectF& dest, const RectF& src)`

### `addQuad`

**Sygnatura:** `void addQuad(const Rect& dest, const Rect& src) {`

### `addUpsideDownQuad`

**Sygnatura:** `void addUpsideDownQuad(const Rect& dest, const Rect& src) {`

### `addBoudingRect`

**Sygnatura:** `void addBoudingRect(const Rect& dest, int innerLineWidth)`

### `addRepeatedRects`

**Sygnatura:** `void addRepeatedRects(const Rect& dest, const Rect& src)`

### `getVertexCount`

**Sygnatura:** `int getVertexCount() { return m_vertexArray->vertexCount(); }`

### `getTextureCoordCount`

**Sygnatura:** `int getTextureCoordCount() { return m_textureCoordArray->vertexCount(); }`

### `unlock`

**Sygnatura:** `void unlock(bool clear = false)`

### `cache`

**Sygnatura:** `void cache()`

### `getTextureRect`

**Sygnatura:** `Rect getTextureRect()`

## Class Diagram

Zobacz: [../diagrams/coordsbuffer.mmd](../diagrams/coordsbuffer.mmd)

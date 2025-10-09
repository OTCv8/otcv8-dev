---
doc_id: "cpp-api-eb62f5c3a41e"
source_path: "framework/graphics/deptharray.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: deptharray.h"
summary: "Dokumentacja API C++ dla framework/graphics/deptharray.h"
tags: ["cpp", "api", "otclient"]
---

# framework/graphics/deptharray.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu deptharray.

## Classes/Structs

### Klasa: `DepthArray`

| Member | Brief | Signature |
|--------|-------|-----------|
| `addDepth` |  | `inline void addDepth(float depth) { m_buffer << depth; }` |
| `clear` |  | `void clear() { m_buffer.reset(); }` |
| `depthCount` |  | `int depthCount() const { return m_buffer.size(); }` |
| `count` |  | `int count() const { return m_buffer.size(); }` |
| `size` |  | `int size() const { return m_buffer.size(); }` |

## Functions

### `addDepth`

**Sygnatura:** `inline void addDepth(float depth) { m_buffer << depth; }`

### `clear`

**Sygnatura:** `void clear() { m_buffer.reset(); }`

### `depthCount`

**Sygnatura:** `int depthCount() const { return m_buffer.size(); }`

### `count`

**Sygnatura:** `int count() const { return m_buffer.size(); }`

### `size`

**Sygnatura:** `int size() const { return m_buffer.size(); }`

## Class Diagram

Zobacz: [../diagrams/deptharray.mmd](../diagrams/deptharray.mmd)

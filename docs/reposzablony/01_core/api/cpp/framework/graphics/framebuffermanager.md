---
doc_id: "cpp-api-03f1fba29e0d"
source_path: "framework/graphics/framebuffermanager.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: framebuffermanager.h"
summary: "Dokumentacja API C++ dla framework/graphics/framebuffermanager.h"
tags: ["cpp", "api", "otclient"]
---

# framework/graphics/framebuffermanager.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu framebuffermanager.

## Classes/Structs

### Klasa: `FrameBufferManager`

| Member | Brief | Signature |
|--------|-------|-----------|
| `init` |  | `void init()` |
| `terminate` |  | `void terminate()` |
| `clear` |  | `void clear()` |
| `createFrameBuffer` |  | `FrameBufferPtr createFrameBuffer(bool withDepth = false)` |
| `m_temporaryFramebuffer` |  | `FrameBufferPtr m_temporaryFramebuffer` |
| `m_drawQueueTemporaryFramebuffer` |  | `FrameBufferPtr m_drawQueueTemporaryFramebuffer` |
| `m_framebuffers` |  | `std::vector<FrameBufferPtr> m_framebuffers` |

## Functions

### `init`

**Sygnatura:** `void init()`

### `terminate`

**Sygnatura:** `void terminate()`

### `clear`

**Sygnatura:** `void clear()`

### `createFrameBuffer`

**Sygnatura:** `FrameBufferPtr createFrameBuffer(bool withDepth = false)`

## Class Diagram

Zobacz: [../diagrams/framebuffermanager.mmd](../diagrams/framebuffermanager.mmd)

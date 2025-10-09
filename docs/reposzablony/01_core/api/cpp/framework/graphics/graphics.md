---
doc_id: "cpp-api-66aeb12a962e"
source_path: "framework/graphics/graphics.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: graphics.h"
summary: "Dokumentacja API C++ dla framework/graphics/graphics.h"
tags: ["cpp", "api", "otclient"]
---

# framework/graphics/graphics.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu graphics.

## Classes/Structs

### Klasa: `Painter`

| Member | Brief | Signature |
|--------|-------|-----------|
| `init` |  | `void init()` |
| `terminate` |  | `void terminate()` |
| `resize` |  | `void resize(const Size& size)` |
| `checkDepthSupport` |  | `void checkDepthSupport()` |
| `getMaxTextureSize` |  | `int getMaxTextureSize() { return m_maxTextureSize; }` |
| `getVendor` |  | `std::string getVendor() { return m_vendor; }` |
| `getRenderer` |  | `std::string getRenderer() { return m_renderer; }` |
| `getVersion` |  | `std::string getVersion() { return m_version; }` |
| `getExtensions` |  | `std::string getExtensions() { return m_extensions; }` |
| `ok` |  | `bool ok() { return m_ok; }` |
| `checkForError` |  | `void checkForError(const std::string& function, const std::string& file, int line)` |

### Klasa: `Graphics`

| Member | Brief | Signature |
|--------|-------|-----------|
| `init` |  | `void init()` |
| `terminate` |  | `void terminate()` |
| `resize` |  | `void resize(const Size& size)` |
| `checkDepthSupport` |  | `void checkDepthSupport()` |
| `getMaxTextureSize` |  | `int getMaxTextureSize() { return m_maxTextureSize; }` |
| `getVendor` |  | `std::string getVendor() { return m_vendor; }` |
| `getRenderer` |  | `std::string getRenderer() { return m_renderer; }` |
| `getVersion` |  | `std::string getVersion() { return m_version; }` |
| `getExtensions` |  | `std::string getExtensions() { return m_extensions; }` |
| `ok` |  | `bool ok() { return m_ok; }` |
| `checkForError` |  | `void checkForError(const std::string& function, const std::string& file, int line)` |

## Functions

### `init`

**Sygnatura:** `void init()`

### `terminate`

**Sygnatura:** `void terminate()`

### `resize`

**Sygnatura:** `void resize(const Size& size)`

### `checkDepthSupport`

**Sygnatura:** `void checkDepthSupport()`

### `getMaxTextureSize`

**Sygnatura:** `int getMaxTextureSize() { return m_maxTextureSize; }`

### `getVendor`

**Sygnatura:** `std::string getVendor() { return m_vendor; }`

### `getRenderer`

**Sygnatura:** `std::string getRenderer() { return m_renderer; }`

### `getVersion`

**Sygnatura:** `std::string getVersion() { return m_version; }`

### `getExtensions`

**Sygnatura:** `std::string getExtensions() { return m_extensions; }`

### `ok`

**Sygnatura:** `bool ok() { return m_ok; }`

### `checkForError`

**Sygnatura:** `void checkForError(const std::string& function, const std::string& file, int line)`

### `checkDepthSupport`

**Sygnatura:** `void checkDepthSupport()`

## Class Diagram

Zobacz: [../diagrams/graphics.mmd](../diagrams/graphics.mmd)

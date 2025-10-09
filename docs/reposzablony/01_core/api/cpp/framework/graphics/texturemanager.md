---
doc_id: "cpp-api-08d7d4d49331"
source_path: "framework/graphics/texturemanager.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: texturemanager.h"
summary: "Dokumentacja API C++ dla framework/graphics/texturemanager.h"
tags: ["cpp", "api", "otclient"]
---

# framework/graphics/texturemanager.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu texturemanager.

## Classes/Structs

### Klasa: `TextureManager`

| Member | Brief | Signature |
|--------|-------|-----------|
| `init` |  | `void init()` |
| `terminate` |  | `void terminate()` |
| `clearCache` |  | `void clearCache()` |
| `reload` |  | `void reload()` |
| `preload` |  | `void preload(const std::string& fileName) { getTexture(fileName); }` |
| `getTexture` |  | `TexturePtr getTexture(const std::string& fileName)` |
| `loadTexture` |  | `TexturePtr loadTexture(std::stringstream& file, const std::string& source)` |

## Functions

### `init`

**Sygnatura:** `void init()`

### `terminate`

**Sygnatura:** `void terminate()`

### `clearCache`

**Sygnatura:** `void clearCache()`

### `reload`

**Sygnatura:** `void reload()`

### `preload`

**Sygnatura:** `void preload(const std::string& fileName) { getTexture(fileName); }`

### `getTexture`

**Sygnatura:** `TexturePtr getTexture(const std::string& fileName)`

### `loadTexture`

**Sygnatura:** `TexturePtr loadTexture(std::stringstream& file, const std::string& source)`

## Class Diagram

Zobacz: [../diagrams/texturemanager.mmd](../diagrams/texturemanager.mmd)

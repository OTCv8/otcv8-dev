---
doc_id: "cpp-api-1bd142296f6d"
source_path: "framework/graphics/atlas.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: atlas.h"
summary: "Dokumentacja API C++ dla framework/graphics/atlas.h"
tags: ["cpp", "api", "otclient"]
---

# framework/graphics/atlas.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu atlas.

## Classes/Structs

### Klasa: `Atlas`

## Functions

### `init`

**Sygnatura:** `void init()`

### `terminate`

**Sygnatura:** `void terminate()`

### `reload`

**Sygnatura:** `void reload()`

### `cache`

**Sygnatura:** `Point cache(uint64_t hash, const Size& size, bool& draw)`

### `cacheFont`

**Sygnatura:** `Point cacheFont(const TexturePtr& fontTexture)`

### `get`

**Sygnatura:** `TexturePtr get(int location) { return m_atlas[location]->getTexture(); }`

### `bind`

**Sygnatura:** `void bind()`

### `release`

**Sygnatura:** `void release()`

### `getStats`

**Sygnatura:** `std::string getStats(); // not thread safe!`

### `reset`

**Sygnatura:** `void reset()`

### `resetAtlas`

**Sygnatura:** `void resetAtlas(int location)`

### `findSpace`

**Sygnatura:** `bool findSpace(int location, int index)`

### `calculateIndex`

**Sygnatura:** `inline int calculateIndex(const Size& size)`

## Class Diagram

Zobacz: [../diagrams/atlas.mmd](../diagrams/atlas.mmd)

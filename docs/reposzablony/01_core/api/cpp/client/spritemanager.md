---
doc_id: "cpp-api-7fc3e8ce72f7"
source_path: "client/spritemanager.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: spritemanager.h"
summary: "Dokumentacja API C++ dla client/spritemanager.h"
tags: ["cpp", "api", "otclient"]
---

# client/spritemanager.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu spritemanager.

## Classes/Structs

### Klasa: `SpriteManager`

| Member | Brief | Signature |
|--------|-------|-----------|
| `terminate` |  | `void terminate()` |
| `loadSpr` |  | `bool loadSpr(std::string file)` |
| `unload` |  | `void unload()` |
| `saveSpr` |  | `void saveSpr(std::string fileName)` |
| `saveSpr64` |  | `void saveSpr64(std::string fileName)` |
| `encryptSprites` |  | `void encryptSprites(std::string fileName)` |
| `dumpSprites` |  | `void dumpSprites(std::string dir)` |
| `getSignature` |  | `uint32 getSignature() { return m_signature; }` |
| `getSpritesCount` |  | `int getSpritesCount() { return m_spritesCount; }` |
| `getSpriteImage` |  | `ImagePtr getSpriteImage(int id)` |
| `isLoaded` |  | `bool isLoaded() { return m_loaded; }` |
| `spriteSize` |  | `int spriteSize() { return m_spriteSize; }` |
| `getOffsetFactor` |  | `float getOffsetFactor() const { return static_cast<float>(m_spriteSize) / 32.0f; }` |
| `isHdMod` |  | `bool isHdMod() const { return m_isHdMod; }` |

## Functions

### `terminate`

**Sygnatura:** `void terminate()`

### `loadSpr`

**Sygnatura:** `bool loadSpr(std::string file)`

### `unload`

**Sygnatura:** `void unload()`

### `saveSpr`

**Sygnatura:** `void saveSpr(std::string fileName)`

### `saveSpr64`

**Sygnatura:** `void saveSpr64(std::string fileName)`

### `encryptSprites`

**Sygnatura:** `void encryptSprites(std::string fileName)`

### `dumpSprites`

**Sygnatura:** `void dumpSprites(std::string dir)`

### `getSignature`

**Sygnatura:** `uint32 getSignature() { return m_signature; }`

### `getSpritesCount`

**Sygnatura:** `int getSpritesCount() { return m_spritesCount; }`

### `getSpriteImage`

**Sygnatura:** `ImagePtr getSpriteImage(int id)`

### `isLoaded`

**Sygnatura:** `bool isLoaded() { return m_loaded; }`

### `spriteSize`

**Sygnatura:** `int spriteSize() { return m_spriteSize; }`

### `getOffsetFactor`

**Sygnatura:** `float getOffsetFactor() const { return static_cast<float>(m_spriteSize) / 32.0f; }`

### `isHdMod`

**Sygnatura:** `bool isHdMod() const { return m_isHdMod; }`

### `loadCasualSpr`

**Sygnatura:** `bool loadCasualSpr(std::string file)`

### `loadCwmSpr`

**Sygnatura:** `bool loadCwmSpr(std::string file)`

### `getSpriteImageCasual`

**Sygnatura:** `ImagePtr getSpriteImageCasual(int id)`

### `getSpriteImageHd`

**Sygnatura:** `ImagePtr getSpriteImageHd(int id)`

## Class Diagram

Zobacz: [../diagrams/spritemanager.mmd](../diagrams/spritemanager.mmd)

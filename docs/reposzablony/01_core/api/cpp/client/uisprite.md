---
doc_id: "cpp-api-730266af5970"
source_path: "client/uisprite.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: uisprite.h"
summary: "Dokumentacja API C++ dla client/uisprite.h"
tags: ["cpp", "api", "otclient"]
---

# client/uisprite.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu uisprite.

## Classes/Structs

### Klasa: `UISprite`

| Member | Brief | Signature |
|--------|-------|-----------|
| `drawSelf` |  | `void drawSelf(Fw::DrawPane drawPane)` |
| `setSpriteId` |  | `void setSpriteId(uint32 id)` |
| `getSpriteId` |  | `uint32 getSpriteId() { return m_spriteId; }` |
| `clearSprite` |  | `void clearSprite() { setSpriteId(0); }` |
| `setSpriteColor` |  | `void setSpriteColor(Color color) { m_spriteColor = color; }` |
| `isSpriteVisible` |  | `bool isSpriteVisible() { return m_spriteVisible; }` |
| `setSpriteVisible` |  | `void setSpriteVisible(bool visible) { m_spriteVisible = visible; }` |
| `hasSprite` |  | `bool hasSprite() { return m_sprite != nullptr; }` |
| `onStyleApply` |  | `void onStyleApply(const std::string& styleName, const OTMLNodePtr& styleNode)` |
| `m_sprite` |  | `TexturePtr m_sprite` |
| `m_spriteId` |  | `uint32 m_spriteId` |
| `m_spriteColor` |  | `Color m_spriteColor` |
| `m_spriteVisible` |  | `stdext::boolean<true> m_spriteVisible` |

## Functions

### `drawSelf`

**Sygnatura:** `void drawSelf(Fw::DrawPane drawPane)`

### `setSpriteId`

**Sygnatura:** `void setSpriteId(uint32 id)`

### `getSpriteId`

**Sygnatura:** `uint32 getSpriteId() { return m_spriteId; }`

### `clearSprite`

**Sygnatura:** `void clearSprite() { setSpriteId(0); }`

### `setSpriteColor`

**Sygnatura:** `void setSpriteColor(Color color) { m_spriteColor = color; }`

### `isSpriteVisible`

**Sygnatura:** `bool isSpriteVisible() { return m_spriteVisible; }`

### `setSpriteVisible`

**Sygnatura:** `void setSpriteVisible(bool visible) { m_spriteVisible = visible; }`

### `hasSprite`

**Sygnatura:** `bool hasSprite() { return m_sprite != nullptr; }`

### `onStyleApply`

**Sygnatura:** `void onStyleApply(const std::string& styleName, const OTMLNodePtr& styleNode)`

## Class Diagram

Zobacz: [../diagrams/uisprite.mmd](../diagrams/uisprite.mmd)

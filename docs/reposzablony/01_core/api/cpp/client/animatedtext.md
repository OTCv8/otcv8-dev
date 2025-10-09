---
doc_id: "cpp-api-9a9b24852caa"
source_path: "client/animatedtext.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: animatedtext.h"
summary: "Dokumentacja API C++ dla client/animatedtext.h"
tags: ["cpp", "api", "otclient"]
---

# client/animatedtext.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu animatedtext.

## Classes/Structs

### Klasa: `AnimatedText`

| Member | Brief | Signature |
|--------|-------|-----------|
| `drawText` |  | `void drawText(const Point& dest, const Rect& visibleRect)` |
| `setColor` |  | `void setColor(int color)` |
| `setText` |  | `void setText(const std::string& text)` |
| `setOffset` |  | `void setOffset(const Point& offset) { m_offset = offset; }` |
| `setFont` |  | `void setFont(const std::string& fontName)` |
| `getColor` |  | `Color getColor() { return m_color; }` |
| `getOffset` |  | `Point getOffset() { return m_offset; }` |
| `getTimer` |  | `Timer getTimer() { return m_animationTimer; }` |
| `merge` |  | `bool merge(const AnimatedTextPtr& other)` |
| `asAnimatedText` |  | `AnimatedTextPtr asAnimatedText() { return static_self_cast<AnimatedText>(); }` |
| `isAnimatedText` |  | `bool isAnimatedText() { return true; }` |
| `getText` |  | `std::string getText() { return m_cachedText.getText(); }` |
| `onAppear` |  | `virtual void onAppear()` |

## Functions

### `drawText`

**Sygnatura:** `void drawText(const Point& dest, const Rect& visibleRect)`

### `setColor`

**Sygnatura:** `void setColor(int color)`

### `setText`

**Sygnatura:** `void setText(const std::string& text)`

### `setOffset`

**Sygnatura:** `void setOffset(const Point& offset) { m_offset = offset; }`

### `setFont`

**Sygnatura:** `void setFont(const std::string& fontName)`

### `getColor`

**Sygnatura:** `Color getColor() { return m_color; }`

### `getOffset`

**Sygnatura:** `Point getOffset() { return m_offset; }`

### `getTimer`

**Sygnatura:** `Timer getTimer() { return m_animationTimer; }`

### `merge`

**Sygnatura:** `bool merge(const AnimatedTextPtr& other)`

### `asAnimatedText`

**Sygnatura:** `AnimatedTextPtr asAnimatedText() { return static_self_cast<AnimatedText>(); }`

### `isAnimatedText`

**Sygnatura:** `bool isAnimatedText() { return true; }`

### `getText`

**Sygnatura:** `std::string getText() { return m_cachedText.getText(); }`

## Class Diagram

Zobacz: [../diagrams/animatedtext.mmd](../diagrams/animatedtext.mmd)

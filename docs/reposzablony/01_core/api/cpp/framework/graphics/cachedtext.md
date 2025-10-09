---
doc_id: "cpp-api-e040b4193202"
source_path: "framework/graphics/cachedtext.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: cachedtext.h"
summary: "Dokumentacja API C++ dla framework/graphics/cachedtext.h"
tags: ["cpp", "api", "otclient"]
---

# framework/graphics/cachedtext.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu cachedtext.

## Classes/Structs

### Klasa: `CachedText`

| Member | Brief | Signature |
|--------|-------|-----------|
| `draw` |  | `void draw(const Rect& rect, const Color& color)` |
| `wrapText` |  | `void wrapText(int maxWidth)` |
| `setFont` |  | `void setFont(const BitmapFontPtr& font) { m_font = font; update(); }` |
| `setText` |  | `void setText(const std::string& text) { m_textColors.clear();  m_text = text; update(); }` |
| `setColoredText` |  | `void setColoredText(const std::vector<std::string>& texts)` |
| `setAlign` |  | `void setAlign(Fw::AlignmentFlag align) { m_align = align; update(); }` |
| `getTextSize` |  | `Size getTextSize() { return m_textSize; }` |
| `getText` |  | `std::string getText() const { return m_text; }` |
| `getFont` |  | `BitmapFontPtr getFont() const { return m_font; }` |
| `getAlign` |  | `Fw::AlignmentFlag getAlign() { return m_align; }` |
| `hasText` |  | `bool hasText() { return !m_text.empty(); }` |

## Functions

### `draw`

**Sygnatura:** `void draw(const Rect& rect, const Color& color)`

### `wrapText`

**Sygnatura:** `void wrapText(int maxWidth)`

### `setFont`

**Sygnatura:** `void setFont(const BitmapFontPtr& font) { m_font = font; update(); }`

### `setText`

**Sygnatura:** `void setText(const std::string& text) { m_textColors.clear();  m_text = text; update(); }`

### `setColoredText`

**Sygnatura:** `void setColoredText(const std::vector<std::string>& texts)`

### `setAlign`

**Sygnatura:** `void setAlign(Fw::AlignmentFlag align) { m_align = align; update(); }`

### `getTextSize`

**Sygnatura:** `Size getTextSize() { return m_textSize; }`

### `getText`

**Sygnatura:** `std::string getText() const { return m_text; }`

### `getFont`

**Sygnatura:** `BitmapFontPtr getFont() const { return m_font; }`

### `getAlign`

**Sygnatura:** `Fw::AlignmentFlag getAlign() { return m_align; }`

### `hasText`

**Sygnatura:** `bool hasText() { return !m_text.empty(); }`

### `update`

**Sygnatura:** `void update()`

## Class Diagram

Zobacz: [../diagrams/cachedtext.mmd](../diagrams/cachedtext.mmd)

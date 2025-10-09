---
doc_id: "cpp-api-6e36432cfaf2"
source_path: "framework/graphics/bitmapfont.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: bitmapfont.h"
summary: "Dokumentacja API C++ dla framework/graphics/bitmapfont.h"
tags: ["cpp", "api", "otclient"]
---

# framework/graphics/bitmapfont.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu bitmapfont.

## Classes/Structs

### Klasa: `BitmapFont`

| Member | Brief | Signature |
|--------|-------|-----------|
| `load` | Load font from otml node | `void load(const OTMLNodePtr& fontNode)` |
| `drawText` | Simple text render starting at startPos | `void drawText(const std::string& text, const Point& startPos, const Color& color = Color::white, bool shadow = false)` |
| `drawText` | Advanced text render delimited by a screen region and alignment | `void drawText(const std::string& text, const Rect& screenCoords, Fw::AlignmentFlag align = Fw::AlignTopLeft, const Color& color = Color::white, bool s` |
| `drawColoredText` |  | `void drawColoredText(const std::string& text, const Rect& screenCoords, Fw::AlignmentFlag align, const std::vector<std::pair<int, Color>>& colors, boo` |
| `calculateDrawTextCoords` |  | `void calculateDrawTextCoords(CoordsBuffer& coordsBuffer, const std::string& text, const Rect& screenCoords, Fw::AlignmentFlag align = Fw::AlignTopLeft` |
| `align` |  | `Fw::AlignmentFlag align = Fw::AlignTopLeft,` |
| `calculateTextRectSize` | Simulate render and calculate text size | `Size calculateTextRectSize(const std::string& text)` |
| `wrapText` |  | `std::string wrapText(const std::string& text, int maxWidth, std::vector<std::pair<int, Color>>* colors = nullptr)` |
| `getId` |  | `int getId() { return m_id; }` |
| `getName` |  | `std::string getName() { return m_name; }` |
| `getGlyphHeight` |  | `int getGlyphHeight() { return m_glyphHeight; }` |
| `getYOffset` |  | `int getYOffset() { return m_yOffset; }` |
| `getGlyphSpacing` |  | `Size getGlyphSpacing() { return m_glyphSpacing; }` |

## Functions

### `load`

Load font from otml node

**Sygnatura:** `void load(const OTMLNodePtr& fontNode)`

### `drawText`

Simple text render starting at startPos

**Sygnatura:** `void drawText(const std::string& text, const Point& startPos, const Color& color = Color::white, bool shadow = false)`

### `drawText`

Advanced text render delimited by a screen region and alignment

**Sygnatura:** `void drawText(const std::string& text, const Rect& screenCoords, Fw::AlignmentFlag align = Fw::AlignTopLeft, const Color& color = Color::white, bool shadow = false)`

### `drawColoredText`

**Sygnatura:** `void drawColoredText(const std::string& text, const Rect& screenCoords, Fw::AlignmentFlag align, const std::vector<std::pair<int, Color>>& colors, bool shadow = false)`

### `calculateDrawTextCoords`

**Sygnatura:** `void calculateDrawTextCoords(CoordsBuffer& coordsBuffer, const std::string& text, const Rect& screenCoords, Fw::AlignmentFlag align = Fw::AlignTopLeft)`

### `calculateTextRectSize`

Simulate render and calculate text size

**Sygnatura:** `Size calculateTextRectSize(const std::string& text)`

### `wrapText`

**Sygnatura:** `std::string wrapText(const std::string& text, int maxWidth, std::vector<std::pair<int, Color>>* colors = nullptr)`

### `getId`

**Sygnatura:** `int getId() { return m_id; }`

### `getName`

**Sygnatura:** `std::string getName() { return m_name; }`

### `getGlyphHeight`

**Sygnatura:** `int getGlyphHeight() { return m_glyphHeight; }`

### `getYOffset`

**Sygnatura:** `int getYOffset() { return m_yOffset; }`

### `getGlyphSpacing`

**Sygnatura:** `Size getGlyphSpacing() { return m_glyphSpacing; }`

### `calculateGlyphsWidthsAutomatically`

Calculates each font character by inspecting font bitmap

**Sygnatura:** `void calculateGlyphsWidthsAutomatically(const ImagePtr& image, const Size& glyphSize)`

### `updateColors`

**Sygnatura:** `void updateColors(std::vector<std::pair<int, Color>>* colors, int pos, int newTextLen)`

## Class Diagram

Zobacz: [../diagrams/bitmapfont.mmd](../diagrams/bitmapfont.mmd)

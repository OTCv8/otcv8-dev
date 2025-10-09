---
doc_id: "cpp-api-978ea3761b75"
source_path: "framework/graphics/textrender.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: textrender.h"
summary: "Dokumentacja API C++ dla framework/graphics/textrender.h"
tags: ["cpp", "api", "otclient"]
---

# framework/graphics/textrender.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu textrender.

## Classes/Structs

### Struktura: `TextRenderCache`

### Klasa: `TextRender`

| Member | Brief | Signature |
|--------|-------|-----------|
| `init` |  | `void init()` |
| `terminate` |  | `void terminate()` |
| `poll` |  | `void poll()` |
| `addText` |  | `uint64_t addText(BitmapFontPtr font, const std::string& text, const Size& size, Fw::AlignmentFlag align = Fw::AlignTopLeft)` |
| `drawText` |  | `void drawText(const Rect& rect, const std::string& text, BitmapFontPtr font, const Color& color = Color::white, Fw::AlignmentFlag align = Fw::AlignTop` |
| `drawText` |  | `void drawText(const Point& pos, uint64_t hash, const Color& color, bool shadow = false)` |
| `drawColoredText` |  | `void drawColoredText(const Point& pos, uint64_t hash, const std::vector<std::pair<int, Color>>& colors, bool shadow = false)` |

## Functions

### `init`

**Sygnatura:** `void init()`

### `terminate`

**Sygnatura:** `void terminate()`

### `poll`

**Sygnatura:** `void poll()`

### `addText`

**Sygnatura:** `uint64_t addText(BitmapFontPtr font, const std::string& text, const Size& size, Fw::AlignmentFlag align = Fw::AlignTopLeft)`

### `drawText`

**Sygnatura:** `void drawText(const Rect& rect, const std::string& text, BitmapFontPtr font, const Color& color = Color::white, Fw::AlignmentFlag align = Fw::AlignTopLeft, bool shadow = false)`

### `drawText`

**Sygnatura:** `void drawText(const Point& pos, uint64_t hash, const Color& color, bool shadow = false)`

### `drawColoredText`

**Sygnatura:** `void drawColoredText(const Point& pos, uint64_t hash, const std::vector<std::pair<int, Color>>& colors, bool shadow = false)`

## Class Diagram

Zobacz: [../diagrams/textrender.mmd](../diagrams/textrender.mmd)

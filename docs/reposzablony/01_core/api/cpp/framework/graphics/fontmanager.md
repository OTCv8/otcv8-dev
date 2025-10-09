---
doc_id: "cpp-api-75c631f52e64"
source_path: "framework/graphics/fontmanager.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: fontmanager.h"
summary: "Dokumentacja API C++ dla framework/graphics/fontmanager.h"
tags: ["cpp", "api", "otclient"]
---

# framework/graphics/fontmanager.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu fontmanager.

## Classes/Structs

### Klasa: `FontManager`

| Member | Brief | Signature |
|--------|-------|-----------|
| `terminate` |  | `void terminate()` |
| `clearFonts` |  | `void clearFonts()` |
| `importFont` |  | `void importFont(std::string file)` |
| `fontExists` |  | `bool fontExists(const std::string& fontName)` |
| `getFont` |  | `BitmapFontPtr getFont(const std::string& fontName)` |
| `getDefaultFont` |  | `BitmapFontPtr getDefaultFont() { return m_defaultFont; }` |
| `setDefaultFont` |  | `void setDefaultFont(const std::string& fontName) { m_defaultFont = getFont(fontName); }` |

## Functions

### `terminate`

**Sygnatura:** `void terminate()`

### `clearFonts`

**Sygnatura:** `void clearFonts()`

### `importFont`

**Sygnatura:** `void importFont(std::string file)`

### `fontExists`

**Sygnatura:** `bool fontExists(const std::string& fontName)`

### `getFont`

**Sygnatura:** `BitmapFontPtr getFont(const std::string& fontName)`

### `getDefaultFont`

**Sygnatura:** `BitmapFontPtr getDefaultFont() { return m_defaultFont; }`

### `setDefaultFont`

**Sygnatura:** `void setDefaultFont(const std::string& fontName) { m_defaultFont = getFont(fontName); }`

## Class Diagram

Zobacz: [../diagrams/fontmanager.mmd](../diagrams/fontmanager.mmd)

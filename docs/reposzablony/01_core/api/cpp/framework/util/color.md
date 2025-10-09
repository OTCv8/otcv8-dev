---
doc_id: "cpp-api-7ff4f669b28c"
source_path: "framework/util/color.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: color.h"
summary: "Dokumentacja API C++ dla framework/util/color.h"
tags: ["cpp", "api", "otclient"]
---

# framework/util/color.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu color.

## Classes/Structs

### Klasa: `Color`

| Member | Brief | Signature |
|--------|-------|-----------|
| `a` |  | `uint8 a() const { return 255.0f * m_a; }` |
| `b` |  | `uint8 b() const { return 255.0f * m_b; }` |
| `g` |  | `uint8 g() const { return 255.0f * m_g; }` |
| `r` |  | `uint8 r() const { return 255.0f * m_r; }` |
| `aF` |  | `float aF() const { return m_a; }` |
| `bF` |  | `float bF() const { return m_b; }` |
| `gF` |  | `float gF() const { return m_g; }` |
| `rF` |  | `float rF() const { return m_r; }` |
| `setRed` |  | `void setRed(int r) { m_r = 0.003921f * r; }` |
| `setGreen` |  | `void setGreen(int g) { m_g = 0.003921f * g; }` |
| `setBlue` |  | `void setBlue(int b) { m_b = 0.003921f * b; }` |
| `setAlpha` |  | `void setAlpha(int a) { m_a = 0.003921f * a; }` |
| `setRed` |  | `void setRed(float r) { m_r = r; }` |
| `setGreen` |  | `void setGreen(float g) { m_g = g; }` |
| `setBlue` |  | `void setBlue(float b) { m_b = b; }` |
| `setAlpha` |  | `void setAlpha(float a) { m_a = a; }` |
| `setRGBA` |  | `void setRGBA(uint8 r, uint8 g, uint8 b, uint8 a = 0xFF) { m_r = r/255.0f; m_g = g/255.0f; m_b = b/255.0f; m_a = a/255.0f; }` |
| `setRGBA` |  | `void setRGBA(uint32 rgba) { setRGBA((rgba >> 0) & 0xff, (rgba >> 8) & 0xff, (rgba >> 16) & 0xff, (rgba >> 24) & 0xff); }` |
| `opacity` |  | `Color opacity(float opacity) const {` |
| `Color` |  | `return Color(m_r, m_g, m_b, m_a * opacity)` |
| `Color` |  | `return Color(std::min<float>(1.0f, m_r + other.m_r), std::min<float>(1.0f, m_g + other.m_g),` |
| `operator` |  | `bool operator==(const Color& other) const {` |
| `true` |  | `return true` |
| `toHex` |  | `std::string toHex()` |
| `to8bit` |  | `static uint8 to8bit(const Color& color) {` |
| `c` |  | `uint8 c = 0` |
| `c` |  | `return c` |
| `from8bit` |  | `static Color from8bit(int color) {` |
| `Color` |  | `return Color(0, 0, 0)` |
| `r` |  | `int r = int(color / 36) % 6 * 51` |
| `g` |  | `int g = int(color / 6) % 6 * 51` |
| `b` |  | `int b = color % 6 * 51` |
| `Color` |  | `return Color(r, g, b)` |
| `getOutfitColor` |  | `static Color getOutfitColor(int color)` |

## Functions

### `a`

**Sygnatura:** `uint8 a() const { return 255.0f * m_a; }`

### `b`

**Sygnatura:** `uint8 b() const { return 255.0f * m_b; }`

### `g`

**Sygnatura:** `uint8 g() const { return 255.0f * m_g; }`

### `r`

**Sygnatura:** `uint8 r() const { return 255.0f * m_r; }`

### `aF`

**Sygnatura:** `float aF() const { return m_a; }`

### `bF`

**Sygnatura:** `float bF() const { return m_b; }`

### `gF`

**Sygnatura:** `float gF() const { return m_g; }`

### `rF`

**Sygnatura:** `float rF() const { return m_r; }`

### `setRed`

**Sygnatura:** `void setRed(int r) { m_r = 0.003921f * r; }`

### `setGreen`

**Sygnatura:** `void setGreen(int g) { m_g = 0.003921f * g; }`

### `setBlue`

**Sygnatura:** `void setBlue(int b) { m_b = 0.003921f * b; }`

### `setAlpha`

**Sygnatura:** `void setAlpha(int a) { m_a = 0.003921f * a; }`

### `setRed`

**Sygnatura:** `void setRed(float r) { m_r = r; }`

### `setGreen`

**Sygnatura:** `void setGreen(float g) { m_g = g; }`

### `setBlue`

**Sygnatura:** `void setBlue(float b) { m_b = b; }`

### `setAlpha`

**Sygnatura:** `void setAlpha(float a) { m_a = a; }`

### `setRGBA`

**Sygnatura:** `void setRGBA(uint8 r, uint8 g, uint8 b, uint8 a = 0xFF) { m_r = r/255.0f; m_g = g/255.0f; m_b = b/255.0f; m_a = a/255.0f; }`

### `setRGBA`

**Sygnatura:** `void setRGBA(uint32 rgba) { setRGBA((rgba >> 0) & 0xff, (rgba >> 8) & 0xff, (rgba >> 16) & 0xff, (rgba >> 24) & 0xff); }`

### `opacity`

**Sygnatura:** `Color opacity(float opacity) const {`

### `Color`

**Sygnatura:** `return Color(m_r, m_g, m_b, m_a * opacity)`

### `Color`

**Sygnatura:** `return Color(std::min<float>(1.0f, m_r + other.m_r), std::min<float>(1.0f, m_g + other.m_g),`

### `toHex`

**Sygnatura:** `std::string toHex()`

### `to8bit`

**Sygnatura:** `static uint8 to8bit(const Color& color) {`

### `from8bit`

**Sygnatura:** `static Color from8bit(int color) {`

### `Color`

**Sygnatura:** `return Color(0, 0, 0)`

### `Color`

**Sygnatura:** `return Color(r, g, b)`

### `getOutfitColor`

**Sygnatura:** `static Color getOutfitColor(int color)`

## Class Diagram

Zobacz: [../diagrams/color.mmd](../diagrams/color.mmd)

---
doc_id: "cpp-api-c5ab7e7f17a4"
source_path: "framework/graphics/paintershaderprogram.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: paintershaderprogram.h"
summary: "Dokumentacja API C++ dla framework/graphics/paintershaderprogram.h"
tags: ["cpp", "api", "otclient"]
---

# framework/graphics/paintershaderprogram.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu paintershaderprogram.

## Classes/Structs

### Klasa: `PainterShaderProgram`

## Functions

### `link`

**Sygnatura:** `bool link()`

### `setTransformMatrix`

**Sygnatura:** `void setTransformMatrix(const Matrix3& transformMatrix)`

### `setProjectionMatrix`

**Sygnatura:** `void setProjectionMatrix(const Matrix3& projectionMatrix)`

### `setTextureMatrix`

**Sygnatura:** `void setTextureMatrix(const Matrix3& textureMatrix)`

### `setColor`

**Sygnatura:** `void setColor(const Color& color)`

### `setMatrixColor`

**Sygnatura:** `void setMatrixColor(const Matrix4& colors)`

### `setDepth`

**Sygnatura:** `void setDepth(float depth)`

### `setResolution`

**Sygnatura:** `void setResolution(const Size& resolution)`

### `setOffset`

**Sygnatura:** `void setOffset(const Point& offset)`

### `setCenter`

**Sygnatura:** `void setCenter(const Point& center)`

### `updateTime`

**Sygnatura:** `void updateTime()`

### `addMultiTexture`

**Sygnatura:** `void addMultiTexture(const std::string& file)`

### `bindMultiTextures`

**Sygnatura:** `void bindMultiTextures()`

### `clearMultiTextures`

**Sygnatura:** `void clearMultiTextures()`

### `enableColorMatrix`

**Sygnatura:** `void enableColorMatrix()`

## Class Diagram

Zobacz: [../diagrams/paintershaderprogram.mmd](../diagrams/paintershaderprogram.mmd)

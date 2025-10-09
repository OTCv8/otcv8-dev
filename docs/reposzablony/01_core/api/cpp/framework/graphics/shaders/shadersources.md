---
doc_id: "cpp-api-6826983740ee"
source_path: "framework/graphics/shaders/shadersources.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: shadersources.h"
summary: "Dokumentacja API C++ dla framework/graphics/shaders/shadersources.h"
tags: ["cpp", "api", "otclient"]
---

# framework/graphics/shaders/shadersources.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu shadersources.

## Functions

### `calculatePosition`

**Sygnatura:** `vec4 calculatePosition();\n\`

### `main`

**Sygnatura:** `void main() {\n\`

### `calculatePosition`

**Sygnatura:** `vec4 calculatePosition();\n\`

### `main`

**Sygnatura:** `void main()\n\`

### `calculatePosition`

**Sygnatura:** `vec4 calculatePosition() {\n\`

### `vec4`

**Sygnatura:** `return vec4((u_ProjectionMatrix * u_TransformMatrix * vec3(a_Vertex.xy, 1.0)).xy, u_Depth / 16384.0, 1.0);\n\`

### `calculatePixel`

**Sygnatura:** `vec4 calculatePixel();\n\`

### `main`

**Sygnatura:** `void main()\n\`

### `calculatePixel`

**Sygnatura:** `vec4 calculatePixel() {\n\`

### `texture2D`

**Sygnatura:** `return texture2D(u_Tex0, v_TexCoord) * u_Color;\n\`

### `calculatePixel`

**Sygnatura:** `vec4 calculatePixel() {\n\`

### `calculatePixel`

**Sygnatura:** `vec4 calculatePixel() {\n\`

### `vec4`

**Sygnatura:** `return vec4(0,0,0,0);\n\`

### `main`

**Sygnatura:** `void main()\n\`

### `main`

**Sygnatura:** `void main()\n\`

### `if`

**Sygnatura:** `else if(texcolor.g > 0.9)\n\`

### `if`

**Sygnatura:** `else if(texcolor.b > 0.9)\n\`

---
doc_id: "cpp-api-9121fe15dd7f"
source_path: "framework/graphics/shadermanager.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: shadermanager.h"
summary: "Dokumentacja API C++ dla framework/graphics/shadermanager.h"
tags: ["cpp", "api", "otclient"]
---

# framework/graphics/shadermanager.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu shadermanager.

## Classes/Structs

### Klasa: `ShaderManager`

| Member | Brief | Signature |
|--------|-------|-----------|
| `init` |  | `void init()` |
| `terminate` |  | `void terminate()` |
| `createShader` |  | `void createShader(const std::string& name, std::string vertex, std::string fragment, bool colorMatrix = false)` |
| `createOutfitShader` |  | `void createOutfitShader(const std::string& name, std::string vertex, std::string fragment)` |
| `createShader` |  | `return createShader(name, vertex, fragment, true)` |
| `addTexture` |  | `void addTexture(const std::string& name, const std::string& file)` |
| `getShader` |  | `PainterShaderProgramPtr getShader(const std::string& name)` |

## Functions

### `init`

**Sygnatura:** `void init()`

### `terminate`

**Sygnatura:** `void terminate()`

### `createShader`

**Sygnatura:** `void createShader(const std::string& name, std::string vertex, std::string fragment, bool colorMatrix = false)`

### `createOutfitShader`

**Sygnatura:** `void createOutfitShader(const std::string& name, std::string vertex, std::string fragment)`

### `createShader`

**Sygnatura:** `return createShader(name, vertex, fragment, true)`

### `addTexture`

**Sygnatura:** `void addTexture(const std::string& name, const std::string& file)`

### `getShader`

**Sygnatura:** `PainterShaderProgramPtr getShader(const std::string& name)`

## Class Diagram

Zobacz: [../diagrams/shadermanager.mmd](../diagrams/shadermanager.mmd)

---
doc_id: "cpp-api-c0f6a1670adc"
source_path: "framework/graphics/shader.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: shader.h"
summary: "Dokumentacja API C++ dla framework/graphics/shader.h"
tags: ["cpp", "api", "otclient"]
---

# framework/graphics/shader.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu shader.

## Classes/Structs

### Klasa: `Shader`

| Member | Brief | Signature |
|--------|-------|-----------|
| `compileSourceCode` |  | `bool compileSourceCode(const std::string& sourceCode)` |
| `compileSourceFile` |  | `bool compileSourceFile(const std::string& sourceFile)` |
| `log` |  | `std::string log()` |
| `getShaderId` |  | `uint getShaderId() { return m_shaderId; }` |
| `getShaderType` |  | `ShaderType getShaderType() { return m_shaderType; }` |

## Enums

### `ShaderType`

**Wartości:**

- `Vertex`
- `Fragment`

## Functions

### `compileSourceCode`

**Sygnatura:** `bool compileSourceCode(const std::string& sourceCode)`

### `compileSourceFile`

**Sygnatura:** `bool compileSourceFile(const std::string& sourceFile)`

### `log`

**Sygnatura:** `std::string log()`

### `getShaderId`

**Sygnatura:** `uint getShaderId() { return m_shaderId; }`

### `getShaderType`

**Sygnatura:** `ShaderType getShaderType() { return m_shaderType; }`

## Class Diagram

Zobacz: [../diagrams/shader.mmd](../diagrams/shader.mmd)

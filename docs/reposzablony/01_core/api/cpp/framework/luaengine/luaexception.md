---
doc_id: "cpp-api-a29ca2767bd1"
source_path: "framework/luaengine/luaexception.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: luaexception.h"
summary: "Dokumentacja API C++ dla framework/luaengine/luaexception.h"
tags: ["cpp", "api", "otclient"]
---

# framework/luaengine/luaexception.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu luaexception.

## Classes/Structs

### Klasa: `LuaException`

| Member | Brief | Signature |
|--------|-------|-----------|
| `generateLuaErrorMessage` |  | `void generateLuaErrorMessage(const std::string& error, int traceLevel)` |
| `m_what` |  | `std::string m_what` |

### Klasa: `LuaBadNumberOfArgumentsException`

### Klasa: `LuaBadValueCastException`

## Functions

### `generateLuaErrorMessage`

**Sygnatura:** `void generateLuaErrorMessage(const std::string& error, int traceLevel)`

## Class Diagram

Zobacz: [../diagrams/luaexception.mmd](../diagrams/luaexception.mmd)

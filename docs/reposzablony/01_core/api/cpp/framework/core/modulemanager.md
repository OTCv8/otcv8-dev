---
doc_id: "cpp-api-e2d0a13cdfb3"
source_path: "framework/core/modulemanager.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: modulemanager.h"
summary: "Dokumentacja API C++ dla framework/core/modulemanager.h"
tags: ["cpp", "api", "otclient"]
---

# framework/core/modulemanager.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu modulemanager.

## Classes/Structs

### Klasa: `ModuleManager`

| Member | Brief | Signature |
|--------|-------|-----------|
| `clear` |  | `void clear()` |
| `discoverModules` |  | `void discoverModules()` |
| `autoLoadModules` |  | `void autoLoadModules(int maxPriority)` |
| `discoverModule` |  | `ModulePtr discoverModule(const std::string& moduleFile)` |
| `ensureModuleLoaded` |  | `void ensureModuleLoaded(const std::string& moduleName)` |
| `unloadModules` |  | `void unloadModules()` |
| `reloadModules` |  | `void reloadModules()` |
| `getModule` |  | `ModulePtr getModule(const std::string& moduleName)` |
| `getModules` |  | `std::deque<ModulePtr> getModules() { return m_modules; }` |
| `updateModuleLoadOrder` |  | `void updateModuleLoadOrder(ModulePtr module)` |

## Functions

### `clear`

**Sygnatura:** `void clear()`

### `discoverModules`

**Sygnatura:** `void discoverModules()`

### `autoLoadModules`

**Sygnatura:** `void autoLoadModules(int maxPriority)`

### `discoverModule`

**Sygnatura:** `ModulePtr discoverModule(const std::string& moduleFile)`

### `ensureModuleLoaded`

**Sygnatura:** `void ensureModuleLoaded(const std::string& moduleName)`

### `unloadModules`

**Sygnatura:** `void unloadModules()`

### `reloadModules`

**Sygnatura:** `void reloadModules()`

### `getModule`

**Sygnatura:** `ModulePtr getModule(const std::string& moduleName)`

### `getModules`

**Sygnatura:** `std::deque<ModulePtr> getModules() { return m_modules; }`

### `updateModuleLoadOrder`

**Sygnatura:** `void updateModuleLoadOrder(ModulePtr module)`

## Class Diagram

Zobacz: [../diagrams/modulemanager.mmd](../diagrams/modulemanager.mmd)

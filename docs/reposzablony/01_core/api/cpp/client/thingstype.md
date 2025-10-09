---
doc_id: "cpp-api-dad186932106"
source_path: "client/thingstype.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: thingstype.h"
summary: "Dokumentacja API C++ dla client/thingstype.h"
tags: ["cpp", "api", "otclient"]
---

# client/thingstype.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu thingstype.

## Classes/Structs

### Klasa: `ThingsType`

| Member | Brief | Signature |
|--------|-------|-----------|
| `load` |  | `bool load(const std::string& file)` |
| `unload` |  | `void unload()` |
| `parseThingType` |  | `bool parseThingType(const FileStreamPtr& fin, ThingType& thingType)` |
| `getSignature` |  | `uint32 getSignature() { return m_signature; }` |
| `isLoaded` |  | `bool isLoaded() { return m_loaded; }` |
| `getFirstItemId` |  | `uint16 getFirstItemId() { return 100; }` |
| `getMaxItemid` |  | `uint16 getMaxItemid() { return m_things[Item].size() + 99; }` |
| `isValidItemId` |  | `bool isValidItemId(int id) { return id >= getFirstItemId() && id <= getMaxItemid(); }` |

## Enums

### `Categories`

**Wartości:**

- `Item`
- `Creature`
- `Effect`
- `Missile`
- `LastCategory`

## Functions

### `load`

**Sygnatura:** `bool load(const std::string& file)`

### `unload`

**Sygnatura:** `void unload()`

### `parseThingType`

**Sygnatura:** `bool parseThingType(const FileStreamPtr& fin, ThingType& thingType)`

### `getSignature`

**Sygnatura:** `uint32 getSignature() { return m_signature; }`

### `isLoaded`

**Sygnatura:** `bool isLoaded() { return m_loaded; }`

### `getFirstItemId`

**Sygnatura:** `uint16 getFirstItemId() { return 100; }`

### `getMaxItemid`

**Sygnatura:** `uint16 getMaxItemid() { return m_things[Item].size() + 99; }`

### `isValidItemId`

**Sygnatura:** `bool isValidItemId(int id) { return id >= getFirstItemId() && id <= getMaxItemid(); }`

## Class Diagram

Zobacz: [../diagrams/thingstype.mmd](../diagrams/thingstype.mmd)

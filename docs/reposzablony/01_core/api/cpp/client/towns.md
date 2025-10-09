---
doc_id: "cpp-api-0fc512c430d4"
source_path: "client/towns.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: towns.h"
summary: "Dokumentacja API C++ dla client/towns.h"
tags: ["cpp", "api", "otclient"]
---

# client/towns.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu towns.

## Classes/Structs

### Klasa: `Town`

| Member | Brief | Signature |
|--------|-------|-----------|
| `setId` |  | `void setId(uint32 tid) { m_id = tid; }` |
| `setName` |  | `void setName(const std::string& name) { m_name = name; }` |
| `setPos` |  | `void setPos(const Position& pos) { m_pos = pos; }` |
| `getId` |  | `uint32 getId() { return m_id; }` |
| `getName` |  | `std::string getName() { return m_name; }` |
| `getPos` |  | `Position getPos() { return m_pos; }` |

### Klasa: `TownManager`

| Member | Brief | Signature |
|--------|-------|-----------|
| `addTown` |  | `void addTown(const TownPtr& town)` |
| `removeTown` |  | `void removeTown(uint32 townId)` |
| `sort` |  | `void sort()` |
| `getTowns` |  | `TownList getTowns() { return m_towns; }` |
| `clear` |  | `void clear() { m_towns.clear(); m_nullTown = nullptr; }` |
| `findTown` |  | `TownList::iterator findTown(uint32 townId)` |

## Functions

### `setId`

**Sygnatura:** `void setId(uint32 tid) { m_id = tid; }`

### `setName`

**Sygnatura:** `void setName(const std::string& name) { m_name = name; }`

### `setPos`

**Sygnatura:** `void setPos(const Position& pos) { m_pos = pos; }`

### `getId`

**Sygnatura:** `uint32 getId() { return m_id; }`

### `getName`

**Sygnatura:** `std::string getName() { return m_name; }`

### `getPos`

**Sygnatura:** `Position getPos() { return m_pos; }`

### `addTown`

**Sygnatura:** `void addTown(const TownPtr& town)`

### `removeTown`

**Sygnatura:** `void removeTown(uint32 townId)`

### `sort`

**Sygnatura:** `void sort()`

### `getTowns`

**Sygnatura:** `TownList getTowns() { return m_towns; }`

### `clear`

**Sygnatura:** `void clear() { m_towns.clear(); m_nullTown = nullptr; }`

### `findTown`

**Sygnatura:** `TownList::iterator findTown(uint32 townId)`

## Class Diagram

Zobacz: [../diagrams/towns.mmd](../diagrams/towns.mmd)

---
doc_id: "cpp-api-d39858ffef08"
source_path: "framework/core/binarytree.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: binarytree.h"
summary: "Dokumentacja API C++ dla framework/core/binarytree.h"
tags: ["cpp", "api", "otclient"]
---

# framework/core/binarytree.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu binarytree.

## Classes/Structs

### Klasa: `BinaryTree`

| Member | Brief | Signature |
|--------|-------|-----------|
| `seek` |  | `void seek(uint pos)` |
| `skip` |  | `void skip(uint len)` |
| `tell` |  | `uint tell() { return m_pos; }` |
| `size` |  | `uint size() { unserialize(); return m_buffer.size(); }` |
| `getU8` |  | `uint8 getU8()` |
| `getU16` |  | `uint16 getU16()` |
| `getU32` |  | `uint32 getU32()` |
| `getU64` |  | `uint64 getU64()` |
| `getString` |  | `std::string getString(uint16 len = 0)` |
| `getPoint` |  | `Point getPoint()` |
| `getChildren` |  | `BinaryTreeVec getChildren()` |
| `canRead` |  | `bool canRead() { unserialize(); return m_pos < m_buffer.size(); }` |

### Klasa: `OutputBinaryTree`

| Member | Brief | Signature |
|--------|-------|-----------|
| `addU8` |  | `void addU8(uint8 v)` |
| `addU16` |  | `void addU16(uint16 v)` |
| `addU32` |  | `void addU32(uint32 v)` |
| `addString` |  | `void addString(const std::string& v)` |
| `addPos` |  | `void addPos(uint16 x, uint16 y, uint8 z)` |
| `addPoint` |  | `void addPoint(const Point& point)` |
| `startNode` |  | `void startNode(uint8 node)` |
| `endNode` |  | `void endNode()` |
| `write` |  | `void write(const uint8* data, size_t size)` |

## Functions

### `seek`

**Sygnatura:** `void seek(uint pos)`

### `skip`

**Sygnatura:** `void skip(uint len)`

### `tell`

**Sygnatura:** `uint tell() { return m_pos; }`

### `size`

**Sygnatura:** `uint size() { unserialize(); return m_buffer.size(); }`

### `getU8`

**Sygnatura:** `uint8 getU8()`

### `getU16`

**Sygnatura:** `uint16 getU16()`

### `getU32`

**Sygnatura:** `uint32 getU32()`

### `getU64`

**Sygnatura:** `uint64 getU64()`

### `getString`

**Sygnatura:** `std::string getString(uint16 len = 0)`

### `getPoint`

**Sygnatura:** `Point getPoint()`

### `getChildren`

**Sygnatura:** `BinaryTreeVec getChildren()`

### `canRead`

**Sygnatura:** `bool canRead() { unserialize(); return m_pos < m_buffer.size(); }`

### `unserialize`

**Sygnatura:** `void unserialize()`

### `skipNodes`

**Sygnatura:** `void skipNodes()`

### `addU8`

**Sygnatura:** `void addU8(uint8 v)`

### `addU16`

**Sygnatura:** `void addU16(uint16 v)`

### `addU32`

**Sygnatura:** `void addU32(uint32 v)`

### `addString`

**Sygnatura:** `void addString(const std::string& v)`

### `addPos`

**Sygnatura:** `void addPos(uint16 x, uint16 y, uint8 z)`

### `addPoint`

**Sygnatura:** `void addPoint(const Point& point)`

### `startNode`

**Sygnatura:** `void startNode(uint8 node)`

### `endNode`

**Sygnatura:** `void endNode()`

### `write`

**Sygnatura:** `void write(const uint8* data, size_t size)`

## Class Diagram

Zobacz: [../diagrams/binarytree.mmd](../diagrams/binarytree.mmd)

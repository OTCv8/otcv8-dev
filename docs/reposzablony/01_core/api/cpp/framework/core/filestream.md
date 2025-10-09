---
doc_id: "cpp-api-a275eed22dad"
source_path: "framework/core/filestream.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: filestream.h"
summary: "Dokumentacja API C++ dla framework/core/filestream.h"
tags: ["cpp", "api", "otclient"]
---

# framework/core/filestream.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu filestream.

## Classes/Structs

### Struktura: `PHYSFS_File`

| Member | Brief | Signature |
|--------|-------|-----------|
| `close` |  | `void close()` |
| `flush` |  | `void flush()` |
| `write` |  | `void write(const void *buffer, uint count)` |
| `read` |  | `int read(void *buffer, uint size, uint nmemb = 1)` |
| `seek` |  | `void seek(uint pos)` |
| `skip` |  | `void skip(uint len)` |
| `size` |  | `uint size()` |
| `tell` |  | `uint tell()` |
| `eof` |  | `bool eof()` |
| `name` |  | `std::string name() { return m_name; }` |
| `getU8` |  | `uint8 getU8()` |
| `getU16` |  | `uint16 getU16()` |
| `getU32` |  | `uint32 getU32()` |
| `getU64` |  | `uint64 getU64()` |
| `get8` |  | `int8 get8()` |
| `get16` |  | `int16 get16()` |
| `get32` |  | `int32 get32()` |
| `get64` |  | `int64 get64()` |
| `getString` |  | `std::string getString()` |
| `getBinaryTree` |  | `BinaryTreePtr getBinaryTree()` |
| `startNode` |  | `void startNode(uint8 n)` |
| `endNode` |  | `void endNode()` |
| `addU8` |  | `void addU8(uint8 v)` |
| `addU16` |  | `void addU16(uint16 v)` |
| `addU32` |  | `void addU32(uint32 v)` |
| `addU64` |  | `void addU64(uint64 v)` |
| `add8` |  | `void add8(int8 v)` |
| `add16` |  | `void add16(int16 v)` |
| `add32` |  | `void add32(int32 v)` |
| `add64` |  | `void add64(int64 v)` |
| `addString` |  | `void addString(const std::string& v)` |
| `addPos` |  | `void addPos(uint16 x, uint16 y, uint8 z) { addU16(x); addU16(y); addU8(z); }` |
| `addPoint` |  | `void addPoint(const Point& p) { addU8(p.x); addU8(p.y); }` |
| `asFileStream` |  | `FileStreamPtr asFileStream() { return static_self_cast<FileStream>(); }` |

### Klasa: `FileStream`

| Member | Brief | Signature |
|--------|-------|-----------|
| `close` |  | `void close()` |
| `flush` |  | `void flush()` |
| `write` |  | `void write(const void *buffer, uint count)` |
| `read` |  | `int read(void *buffer, uint size, uint nmemb = 1)` |
| `seek` |  | `void seek(uint pos)` |
| `skip` |  | `void skip(uint len)` |
| `size` |  | `uint size()` |
| `tell` |  | `uint tell()` |
| `eof` |  | `bool eof()` |
| `name` |  | `std::string name() { return m_name; }` |
| `getU8` |  | `uint8 getU8()` |
| `getU16` |  | `uint16 getU16()` |
| `getU32` |  | `uint32 getU32()` |
| `getU64` |  | `uint64 getU64()` |
| `get8` |  | `int8 get8()` |
| `get16` |  | `int16 get16()` |
| `get32` |  | `int32 get32()` |
| `get64` |  | `int64 get64()` |
| `getString` |  | `std::string getString()` |
| `getBinaryTree` |  | `BinaryTreePtr getBinaryTree()` |
| `startNode` |  | `void startNode(uint8 n)` |
| `endNode` |  | `void endNode()` |
| `addU8` |  | `void addU8(uint8 v)` |
| `addU16` |  | `void addU16(uint16 v)` |
| `addU32` |  | `void addU32(uint32 v)` |
| `addU64` |  | `void addU64(uint64 v)` |
| `add8` |  | `void add8(int8 v)` |
| `add16` |  | `void add16(int16 v)` |
| `add32` |  | `void add32(int32 v)` |
| `add64` |  | `void add64(int64 v)` |
| `addString` |  | `void addString(const std::string& v)` |
| `addPos` |  | `void addPos(uint16 x, uint16 y, uint8 z) { addU16(x); addU16(y); addU8(z); }` |
| `addPoint` |  | `void addPoint(const Point& p) { addU8(p.x); addU8(p.y); }` |
| `asFileStream` |  | `FileStreamPtr asFileStream() { return static_self_cast<FileStream>(); }` |

## Functions

### `close`

**Sygnatura:** `void close()`

### `flush`

**Sygnatura:** `void flush()`

### `write`

**Sygnatura:** `void write(const void *buffer, uint count)`

### `read`

**Sygnatura:** `int read(void *buffer, uint size, uint nmemb = 1)`

### `seek`

**Sygnatura:** `void seek(uint pos)`

### `skip`

**Sygnatura:** `void skip(uint len)`

### `size`

**Sygnatura:** `uint size()`

### `tell`

**Sygnatura:** `uint tell()`

### `eof`

**Sygnatura:** `bool eof()`

### `name`

**Sygnatura:** `std::string name() { return m_name; }`

### `getU8`

**Sygnatura:** `uint8 getU8()`

### `getU16`

**Sygnatura:** `uint16 getU16()`

### `getU32`

**Sygnatura:** `uint32 getU32()`

### `getU64`

**Sygnatura:** `uint64 getU64()`

### `get8`

**Sygnatura:** `int8 get8()`

### `get16`

**Sygnatura:** `int16 get16()`

### `get32`

**Sygnatura:** `int32 get32()`

### `get64`

**Sygnatura:** `int64 get64()`

### `getString`

**Sygnatura:** `std::string getString()`

### `getBinaryTree`

**Sygnatura:** `BinaryTreePtr getBinaryTree()`

### `startNode`

**Sygnatura:** `void startNode(uint8 n)`

### `endNode`

**Sygnatura:** `void endNode()`

### `addU8`

**Sygnatura:** `void addU8(uint8 v)`

### `addU16`

**Sygnatura:** `void addU16(uint16 v)`

### `addU32`

**Sygnatura:** `void addU32(uint32 v)`

### `addU64`

**Sygnatura:** `void addU64(uint64 v)`

### `add8`

**Sygnatura:** `void add8(int8 v)`

### `add16`

**Sygnatura:** `void add16(int16 v)`

### `add32`

**Sygnatura:** `void add32(int32 v)`

### `add64`

**Sygnatura:** `void add64(int64 v)`

### `addString`

**Sygnatura:** `void addString(const std::string& v)`

### `addPos`

**Sygnatura:** `void addPos(uint16 x, uint16 y, uint8 z) { addU16(x); addU16(y); addU8(z); }`

### `addPoint`

**Sygnatura:** `void addPoint(const Point& p) { addU8(p.x); addU8(p.y); }`

### `asFileStream`

**Sygnatura:** `FileStreamPtr asFileStream() { return static_self_cast<FileStream>(); }`

### `initFromGzip`

**Sygnatura:** `bool initFromGzip(const std::string& buffer)`

### `checkWrite`

**Sygnatura:** `void checkWrite()`

### `throwError`

**Sygnatura:** `void throwError(const std::string& message, bool physfsError = false)`

## Class Diagram

Zobacz: [../diagrams/filestream.mmd](../diagrams/filestream.mmd)

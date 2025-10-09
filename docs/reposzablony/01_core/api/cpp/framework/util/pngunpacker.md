---
doc_id: "cpp-api-06cb54a2a2fe"
source_path: "framework/util/pngunpacker.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: pngunpacker.h"
summary: "Dokumentacja API C++ dla framework/util/pngunpacker.h"
tags: ["cpp", "api", "otclient"]
---

# framework/util/pngunpacker.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu pngunpacker.

## Classes/Structs

### Klasa: `FileMetadata`

File unpacking related

| Member | Brief | Signature |
|--------|-------|-----------|
| `getOffset` |  | `uint32_t getOffset() const { return offset; }` |
| `getFileSize` |  | `uint32_t getFileSize() const { return fileSize; }` |

### Klasa: `PngUnpacker`

| Member | Brief | Signature |
|--------|-------|-----------|
| `unpack` |  | `static std::unordered_map<uint32_t, std::string> unpack(const FileStreamPtr& file)` |

## Functions

### `getOffset`

**Sygnatura:** `uint32_t getOffset() const { return offset; }`

### `getFileSize`

**Sygnatura:** `uint32_t getFileSize() const { return fileSize; }`

### `unpack`

**Sygnatura:** `static std::unordered_map<uint32_t, std::string> unpack(const FileStreamPtr& file)`

## Class Diagram

Zobacz: [../diagrams/pngunpacker.mmd](../diagrams/pngunpacker.mmd)

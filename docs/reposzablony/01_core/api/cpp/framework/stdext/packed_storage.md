---
doc_id: "cpp-api-24a2ade06b34"
source_path: "framework/stdext/packed_storage.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: packed_storage.h"
summary: "Dokumentacja API C++ dla framework/stdext/packed_storage.h"
tags: ["cpp", "api", "otclient"]
---

# framework/stdext/packed_storage.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu packed_storage.

## Namespaces

### `stdext`

## Classes/Structs

### Klasa: `packed_storage`

**Szablon:** `template<typename Key, typename SizeType = uint8>`

### Struktura: `value_pair`

## Functions

### `set`

**Sygnatura:** `void set(Key id, const T& value) {`

### `remove`

**Sygnatura:** `bool remove(Key id) {`

### `get`

**Sygnatura:** `T get(Key id) const {`

### `T`

**Sygnatura:** `return T()`

### `has`

**Sygnatura:** `bool has(Key id) const {`

### `clear`

**Sygnatura:** `void clear() {`

### `size`

**Sygnatura:** `std::size_t size() { return m_size; }`

## Class Diagram

Zobacz: [../diagrams/packed_storage.mmd](../diagrams/packed_storage.mmd)

---
doc_id: "cpp-api-d95e229bd162"
source_path: "framework/stdext/dynamic_storage.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: dynamic_storage.h"
summary: "Dokumentacja API C++ dla framework/stdext/dynamic_storage.h"
tags: ["cpp", "api", "otclient"]
---

# framework/stdext/dynamic_storage.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu dynamic_storage.

## Namespaces

### `stdext`

## Classes/Structs

### Klasa: `dynamic_storage`

**Szablon:** `template<typename Key>`

## Functions

### `remove`

**Sygnatura:** `bool remove(const Key& k) {`

### `has`

**Sygnatura:** `bool has(const Key& k) const { return k < m_data.size() && !m_data[k].empty(); }`

### `size`

**Sygnatura:** `std::size_t size() const {`

### `clear`

**Sygnatura:** `void clear() { m_data.clear(); }`

## Class Diagram

Zobacz: [../diagrams/dynamic_storage.mmd](../diagrams/dynamic_storage.mmd)

---
doc_id: "cpp-api-0823ee173a18"
source_path: "framework/stdext/shared_object.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: shared_object.h"
summary: "Dokumentacja API C++ dla framework/stdext/shared_object.h"
tags: ["cpp", "api", "otclient"]
---

# framework/stdext/shared_object.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu shared_object.

## Namespaces

### `stdext`

### `std`

## Classes/Structs

### Klasa: `shared_object_ptr`

**Szablon:** `template<class T>`

| Member | Brief | Signature |
|--------|-------|-----------|
| `add_ref` |  | `void add_ref() { ++refs; }` |
| `dec_ref` |  | `void dec_ref() { if(--refs == 0) delete this; }` |
| `ref_count` |  | `refcount_t ref_count() { return refs; }` |

### Klasa: `shared_object`

| Member | Brief | Signature |
|--------|-------|-----------|
| `add_ref` |  | `void add_ref() { ++refs; }` |
| `dec_ref` |  | `void dec_ref() { if(--refs == 0) delete this; }` |
| `ref_count` |  | `refcount_t ref_count() { return refs; }` |

### Klasa: `shared_object_ptr`

**Szablon:** `template<class T>`

| Member | Brief | Signature |
|--------|-------|-----------|
| `reset` |  | `void reset() { shared_object_ptr().swap(*this); }` |
| `reset` |  | `void reset(T* rhs) { shared_object_ptr(rhs).swap(*this); }` |
| `swap` |  | `void swap(shared_object_ptr& rhs) { std::swap(px, rhs.px); }` |
| `use_count` |  | `refcount_t use_count() const { return ((shared_object*)px)->ref_count(); }` |
| `is_unique` |  | `bool is_unique() const { return use_count() == 1; }` |
| `unspecified_bool_type` |  | `operator unspecified_bool_type() const { return px == nullptr ? nullptr : &shared_object_ptr::px; }` |

## Functions

### `add_ref`

**Sygnatura:** `void add_ref() { ++refs; }`

### `dec_ref`

**Sygnatura:** `void dec_ref() { if(--refs == 0) delete this; }`

### `ref_count`

**Sygnatura:** `refcount_t ref_count() { return refs; }`

### `reset`

**Sygnatura:** `void reset() { shared_object_ptr().swap(*this); }`

### `reset`

**Sygnatura:** `void reset(T* rhs) { shared_object_ptr(rhs).swap(*this); }`

### `swap`

**Sygnatura:** `void swap(shared_object_ptr& rhs) { std::swap(px, rhs.px); }`

### `use_count`

**Sygnatura:** `refcount_t use_count() const { return ((shared_object*)px)->ref_count(); }`

### `is_unique`

**Sygnatura:** `bool is_unique() const { return use_count() == 1; }`

### `unspecified_bool_type`

**Sygnatura:** `operator unspecified_bool_type() const { return px == nullptr ? nullptr : &shared_object_ptr::px; }`

### `add_ref`

**Sygnatura:** `void add_ref() { ((shared_object*)px)->add_ref(); }`

### `dec_ref`

**Sygnatura:** `void dec_ref() { ((shared_object*)px)->dec_ref(); }`

## Types/Aliases

### `element_type`

**Typedef:** `T`

## Class Diagram

Zobacz: [../diagrams/shared_object.mmd](../diagrams/shared_object.mmd)

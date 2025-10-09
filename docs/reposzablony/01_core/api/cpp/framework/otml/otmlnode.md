---
doc_id: "cpp-api-bd5d1ff3d3cf"
source_path: "framework/otml/otmlnode.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: otmlnode.h"
summary: "Dokumentacja API C++ dla framework/otml/otmlnode.h"
tags: ["cpp", "api", "otclient"]
---

# framework/otml/otmlnode.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu otmlnode.

## Classes/Structs

### Klasa: `OTMLNode`

| Member | Brief | Signature |
|--------|-------|-----------|
| `create` |  | `static OTMLNodePtr create(std::string tag = "", bool unique = false)` |
| `create` |  | `static OTMLNodePtr create(std::string tag, std::string value)` |
| `tag` |  | `std::string tag() { return m_tag; }` |
| `size` |  | `int size() { return m_children.size(); }` |
| `source` |  | `std::string source() { return m_source; }` |
| `rawValue` |  | `std::string rawValue() { return m_value; }` |
| `isUnique` |  | `bool isUnique() { return m_unique; }` |
| `isNull` |  | `bool isNull() { return m_null; }` |
| `hasTag` |  | `bool hasTag() { return !m_tag.empty(); }` |
| `hasValue` |  | `bool hasValue() { return !m_value.empty(); }` |
| `hasChildren` |  | `bool hasChildren()` |
| `hasChildAt` |  | `bool hasChildAt(const std::string& childTag) { return !!get(childTag); }` |
| `getIndex` |  | `size_t getIndex() { return m_index; }` |
| `setTag` |  | `void setTag(const std::string& tag)` |
| `setValue` |  | `void setValue(const std::string& value) { m_value = value; }` |
| `setNull` |  | `void setNull(bool null) { m_null = null; }` |
| `setUnique` |  | `void setUnique(bool unique) { m_unique = unique; }` |
| `setSource` |  | `void setSource(const std::string& source) { m_source = source; }` |
| `setIndex` |  | `void setIndex(size_t index) { m_index = index; }` |
| `lockTag` |  | `void lockTag() {` |
| `get` |  | `OTMLNodePtr get(const std::string& childTag)` |
| `getIndex` |  | `OTMLNodePtr getIndex(int childIndex)` |
| `at` |  | `OTMLNodePtr at(const std::string& childTag)` |
| `addChild` |  | `void addChild(const OTMLNodePtr& newChild)` |
| `removeChild` |  | `bool removeChild(const OTMLNodePtr& oldChild)` |
| `copy` |  | `void copy(const OTMLNodePtr& node)` |
| `merge` |  | `void merge(const OTMLNodePtr& node)` |
| `clear` |  | `void clear()` |
| `children` |  | `OTMLNodeList children()` |
| `clone` |  | `OTMLNodePtr clone()` |
| `value` |  | `T value()` |
| `valueAt` |  | `T valueAt(const std::string& childTag)` |
| `valueAtIndex` |  | `T valueAtIndex(int childIndex)` |
| `valueAt` |  | `T valueAt(const std::string& childTag, const T& def)` |
| `valueAtIndex` |  | `T valueAtIndex(int childIndex, const T& def)` |
| `write` |  | `void write(const T& v)` |
| `writeAt` |  | `void writeAt(const std::string& childTag, const T& v)` |
| `writeIn` |  | `void writeIn(const T& v)` |
| `emit` |  | `virtual std::string emit()` |
| `asOTMLNode` |  | `OTMLNodePtr asOTMLNode() { return static_self_cast<OTMLNode>(); }` |
| `m_tag` |  | `std::string m_tag` |
| `m_value` |  | `std::string m_value` |
| `m_source` |  | `std::string m_source` |
| `m_index` |  | `size_t m_index = 0` |
| `m_unique` |  | `bool m_unique` |
| `m_null` |  | `bool m_null` |
| `m_tagLocked` |  | `bool m_tagLocked = false` |

## Functions

### `create`

**Sygnatura:** `static OTMLNodePtr create(std::string tag = "", bool unique = false)`

### `create`

**Sygnatura:** `static OTMLNodePtr create(std::string tag, std::string value)`

### `tag`

**Sygnatura:** `std::string tag() { return m_tag; }`

### `size`

**Sygnatura:** `int size() { return m_children.size(); }`

### `source`

**Sygnatura:** `std::string source() { return m_source; }`

### `rawValue`

**Sygnatura:** `std::string rawValue() { return m_value; }`

### `isUnique`

**Sygnatura:** `bool isUnique() { return m_unique; }`

### `isNull`

**Sygnatura:** `bool isNull() { return m_null; }`

### `hasTag`

**Sygnatura:** `bool hasTag() { return !m_tag.empty(); }`

### `hasValue`

**Sygnatura:** `bool hasValue() { return !m_value.empty(); }`

### `hasChildren`

**Sygnatura:** `bool hasChildren()`

### `hasChildAt`

**Sygnatura:** `bool hasChildAt(const std::string& childTag) { return !!get(childTag); }`

### `getIndex`

**Sygnatura:** `size_t getIndex() { return m_index; }`

### `setTag`

**Sygnatura:** `void setTag(const std::string& tag)`

### `setValue`

**Sygnatura:** `void setValue(const std::string& value) { m_value = value; }`

### `setNull`

**Sygnatura:** `void setNull(bool null) { m_null = null; }`

### `setUnique`

**Sygnatura:** `void setUnique(bool unique) { m_unique = unique; }`

### `setSource`

**Sygnatura:** `void setSource(const std::string& source) { m_source = source; }`

### `setIndex`

**Sygnatura:** `void setIndex(size_t index) { m_index = index; }`

### `lockTag`

**Sygnatura:** `void lockTag() {`

### `get`

**Sygnatura:** `OTMLNodePtr get(const std::string& childTag)`

### `getIndex`

**Sygnatura:** `OTMLNodePtr getIndex(int childIndex)`

### `at`

**Sygnatura:** `OTMLNodePtr at(const std::string& childTag)`

### `addChild`

**Sygnatura:** `void addChild(const OTMLNodePtr& newChild)`

### `removeChild`

**Sygnatura:** `bool removeChild(const OTMLNodePtr& oldChild)`

### `copy`

**Sygnatura:** `void copy(const OTMLNodePtr& node)`

### `merge`

**Sygnatura:** `void merge(const OTMLNodePtr& node)`

### `clear`

**Sygnatura:** `void clear()`

### `children`

**Sygnatura:** `OTMLNodeList children()`

### `clone`

**Sygnatura:** `OTMLNodePtr clone()`

### `value`

**Sygnatura:** `T value()`

### `valueAt`

**Sygnatura:** `T valueAt(const std::string& childTag)`

### `valueAtIndex`

**Sygnatura:** `T valueAtIndex(int childIndex)`

### `valueAt`

**Sygnatura:** `T valueAt(const std::string& childTag, const T& def)`

### `valueAtIndex`

**Sygnatura:** `T valueAtIndex(int childIndex, const T& def)`

### `write`

**Sygnatura:** `void write(const T& v)`

### `writeAt`

**Sygnatura:** `void writeAt(const std::string& childTag, const T& v)`

### `writeIn`

**Sygnatura:** `void writeIn(const T& v)`

### `asOTMLNode`

**Sygnatura:** `OTMLNodePtr asOTMLNode() { return static_self_cast<OTMLNode>(); }`

### `OTMLException`

**Sygnatura:** `throw OTMLException(asOTMLNode(), stdext::format("failed to cast node value '%s' to type '%s'", m_value, stdext::demangle_type<T>()))`

## Class Diagram

Zobacz: [../diagrams/otmlnode.mmd](../diagrams/otmlnode.mmd)

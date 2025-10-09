---
doc_id: "cpp-api-32e6e1a5aff7"
source_path: "framework/util/point.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: point.h"
summary: "Dokumentacja API C++ dla framework/util/point.h"
tags: ["cpp", "api", "otclient"]
---

# framework/util/point.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu point.

## Classes/Structs

### Klasa: `TSize`

**Szablon:** `template<class T>`

| Member | Brief | Signature |
|--------|-------|-----------|
| `isNull` |  | `bool isNull() const { return x==0 && y==0; }` |
| `toSize` |  | `TSize<T> toSize() const { return TSize<T>(x, y); }` |
| `operator` |  | `bool operator==(const TPoint<T>& other) const { return other.x==x && other.y==y; }` |
| `length` |  | `float length() const { return sqrt((float)(x*x + y*y)); }` |
| `manhattanLength` |  | `T manhattanLength() const { return std::abs(x) + std::abs(y); }` |
| `distanceFrom` |  | `float distanceFrom(const TPoint<T>& other) const {` |

### Klasa: `TPoint`

**Szablon:** `template<class T>`

| Member | Brief | Signature |
|--------|-------|-----------|
| `isNull` |  | `bool isNull() const { return x==0 && y==0; }` |
| `toSize` |  | `TSize<T> toSize() const { return TSize<T>(x, y); }` |
| `operator` |  | `bool operator==(const TPoint<T>& other) const { return other.x==x && other.y==y; }` |
| `length` |  | `float length() const { return sqrt((float)(x*x + y*y)); }` |
| `manhattanLength` |  | `T manhattanLength() const { return std::abs(x) + std::abs(y); }` |
| `distanceFrom` |  | `float distanceFrom(const TPoint<T>& other) const {` |

## Functions

### `isNull`

**Sygnatura:** `bool isNull() const { return x==0 && y==0; }`

### `toSize`

**Sygnatura:** `TSize<T> toSize() const { return TSize<T>(x, y); }`

### `length`

**Sygnatura:** `float length() const { return sqrt((float)(x*x + y*y)); }`

### `manhattanLength`

**Sygnatura:** `T manhattanLength() const { return std::abs(x) + std::abs(y); }`

### `distanceFrom`

**Sygnatura:** `float distanceFrom(const TPoint<T>& other) const {`

## Types/Aliases

### `Point`

**Typedef:** `TPoint<int>`

### `PointF`

**Typedef:** `TPoint<float>`

## Class Diagram

Zobacz: [../diagrams/point.mmd](../diagrams/point.mmd)

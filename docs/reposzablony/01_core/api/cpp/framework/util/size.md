---
doc_id: "cpp-api-f85aa3d93ed3"
source_path: "framework/util/size.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: size.h"
summary: "Dokumentacja API C++ dla framework/util/size.h"
tags: ["cpp", "api", "otclient"]
---

# framework/util/size.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu size.

## Classes/Structs

### Klasa: `TSize`

**Szablon:** `template<class T>`

| Member | Brief | Signature |
|--------|-------|-----------|
| `toPoint` |  | `TPoint<T> toPoint() const { return TPoint<T>(wd, ht); }` |
| `isNull` |  | `bool isNull() const { return wd==0 && ht==0; }` |
| `isEmpty` |  | `bool isEmpty() const { return wd<1 \|\| ht<1; }` |
| `isValid` |  | `bool isValid() const { return wd>=0 && ht>=0; }` |
| `width` |  | `T width() const { return wd; }` |
| `height` |  | `T height() const { return ht; }` |
| `resize` |  | `void resize(T w, T h) { wd = w; ht = h; }` |
| `setWidth` |  | `void setWidth(T w) { wd = w; }` |
| `setHeight` |  | `void setHeight(T h) { ht = h; }` |
| `operator` |  | `bool operator==(const TSize<T>& other) const { return other.wd==wd && other.ht==ht; }` |
| `expandedTo` |  | `TSize<T> expandedTo(const TSize<T>& other) const { return TSize<T>(std::max<T>(wd, other.wd), std::max<T>(ht, other.ht)); }` |
| `boundedTo` |  | `TSize<T> boundedTo(const TSize<T>& other) const { return TSize<T>(std::min<T>(wd, other.wd), std::min<T>(ht, other.ht)); }` |
| `scale` |  | `void scale(const TSize<T>& s, Fw::AspectRatioMode mode) {` |
| `useHeight` |  | `bool useHeight` |
| `rw` |  | `T rw = (s.ht * wd) / ht` |
| `scale` |  | `void scale(int w, int h, Fw::AspectRatioMode mode) { scale(TSize<T>(w, h), mode); }` |
| `ratio` |  | `float ratio() const { return (float)wd/ht; }` |
| `area` |  | `T area() const { return wd*ht; }` |

## Functions

### `toPoint`

**Sygnatura:** `TPoint<T> toPoint() const { return TPoint<T>(wd, ht); }`

### `isNull`

**Sygnatura:** `bool isNull() const { return wd==0 && ht==0; }`

### `isEmpty`

**Sygnatura:** `bool isEmpty() const { return wd<1 || ht<1; }`

### `isValid`

**Sygnatura:** `bool isValid() const { return wd>=0 && ht>=0; }`

### `width`

**Sygnatura:** `T width() const { return wd; }`

### `height`

**Sygnatura:** `T height() const { return ht; }`

### `resize`

**Sygnatura:** `void resize(T w, T h) { wd = w; ht = h; }`

### `setWidth`

**Sygnatura:** `void setWidth(T w) { wd = w; }`

### `setHeight`

**Sygnatura:** `void setHeight(T h) { ht = h; }`

### `expandedTo`

**Sygnatura:** `TSize<T> expandedTo(const TSize<T>& other) const { return TSize<T>(std::max<T>(wd, other.wd), std::max<T>(ht, other.ht)); }`

### `boundedTo`

**Sygnatura:** `TSize<T> boundedTo(const TSize<T>& other) const { return TSize<T>(std::min<T>(wd, other.wd), std::min<T>(ht, other.ht)); }`

### `scale`

**Sygnatura:** `void scale(const TSize<T>& s, Fw::AspectRatioMode mode) {`

### `scale`

**Sygnatura:** `void scale(int w, int h, Fw::AspectRatioMode mode) { scale(TSize<T>(w, h), mode); }`

### `ratio`

**Sygnatura:** `float ratio() const { return (float)wd/ht; }`

### `area`

**Sygnatura:** `T area() const { return wd*ht; }`

## Types/Aliases

### `Size`

**Typedef:** `TSize<int>`

### `SizeF`

**Typedef:** `TSize<float>`

## Class Diagram

Zobacz: [../diagrams/size.mmd](../diagrams/size.mmd)

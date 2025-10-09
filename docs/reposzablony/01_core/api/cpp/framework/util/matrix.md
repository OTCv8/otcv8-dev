---
doc_id: "cpp-api-b62c3ac353e0"
source_path: "framework/util/matrix.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: matrix.h"
summary: "Dokumentacja API C++ dla framework/util/matrix.h"
tags: ["cpp", "api", "otclient"]
---

# framework/util/matrix.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu matrix.

## Classes/Structs

### Klasa: `Matrix`

**Szablon:** `template<int N, int M, typename T = float>`

| Member | Brief | Signature |
|--------|-------|-----------|
| `setIdentity` |  | `void setIdentity()` |
| `isIdentity` |  | `bool isIdentity() const` |
| `fill` |  | `void fill(T value)` |
| `transposed` |  | `Matrix<M,N,T> transposed() const` |
| `operator` |  | `T operator()(int row, int column) const { return m[row-1][column-1]; }` |
| `operator` |  | `bool operator==(const Matrix<N,M,T>& other) const` |

## Functions

### `setIdentity`

**Sygnatura:** `void setIdentity()`

### `isIdentity`

**Sygnatura:** `bool isIdentity() const`

### `fill`

**Sygnatura:** `void fill(T value)`

### `transposed`

**Sygnatura:** `Matrix<M,N,T> transposed() const`

### `operator`

**Sygnatura:** `T operator()(int row, int column) const { return m[row-1][column-1]; }`

### `result`

**Sygnatura:** `Matrix<M,N,T> result(1)`

### `c`

**Sygnatura:** `Matrix<M,Q,T> c(1)`

## Types/Aliases

### `Matrix4x4`

**Typedef:** `Matrix<4,4>`

### `Matrix3x3`

**Typedef:** `Matrix<3,3>`

### `Matrix2x2`

**Typedef:** `Matrix<2,2>`

### `Matrix4`

**Typedef:** `Matrix4x4`

### `Matrix3`

**Typedef:** `Matrix3x3`

### `Matrix2`

**Typedef:** `Matrix2x2`

## Class Diagram

Zobacz: [../diagrams/matrix.mmd](../diagrams/matrix.mmd)

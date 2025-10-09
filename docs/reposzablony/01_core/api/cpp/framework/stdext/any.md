---
doc_id: "cpp-api-24f7c69195b3"
source_path: "framework/stdext/any.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: any.h"
summary: "Dokumentacja API C++ dla framework/stdext/any.h"
tags: ["cpp", "api", "otclient"]
---

# framework/stdext/any.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu any.

## Namespaces

### `stdext`

## Classes/Structs

### Klasa: `any`

### Struktura: `placeholder`

### Struktura: `holder`

**Szablon:** `template<typename T>`

## Functions

### `any`

**Sygnatura:** `template<typename T> any(const T& value) : content(new holder<T>(value)) { }`

### `empty`

**Sygnatura:** `bool empty() const { return !content; }`

## Class Diagram

Zobacz: [../diagrams/any.mmd](../diagrams/any.mmd)

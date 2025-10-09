---
doc_id: "cpp-api-c9605397c972"
source_path: "framework/stdext/exception.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: exception.h"
summary: "Dokumentacja API C++ dla framework/stdext/exception.h"
tags: ["cpp", "api", "otclient"]
---

# framework/stdext/exception.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu exception.

## Namespaces

### `stdext`

## Classes/Structs

### Klasa: `exception`

| Member | Brief | Signature |
|--------|-------|-----------|
| `m_what` |  | `std::string m_what` |

## Functions

### `throw_exception`

Throws a generic exception

**Sygnatura:** `inline void throw_exception(const std::string& what) { throw exception(what); }`

## Class Diagram

Zobacz: [../diagrams/exception.mmd](../diagrams/exception.mmd)

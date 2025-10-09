---
doc_id: "cpp-api-21463b6eda9b"
source_path: "framework/otml/otmldocument.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: otmldocument.h"
summary: "Dokumentacja API C++ dla framework/otml/otmldocument.h"
tags: ["cpp", "api", "otclient"]
---

# framework/otml/otmldocument.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu otmldocument.

## Classes/Structs

### Klasa: `OTMLDocument`

| Member | Brief | Signature |
|--------|-------|-----------|
| `create` | Create a new OTML document for filling it with nodes | `static OTMLDocumentPtr create()` |
| `parse` | Parse OTML from a file | `static OTMLDocumentPtr parse(const std::string& fileName)` |
| `parseString` | Parse OTML from a string | `static OTMLDocumentPtr parseString(const std::string& data, const std::string& source)` |
| `parse` | Parse OTML from input stream @param source is the file name that will be used to show errors message | `static OTMLDocumentPtr parse(std::istream& in, const std::string& source)` |
| `emit` | Emits this document and all it's children to a std::string | `std::string emit()` |
| `save` | Save this document to a file | `bool save(const std::string& fileName)` |

## Functions

### `create`

Create a new OTML document for filling it with nodes

**Sygnatura:** `static OTMLDocumentPtr create()`

### `parse`

Parse OTML from a file

**Sygnatura:** `static OTMLDocumentPtr parse(const std::string& fileName)`

### `parseString`

Parse OTML from a string

**Sygnatura:** `static OTMLDocumentPtr parseString(const std::string& data, const std::string& source)`

### `parse`

Parse OTML from input stream @param source is the file name that will be used to show errors messages

**Sygnatura:** `static OTMLDocumentPtr parse(std::istream& in, const std::string& source)`

### `emit`

Emits this document and all it's children to a std::string

**Sygnatura:** `std::string emit()`

### `save`

Save this document to a file

**Sygnatura:** `bool save(const std::string& fileName)`

## Class Diagram

Zobacz: [../diagrams/otmldocument.mmd](../diagrams/otmldocument.mmd)

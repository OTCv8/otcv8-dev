---
doc_id: "cpp-api-a9b71c952c27"
source_path: "framework/otml/otmlparser.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: otmlparser.h"
summary: "Dokumentacja API C++ dla framework/otml/otmlparser.h"
tags: ["cpp", "api", "otclient"]
---

# framework/otml/otmlparser.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu otmlparser.

## Classes/Structs

### Klasa: `OTMLParser`

| Member | Brief | Signature |
|--------|-------|-----------|
| `parse` | Parse the entire document | `void parse()` |

## Functions

### `parse`

Parse the entire document

**Sygnatura:** `void parse()`

### `getNextLine`

Retrieve next line from the input stream

**Sygnatura:** `std::string getNextLine()`

### `getLineDepth`

Counts depth of a line (every 2 spaces increments one depth)

**Sygnatura:** `int getLineDepth(const std::string& line, bool multilining = false)`

### `parseLine`

Parse each line of the input stream

**Sygnatura:** `void parseLine(std::string line)`

### `parseNode`

Parse nodes tag and value

**Sygnatura:** `void parseNode(const std::string& data)`

## Class Diagram

Zobacz: [../diagrams/otmlparser.mmd](../diagrams/otmlparser.mmd)

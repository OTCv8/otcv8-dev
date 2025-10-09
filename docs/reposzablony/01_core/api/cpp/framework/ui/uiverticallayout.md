---
doc_id: "cpp-api-7857bf34d5aa"
source_path: "framework/ui/uiverticallayout.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: uiverticallayout.h"
summary: "Dokumentacja API C++ dla framework/ui/uiverticallayout.h"
tags: ["cpp", "api", "otclient"]
---

# framework/ui/uiverticallayout.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu uiverticallayout.

## Classes/Structs

### Klasa: `UIVerticalLayout`

| Member | Brief | Signature |
|--------|-------|-----------|
| `applyStyle` |  | `void applyStyle(const OTMLNodePtr& styleNode)` |
| `setAlignBottom` |  | `void setAlignBottom(bool aliginBottom) { m_alignBottom = aliginBottom; update(); }` |
| `isAlignBottom` |  | `bool isAlignBottom() { return m_alignBottom; }` |
| `isUIVerticalLayout` |  | `bool isUIVerticalLayout() { return true; }` |
| `internalUpdate` |  | `bool internalUpdate()` |
| `m_alignBottom` |  | `stdext::boolean<false> m_alignBottom` |

## Functions

### `applyStyle`

**Sygnatura:** `void applyStyle(const OTMLNodePtr& styleNode)`

### `setAlignBottom`

**Sygnatura:** `void setAlignBottom(bool aliginBottom) { m_alignBottom = aliginBottom; update(); }`

### `isAlignBottom`

**Sygnatura:** `bool isAlignBottom() { return m_alignBottom; }`

### `isUIVerticalLayout`

**Sygnatura:** `bool isUIVerticalLayout() { return true; }`

### `internalUpdate`

**Sygnatura:** `bool internalUpdate()`

## Class Diagram

Zobacz: [../diagrams/uiverticallayout.mmd](../diagrams/uiverticallayout.mmd)

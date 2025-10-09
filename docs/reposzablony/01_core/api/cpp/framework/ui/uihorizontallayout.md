---
doc_id: "cpp-api-00e9938fae30"
source_path: "framework/ui/uihorizontallayout.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: uihorizontallayout.h"
summary: "Dokumentacja API C++ dla framework/ui/uihorizontallayout.h"
tags: ["cpp", "api", "otclient"]
---

# framework/ui/uihorizontallayout.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu uihorizontallayout.

## Classes/Structs

### Klasa: `UIHorizontalLayout`

| Member | Brief | Signature |
|--------|-------|-----------|
| `applyStyle` |  | `void applyStyle(const OTMLNodePtr& styleNode)` |
| `setAlignRight` |  | `void setAlignRight(bool aliginRight) { m_alignRight = aliginRight; update(); }` |
| `isUIHorizontalLayout` |  | `bool isUIHorizontalLayout() { return true; }` |
| `internalUpdate` |  | `bool internalUpdate()` |
| `m_alignChidren` |  | `Fw::AlignmentFlag m_alignChidren` |
| `m_alignRight` |  | `stdext::boolean<false> m_alignRight` |

## Functions

### `applyStyle`

**Sygnatura:** `void applyStyle(const OTMLNodePtr& styleNode)`

### `setAlignRight`

**Sygnatura:** `void setAlignRight(bool aliginRight) { m_alignRight = aliginRight; update(); }`

### `isUIHorizontalLayout`

**Sygnatura:** `bool isUIHorizontalLayout() { return true; }`

### `internalUpdate`

**Sygnatura:** `bool internalUpdate()`

## Class Diagram

Zobacz: [../diagrams/uihorizontallayout.mmd](../diagrams/uihorizontallayout.mmd)

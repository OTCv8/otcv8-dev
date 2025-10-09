---
doc_id: "cpp-api-164e3abb42ae"
source_path: "framework/ui/uiboxlayout.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: uiboxlayout.h"
summary: "Dokumentacja API C++ dla framework/ui/uiboxlayout.h"
tags: ["cpp", "api", "otclient"]
---

# framework/ui/uiboxlayout.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu uiboxlayout.

## Classes/Structs

### Klasa: `UIBoxLayout`

| Member | Brief | Signature |
|--------|-------|-----------|
| `applyStyle` |  | `void applyStyle(const OTMLNodePtr& styleNode)` |
| `addWidget` |  | `void addWidget(const UIWidgetPtr& widget) { update(); }` |
| `removeWidget` |  | `void removeWidget(const UIWidgetPtr& widget) { update(); }` |
| `setSpacing` |  | `void setSpacing(int spacing) { m_spacing = spacing; update(); }` |
| `setFitChildren` |  | `void setFitChildren(bool fitParent) { m_fitChildren = fitParent; update(); }` |
| `isUIBoxLayout` |  | `bool isUIBoxLayout() { return true; }` |
| `m_fitChildren` |  | `stdext::boolean<false> m_fitChildren` |
| `m_spacing` |  | `int m_spacing` |

## Functions

### `applyStyle`

**Sygnatura:** `void applyStyle(const OTMLNodePtr& styleNode)`

### `addWidget`

**Sygnatura:** `void addWidget(const UIWidgetPtr& widget) { update(); }`

### `removeWidget`

**Sygnatura:** `void removeWidget(const UIWidgetPtr& widget) { update(); }`

### `setSpacing`

**Sygnatura:** `void setSpacing(int spacing) { m_spacing = spacing; update(); }`

### `setFitChildren`

**Sygnatura:** `void setFitChildren(bool fitParent) { m_fitChildren = fitParent; update(); }`

### `isUIBoxLayout`

**Sygnatura:** `bool isUIBoxLayout() { return true; }`

## Class Diagram

Zobacz: [../diagrams/uiboxlayout.mmd](../diagrams/uiboxlayout.mmd)

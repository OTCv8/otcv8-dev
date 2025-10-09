---
doc_id: "cpp-api-84375e6d6867"
source_path: "client/uimapanchorlayout.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: uimapanchorlayout.h"
summary: "Dokumentacja API C++ dla client/uimapanchorlayout.h"
tags: ["cpp", "api", "otclient"]
---

# client/uimapanchorlayout.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu uimapanchorlayout.

## Classes/Structs

### Klasa: `UIPositionAnchor`

| Member | Brief | Signature |
|--------|-------|-----------|
| `getHookedWidget` |  | `UIWidgetPtr getHookedWidget(const UIWidgetPtr& widget, const UIWidgetPtr& parentWidget) { return parentWidget; }` |
| `getHookedPoint` |  | `int getHookedPoint(const UIWidgetPtr& hookedWidget, const UIWidgetPtr& parentWidget)` |

### Klasa: `UIMapAnchorLayout`

| Member | Brief | Signature |
|--------|-------|-----------|
| `centerInPosition` |  | `void centerInPosition(const UIWidgetPtr& anchoredWidget, const Position& hookedPosition)` |
| `fillPosition` |  | `void fillPosition(const UIWidgetPtr& anchoredWidget, const Position& hookedPosition)` |

## Functions

### `getHookedWidget`

**Sygnatura:** `UIWidgetPtr getHookedWidget(const UIWidgetPtr& widget, const UIWidgetPtr& parentWidget) { return parentWidget; }`

### `getHookedPoint`

**Sygnatura:** `int getHookedPoint(const UIWidgetPtr& hookedWidget, const UIWidgetPtr& parentWidget)`

### `centerInPosition`

**Sygnatura:** `void centerInPosition(const UIWidgetPtr& anchoredWidget, const Position& hookedPosition)`

### `fillPosition`

**Sygnatura:** `void fillPosition(const UIWidgetPtr& anchoredWidget, const Position& hookedPosition)`

## Class Diagram

Zobacz: [../diagrams/uimapanchorlayout.mmd](../diagrams/uimapanchorlayout.mmd)

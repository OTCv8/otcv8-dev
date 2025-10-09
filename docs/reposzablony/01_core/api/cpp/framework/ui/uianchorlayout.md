---
doc_id: "cpp-api-6c8cb1423198"
source_path: "framework/ui/uianchorlayout.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: uianchorlayout.h"
summary: "Dokumentacja API C++ dla framework/ui/uianchorlayout.h"
tags: ["cpp", "api", "otclient"]
---

# framework/ui/uianchorlayout.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu uianchorlayout.

## Classes/Structs

### Klasa: `UIAnchor`

| Member | Brief | Signature |
|--------|-------|-----------|
| `getAnchoredEdge` |  | `Fw::AnchorEdge getAnchoredEdge() const { return m_anchoredEdge; }` |
| `getHookedEdge` |  | `Fw::AnchorEdge getHookedEdge() const { return m_hookedEdge; }` |
| `getHookedWidget` |  | `virtual UIWidgetPtr getHookedWidget(const UIWidgetPtr& widget, const UIWidgetPtr& parentWidget)` |
| `getHookedPoint` |  | `virtual int getHookedPoint(const UIWidgetPtr& hookedWidget, const UIWidgetPtr& parentWidget)` |
| `m_anchoredEdge` |  | `Fw::AnchorEdge m_anchoredEdge` |
| `m_hookedEdge` |  | `Fw::AnchorEdge m_hookedEdge` |
| `m_hookedWidgetId` |  | `std::string m_hookedWidgetId` |

### Klasa: `UIAnchorGroup`

| Member | Brief | Signature |
|--------|-------|-----------|
| `addAnchor` |  | `void addAnchor(const UIAnchorPtr& anchor)` |
| `isUpdated` |  | `bool isUpdated() { return m_updated; }` |
| `setUpdated` |  | `void setUpdated(bool updated) { m_updated = updated; }` |

### Klasa: `UIAnchorLayout`

| Member | Brief | Signature |
|--------|-------|-----------|
| `removeAnchors` |  | `void removeAnchors(const UIWidgetPtr& anchoredWidget)` |
| `hasAnchors` |  | `bool hasAnchors(const UIWidgetPtr& anchoredWidget)` |
| `centerIn` |  | `void centerIn(const UIWidgetPtr& anchoredWidget, const std::string& hookedWidgetId)` |
| `fill` |  | `void fill(const UIWidgetPtr& anchoredWidget, const std::string& hookedWidgetId)` |
| `addWidget` |  | `void addWidget(const UIWidgetPtr& widget)` |
| `removeWidget` |  | `void removeWidget(const UIWidgetPtr& widget)` |
| `isUIAnchorLayout` |  | `bool isUIAnchorLayout() { return true; }` |
| `internalUpdate` |  | `virtual bool internalUpdate()` |
| `updateWidget` |  | `virtual bool updateWidget(const UIWidgetPtr& widget, const UIAnchorGroupPtr& anchorGroup, UIWidgetPtr first = nullptr)` |
| `m_anchorsGroups` |  | `std::unordered_map<UIWidgetPtr, UIAnchorGroupPtr> m_anchorsGroups` |

## Functions

### `getAnchoredEdge`

**Sygnatura:** `Fw::AnchorEdge getAnchoredEdge() const { return m_anchoredEdge; }`

### `getHookedEdge`

**Sygnatura:** `Fw::AnchorEdge getHookedEdge() const { return m_hookedEdge; }`

### `addAnchor`

**Sygnatura:** `void addAnchor(const UIAnchorPtr& anchor)`

### `isUpdated`

**Sygnatura:** `bool isUpdated() { return m_updated; }`

### `setUpdated`

**Sygnatura:** `void setUpdated(bool updated) { m_updated = updated; }`

### `removeAnchors`

**Sygnatura:** `void removeAnchors(const UIWidgetPtr& anchoredWidget)`

### `hasAnchors`

**Sygnatura:** `bool hasAnchors(const UIWidgetPtr& anchoredWidget)`

### `centerIn`

**Sygnatura:** `void centerIn(const UIWidgetPtr& anchoredWidget, const std::string& hookedWidgetId)`

### `fill`

**Sygnatura:** `void fill(const UIWidgetPtr& anchoredWidget, const std::string& hookedWidgetId)`

### `addWidget`

**Sygnatura:** `void addWidget(const UIWidgetPtr& widget)`

### `removeWidget`

**Sygnatura:** `void removeWidget(const UIWidgetPtr& widget)`

### `isUIAnchorLayout`

**Sygnatura:** `bool isUIAnchorLayout() { return true; }`

## Class Diagram

Zobacz: [../diagrams/uianchorlayout.mmd](../diagrams/uianchorlayout.mmd)

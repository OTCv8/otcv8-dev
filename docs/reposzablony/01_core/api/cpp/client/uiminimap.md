---
doc_id: "cpp-api-9bbc93cccf0a"
source_path: "client/uiminimap.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: uiminimap.h"
summary: "Dokumentacja API C++ dla client/uiminimap.h"
tags: ["cpp", "api", "otclient"]
---

# client/uiminimap.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu uiminimap.

## Classes/Structs

### Klasa: `UIMinimap`

| Member | Brief | Signature |
|--------|-------|-----------|
| `drawSelf` |  | `void drawSelf(Fw::DrawPane drawPane)` |
| `zoomIn` |  | `bool zoomIn() { return setZoom(m_zoom+1); }` |
| `zoomOut` |  | `bool zoomOut() { return setZoom(m_zoom-1); }` |
| `setZoom` |  | `bool setZoom(int zoom)` |
| `setMinZoom` |  | `void setMinZoom(int minZoom) { m_minZoom = minZoom; }` |
| `setMaxZoom` |  | `void setMaxZoom(int maxZoom) { m_maxZoom = maxZoom; }` |
| `setCameraPosition` |  | `void setCameraPosition(const Position& pos)` |
| `floorUp` |  | `bool floorUp()` |
| `floorDown` |  | `bool floorDown()` |
| `getTilePoint` |  | `Point getTilePoint(const Position& pos)` |
| `getTileRect` |  | `Rect getTileRect(const Position& pos)` |
| `getTilePosition` |  | `Position getTilePosition(const Point& mousePos)` |
| `getCameraPosition` |  | `Position getCameraPosition() { return m_cameraPosition; }` |
| `getMinZoom` |  | `int getMinZoom() { return m_minZoom; }` |
| `getMaxZoom` |  | `int getMaxZoom() { return m_maxZoom; }` |
| `getZoom` |  | `int getZoom() { return m_zoom; }` |
| `getScale` |  | `float getScale() { return m_scale; }` |
| `anchorPosition` |  | `void anchorPosition(const UIWidgetPtr& anchoredWidget, Fw::AnchorEdge anchoredEdge, const Position& hookedPosition, Fw::AnchorEdge hookedEdge)` |
| `fillPosition` |  | `void fillPosition(const UIWidgetPtr& anchoredWidget, const Position& hookedPosition)` |
| `centerInPosition` |  | `void centerInPosition(const UIWidgetPtr& anchoredWidget, const Position& hookedPosition)` |
| `onZoomChange` |  | `virtual void onZoomChange(int zoom, int oldZoom)` |
| `onCameraPositionChange` |  | `virtual void onCameraPositionChange(const Position& position, const Position& oldPosition)` |
| `onStyleApply` |  | `virtual void onStyleApply(const std::string& styleName, const OTMLNodePtr& styleNode)` |

## Functions

### `drawSelf`

**Sygnatura:** `void drawSelf(Fw::DrawPane drawPane)`

### `zoomIn`

**Sygnatura:** `bool zoomIn() { return setZoom(m_zoom+1); }`

### `zoomOut`

**Sygnatura:** `bool zoomOut() { return setZoom(m_zoom-1); }`

### `setZoom`

**Sygnatura:** `bool setZoom(int zoom)`

### `setMinZoom`

**Sygnatura:** `void setMinZoom(int minZoom) { m_minZoom = minZoom; }`

### `setMaxZoom`

**Sygnatura:** `void setMaxZoom(int maxZoom) { m_maxZoom = maxZoom; }`

### `setCameraPosition`

**Sygnatura:** `void setCameraPosition(const Position& pos)`

### `floorUp`

**Sygnatura:** `bool floorUp()`

### `floorDown`

**Sygnatura:** `bool floorDown()`

### `getTilePoint`

**Sygnatura:** `Point getTilePoint(const Position& pos)`

### `getTileRect`

**Sygnatura:** `Rect getTileRect(const Position& pos)`

### `getTilePosition`

**Sygnatura:** `Position getTilePosition(const Point& mousePos)`

### `getCameraPosition`

**Sygnatura:** `Position getCameraPosition() { return m_cameraPosition; }`

### `getMinZoom`

**Sygnatura:** `int getMinZoom() { return m_minZoom; }`

### `getMaxZoom`

**Sygnatura:** `int getMaxZoom() { return m_maxZoom; }`

### `getZoom`

**Sygnatura:** `int getZoom() { return m_zoom; }`

### `getScale`

**Sygnatura:** `float getScale() { return m_scale; }`

### `anchorPosition`

**Sygnatura:** `void anchorPosition(const UIWidgetPtr& anchoredWidget, Fw::AnchorEdge anchoredEdge, const Position& hookedPosition, Fw::AnchorEdge hookedEdge)`

### `fillPosition`

**Sygnatura:** `void fillPosition(const UIWidgetPtr& anchoredWidget, const Position& hookedPosition)`

### `centerInPosition`

**Sygnatura:** `void centerInPosition(const UIWidgetPtr& anchoredWidget, const Position& hookedPosition)`

### `update`

**Sygnatura:** `void update()`

## Class Diagram

Zobacz: [../diagrams/uiminimap.mmd](../diagrams/uiminimap.mmd)

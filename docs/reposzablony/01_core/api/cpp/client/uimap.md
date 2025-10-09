---
doc_id: "cpp-api-282a725271bb"
source_path: "client/uimap.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: uimap.h"
summary: "Dokumentacja API C++ dla client/uimap.h"
tags: ["cpp", "api", "otclient"]
---

# client/uimap.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu uimap.

## Classes/Structs

### Klasa: `UIMap`

| Member | Brief | Signature |
|--------|-------|-----------|
| `onMouseMove` |  | `bool onMouseMove(const Point& mousePos, const Point& mouseMoved)` |
| `drawSelf` |  | `void drawSelf(Fw::DrawPane drawPane)` |
| `movePixels` |  | `void movePixels(int x, int y)` |
| `setZoom` |  | `bool setZoom(int zoom)` |
| `zoomIn` |  | `bool zoomIn()` |
| `zoomOut` |  | `bool zoomOut()` |
| `followCreature` |  | `void followCreature(const CreaturePtr& creature) { m_mapView->followCreature(creature); }` |
| `setCameraPosition` |  | `void setCameraPosition(const Position& pos) { m_mapView->setCameraPosition(pos); }` |
| `setMaxZoomIn` |  | `void setMaxZoomIn(int maxZoomIn) { m_maxZoomIn = maxZoomIn; }` |
| `setMaxZoomOut` |  | `void setMaxZoomOut(int maxZoomOut) { m_maxZoomOut = maxZoomOut; }` |
| `setMultifloor` |  | `void setMultifloor(bool enable) { m_mapView->setMultifloor(enable); }` |
| `lockVisibleFloor` |  | `void lockVisibleFloor(int floor) { m_mapView->lockFirstVisibleFloor(floor); }` |
| `unlockVisibleFloor` |  | `void unlockVisibleFloor() { m_mapView->unlockFirstVisibleFloor(); }` |
| `setVisibleDimension` |  | `void setVisibleDimension(const Size& visibleDimension)` |
| `setDrawFlags` |  | `void setDrawFlags(Otc::DrawFlags drawFlags) { m_mapView->setDrawFlags(drawFlags); }` |
| `setDrawTexts` |  | `void setDrawTexts(bool enable) { m_mapView->setDrawTexts(enable); }` |
| `setDrawNames` |  | `void setDrawNames(bool enable) { m_mapView->setDrawNames(enable); }` |
| `setDrawHealthBars` |  | `void setDrawHealthBars(bool enable) { m_mapView->setDrawHealthBars(enable); }` |
| `setDrawHealthBarsOnTop` |  | `void setDrawHealthBarsOnTop(bool enable) { m_mapView->setDrawHealthBarsOnTop(enable); }` |
| `setDrawLights` |  | `void setDrawLights(bool enable) { m_mapView->setDrawLights(enable); }` |
| `setDrawManaBar` |  | `void setDrawManaBar(bool enable) { m_mapView->setDrawManaBar(enable); }` |
| `setDrawPlayerBars` |  | `void setDrawPlayerBars(bool enable) { m_mapView->setDrawPlayerBars(enable); }` |
| `setAnimated` |  | `void setAnimated(bool enable) { m_mapView->setAnimated(enable); }` |
| `setKeepAspectRatio` |  | `void setKeepAspectRatio(bool enable)` |
| `setMinimumAmbientLight` |  | `void setMinimumAmbientLight(float intensity) { m_mapView->setMinimumAmbientLight(intensity); }` |
| `setLimitVisibleRange` |  | `void setLimitVisibleRange(bool limitVisibleRange) { m_limitVisibleRange = limitVisibleRange; updateVisibleDimension(); }` |
| `setFloorFading` |  | `void setFloorFading(int value) { m_mapView->setFloorFading(value); }` |
| `setCrosshair` |  | `void setCrosshair(const std::string& type) { m_mapView->setCrosshair(type); }` |
| `isMultifloor` |  | `bool isMultifloor() { return m_mapView->isMultifloor(); }` |
| `isDrawingTexts` |  | `bool isDrawingTexts() { return m_mapView->isDrawingTexts(); }` |
| `isDrawingNames` |  | `bool isDrawingNames() { return m_mapView->isDrawingNames(); }` |
| `isDrawingHealthBars` |  | `bool isDrawingHealthBars() { return m_mapView->isDrawingHealthBars(); }` |
| `isDrawingHealthBarsOnTop` |  | `bool isDrawingHealthBarsOnTop() { return m_mapView->isDrawingHealthBarsOnTop(); }` |
| `isDrawingLights` |  | `bool isDrawingLights() { return m_mapView->isDrawingLights(); }` |
| `isDrawingManaBar` |  | `bool isDrawingManaBar() { return m_mapView->isDrawingManaBar(); }` |
| `isAnimating` |  | `bool isAnimating() { return m_mapView->isAnimating(); }` |
| `isKeepAspectRatioEnabled` |  | `bool isKeepAspectRatioEnabled() { return m_keepAspectRatio; }` |
| `isLimitVisibleRangeEnabled` |  | `bool isLimitVisibleRangeEnabled() { return m_limitVisibleRange; }` |
| `getVisibleDimension` |  | `Size getVisibleDimension() { return m_mapView->getVisibleDimension(); }` |
| `getFollowingCreature` |  | `CreaturePtr getFollowingCreature() { return m_mapView->getFollowingCreature(); }` |
| `getDrawFlags` |  | `Otc::DrawFlags getDrawFlags() { return m_mapView->getDrawFlags(); }` |
| `getCameraPosition` |  | `Position getCameraPosition() { return m_mapView->getCameraPosition(); }` |
| `getPosition` |  | `Position getPosition(const Point& mousePos)` |
| `getPositionOffset` |  | `Point getPositionOffset(const Point& mousePos)` |
| `getTile` |  | `TilePtr getTile(const Point& mousePos)` |
| `getMaxZoomIn` |  | `int getMaxZoomIn() { return m_maxZoomIn; }` |
| `getMaxZoomOut` |  | `int getMaxZoomOut() { return m_maxZoomOut; }` |
| `getZoom` |  | `int getZoom() { return m_zoom; }` |
| `getMinimumAmbientLight` |  | `float getMinimumAmbientLight() { return m_mapView->getMinimumAmbientLight(); }` |
| `setShader` |  | `void setShader(const std::string& shader)` |
| `getShader` |  | `std::string getShader()` |
| `m_shader` |  | `return m_shader` |
| `onStyleApply` |  | `virtual void onStyleApply(const std::string& styleName, const OTMLNodePtr& styleNode)` |
| `onGeometryChange` |  | `virtual void onGeometryChange(const Rect& oldRect, const Rect& newRect)` |

## Functions

### `onMouseMove`

**Sygnatura:** `bool onMouseMove(const Point& mousePos, const Point& mouseMoved)`

### `drawSelf`

**Sygnatura:** `void drawSelf(Fw::DrawPane drawPane)`

### `movePixels`

**Sygnatura:** `void movePixels(int x, int y)`

### `setZoom`

**Sygnatura:** `bool setZoom(int zoom)`

### `zoomIn`

**Sygnatura:** `bool zoomIn()`

### `zoomOut`

**Sygnatura:** `bool zoomOut()`

### `followCreature`

**Sygnatura:** `void followCreature(const CreaturePtr& creature) { m_mapView->followCreature(creature); }`

### `setCameraPosition`

**Sygnatura:** `void setCameraPosition(const Position& pos) { m_mapView->setCameraPosition(pos); }`

### `setMaxZoomIn`

**Sygnatura:** `void setMaxZoomIn(int maxZoomIn) { m_maxZoomIn = maxZoomIn; }`

### `setMaxZoomOut`

**Sygnatura:** `void setMaxZoomOut(int maxZoomOut) { m_maxZoomOut = maxZoomOut; }`

### `setMultifloor`

**Sygnatura:** `void setMultifloor(bool enable) { m_mapView->setMultifloor(enable); }`

### `lockVisibleFloor`

**Sygnatura:** `void lockVisibleFloor(int floor) { m_mapView->lockFirstVisibleFloor(floor); }`

### `unlockVisibleFloor`

**Sygnatura:** `void unlockVisibleFloor() { m_mapView->unlockFirstVisibleFloor(); }`

### `setVisibleDimension`

**Sygnatura:** `void setVisibleDimension(const Size& visibleDimension)`

### `setDrawFlags`

**Sygnatura:** `void setDrawFlags(Otc::DrawFlags drawFlags) { m_mapView->setDrawFlags(drawFlags); }`

### `setDrawTexts`

**Sygnatura:** `void setDrawTexts(bool enable) { m_mapView->setDrawTexts(enable); }`

### `setDrawNames`

**Sygnatura:** `void setDrawNames(bool enable) { m_mapView->setDrawNames(enable); }`

### `setDrawHealthBars`

**Sygnatura:** `void setDrawHealthBars(bool enable) { m_mapView->setDrawHealthBars(enable); }`

### `setDrawHealthBarsOnTop`

**Sygnatura:** `void setDrawHealthBarsOnTop(bool enable) { m_mapView->setDrawHealthBarsOnTop(enable); }`

### `setDrawLights`

**Sygnatura:** `void setDrawLights(bool enable) { m_mapView->setDrawLights(enable); }`

### `setDrawManaBar`

**Sygnatura:** `void setDrawManaBar(bool enable) { m_mapView->setDrawManaBar(enable); }`

### `setDrawPlayerBars`

**Sygnatura:** `void setDrawPlayerBars(bool enable) { m_mapView->setDrawPlayerBars(enable); }`

### `setAnimated`

**Sygnatura:** `void setAnimated(bool enable) { m_mapView->setAnimated(enable); }`

### `setKeepAspectRatio`

**Sygnatura:** `void setKeepAspectRatio(bool enable)`

### `setMinimumAmbientLight`

**Sygnatura:** `void setMinimumAmbientLight(float intensity) { m_mapView->setMinimumAmbientLight(intensity); }`

### `setLimitVisibleRange`

**Sygnatura:** `void setLimitVisibleRange(bool limitVisibleRange) { m_limitVisibleRange = limitVisibleRange; updateVisibleDimension(); }`

### `setFloorFading`

**Sygnatura:** `void setFloorFading(int value) { m_mapView->setFloorFading(value); }`

### `setCrosshair`

**Sygnatura:** `void setCrosshair(const std::string& type) { m_mapView->setCrosshair(type); }`

### `isMultifloor`

**Sygnatura:** `bool isMultifloor() { return m_mapView->isMultifloor(); }`

### `isDrawingTexts`

**Sygnatura:** `bool isDrawingTexts() { return m_mapView->isDrawingTexts(); }`

### `isDrawingNames`

**Sygnatura:** `bool isDrawingNames() { return m_mapView->isDrawingNames(); }`

### `isDrawingHealthBars`

**Sygnatura:** `bool isDrawingHealthBars() { return m_mapView->isDrawingHealthBars(); }`

### `isDrawingHealthBarsOnTop`

**Sygnatura:** `bool isDrawingHealthBarsOnTop() { return m_mapView->isDrawingHealthBarsOnTop(); }`

### `isDrawingLights`

**Sygnatura:** `bool isDrawingLights() { return m_mapView->isDrawingLights(); }`

### `isDrawingManaBar`

**Sygnatura:** `bool isDrawingManaBar() { return m_mapView->isDrawingManaBar(); }`

### `isAnimating`

**Sygnatura:** `bool isAnimating() { return m_mapView->isAnimating(); }`

### `isKeepAspectRatioEnabled`

**Sygnatura:** `bool isKeepAspectRatioEnabled() { return m_keepAspectRatio; }`

### `isLimitVisibleRangeEnabled`

**Sygnatura:** `bool isLimitVisibleRangeEnabled() { return m_limitVisibleRange; }`

### `getVisibleDimension`

**Sygnatura:** `Size getVisibleDimension() { return m_mapView->getVisibleDimension(); }`

### `getFollowingCreature`

**Sygnatura:** `CreaturePtr getFollowingCreature() { return m_mapView->getFollowingCreature(); }`

### `getDrawFlags`

**Sygnatura:** `Otc::DrawFlags getDrawFlags() { return m_mapView->getDrawFlags(); }`

### `getCameraPosition`

**Sygnatura:** `Position getCameraPosition() { return m_mapView->getCameraPosition(); }`

### `getPosition`

**Sygnatura:** `Position getPosition(const Point& mousePos)`

### `getPositionOffset`

**Sygnatura:** `Point getPositionOffset(const Point& mousePos)`

### `getTile`

**Sygnatura:** `TilePtr getTile(const Point& mousePos)`

### `getMaxZoomIn`

**Sygnatura:** `int getMaxZoomIn() { return m_maxZoomIn; }`

### `getMaxZoomOut`

**Sygnatura:** `int getMaxZoomOut() { return m_maxZoomOut; }`

### `getZoom`

**Sygnatura:** `int getZoom() { return m_zoom; }`

### `getMinimumAmbientLight`

**Sygnatura:** `float getMinimumAmbientLight() { return m_mapView->getMinimumAmbientLight(); }`

### `setShader`

**Sygnatura:** `void setShader(const std::string& shader)`

### `getShader`

**Sygnatura:** `std::string getShader()`

### `updateVisibleDimension`

**Sygnatura:** `void updateVisibleDimension()`

### `updateMapSize`

**Sygnatura:** `void updateMapSize()`

## Class Diagram

Zobacz: [../diagrams/uimap.mmd](../diagrams/uimap.mmd)

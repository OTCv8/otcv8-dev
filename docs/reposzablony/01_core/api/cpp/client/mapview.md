---
doc_id: "cpp-api-01060cd409e2"
source_path: "client/mapview.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: mapview.h"
summary: "Dokumentacja API C++ dla client/mapview.h"
tags: ["cpp", "api", "otclient"]
---

# client/mapview.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu mapview.

## Classes/Structs

### Klasa: `MapView`

| Member | Brief | Signature |
|--------|-------|-----------|
| `drawMapBackground` |  | `void drawMapBackground(const Rect& rect, const TilePtr& crosshairTile = nullptr)` |
| `drawMapForeground` |  | `void drawMapForeground(const Rect& rect)` |
| `onTileUpdate` |  | `void onTileUpdate(const Position& pos)` |
| `onMapCenterChange` |  | `void onMapCenterChange(const Position& pos)` |
| `lockFirstVisibleFloor` |  | `void lockFirstVisibleFloor(int firstVisibleFloor)` |
| `unlockFirstVisibleFloor` |  | `void unlockFirstVisibleFloor()` |
| `getLockedFirstVisibleFloor` |  | `int getLockedFirstVisibleFloor() { return m_lockedFirstVisibleFloor; }` |
| `setMultifloor` |  | `void setMultifloor(bool enable) { m_multifloor = enable; requestVisibleTilesCacheUpdate(); }` |
| `isMultifloor` |  | `bool isMultifloor() { return m_multifloor; }` |
| `setVisibleDimension` |  | `void setVisibleDimension(const Size& visibleDimension)` |
| `optimizeForSize` |  | `void optimizeForSize(const Size & visibleSize)` |
| `getVisibleDimension` |  | `Size getVisibleDimension() { return m_visibleDimension; }` |
| `getVisibleCenterOffset` |  | `Point getVisibleCenterOffset() { return m_visibleCenterOffset; }` |
| `getCachedFirstVisibleFloor` |  | `int getCachedFirstVisibleFloor() { return m_cachedFirstVisibleFloor; }` |
| `getCachedLastVisibleFloor` |  | `int getCachedLastVisibleFloor() { return m_cachedLastVisibleFloor; }` |
| `followCreature` |  | `void followCreature(const CreaturePtr& creature)` |
| `getFollowingCreature` |  | `CreaturePtr getFollowingCreature() { return m_followingCreature; }` |
| `isFollowingCreature` |  | `bool isFollowingCreature() { return m_followingCreature && m_follow; }` |
| `setCameraPosition` |  | `void setCameraPosition(const Position& pos)` |
| `getCameraPosition` |  | `Position getCameraPosition()` |
| `setMinimumAmbientLight` |  | `void setMinimumAmbientLight(float intensity) { m_minimumAmbientLight = intensity; }` |
| `getMinimumAmbientLight` |  | `float getMinimumAmbientLight() { return m_minimumAmbientLight; }` |
| `setDrawFlags` |  | `void setDrawFlags(Otc::DrawFlags drawFlags) { m_drawFlags = drawFlags; requestVisibleTilesCacheUpdate(); }` |
| `getDrawFlags` |  | `Otc::DrawFlags getDrawFlags() { return m_drawFlags; }` |
| `setDrawTexts` |  | `void setDrawTexts(bool enable) { m_drawTexts = enable; }` |
| `isDrawingTexts` |  | `bool isDrawingTexts() { return m_drawTexts; }` |
| `setDrawNames` |  | `void setDrawNames(bool enable) { m_drawNames = enable; }` |
| `isDrawingNames` |  | `bool isDrawingNames() { return m_drawNames; }` |
| `setDrawHealthBars` |  | `void setDrawHealthBars(bool enable) { m_drawHealthBars = enable; }` |
| `isDrawingHealthBars` |  | `bool isDrawingHealthBars() { return m_drawHealthBars; }` |
| `setDrawHealthBarsOnTop` |  | `void setDrawHealthBarsOnTop(bool enable) { m_drawHealthBarsOnTop = enable; }` |
| `isDrawingHealthBarsOnTop` |  | `bool isDrawingHealthBarsOnTop() { return m_drawHealthBarsOnTop; }` |
| `setDrawLights` |  | `void setDrawLights(bool enable)` |
| `isDrawingLights` |  | `bool isDrawingLights() { return m_drawLight; }` |
| `setDrawManaBar` |  | `void setDrawManaBar(bool enable) { m_drawManaBar = enable; }` |
| `isDrawingManaBar` |  | `bool isDrawingManaBar() { return m_drawManaBar; }` |
| `setDrawPlayerBars` |  | `void setDrawPlayerBars(bool enable) { m_drawPlayerBars = enable; }` |
| `move` |  | `void move(int x, int y)` |
| `setAnimated` |  | `void setAnimated(bool animated) { m_animated = animated; requestVisibleTilesCacheUpdate(); }` |
| `isAnimating` |  | `bool isAnimating() { return m_animated; }` |
| `setFloorFading` |  | `void setFloorFading(int value) { m_floorFading = value; }` |
| `setCrosshair` |  | `void setCrosshair(const std::string& file)` |
| `getPosition` |  | `Position getPosition(const Point& point, const Size& mapSize)` |
| `getPositionOffset` |  | `Point getPositionOffset(const Point& point, const Size& mapSize)` |
| `asMapView` |  | `MapViewPtr asMapView() { return static_self_cast<MapView>(); }` |

## Functions

### `drawMapBackground`

**Sygnatura:** `void drawMapBackground(const Rect& rect, const TilePtr& crosshairTile = nullptr)`

### `drawMapForeground`

**Sygnatura:** `void drawMapForeground(const Rect& rect)`

### `drawFloor`

**Sygnatura:** `void drawFloor(short floor, const Position& cameraPosition, const TilePtr& crosshairTile = nullptr)`

### `drawTileTexts`

**Sygnatura:** `void drawTileTexts(const Rect& rect, const Rect& srcRect)`

### `drawTileWidget`

**Sygnatura:** `void drawTileWidget(const Rect& rect, const Rect& srcRect)`

### `updateGeometry`

**Sygnatura:** `void updateGeometry(const Size& visibleDimension, const Size& optimizedSize)`

### `updateVisibleTilesCache`

**Sygnatura:** `void updateVisibleTilesCache()`

### `requestVisibleTilesCacheUpdate`

**Sygnatura:** `void requestVisibleTilesCacheUpdate() { m_mustUpdateVisibleTilesCache = true; }`

### `onTileUpdate`

**Sygnatura:** `void onTileUpdate(const Position& pos)`

### `onMapCenterChange`

**Sygnatura:** `void onMapCenterChange(const Position& pos)`

### `lockFirstVisibleFloor`

**Sygnatura:** `void lockFirstVisibleFloor(int firstVisibleFloor)`

### `unlockFirstVisibleFloor`

**Sygnatura:** `void unlockFirstVisibleFloor()`

### `getLockedFirstVisibleFloor`

**Sygnatura:** `int getLockedFirstVisibleFloor() { return m_lockedFirstVisibleFloor; }`

### `setMultifloor`

**Sygnatura:** `void setMultifloor(bool enable) { m_multifloor = enable; requestVisibleTilesCacheUpdate(); }`

### `isMultifloor`

**Sygnatura:** `bool isMultifloor() { return m_multifloor; }`

### `setVisibleDimension`

**Sygnatura:** `void setVisibleDimension(const Size& visibleDimension)`

### `optimizeForSize`

**Sygnatura:** `void optimizeForSize(const Size & visibleSize)`

### `getVisibleDimension`

**Sygnatura:** `Size getVisibleDimension() { return m_visibleDimension; }`

### `getVisibleCenterOffset`

**Sygnatura:** `Point getVisibleCenterOffset() { return m_visibleCenterOffset; }`

### `getCachedFirstVisibleFloor`

**Sygnatura:** `int getCachedFirstVisibleFloor() { return m_cachedFirstVisibleFloor; }`

### `getCachedLastVisibleFloor`

**Sygnatura:** `int getCachedLastVisibleFloor() { return m_cachedLastVisibleFloor; }`

### `followCreature`

**Sygnatura:** `void followCreature(const CreaturePtr& creature)`

### `getFollowingCreature`

**Sygnatura:** `CreaturePtr getFollowingCreature() { return m_followingCreature; }`

### `isFollowingCreature`

**Sygnatura:** `bool isFollowingCreature() { return m_followingCreature && m_follow; }`

### `setCameraPosition`

**Sygnatura:** `void setCameraPosition(const Position& pos)`

### `getCameraPosition`

**Sygnatura:** `Position getCameraPosition()`

### `setMinimumAmbientLight`

**Sygnatura:** `void setMinimumAmbientLight(float intensity) { m_minimumAmbientLight = intensity; }`

### `getMinimumAmbientLight`

**Sygnatura:** `float getMinimumAmbientLight() { return m_minimumAmbientLight; }`

### `setDrawFlags`

**Sygnatura:** `void setDrawFlags(Otc::DrawFlags drawFlags) { m_drawFlags = drawFlags; requestVisibleTilesCacheUpdate(); }`

### `getDrawFlags`

**Sygnatura:** `Otc::DrawFlags getDrawFlags() { return m_drawFlags; }`

### `setDrawTexts`

**Sygnatura:** `void setDrawTexts(bool enable) { m_drawTexts = enable; }`

### `isDrawingTexts`

**Sygnatura:** `bool isDrawingTexts() { return m_drawTexts; }`

### `setDrawNames`

**Sygnatura:** `void setDrawNames(bool enable) { m_drawNames = enable; }`

### `isDrawingNames`

**Sygnatura:** `bool isDrawingNames() { return m_drawNames; }`

### `setDrawHealthBars`

**Sygnatura:** `void setDrawHealthBars(bool enable) { m_drawHealthBars = enable; }`

### `isDrawingHealthBars`

**Sygnatura:** `bool isDrawingHealthBars() { return m_drawHealthBars; }`

### `setDrawHealthBarsOnTop`

**Sygnatura:** `void setDrawHealthBarsOnTop(bool enable) { m_drawHealthBarsOnTop = enable; }`

### `isDrawingHealthBarsOnTop`

**Sygnatura:** `bool isDrawingHealthBarsOnTop() { return m_drawHealthBarsOnTop; }`

### `setDrawLights`

**Sygnatura:** `void setDrawLights(bool enable)`

### `isDrawingLights`

**Sygnatura:** `bool isDrawingLights() { return m_drawLight; }`

### `setDrawManaBar`

**Sygnatura:** `void setDrawManaBar(bool enable) { m_drawManaBar = enable; }`

### `isDrawingManaBar`

**Sygnatura:** `bool isDrawingManaBar() { return m_drawManaBar; }`

### `setDrawPlayerBars`

**Sygnatura:** `void setDrawPlayerBars(bool enable) { m_drawPlayerBars = enable; }`

### `move`

**Sygnatura:** `void move(int x, int y)`

### `setAnimated`

**Sygnatura:** `void setAnimated(bool animated) { m_animated = animated; requestVisibleTilesCacheUpdate(); }`

### `isAnimating`

**Sygnatura:** `bool isAnimating() { return m_animated; }`

### `setFloorFading`

**Sygnatura:** `void setFloorFading(int value) { m_floorFading = value; }`

### `setCrosshair`

**Sygnatura:** `void setCrosshair(const std::string& file)`

### `getPosition`

**Sygnatura:** `Position getPosition(const Point& point, const Size& mapSize)`

### `getPositionOffset`

**Sygnatura:** `Point getPositionOffset(const Point& point, const Size& mapSize)`

### `asMapView`

**Sygnatura:** `MapViewPtr asMapView() { return static_self_cast<MapView>(); }`

### `calcFramebufferSource`

**Sygnatura:** `Rect calcFramebufferSource(const Size& destSize, bool inNextFrame = false)`

### `calcFirstVisibleFloor`

**Sygnatura:** `int calcFirstVisibleFloor(bool forFading = false)`

### `calcLastVisibleFloor`

**Sygnatura:** `int calcLastVisibleFloor()`

### `transformPositionTo2D`

**Sygnatura:** `Point transformPositionTo2D(const Position& position, const Position& relativePosition)`

## Class Diagram

Zobacz: [../diagrams/mapview.mmd](../diagrams/mapview.mmd)

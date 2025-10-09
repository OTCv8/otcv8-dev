---
doc_id: "cpp-api-57ed53f3fa0c"
source_path: "client/minimap.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: minimap.h"
summary: "Dokumentacja API C++ dla client/minimap.h"
tags: ["cpp", "api", "otclient"]
---

# client/minimap.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu minimap.

## Classes/Structs

### Struktura: `MinimapTile`

### Klasa: `MinimapBlock`

| Member | Brief | Signature |
|--------|-------|-----------|
| `clean` |  | `void clean()` |
| `update` |  | `void update()` |
| `updateTile` |  | `void updateTile(int x, int y, const MinimapTile& tile)` |
| `resetTile` |  | `void resetTile(int x, int y) { m_tiles[getTileIndex(x,y)] = MinimapTile(); }` |
| `getTileIndex` |  | `uint getTileIndex(int x, int y) { return ((y % MMBLOCK_SIZE) * MMBLOCK_SIZE) + (x % MMBLOCK_SIZE); }` |
| `mustUpdate` |  | `void mustUpdate() { m_mustUpdate = true; }` |
| `justSaw` |  | `void justSaw() { m_wasSeen = true; }` |
| `wasSeen` |  | `bool wasSeen() { return m_wasSeen; }` |

### Klasa: `Minimap`

| Member | Brief | Signature |
|--------|-------|-----------|
| `init` |  | `void init()` |
| `terminate` |  | `void terminate()` |
| `clean` |  | `void clean()` |
| `draw` |  | `void draw(const Rect& screenRect, const Position& mapCenter, float scale, const Color& color)` |
| `getTilePoint` |  | `Point getTilePoint(const Position& pos, const Rect& screenRect, const Position& mapCenter, float scale)` |
| `getTilePosition` |  | `Position getTilePosition(const Point& point, const Rect& screenRect, const Position& mapCenter, float scale)` |
| `getTileRect` |  | `Rect getTileRect(const Position& pos, const Rect& screenRect, const Position& mapCenter, float scale)` |
| `updateTile` |  | `void updateTile(const Position& pos, const TilePtr& tile)` |
| `threadGetTile` |  | `std::pair<MinimapBlock_ptr, MinimapTile> threadGetTile(const Position& pos)` |
| `loadImage` |  | `bool loadImage(const std::string& fileName, const Position& topLeft, float colorFactor)` |
| `saveImage` |  | `void saveImage(const std::string& fileName, const Rect& mapRect)` |
| `loadOtmm` |  | `bool loadOtmm(const std::string& fileName)` |
| `saveOtmm` |  | `void saveOtmm(const std::string& fileName)` |

## Enums

### `MinimapTileFlags`

**Wartości:**

- `MinimapTileWasSeen`
- `MinimapTileNotPathable`
- `MinimapTileNotWalkable`
- `MinimapTileEmpty`

## Functions

### `hasFlag`

**Sygnatura:** `bool hasFlag(MinimapTileFlags flag) const { return flags & flag; }`

### `getSpeed`

**Sygnatura:** `int getSpeed() const { return speed * 10; }`

### `clean`

**Sygnatura:** `void clean()`

### `update`

**Sygnatura:** `void update()`

### `updateTile`

**Sygnatura:** `void updateTile(int x, int y, const MinimapTile& tile)`

### `resetTile`

**Sygnatura:** `void resetTile(int x, int y) { m_tiles[getTileIndex(x,y)] = MinimapTile(); }`

### `getTileIndex`

**Sygnatura:** `uint getTileIndex(int x, int y) { return ((y % MMBLOCK_SIZE) * MMBLOCK_SIZE) + (x % MMBLOCK_SIZE); }`

### `mustUpdate`

**Sygnatura:** `void mustUpdate() { m_mustUpdate = true; }`

### `justSaw`

**Sygnatura:** `void justSaw() { m_wasSeen = true; }`

### `wasSeen`

**Sygnatura:** `bool wasSeen() { return m_wasSeen; }`

### `init`

**Sygnatura:** `void init()`

### `terminate`

**Sygnatura:** `void terminate()`

### `clean`

**Sygnatura:** `void clean()`

### `draw`

**Sygnatura:** `void draw(const Rect& screenRect, const Position& mapCenter, float scale, const Color& color)`

### `getTilePoint`

**Sygnatura:** `Point getTilePoint(const Position& pos, const Rect& screenRect, const Position& mapCenter, float scale)`

### `getTilePosition`

**Sygnatura:** `Position getTilePosition(const Point& point, const Rect& screenRect, const Position& mapCenter, float scale)`

### `getTileRect`

**Sygnatura:** `Rect getTileRect(const Position& pos, const Rect& screenRect, const Position& mapCenter, float scale)`

### `updateTile`

**Sygnatura:** `void updateTile(const Position& pos, const TilePtr& tile)`

### `threadGetTile`

**Sygnatura:** `std::pair<MinimapBlock_ptr, MinimapTile> threadGetTile(const Position& pos)`

### `loadImage`

**Sygnatura:** `bool loadImage(const std::string& fileName, const Position& topLeft, float colorFactor)`

### `saveImage`

**Sygnatura:** `void saveImage(const std::string& fileName, const Rect& mapRect)`

### `loadOtmm`

**Sygnatura:** `bool loadOtmm(const std::string& fileName)`

### `saveOtmm`

**Sygnatura:** `void saveOtmm(const std::string& fileName)`

### `calcMapRect`

**Sygnatura:** `Rect calcMapRect(const Rect& screenRect, const Position& mapCenter, float scale)`

### `hasBlock`

**Sygnatura:** `bool hasBlock(const Position& pos) { return m_tileBlocks[pos.z].find(getBlockIndex(pos)) != m_tileBlocks[pos.z].end(); }`

### `lock`

**Sygnatura:** `std::lock_guard<std::mutex> lock(m_lock)`

### `getBlockOffset`

**Sygnatura:** `Point getBlockOffset(const Point& pos) { return Point(pos.x - pos.x % MMBLOCK_SIZE,`

### `getIndexPosition`

**Sygnatura:** `Position getIndexPosition(int index, int z) { return Position((index % (65536 / MMBLOCK_SIZE))*MMBLOCK_SIZE,`

### `getBlockIndex`

**Sygnatura:** `uint getBlockIndex(const Position& pos) { return ((pos.y / MMBLOCK_SIZE) * (65536 / MMBLOCK_SIZE)) + (pos.x / MMBLOCK_SIZE); }`

## Types/Aliases

### `MinimapBlock_ptr`

**Using:** `std::shared_ptr<MinimapBlock>`

## Class Diagram

Zobacz: [../diagrams/minimap.mmd](../diagrams/minimap.mmd)

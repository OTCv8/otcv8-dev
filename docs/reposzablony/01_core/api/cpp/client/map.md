---
doc_id: "cpp-api-d3c3f1be22f7"
source_path: "client/map.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: map.h"
summary: "Dokumentacja API C++ dla client/map.h"
tags: ["cpp", "api", "otclient"]
---

# client/map.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu map.

## Classes/Structs

### Klasa: `TileBlock`

### Struktura: `AwareRange`

### Struktura: `PathFindResult`

### Struktura: `Node`

### Klasa: `Map`

| Member | Brief | Signature |
|--------|-------|-----------|
| `init` |  | `void init()` |
| `terminate` |  | `void terminate()` |
| `addMapView` |  | `void addMapView(const MapViewPtr& mapView)` |
| `removeMapView` |  | `void removeMapView(const MapViewPtr& mapView)` |
| `notificateTileUpdate` |  | `void notificateTileUpdate(const Position& pos, bool updateMinimap = false)` |
| `requestVisibleTilesCacheUpdate` |  | `void requestVisibleTilesCacheUpdate()` |
| `loadOtcm` |  | `bool loadOtcm(const std::string& fileName)` |
| `saveOtcm` |  | `void saveOtcm(const std::string& fileName)` |
| `loadOtbm` |  | `void loadOtbm(const std::string& fileName)` |
| `saveOtbm` |  | `void saveOtbm(const std::string& fileName)` |
| `setHouseFile` |  | `void setHouseFile(const std::string& file) { m_attribs.set(OTBM_ATTR_HOUSE_FILE, file); }` |
| `setSpawnFile` |  | `void setSpawnFile(const std::string& file) { m_attribs.set(OTBM_ATTR_SPAWN_FILE, file); }` |
| `setDescription` |  | `void setDescription(const std::string& desc) { m_attribs.set(OTBM_ATTR_DESCRIPTION, desc); }` |
| `clearDescriptions` |  | `void clearDescriptions() { m_attribs.remove(OTBM_ATTR_DESCRIPTION); }` |
| `setWidth` |  | `void setWidth(uint16 w) { m_attribs.set(OTBM_ATTR_WIDTH, w); }` |
| `setHeight` |  | `void setHeight(uint16 h) { m_attribs.set(OTBM_ATTR_HEIGHT, h); }` |
| `getHouseFile` |  | `std::string getHouseFile() { return m_attribs.get<std::string>(OTBM_ATTR_HOUSE_FILE); }` |
| `getSpawnFile` |  | `std::string getSpawnFile() { return m_attribs.get<std::string>(OTBM_ATTR_SPAWN_FILE); }` |
| `getSize` |  | `Size getSize() { return Size(m_attribs.get<uint16>(OTBM_ATTR_WIDTH), m_attribs.get<uint16>(OTBM_ATTR_HEIGHT)); }` |
| `getDescriptions` |  | `std::vector<std::string> getDescriptions() { return stdext::split(m_attribs.get<std::string>(OTBM_ATTR_DESCRIPTION), "\n"); }` |
| `clean` |  | `void clean()` |
| `cleanDynamicThings` |  | `void cleanDynamicThings()` |
| `cleanTexts` |  | `void cleanTexts()` |
| `addThing` |  | `void addThing(const ThingPtr& thing, const Position& pos, int stackPos = -1)` |
| `setTileSpeed` |  | `void setTileSpeed(const Position & pos, uint16_t speed, uint8_t blocking)` |
| `getThing` |  | `ThingPtr getThing(const Position& pos, int stackPos)` |
| `removeThing` |  | `bool removeThing(const ThingPtr& thing)` |
| `removeThingByPos` |  | `bool removeThingByPos(const Position& pos, int stackPos)` |
| `colorizeThing` |  | `void colorizeThing(const ThingPtr& thing, const Color& color)` |
| `removeThingColor` |  | `void removeThingColor(const ThingPtr& thing)` |
| `getStaticText` |  | `StaticTextPtr getStaticText(const Position& pos)` |
| `cleanTile` |  | `void cleanTile(const Position& pos)` |
| `setShowZone` |  | `void setShowZone(tileflags_t zone, bool show)` |
| `setShowZones` |  | `void setShowZones(bool show)` |
| `setZoneColor` |  | `void setZoneColor(tileflags_t flag, const Color& color)` |
| `setZoneOpacity` |  | `void setZoneOpacity(float opacity) { m_zoneOpacity = opacity; }` |
| `getZoneOpacity` |  | `float getZoneOpacity() { return m_zoneOpacity; }` |
| `getZoneColor` |  | `Color getZoneColor(tileflags_t flag)` |
| `getZoneFlags` |  | `tileflags_t getZoneFlags() { return (tileflags_t)m_zoneFlags; }` |
| `showZones` |  | `bool showZones() { return m_zoneFlags != 0; }` |
| `showZone` |  | `bool showZone(tileflags_t zone) { return (m_zoneFlags & zone) == zone; }` |
| `setForceShowAnimations` |  | `void setForceShowAnimations(bool force)` |
| `isForcingAnimations` |  | `bool isForcingAnimations()` |
| `isShowingAnimations` |  | `bool isShowingAnimations()` |
| `setShowAnimations` |  | `void setShowAnimations(bool show)` |
| `findItemsById` |  | `std::map<Position, ItemPtr> findItemsById(uint16 clientId, uint32 max)` |
| `addCreature` |  | `void addCreature(const CreaturePtr& creature)` |
| `getCreatureById` |  | `CreaturePtr getCreatureById(uint32 id)` |
| `removeCreatureById` |  | `void removeCreatureById(uint32 id)` |
| `getSightSpectators` |  | `std::vector<CreaturePtr> getSightSpectators(const Position& centerPos, bool multiFloor)` |
| `getSpectators` |  | `std::vector<CreaturePtr> getSpectators(const Position& centerPos, bool multiFloor)` |
| `getSpectatorsInRange` |  | `std::vector<CreaturePtr> getSpectatorsInRange(const Position& centerPos, bool multiFloor, int xRange, int yRange)` |
| `getSpectatorsInRangeEx` |  | `std::vector<CreaturePtr> getSpectatorsInRangeEx(const Position& centerPos, bool multiFloor, int minXRange, int maxXRange, int minYRange, int maxYRange` |
| `getSpectatorsByPattern` |  | `std::vector<CreaturePtr> getSpectatorsByPattern(const Position& centerPos, const std::string& pattern, Otc::Direction direction)` |
| `setLight` |  | `void setLight(const Light& light) { m_light = light; }` |
| `setCentralPosition` |  | `void setCentralPosition(const Position& centralPosition)` |
| `isLookPossible` |  | `bool isLookPossible(const Position& pos)` |
| `isCovered` |  | `bool isCovered(const Position& pos, int firstFloor = 0)` |
| `isCompletelyCovered` |  | `bool isCompletelyCovered(const Position& pos, int firstFloor = 0)` |
| `isAwareOfPosition` |  | `bool isAwareOfPosition(const Position& pos, bool extended = false)` |
| `isAwareOfPositionForClean` |  | `bool isAwareOfPositionForClean(const Position& pos, bool extended = false)` |
| `setAwareRange` |  | `void setAwareRange(const AwareRange& range)` |
| `resetAwareRange` |  | `void resetAwareRange()` |
| `getAwareRange` |  | `AwareRange getAwareRange() { return m_awareRange; }` |
| `getAwareRangeAsSize` |  | `Size getAwareRangeAsSize() { return Size(m_awareRange.horizontal(), m_awareRange.vertical()); }` |
| `getLight` |  | `Light getLight() { return m_light; }` |
| `getCentralPosition` |  | `Position getCentralPosition() { return m_centralPosition; }` |
| `getFirstAwareFloor` |  | `int getFirstAwareFloor()` |
| `getLastAwareFloor` |  | `int getLastAwareFloor()` |
| `getAnimatedTexts` |  | `std::vector<AnimatedTextPtr> getAnimatedTexts() { return m_animatedTexts; }` |
| `getStaticTexts` |  | `std::vector<StaticTextPtr> getStaticTexts() { return m_staticTexts; }` |
| `newFindPath` |  | `PathFindResult_ptr newFindPath(const Position& start, const Position& goal, std::shared_ptr<std::list<Node*>> visibleNodes)` |
| `findPathAsync` |  | `void findPathAsync(const Position & start, const Position & goal, std::function<void(PathFindResult_ptr)> callback)` |
| `getMinimapColor` |  | `int getMinimapColor(const Position& pos)` |
| `isPatchable` |  | `bool isPatchable(const Position& pos)` |
| `isWalkable` |  | `bool isWalkable(const Position& pos, bool ignoreCreatures)` |
| `isSightClear` |  | `bool isSightClear(const Position& fromPos, const Position& toPos)` |
| `checkSightLine` |  | `bool checkSightLine(const Position& fromPos, const Position& toPos)` |

## Enums

### `OTBM_ItemAttr`

**Wartości:**

- `OTBM_ATTR_DESCRIPTION`
- `OTBM_ATTR_EXT_FILE`
- `OTBM_ATTR_TILE_FLAGS`
- `OTBM_ATTR_ACTION_ID`
- `OTBM_ATTR_UNIQUE_ID`
- `OTBM_ATTR_TEXT`
- `OTBM_ATTR_DESC`
- `OTBM_ATTR_TELE_DEST`
- `OTBM_ATTR_ITEM`
- `OTBM_ATTR_DEPOT_ID`
- `OTBM_ATTR_SPAWN_FILE`
- `OTBM_ATTR_RUNE_CHARGES`
- `OTBM_ATTR_HOUSE_FILE`
- `OTBM_ATTR_HOUSEDOORID`
- `OTBM_ATTR_COUNT`
- `OTBM_ATTR_DURATION`
- `OTBM_ATTR_DECAYING_STATE`
- `OTBM_ATTR_WRITTENDATE`
- `OTBM_ATTR_WRITTENBY`
- `OTBM_ATTR_SLEEPERGUID`
- `OTBM_ATTR_SLEEPSTART`
- `OTBM_ATTR_CHARGES`
- `OTBM_ATTR_CONTAINER_ITEMS`
- `OTBM_ATTR_ATTRIBUTE_MAP`
- `OTBM_ATTR_WIDTH`
- `OTBM_ATTR_HEIGHT`

### `OTBM_NodeTypes_t`

**Wartości:**

- `OTBM_ROOTV2`
- `OTBM_MAP_DATA`
- `OTBM_ITEM_DEF`
- `OTBM_TILE_AREA`
- `OTBM_TILE`
- `OTBM_ITEM`
- `OTBM_TILE_SQUARE`
- `OTBM_TILE_REF`
- `OTBM_SPAWNS`
- `OTBM_SPAWN_AREA`
- `OTBM_MONSTER`
- `OTBM_TOWNS`
- `OTBM_TOWN`
- `OTBM_HOUSETILE`
- `OTBM_WAYPOINTS`
- `OTBM_WAYPOINT`

## Functions

### `remove`

**Sygnatura:** `void remove(const Position& pos) { m_tiles[getTileIndex(pos)] = nullptr; }`

### `getTileIndex`

**Sygnatura:** `uint getTileIndex(const Position& pos) { return ((pos.y % BLOCK_SIZE) * BLOCK_SIZE) + (pos.x % BLOCK_SIZE); }`

### `horizontal`

**Sygnatura:** `int horizontal() { return left + right + 1; }`

### `vertical`

**Sygnatura:** `int vertical() { return top + bottom + 1; }`

### `init`

**Sygnatura:** `void init()`

### `terminate`

**Sygnatura:** `void terminate()`

### `addMapView`

**Sygnatura:** `void addMapView(const MapViewPtr& mapView)`

### `removeMapView`

**Sygnatura:** `void removeMapView(const MapViewPtr& mapView)`

### `notificateTileUpdate`

**Sygnatura:** `void notificateTileUpdate(const Position& pos, bool updateMinimap = false)`

### `requestVisibleTilesCacheUpdate`

**Sygnatura:** `void requestVisibleTilesCacheUpdate()`

### `loadOtcm`

**Sygnatura:** `bool loadOtcm(const std::string& fileName)`

### `saveOtcm`

**Sygnatura:** `void saveOtcm(const std::string& fileName)`

### `loadOtbm`

**Sygnatura:** `void loadOtbm(const std::string& fileName)`

### `saveOtbm`

**Sygnatura:** `void saveOtbm(const std::string& fileName)`

### `setHouseFile`

**Sygnatura:** `void setHouseFile(const std::string& file) { m_attribs.set(OTBM_ATTR_HOUSE_FILE, file); }`

### `setSpawnFile`

**Sygnatura:** `void setSpawnFile(const std::string& file) { m_attribs.set(OTBM_ATTR_SPAWN_FILE, file); }`

### `setDescription`

**Sygnatura:** `void setDescription(const std::string& desc) { m_attribs.set(OTBM_ATTR_DESCRIPTION, desc); }`

### `clearDescriptions`

**Sygnatura:** `void clearDescriptions() { m_attribs.remove(OTBM_ATTR_DESCRIPTION); }`

### `setWidth`

**Sygnatura:** `void setWidth(uint16 w) { m_attribs.set(OTBM_ATTR_WIDTH, w); }`

### `setHeight`

**Sygnatura:** `void setHeight(uint16 h) { m_attribs.set(OTBM_ATTR_HEIGHT, h); }`

### `getHouseFile`

**Sygnatura:** `std::string getHouseFile() { return m_attribs.get<std::string>(OTBM_ATTR_HOUSE_FILE); }`

### `getSpawnFile`

**Sygnatura:** `std::string getSpawnFile() { return m_attribs.get<std::string>(OTBM_ATTR_SPAWN_FILE); }`

### `getSize`

**Sygnatura:** `Size getSize() { return Size(m_attribs.get<uint16>(OTBM_ATTR_WIDTH), m_attribs.get<uint16>(OTBM_ATTR_HEIGHT)); }`

### `getDescriptions`

**Sygnatura:** `std::vector<std::string> getDescriptions() { return stdext::split(m_attribs.get<std::string>(OTBM_ATTR_DESCRIPTION), "\n"); }`

### `clean`

**Sygnatura:** `void clean()`

### `cleanDynamicThings`

**Sygnatura:** `void cleanDynamicThings()`

### `cleanTexts`

**Sygnatura:** `void cleanTexts()`

### `addThing`

**Sygnatura:** `void addThing(const ThingPtr& thing, const Position& pos, int stackPos = -1)`

### `setTileSpeed`

**Sygnatura:** `void setTileSpeed(const Position & pos, uint16_t speed, uint8_t blocking)`

### `getThing`

**Sygnatura:** `ThingPtr getThing(const Position& pos, int stackPos)`

### `removeThing`

**Sygnatura:** `bool removeThing(const ThingPtr& thing)`

### `removeThingByPos`

**Sygnatura:** `bool removeThingByPos(const Position& pos, int stackPos)`

### `colorizeThing`

**Sygnatura:** `void colorizeThing(const ThingPtr& thing, const Color& color)`

### `removeThingColor`

**Sygnatura:** `void removeThingColor(const ThingPtr& thing)`

### `getStaticText`

**Sygnatura:** `StaticTextPtr getStaticText(const Position& pos)`

### `cleanTile`

**Sygnatura:** `void cleanTile(const Position& pos)`

### `setShowZone`

**Sygnatura:** `void setShowZone(tileflags_t zone, bool show)`

### `setShowZones`

**Sygnatura:** `void setShowZones(bool show)`

### `setZoneColor`

**Sygnatura:** `void setZoneColor(tileflags_t flag, const Color& color)`

### `setZoneOpacity`

**Sygnatura:** `void setZoneOpacity(float opacity) { m_zoneOpacity = opacity; }`

### `getZoneOpacity`

**Sygnatura:** `float getZoneOpacity() { return m_zoneOpacity; }`

### `getZoneColor`

**Sygnatura:** `Color getZoneColor(tileflags_t flag)`

### `getZoneFlags`

**Sygnatura:** `tileflags_t getZoneFlags() { return (tileflags_t)m_zoneFlags; }`

### `showZones`

**Sygnatura:** `bool showZones() { return m_zoneFlags != 0; }`

### `showZone`

**Sygnatura:** `bool showZone(tileflags_t zone) { return (m_zoneFlags & zone) == zone; }`

### `setForceShowAnimations`

**Sygnatura:** `void setForceShowAnimations(bool force)`

### `isForcingAnimations`

**Sygnatura:** `bool isForcingAnimations()`

### `isShowingAnimations`

**Sygnatura:** `bool isShowingAnimations()`

### `setShowAnimations`

**Sygnatura:** `void setShowAnimations(bool show)`

### `findItemsById`

**Sygnatura:** `std::map<Position, ItemPtr> findItemsById(uint16 clientId, uint32 max)`

### `addCreature`

**Sygnatura:** `void addCreature(const CreaturePtr& creature)`

### `getCreatureById`

**Sygnatura:** `CreaturePtr getCreatureById(uint32 id)`

### `removeCreatureById`

**Sygnatura:** `void removeCreatureById(uint32 id)`

### `getSightSpectators`

**Sygnatura:** `std::vector<CreaturePtr> getSightSpectators(const Position& centerPos, bool multiFloor)`

### `getSpectators`

**Sygnatura:** `std::vector<CreaturePtr> getSpectators(const Position& centerPos, bool multiFloor)`

### `getSpectatorsInRange`

**Sygnatura:** `std::vector<CreaturePtr> getSpectatorsInRange(const Position& centerPos, bool multiFloor, int xRange, int yRange)`

### `getSpectatorsInRangeEx`

**Sygnatura:** `std::vector<CreaturePtr> getSpectatorsInRangeEx(const Position& centerPos, bool multiFloor, int minXRange, int maxXRange, int minYRange, int maxYRange)`

### `getSpectatorsByPattern`

**Sygnatura:** `std::vector<CreaturePtr> getSpectatorsByPattern(const Position& centerPos, const std::string& pattern, Otc::Direction direction)`

### `setLight`

**Sygnatura:** `void setLight(const Light& light) { m_light = light; }`

### `setCentralPosition`

**Sygnatura:** `void setCentralPosition(const Position& centralPosition)`

### `isLookPossible`

**Sygnatura:** `bool isLookPossible(const Position& pos)`

### `isCovered`

**Sygnatura:** `bool isCovered(const Position& pos, int firstFloor = 0)`

### `isCompletelyCovered`

**Sygnatura:** `bool isCompletelyCovered(const Position& pos, int firstFloor = 0)`

### `isAwareOfPosition`

**Sygnatura:** `bool isAwareOfPosition(const Position& pos, bool extended = false)`

### `isAwareOfPositionForClean`

**Sygnatura:** `bool isAwareOfPositionForClean(const Position& pos, bool extended = false)`

### `setAwareRange`

**Sygnatura:** `void setAwareRange(const AwareRange& range)`

### `resetAwareRange`

**Sygnatura:** `void resetAwareRange()`

### `getAwareRange`

**Sygnatura:** `AwareRange getAwareRange() { return m_awareRange; }`

### `getAwareRangeAsSize`

**Sygnatura:** `Size getAwareRangeAsSize() { return Size(m_awareRange.horizontal(), m_awareRange.vertical()); }`

### `getLight`

**Sygnatura:** `Light getLight() { return m_light; }`

### `getCentralPosition`

**Sygnatura:** `Position getCentralPosition() { return m_centralPosition; }`

### `getFirstAwareFloor`

**Sygnatura:** `int getFirstAwareFloor()`

### `getLastAwareFloor`

**Sygnatura:** `int getLastAwareFloor()`

### `getAnimatedTexts`

**Sygnatura:** `std::vector<AnimatedTextPtr> getAnimatedTexts() { return m_animatedTexts; }`

### `getStaticTexts`

**Sygnatura:** `std::vector<StaticTextPtr> getStaticTexts() { return m_staticTexts; }`

### `newFindPath`

**Sygnatura:** `PathFindResult_ptr newFindPath(const Position& start, const Position& goal, std::shared_ptr<std::list<Node*>> visibleNodes)`

### `findPathAsync`

**Sygnatura:** `void findPathAsync(const Position & start, const Position & goal, std::function<void(PathFindResult_ptr)> callback)`

### `getMinimapColor`

**Sygnatura:** `int getMinimapColor(const Position& pos)`

### `isPatchable`

**Sygnatura:** `bool isPatchable(const Position& pos)`

### `isWalkable`

**Sygnatura:** `bool isWalkable(const Position& pos, bool ignoreCreatures)`

### `isSightClear`

**Sygnatura:** `bool isSightClear(const Position& fromPos, const Position& toPos)`

### `checkSightLine`

**Sygnatura:** `bool checkSightLine(const Position& fromPos, const Position& toPos)`

### `removeUnawareThings`

**Sygnatura:** `void removeUnawareThings()`

### `getBlockIndex`

**Sygnatura:** `uint getBlockIndex(const Position& pos) { return ((pos.y / BLOCK_SIZE) * (65536 / BLOCK_SIZE)) + (pos.x / BLOCK_SIZE); }`

## Types/Aliases

### `PathFindResult_ptr`

**Using:** `std::shared_ptr<PathFindResult>`

## Class Diagram

Zobacz: [../diagrams/map.mmd](../diagrams/map.mmd)

---
doc_id: "cpp-api-c9ea19fef5ea"
source_path: "client/tile.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: tile.h"
summary: "Dokumentacja API C++ dla client/tile.h"
tags: ["cpp", "api", "otclient"]
---

# client/tile.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu tile.

## Classes/Structs

### Klasa: `Tile`

| Member | Brief | Signature |
|--------|-------|-----------|
| `calculateCorpseCorrection` |  | `void calculateCorpseCorrection()` |
| `drawGround` |  | `void drawGround(const Point& dest, LightView* lightView = nullptr)` |
| `drawBottom` |  | `void drawBottom(const Point& dest, LightView* lightView = nullptr)` |
| `drawCreatures` |  | `void drawCreatures(const Point& dest, LightView* lightView = nullptr)` |
| `drawTop` |  | `void drawTop(const Point& dest, LightView* lightView = nullptr)` |
| `drawTexts` |  | `void drawTexts(Point dest)` |
| `drawWidget` |  | `void drawWidget(Point dest)` |
| `clean` |  | `void clean()` |
| `addWalkingCreature` |  | `void addWalkingCreature(const CreaturePtr& creature)` |
| `removeWalkingCreature` |  | `void removeWalkingCreature(const CreaturePtr& creature)` |
| `addThing` |  | `void addThing(const ThingPtr& thing, int stackPos)` |
| `removeThing` |  | `bool removeThing(ThingPtr thing)` |
| `getThing` |  | `ThingPtr getThing(int stackPos)` |
| `getEffect` |  | `EffectPtr getEffect(uint16 id)` |
| `hasThing` |  | `bool hasThing(const ThingPtr& thing)` |
| `getThingStackPos` |  | `int getThingStackPos(const ThingPtr& thing)` |
| `getTopThing` |  | `ThingPtr getTopThing()` |
| `getTopLookThing` |  | `ThingPtr getTopLookThing()` |
| `getTopLookThingEx` |  | `ThingPtr getTopLookThingEx(Point offset)` |
| `getTopUseThing` |  | `ThingPtr getTopUseThing()` |
| `getTopCreature` |  | `CreaturePtr getTopCreature()` |
| `getTopCreatureEx` |  | `CreaturePtr getTopCreatureEx(Point offset)` |
| `getTopMoveThing` |  | `ThingPtr getTopMoveThing()` |
| `getTopMultiUseThing` |  | `ThingPtr getTopMultiUseThing()` |
| `getTopMultiUseThingEx` |  | `ThingPtr getTopMultiUseThingEx(Point offset)` |
| `getDrawElevation` |  | `int getDrawElevation() { return m_drawElevation; }` |
| `getItems` |  | `std::vector<ItemPtr> getItems()` |
| `getCreatures` |  | `std::vector<CreaturePtr> getCreatures()` |
| `getWalkingCreatures` |  | `std::vector<CreaturePtr> getWalkingCreatures() { return m_walkingCreatures; }` |
| `getThings` |  | `std::vector<ThingPtr> getThings() { return m_things; }` |
| `getEffects` |  | `std::vector<EffectPtr> getEffects() { return m_effects; }` |
| `getGround` |  | `ItemPtr getGround()` |
| `getGroundSpeed` |  | `int getGroundSpeed()` |
| `isBlocking` |  | `bool isBlocking() { return m_blocking != 0; }` |
| `getMinimapColorByte` |  | `uint8 getMinimapColorByte()` |
| `getThingCount` |  | `int getThingCount() { return m_things.size() + m_effects.size(); }` |
| `isPathable` |  | `bool isPathable()` |
| `isWalkable` |  | `bool isWalkable(bool ignoreCreatures = false)` |
| `isFullGround` |  | `bool isFullGround()` |
| `isFullyOpaque` |  | `bool isFullyOpaque()` |
| `isSingleDimension` |  | `bool isSingleDimension()` |
| `isLookPossible` |  | `bool isLookPossible()` |
| `isBlockingProjectile` |  | `bool isBlockingProjectile()` |
| `isClickable` |  | `bool isClickable()` |
| `isEmpty` |  | `bool isEmpty()` |
| `isDrawable` |  | `bool isDrawable()` |
| `hasTranslucentLight` |  | `bool hasTranslucentLight() { return m_flags & TILESTATE_TRANSLUECENT_LIGHT; }` |
| `mustHookSouth` |  | `bool mustHookSouth()` |
| `mustHookEast` |  | `bool mustHookEast()` |
| `hasCreature` |  | `bool hasCreature()` |
| `hasBlockingCreature` |  | `bool hasBlockingCreature()` |
| `limitsFloorsView` |  | `bool limitsFloorsView(bool isFreeView = false)` |
| `canErase` |  | `bool canErase()` |
| `getElevation` |  | `int getElevation()` |
| `hasElevation` |  | `bool hasElevation(int elevation = 1)` |
| `overwriteMinimapColor` |  | `void overwriteMinimapColor(uint8 color) { m_minimapColor = color; }` |
| `remFlag` |  | `void remFlag(uint32 flag) { m_flags &= ~flag; }` |
| `setFlag` |  | `void setFlag(uint32 flag) { m_flags \|= flag; }` |
| `setFlags` |  | `void setFlags(uint32 flags) { m_flags = flags; }` |
| `hasFlag` |  | `bool hasFlag(uint32 flag) { return (m_flags & flag) == flag; }` |
| `getFlags` |  | `uint32 getFlags() { return m_flags; }` |
| `setHouseId` |  | `void setHouseId(uint32 hid) { m_houseId = hid; }` |
| `getHouseId` |  | `uint32 getHouseId() { return m_houseId; }` |
| `isHouseTile` |  | `bool isHouseTile() { return m_houseId != 0 && (m_flags & TILESTATE_HOUSE) == TILESTATE_HOUSE; }` |
| `select` |  | `void select() { m_selected = true; }` |
| `unselect` |  | `void unselect() { m_selected = false; }` |
| `isSelected` |  | `bool isSelected() { return m_selected; }` |
| `asTile` |  | `TilePtr asTile() { return static_self_cast<Tile>(); }` |
| `setSpeed` |  | `void setSpeed(uint16_t speed, uint8_t blocking) {` |
| `setText` |  | `void setText(const std::string& text, Color color)` |
| `getText` |  | `std::string getText()` |
| `setTimer` |  | `void setTimer(int time, Color color)` |
| `getTimer` |  | `int getTimer()` |
| `setFill` |  | `void setFill(Color color)` |
| `resetFill` |  | `void resetFill() { m_fill = Color::alpha; }` |
| `canShoot` |  | `bool canShoot(int distance)` |
| `setWidget` |  | `void setWidget(UIWidgetPtr widget) { m_widget = widget; }` |
| `getWidget` |  | `UIWidgetPtr getWidget() { return m_widget; }` |
| `removeWidget` |  | `void removeWidget() {` |

## Enums

### `tileflags_t`

**Wartości:**

- `TILESTATE_NONE`
- `TILESTATE_PROTECTIONZONE`
- `TILESTATE_TRASHED`
- `TILESTATE_OPTIONALZONE`
- `TILESTATE_NOLOGOUT`
- `TILESTATE_HARDCOREZONE`
- `TILESTATE_REFRESH`
- `TILESTATE_HOUSE`
- `TILESTATE_TELEPORT`
- `TILESTATE_MAGICFIELD`
- `TILESTATE_MAILBOX`
- `TILESTATE_TRASHHOLDER`
- `TILESTATE_BED`
- `TILESTATE_DEPOT`
- `TILESTATE_TRANSLUECENT_LIGHT`
- `TILESTATE_LAST`

## Functions

### `calculateCorpseCorrection`

**Sygnatura:** `void calculateCorpseCorrection()`

### `drawGround`

**Sygnatura:** `void drawGround(const Point& dest, LightView* lightView = nullptr)`

### `drawBottom`

**Sygnatura:** `void drawBottom(const Point& dest, LightView* lightView = nullptr)`

### `drawCreatures`

**Sygnatura:** `void drawCreatures(const Point& dest, LightView* lightView = nullptr)`

### `drawTop`

**Sygnatura:** `void drawTop(const Point& dest, LightView* lightView = nullptr)`

### `drawTexts`

**Sygnatura:** `void drawTexts(Point dest)`

### `drawWidget`

**Sygnatura:** `void drawWidget(Point dest)`

### `clean`

**Sygnatura:** `void clean()`

### `addWalkingCreature`

**Sygnatura:** `void addWalkingCreature(const CreaturePtr& creature)`

### `removeWalkingCreature`

**Sygnatura:** `void removeWalkingCreature(const CreaturePtr& creature)`

### `addThing`

**Sygnatura:** `void addThing(const ThingPtr& thing, int stackPos)`

### `removeThing`

**Sygnatura:** `bool removeThing(ThingPtr thing)`

### `getThing`

**Sygnatura:** `ThingPtr getThing(int stackPos)`

### `getEffect`

**Sygnatura:** `EffectPtr getEffect(uint16 id)`

### `hasThing`

**Sygnatura:** `bool hasThing(const ThingPtr& thing)`

### `getThingStackPos`

**Sygnatura:** `int getThingStackPos(const ThingPtr& thing)`

### `getTopThing`

**Sygnatura:** `ThingPtr getTopThing()`

### `getTopLookThing`

**Sygnatura:** `ThingPtr getTopLookThing()`

### `getTopLookThingEx`

**Sygnatura:** `ThingPtr getTopLookThingEx(Point offset)`

### `getTopUseThing`

**Sygnatura:** `ThingPtr getTopUseThing()`

### `getTopCreature`

**Sygnatura:** `CreaturePtr getTopCreature()`

### `getTopCreatureEx`

**Sygnatura:** `CreaturePtr getTopCreatureEx(Point offset)`

### `getTopMoveThing`

**Sygnatura:** `ThingPtr getTopMoveThing()`

### `getTopMultiUseThing`

**Sygnatura:** `ThingPtr getTopMultiUseThing()`

### `getTopMultiUseThingEx`

**Sygnatura:** `ThingPtr getTopMultiUseThingEx(Point offset)`

### `getDrawElevation`

**Sygnatura:** `int getDrawElevation() { return m_drawElevation; }`

### `getItems`

**Sygnatura:** `std::vector<ItemPtr> getItems()`

### `getCreatures`

**Sygnatura:** `std::vector<CreaturePtr> getCreatures()`

### `getWalkingCreatures`

**Sygnatura:** `std::vector<CreaturePtr> getWalkingCreatures() { return m_walkingCreatures; }`

### `getThings`

**Sygnatura:** `std::vector<ThingPtr> getThings() { return m_things; }`

### `getEffects`

**Sygnatura:** `std::vector<EffectPtr> getEffects() { return m_effects; }`

### `getGround`

**Sygnatura:** `ItemPtr getGround()`

### `getGroundSpeed`

**Sygnatura:** `int getGroundSpeed()`

### `isBlocking`

**Sygnatura:** `bool isBlocking() { return m_blocking != 0; }`

### `getMinimapColorByte`

**Sygnatura:** `uint8 getMinimapColorByte()`

### `getThingCount`

**Sygnatura:** `int getThingCount() { return m_things.size() + m_effects.size(); }`

### `isPathable`

**Sygnatura:** `bool isPathable()`

### `isWalkable`

**Sygnatura:** `bool isWalkable(bool ignoreCreatures = false)`

### `isFullGround`

**Sygnatura:** `bool isFullGround()`

### `isFullyOpaque`

**Sygnatura:** `bool isFullyOpaque()`

### `isSingleDimension`

**Sygnatura:** `bool isSingleDimension()`

### `isLookPossible`

**Sygnatura:** `bool isLookPossible()`

### `isBlockingProjectile`

**Sygnatura:** `bool isBlockingProjectile()`

### `isClickable`

**Sygnatura:** `bool isClickable()`

### `isEmpty`

**Sygnatura:** `bool isEmpty()`

### `isDrawable`

**Sygnatura:** `bool isDrawable()`

### `hasTranslucentLight`

**Sygnatura:** `bool hasTranslucentLight() { return m_flags & TILESTATE_TRANSLUECENT_LIGHT; }`

### `mustHookSouth`

**Sygnatura:** `bool mustHookSouth()`

### `mustHookEast`

**Sygnatura:** `bool mustHookEast()`

### `hasCreature`

**Sygnatura:** `bool hasCreature()`

### `hasBlockingCreature`

**Sygnatura:** `bool hasBlockingCreature()`

### `limitsFloorsView`

**Sygnatura:** `bool limitsFloorsView(bool isFreeView = false)`

### `canErase`

**Sygnatura:** `bool canErase()`

### `getElevation`

**Sygnatura:** `int getElevation()`

### `hasElevation`

**Sygnatura:** `bool hasElevation(int elevation = 1)`

### `overwriteMinimapColor`

**Sygnatura:** `void overwriteMinimapColor(uint8 color) { m_minimapColor = color; }`

### `remFlag`

**Sygnatura:** `void remFlag(uint32 flag) { m_flags &= ~flag; }`

### `setFlag`

**Sygnatura:** `void setFlag(uint32 flag) { m_flags |= flag; }`

### `setFlags`

**Sygnatura:** `void setFlags(uint32 flags) { m_flags = flags; }`

### `hasFlag`

**Sygnatura:** `bool hasFlag(uint32 flag) { return (m_flags & flag) == flag; }`

### `getFlags`

**Sygnatura:** `uint32 getFlags() { return m_flags; }`

### `setHouseId`

**Sygnatura:** `void setHouseId(uint32 hid) { m_houseId = hid; }`

### `getHouseId`

**Sygnatura:** `uint32 getHouseId() { return m_houseId; }`

### `isHouseTile`

**Sygnatura:** `bool isHouseTile() { return m_houseId != 0 && (m_flags & TILESTATE_HOUSE) == TILESTATE_HOUSE; }`

### `select`

**Sygnatura:** `void select() { m_selected = true; }`

### `unselect`

**Sygnatura:** `void unselect() { m_selected = false; }`

### `isSelected`

**Sygnatura:** `bool isSelected() { return m_selected; }`

### `asTile`

**Sygnatura:** `TilePtr asTile() { return static_self_cast<Tile>(); }`

### `setSpeed`

**Sygnatura:** `void setSpeed(uint16_t speed, uint8_t blocking) {`

### `setText`

**Sygnatura:** `void setText(const std::string& text, Color color)`

### `getText`

**Sygnatura:** `std::string getText()`

### `setTimer`

**Sygnatura:** `void setTimer(int time, Color color)`

### `getTimer`

**Sygnatura:** `int getTimer()`

### `setFill`

**Sygnatura:** `void setFill(Color color)`

### `resetFill`

**Sygnatura:** `void resetFill() { m_fill = Color::alpha; }`

### `canShoot`

**Sygnatura:** `bool canShoot(int distance)`

### `setWidget`

**Sygnatura:** `void setWidget(UIWidgetPtr widget) { m_widget = widget; }`

### `getWidget`

**Sygnatura:** `UIWidgetPtr getWidget() { return m_widget; }`

### `removeWidget`

**Sygnatura:** `void removeWidget() {`

### `checkTranslucentLight`

**Sygnatura:** `void checkTranslucentLight()`

## Class Diagram

Zobacz: [../diagrams/tile.mmd](../diagrams/tile.mmd)

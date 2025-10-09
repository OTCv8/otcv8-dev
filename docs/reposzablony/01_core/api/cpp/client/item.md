---
doc_id: "cpp-api-3aab6924c226"
source_path: "client/item.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: item.h"
summary: "Dokumentacja API C++ dla client/item.h"
tags: ["cpp", "api", "otclient"]
---

# client/item.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu item.

## Classes/Structs

### Klasa: `Item`

| Member | Brief | Signature |
|--------|-------|-----------|
| `create` |  | `static ItemPtr create(int id, int countOrSubtype = 1)` |
| `createFromOtb` |  | `static ItemPtr createFromOtb(int id)` |
| `draw` |  | `void draw(const Point& dest, bool animate = true, LightView* lightView = nullptr)` |
| `draw` |  | `void draw(const Rect& dest, bool animate = true)` |
| `setId` |  | `void setId(uint32 id)` |
| `setOtbId` |  | `void setOtbId(uint16 id)` |
| `setCountOrSubType` |  | `void setCountOrSubType(int value) { m_countOrSubType = value; }` |
| `setCount` |  | `void setCount(int count) { m_countOrSubType = count; }` |
| `setSubType` |  | `void setSubType(int subType) { m_countOrSubType = subType; }` |
| `setColor` |  | `void setColor(const Color& c) { m_color = c; }` |
| `setTooltip` |  | `void setTooltip(const std::string& str) { m_tooltip = str; }` |
| `setQuickLootFlags` |  | `void setQuickLootFlags(uint32 flags) { m_quickLootFlags = flags; }` |
| `setShader` |  | `void setShader(const std::string& str) { m_shader = str; }` |
| `getCountOrSubType` |  | `int getCountOrSubType() { return m_countOrSubType; }` |
| `getSubType` |  | `int getSubType()` |
| `getCount` |  | `int getCount()` |
| `getId` |  | `uint32 getId() { return m_clientId; }` |
| `getClientId` |  | `uint16 getClientId() { return m_clientId; }` |
| `getServerId` |  | `uint16 getServerId() { return m_serverId; }` |
| `getName` |  | `std::string getName()` |
| `isValid` |  | `bool isValid()` |
| `getTooltip` |  | `std::string getTooltip() { return m_tooltip; }` |
| `getQuickLootFlags` |  | `uint32 getQuickLootFlags() { return m_quickLootFlags; }` |
| `getShader` |  | `std::string getShader() { return m_shader; }` |
| `unserializeItem` |  | `void unserializeItem(const BinaryTreePtr& in)` |
| `serializeItem` |  | `void serializeItem(const OutputBinaryTreePtr& out)` |
| `setDepotId` |  | `void setDepotId(uint16 depotId) { m_attribs.set(ATTR_DEPOT_ID, depotId); }` |
| `getDepotId` |  | `uint16 getDepotId() { return m_attribs.get<uint16>(ATTR_DEPOT_ID); }` |
| `setDoorId` |  | `void setDoorId(uint8 doorId) { m_attribs.set(ATTR_HOUSEDOORID, doorId); }` |
| `getDoorId` |  | `uint8 getDoorId() { return m_attribs.get<uint8>(ATTR_HOUSEDOORID); }` |
| `getUniqueId` |  | `uint16 getUniqueId() { return m_attribs.get<uint16>(ATTR_UNIQUE_ID); }` |
| `getActionId` |  | `uint16 getActionId() { return m_attribs.get<uint16>(ATTR_ACTION_ID); }` |
| `setActionId` |  | `void setActionId(uint16 actionId) { m_attribs.set(ATTR_ACTION_ID, actionId); }` |
| `setUniqueId` |  | `void setUniqueId(uint16 uniqueId) { m_attribs.set(ATTR_UNIQUE_ID, uniqueId); }` |
| `getText` |  | `std::string getText() { return m_attribs.get<std::string>(ATTR_TEXT); }` |
| `getDescription` |  | `std::string getDescription() { return m_attribs.get<std::string>(ATTR_DESC); }` |
| `setDescription` |  | `void setDescription(std::string desc) { m_attribs.set(ATTR_DESC, desc); }` |
| `setText` |  | `void setText(std::string txt) { m_attribs.set(ATTR_TEXT, txt); }` |
| `getTeleportDestination` |  | `Position getTeleportDestination() { return m_attribs.get<Position>(ATTR_TELE_DEST); }` |
| `setTeleportDestination` |  | `void setTeleportDestination(const Position& pos) { m_attribs.set(ATTR_TELE_DEST, pos); }` |
| `setAsync` |  | `void setAsync(bool enable) { m_async = enable; }` |
| `isHouseDoor` |  | `bool isHouseDoor() { return m_attribs.has(ATTR_HOUSEDOORID); }` |
| `isDepot` |  | `bool isDepot() { return m_attribs.has(ATTR_DEPOT_ID); }` |
| `isContainer` |  | `bool isContainer() { return m_attribs.has(ATTR_CONTAINER_ITEMS); }` |
| `isDoor` |  | `bool isDoor() { return m_attribs.has(ATTR_HOUSEDOORID); }` |
| `isTeleport` |  | `bool isTeleport() { return m_attribs.has(ATTR_TELE_DEST); }` |
| `isMoveable` |  | `bool isMoveable()` |
| `isGround` |  | `bool isGround()` |
| `clone` |  | `ItemPtr clone()` |
| `asItem` |  | `ItemPtr asItem() { return static_self_cast<Item>(); }` |
| `isItem` |  | `bool isItem() { return true; }` |
| `getContainerItems` |  | `ItemVector getContainerItems() { return m_containerItems; }` |
| `getContainerItem` |  | `ItemPtr getContainerItem(int slot) { return m_containerItems[slot]; }` |
| `addContainerItemIndexed` |  | `void addContainerItemIndexed(const ItemPtr& i, int slot) { m_containerItems[slot] = i; }` |
| `addContainerItem` |  | `void addContainerItem(const ItemPtr& i) { m_containerItems.push_back(i); }` |
| `removeContainerItem` |  | `void removeContainerItem(int slot) { m_containerItems[slot] = nullptr; }` |
| `clearContainerItems` |  | `void clearContainerItems() { m_containerItems.clear(); }` |
| `calculatePatterns` |  | `void calculatePatterns(int& xPattern, int& yPattern, int& zPattern)` |
| `calculateAnimationPhase` |  | `int calculateAnimationPhase(bool animate)` |
| `getExactSize` |  | `int getExactSize(int layer = 0, int xPattern = 0, int yPattern = 0, int zPattern = 0, int animationPhase = 0)` |
| `setCustomAttribute` |  | `void setCustomAttribute(uint16 key, uint64 value) {` |
| `getCustomAttribute` |  | `uint64 getCustomAttribute(uint16 key) {` |

## Enums

### `ItemAttr`

**Wartości:**

- `ATTR_END`
- `ATTR_TILE_FLAGS`
- `ATTR_ACTION_ID`
- `ATTR_UNIQUE_ID`
- `ATTR_TEXT`
- `ATTR_DESC`
- `ATTR_TELE_DEST`
- `ATTR_ITEM`
- `ATTR_DEPOT_ID`
- `ATTR_RUNE_CHARGES`
- `ATTR_HOUSEDOORID`
- `ATTR_COUNT`
- `ATTR_DURATION`
- `ATTR_DECAYING_STATE`
- `ATTR_WRITTENDATE`
- `ATTR_WRITTENBY`
- `ATTR_SLEEPERGUID`
- `ATTR_SLEEPSTART`
- `ATTR_CHARGES`
- `ATTR_CONTAINER_ITEMS`
- `ATTR_NAME`
- `ATTR_PLURALNAME`
- `ATTR_ATTACK`
- `ATTR_EXTRAATTACK`
- `ATTR_DEFENSE`
- `ATTR_EXTRADEFENSE`
- `ATTR_ARMOR`
- `ATTR_ATTACKSPEED`
- `ATTR_HITCHANCE`
- `ATTR_SHOOTRANGE`
- `ATTR_ARTICLE`
- `ATTR_SCRIPTPROTECTED`
- `ATTR_DUALWIELD`
- `ATTR_ATTRIBUTE_MAP`

## Functions

### `create`

**Sygnatura:** `static ItemPtr create(int id, int countOrSubtype = 1)`

### `createFromOtb`

**Sygnatura:** `static ItemPtr createFromOtb(int id)`

### `draw`

**Sygnatura:** `void draw(const Point& dest, bool animate = true, LightView* lightView = nullptr)`

### `draw`

**Sygnatura:** `void draw(const Rect& dest, bool animate = true)`

### `setId`

**Sygnatura:** `void setId(uint32 id)`

### `setOtbId`

**Sygnatura:** `void setOtbId(uint16 id)`

### `setCountOrSubType`

**Sygnatura:** `void setCountOrSubType(int value) { m_countOrSubType = value; }`

### `setCount`

**Sygnatura:** `void setCount(int count) { m_countOrSubType = count; }`

### `setSubType`

**Sygnatura:** `void setSubType(int subType) { m_countOrSubType = subType; }`

### `setColor`

**Sygnatura:** `void setColor(const Color& c) { m_color = c; }`

### `setTooltip`

**Sygnatura:** `void setTooltip(const std::string& str) { m_tooltip = str; }`

### `setQuickLootFlags`

**Sygnatura:** `void setQuickLootFlags(uint32 flags) { m_quickLootFlags = flags; }`

### `setShader`

**Sygnatura:** `void setShader(const std::string& str) { m_shader = str; }`

### `getCountOrSubType`

**Sygnatura:** `int getCountOrSubType() { return m_countOrSubType; }`

### `getSubType`

**Sygnatura:** `int getSubType()`

### `getCount`

**Sygnatura:** `int getCount()`

### `getId`

**Sygnatura:** `uint32 getId() { return m_clientId; }`

### `getClientId`

**Sygnatura:** `uint16 getClientId() { return m_clientId; }`

### `getServerId`

**Sygnatura:** `uint16 getServerId() { return m_serverId; }`

### `getName`

**Sygnatura:** `std::string getName()`

### `isValid`

**Sygnatura:** `bool isValid()`

### `getTooltip`

**Sygnatura:** `std::string getTooltip() { return m_tooltip; }`

### `getQuickLootFlags`

**Sygnatura:** `uint32 getQuickLootFlags() { return m_quickLootFlags; }`

### `getShader`

**Sygnatura:** `std::string getShader() { return m_shader; }`

### `unserializeItem`

**Sygnatura:** `void unserializeItem(const BinaryTreePtr& in)`

### `serializeItem`

**Sygnatura:** `void serializeItem(const OutputBinaryTreePtr& out)`

### `setDepotId`

**Sygnatura:** `void setDepotId(uint16 depotId) { m_attribs.set(ATTR_DEPOT_ID, depotId); }`

### `getDepotId`

**Sygnatura:** `uint16 getDepotId() { return m_attribs.get<uint16>(ATTR_DEPOT_ID); }`

### `setDoorId`

**Sygnatura:** `void setDoorId(uint8 doorId) { m_attribs.set(ATTR_HOUSEDOORID, doorId); }`

### `getDoorId`

**Sygnatura:** `uint8 getDoorId() { return m_attribs.get<uint8>(ATTR_HOUSEDOORID); }`

### `getUniqueId`

**Sygnatura:** `uint16 getUniqueId() { return m_attribs.get<uint16>(ATTR_UNIQUE_ID); }`

### `getActionId`

**Sygnatura:** `uint16 getActionId() { return m_attribs.get<uint16>(ATTR_ACTION_ID); }`

### `setActionId`

**Sygnatura:** `void setActionId(uint16 actionId) { m_attribs.set(ATTR_ACTION_ID, actionId); }`

### `setUniqueId`

**Sygnatura:** `void setUniqueId(uint16 uniqueId) { m_attribs.set(ATTR_UNIQUE_ID, uniqueId); }`

### `getText`

**Sygnatura:** `std::string getText() { return m_attribs.get<std::string>(ATTR_TEXT); }`

### `getDescription`

**Sygnatura:** `std::string getDescription() { return m_attribs.get<std::string>(ATTR_DESC); }`

### `setDescription`

**Sygnatura:** `void setDescription(std::string desc) { m_attribs.set(ATTR_DESC, desc); }`

### `setText`

**Sygnatura:** `void setText(std::string txt) { m_attribs.set(ATTR_TEXT, txt); }`

### `getTeleportDestination`

**Sygnatura:** `Position getTeleportDestination() { return m_attribs.get<Position>(ATTR_TELE_DEST); }`

### `setTeleportDestination`

**Sygnatura:** `void setTeleportDestination(const Position& pos) { m_attribs.set(ATTR_TELE_DEST, pos); }`

### `setAsync`

**Sygnatura:** `void setAsync(bool enable) { m_async = enable; }`

### `isHouseDoor`

**Sygnatura:** `bool isHouseDoor() { return m_attribs.has(ATTR_HOUSEDOORID); }`

### `isDepot`

**Sygnatura:** `bool isDepot() { return m_attribs.has(ATTR_DEPOT_ID); }`

### `isContainer`

**Sygnatura:** `bool isContainer() { return m_attribs.has(ATTR_CONTAINER_ITEMS); }`

### `isDoor`

**Sygnatura:** `bool isDoor() { return m_attribs.has(ATTR_HOUSEDOORID); }`

### `isTeleport`

**Sygnatura:** `bool isTeleport() { return m_attribs.has(ATTR_TELE_DEST); }`

### `isMoveable`

**Sygnatura:** `bool isMoveable()`

### `isGround`

**Sygnatura:** `bool isGround()`

### `clone`

**Sygnatura:** `ItemPtr clone()`

### `asItem`

**Sygnatura:** `ItemPtr asItem() { return static_self_cast<Item>(); }`

### `isItem`

**Sygnatura:** `bool isItem() { return true; }`

### `getContainerItems`

**Sygnatura:** `ItemVector getContainerItems() { return m_containerItems; }`

### `getContainerItem`

**Sygnatura:** `ItemPtr getContainerItem(int slot) { return m_containerItems[slot]; }`

### `addContainerItemIndexed`

**Sygnatura:** `void addContainerItemIndexed(const ItemPtr& i, int slot) { m_containerItems[slot] = i; }`

### `addContainerItem`

**Sygnatura:** `void addContainerItem(const ItemPtr& i) { m_containerItems.push_back(i); }`

### `removeContainerItem`

**Sygnatura:** `void removeContainerItem(int slot) { m_containerItems[slot] = nullptr; }`

### `clearContainerItems`

**Sygnatura:** `void clearContainerItems() { m_containerItems.clear(); }`

### `calculatePatterns`

**Sygnatura:** `void calculatePatterns(int& xPattern, int& yPattern, int& zPattern)`

### `calculateAnimationPhase`

**Sygnatura:** `int calculateAnimationPhase(bool animate)`

### `getExactSize`

**Sygnatura:** `int getExactSize(int layer = 0, int xPattern = 0, int yPattern = 0, int zPattern = 0, int animationPhase = 0)`

### `setCustomAttribute`

**Sygnatura:** `void setCustomAttribute(uint16 key, uint64 value) {`

### `getCustomAttribute`

**Sygnatura:** `uint64 getCustomAttribute(uint16 key) {`

## Class Diagram

Zobacz: [../diagrams/item.mmd](../diagrams/item.mmd)

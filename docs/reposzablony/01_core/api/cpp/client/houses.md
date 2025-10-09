---
doc_id: "cpp-api-d38330336642"
source_path: "client/houses.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: houses.h"
summary: "Dokumentacja API C++ dla client/houses.h"
tags: ["cpp", "api", "otclient"]
---

# client/houses.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu houses.

## Classes/Structs

### Klasa: `House`

| Member | Brief | Signature |
|--------|-------|-----------|
| `setTile` |  | `void setTile(const TilePtr& tile)` |
| `getTile` |  | `TilePtr getTile(const Position& pos)` |
| `setName` |  | `void setName(const std::string& name) { m_attribs.set(HouseAttrName, name); }` |
| `getName` |  | `std::string getName() { return m_attribs.get<std::string>(HouseAttrName); }` |
| `setId` |  | `void setId(uint32 hId) { m_attribs.set(HouseAttrId, hId); }` |
| `getId` |  | `uint32 getId() { return m_attribs.get<uint32>(HouseAttrId); }` |
| `setTownId` |  | `void setTownId(uint32 tid) { m_attribs.set(HouseAttrTown, tid); }` |
| `getTownId` |  | `uint32 getTownId() { return m_attribs.get<uint32>(HouseAttrTown); }` |
| `setSize` |  | `void setSize(uint32 s) { m_attribs.set(HouseAttrSize, s); }` |
| `getSize` |  | `uint32 getSize() { return m_attribs.get<uint32>(HouseAttrSize); }` |
| `setRent` |  | `void setRent(uint32 r) { m_attribs.set(HouseAttrRent, r); }` |
| `getRent` |  | `uint32 getRent() { return m_attribs.get<uint32>(HouseAttrRent); }` |
| `setEntry` |  | `void setEntry(const Position& p) { m_attribs.set(HouseAttrEntry, p); }` |
| `getEntry` |  | `Position getEntry() { return m_attribs.get<Position>(HouseAttrEntry); }` |
| `addDoor` |  | `void addDoor(const ItemPtr& door)` |
| `removeDoor` |  | `void removeDoor(const ItemPtr& door) { removeDoorById(door->getDoorId()); }` |
| `removeDoorById` |  | `void removeDoorById(uint32 doorId)` |
| `load` |  | `void load(const TiXmlElement* elem)` |
| `save` |  | `void save(TiXmlElement* elem)` |

### Klasa: `HouseManager`

## Enums

### `HouseAttr`

**Wartości:**

- `HouseAttrId`
- `HouseAttrName`
- `HouseAttrTown`
- `HouseAttrEntry`
- `HouseAttrSize`
- `HouseAttrRent`

## Functions

### `setTile`

**Sygnatura:** `void setTile(const TilePtr& tile)`

### `getTile`

**Sygnatura:** `TilePtr getTile(const Position& pos)`

### `setName`

**Sygnatura:** `void setName(const std::string& name) { m_attribs.set(HouseAttrName, name); }`

### `getName`

**Sygnatura:** `std::string getName() { return m_attribs.get<std::string>(HouseAttrName); }`

### `setId`

**Sygnatura:** `void setId(uint32 hId) { m_attribs.set(HouseAttrId, hId); }`

### `getId`

**Sygnatura:** `uint32 getId() { return m_attribs.get<uint32>(HouseAttrId); }`

### `setTownId`

**Sygnatura:** `void setTownId(uint32 tid) { m_attribs.set(HouseAttrTown, tid); }`

### `getTownId`

**Sygnatura:** `uint32 getTownId() { return m_attribs.get<uint32>(HouseAttrTown); }`

### `setSize`

**Sygnatura:** `void setSize(uint32 s) { m_attribs.set(HouseAttrSize, s); }`

### `getSize`

**Sygnatura:** `uint32 getSize() { return m_attribs.get<uint32>(HouseAttrSize); }`

### `setRent`

**Sygnatura:** `void setRent(uint32 r) { m_attribs.set(HouseAttrRent, r); }`

### `getRent`

**Sygnatura:** `uint32 getRent() { return m_attribs.get<uint32>(HouseAttrRent); }`

### `setEntry`

**Sygnatura:** `void setEntry(const Position& p) { m_attribs.set(HouseAttrEntry, p); }`

### `getEntry`

**Sygnatura:** `Position getEntry() { return m_attribs.get<Position>(HouseAttrEntry); }`

### `addDoor`

**Sygnatura:** `void addDoor(const ItemPtr& door)`

### `removeDoor`

**Sygnatura:** `void removeDoor(const ItemPtr& door) { removeDoorById(door->getDoorId()); }`

### `removeDoorById`

**Sygnatura:** `void removeDoorById(uint32 doorId)`

### `load`

**Sygnatura:** `void load(const TiXmlElement* elem)`

### `save`

**Sygnatura:** `void save(TiXmlElement* elem)`

### `addHouse`

**Sygnatura:** `void addHouse(const HousePtr& house)`

### `removeHouse`

**Sygnatura:** `void removeHouse(uint32 houseId)`

### `getHouse`

**Sygnatura:** `HousePtr getHouse(uint32 houseId)`

### `getHouseByName`

**Sygnatura:** `HousePtr getHouseByName(std::string name)`

### `load`

**Sygnatura:** `void load(const std::string& fileName)`

### `save`

**Sygnatura:** `void save(const std::string& fileName)`

### `sort`

**Sygnatura:** `void sort()`

### `clear`

**Sygnatura:** `void clear() { m_houses.clear(); }`

### `getHouseList`

**Sygnatura:** `HouseList getHouseList() { return m_houses; }`

### `filterHouses`

**Sygnatura:** `HouseList filterHouses(uint32 townId)`

### `findHouse`

**Sygnatura:** `HouseList::iterator findHouse(uint32 houseId)`

## Class Diagram

Zobacz: [../diagrams/houses.mmd](../diagrams/houses.mmd)

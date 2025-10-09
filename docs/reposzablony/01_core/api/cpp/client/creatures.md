---
doc_id: "cpp-api-b85a8fdb97fc"
source_path: "client/creatures.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: creatures.h"
summary: "Dokumentacja API C++ dla client/creatures.h"
tags: ["cpp", "api", "otclient"]
---

# client/creatures.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu creatures.

## Classes/Structs

### Klasa: `Spawn`

| Member | Brief | Signature |
|--------|-------|-----------|
| `setRadius` |  | `void setRadius(int32 r) { m_attribs.set(SpawnAttrRadius, r) ;}` |
| `getRadius` |  | `int32 getRadius() { return m_attribs.get<int32>(SpawnAttrRadius); }` |
| `setCenterPos` |  | `void setCenterPos(const Position& pos) { m_attribs.set(SpawnAttrCenter, pos); }` |
| `getCenterPos` |  | `Position getCenterPos() { return m_attribs.get<Position>(SpawnAttrCenter); }` |
| `getCreatures` |  | `std::vector<CreatureTypePtr> getCreatures()` |
| `addCreature` |  | `void addCreature(const Position& placePos, const CreatureTypePtr& cType)` |
| `removeCreature` |  | `void removeCreature(const Position& pos)` |
| `clear` |  | `void clear() { m_creatures.clear(); }` |
| `load` |  | `void load(TiXmlElement* node)` |
| `save` |  | `void save(TiXmlElement* node)` |

### Klasa: `CreatureType`

| Member | Brief | Signature |
|--------|-------|-----------|
| `setSpawnTime` |  | `void setSpawnTime(int32 spawnTime) { m_attribs.set(CreatureAttrSpawnTime, spawnTime); }` |
| `getSpawnTime` |  | `int32 getSpawnTime() { return m_attribs.get<int32>(CreatureAttrSpawnTime); }` |
| `setName` |  | `void setName(const std::string& name) { m_attribs.set(CreatureAttrName, name); }` |
| `getName` |  | `std::string getName() { return m_attribs.get<std::string>(CreatureAttrName); }` |
| `setOutfit` |  | `void setOutfit(const Outfit& o) { m_attribs.set(CreatureAttrOutfit, o); }` |
| `getOutfit` |  | `Outfit getOutfit() { return m_attribs.get<Outfit>(CreatureAttrOutfit); }` |
| `setDirection` |  | `void setDirection(Otc::Direction dir) { m_attribs.set(CreatureAttrDir, dir); }` |
| `getDirection` |  | `Otc::Direction getDirection() { return m_attribs.get<Otc::Direction>(CreatureAttrDir); }` |
| `setRace` |  | `void setRace(CreatureRace race) { m_attribs.set(CreatureAttrRace, race); }` |
| `getRace` |  | `CreatureRace getRace() { return m_attribs.get<CreatureRace>(CreatureAttrRace); }` |
| `cast` |  | `CreaturePtr cast()` |

### Klasa: `CreatureManager`

| Member | Brief | Signature |
|--------|-------|-----------|
| `clear` |  | `void clear() { m_creatures.clear(); }` |
| `clearSpawns` |  | `void clearSpawns()` |
| `terminate` |  | `void terminate()` |
| `loadMonsters` |  | `void loadMonsters(const std::string& file)` |
| `loadSingleCreature` |  | `void loadSingleCreature(const std::string& file)` |
| `loadNpcs` |  | `void loadNpcs(const std::string& folder)` |
| `loadCreatureBuffer` |  | `void loadCreatureBuffer(const std::string& buffer)` |
| `loadSpawns` |  | `void loadSpawns(const std::string& fileName)` |
| `saveSpawns` |  | `void saveSpawns(const std::string& fileName)` |
| `getSpawns` |  | `std::vector<SpawnPtr> getSpawns()` |
| `getSpawn` |  | `SpawnPtr getSpawn(const Position& centerPos)` |
| `getSpawnForPlacePos` |  | `SpawnPtr getSpawnForPlacePos(const Position& pos)` |
| `addSpawn` |  | `SpawnPtr addSpawn(const Position& centerPos, int radius)` |
| `deleteSpawn` |  | `void deleteSpawn(const SpawnPtr& spawn)` |
| `isLoaded` |  | `bool isLoaded() { return m_loaded; }` |
| `isSpawnLoaded` |  | `bool isSpawnLoaded() { return m_spawnLoaded; }` |
| `internalLoadCreatureBuffer` |  | `void internalLoadCreatureBuffer(TiXmlElement* elem, const CreatureTypePtr& m)` |

## Enums

### `CreatureAttr`

**Wartości:**

- `CreatureAttrPosition`
- `CreatureAttrName`
- `CreatureAttrOutfit`
- `CreatureAttrSpawnTime`
- `CreatureAttrDir`
- `CreatureAttrRace`

### `CreatureRace`

**Wartości:**

- `CreatureRaceNpc`
- `CreatureRaceMonster`

### `SpawnAttr`

**Wartości:**

- `SpawnAttrRadius`
- `SpawnAttrCenter`

## Functions

### `setRadius`

**Sygnatura:** `void setRadius(int32 r) { m_attribs.set(SpawnAttrRadius, r) ;}`

### `getRadius`

**Sygnatura:** `int32 getRadius() { return m_attribs.get<int32>(SpawnAttrRadius); }`

### `setCenterPos`

**Sygnatura:** `void setCenterPos(const Position& pos) { m_attribs.set(SpawnAttrCenter, pos); }`

### `getCenterPos`

**Sygnatura:** `Position getCenterPos() { return m_attribs.get<Position>(SpawnAttrCenter); }`

### `getCreatures`

**Sygnatura:** `std::vector<CreatureTypePtr> getCreatures()`

### `addCreature`

**Sygnatura:** `void addCreature(const Position& placePos, const CreatureTypePtr& cType)`

### `removeCreature`

**Sygnatura:** `void removeCreature(const Position& pos)`

### `clear`

**Sygnatura:** `void clear() { m_creatures.clear(); }`

### `load`

**Sygnatura:** `void load(TiXmlElement* node)`

### `save`

**Sygnatura:** `void save(TiXmlElement* node)`

### `setSpawnTime`

**Sygnatura:** `void setSpawnTime(int32 spawnTime) { m_attribs.set(CreatureAttrSpawnTime, spawnTime); }`

### `getSpawnTime`

**Sygnatura:** `int32 getSpawnTime() { return m_attribs.get<int32>(CreatureAttrSpawnTime); }`

### `setName`

**Sygnatura:** `void setName(const std::string& name) { m_attribs.set(CreatureAttrName, name); }`

### `getName`

**Sygnatura:** `std::string getName() { return m_attribs.get<std::string>(CreatureAttrName); }`

### `setOutfit`

**Sygnatura:** `void setOutfit(const Outfit& o) { m_attribs.set(CreatureAttrOutfit, o); }`

### `getOutfit`

**Sygnatura:** `Outfit getOutfit() { return m_attribs.get<Outfit>(CreatureAttrOutfit); }`

### `setDirection`

**Sygnatura:** `void setDirection(Otc::Direction dir) { m_attribs.set(CreatureAttrDir, dir); }`

### `getDirection`

**Sygnatura:** `Otc::Direction getDirection() { return m_attribs.get<Otc::Direction>(CreatureAttrDir); }`

### `setRace`

**Sygnatura:** `void setRace(CreatureRace race) { m_attribs.set(CreatureAttrRace, race); }`

### `getRace`

**Sygnatura:** `CreatureRace getRace() { return m_attribs.get<CreatureRace>(CreatureAttrRace); }`

### `cast`

**Sygnatura:** `CreaturePtr cast()`

### `clear`

**Sygnatura:** `void clear() { m_creatures.clear(); }`

### `clearSpawns`

**Sygnatura:** `void clearSpawns()`

### `terminate`

**Sygnatura:** `void terminate()`

### `loadMonsters`

**Sygnatura:** `void loadMonsters(const std::string& file)`

### `loadSingleCreature`

**Sygnatura:** `void loadSingleCreature(const std::string& file)`

### `loadNpcs`

**Sygnatura:** `void loadNpcs(const std::string& folder)`

### `loadCreatureBuffer`

**Sygnatura:** `void loadCreatureBuffer(const std::string& buffer)`

### `loadSpawns`

**Sygnatura:** `void loadSpawns(const std::string& fileName)`

### `saveSpawns`

**Sygnatura:** `void saveSpawns(const std::string& fileName)`

### `getSpawns`

**Sygnatura:** `std::vector<SpawnPtr> getSpawns()`

### `getSpawn`

**Sygnatura:** `SpawnPtr getSpawn(const Position& centerPos)`

### `getSpawnForPlacePos`

**Sygnatura:** `SpawnPtr getSpawnForPlacePos(const Position& pos)`

### `addSpawn`

**Sygnatura:** `SpawnPtr addSpawn(const Position& centerPos, int radius)`

### `deleteSpawn`

**Sygnatura:** `void deleteSpawn(const SpawnPtr& spawn)`

### `isLoaded`

**Sygnatura:** `bool isLoaded() { return m_loaded; }`

### `isSpawnLoaded`

**Sygnatura:** `bool isSpawnLoaded() { return m_spawnLoaded; }`

### `internalLoadCreatureBuffer`

**Sygnatura:** `void internalLoadCreatureBuffer(TiXmlElement* elem, const CreatureTypePtr& m)`

## Class Diagram

Zobacz: [../diagrams/creatures.mmd](../diagrams/creatures.mmd)

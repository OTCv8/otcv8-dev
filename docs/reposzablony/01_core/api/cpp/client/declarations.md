---
doc_id: "cpp-api-15e454b5fab9"
source_path: "client/declarations.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: declarations.h"
summary: "Dokumentacja API C++ dla client/declarations.h"
tags: ["cpp", "api", "otclient"]
---

# client/declarations.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu declarations.

## Classes/Structs

### Klasa: `Map`

### Klasa: `Game`

### Klasa: `MapView`

### Klasa: `LightView`

### Klasa: `Tile`

### Klasa: `Thing`

### Klasa: `Item`

### Klasa: `Container`

### Klasa: `Creature`

### Klasa: `Monster`

### Klasa: `Npc`

### Klasa: `Player`

### Klasa: `LocalPlayer`

### Klasa: `Effect`

### Klasa: `Missile`

### Klasa: `AnimatedText`

### Klasa: `StaticText`

### Klasa: `Animator`

### Klasa: `ThingType`

### Klasa: `ItemType`

### Klasa: `House`

### Klasa: `Town`

### Klasa: `CreatureType`

### Klasa: `Spawn`

### Klasa: `TileBlock`

### Klasa: `ProtocolLogin`

### Klasa: `ProtocolGame`

### Klasa: `UIItem`

### Klasa: `UICreature`

### Klasa: `UIGraph`

### Klasa: `UIMap`

### Klasa: `UIMinimap`

### Klasa: `UIProgressRect`

### Klasa: `UIMapAnchorLayout`

### Klasa: `UIPositionAnchor`

### Klasa: `UISprite`

### Klasa: `HealthBar`

## Types/Aliases

### `MapViewPtr`

**Typedef:** `stdext::shared_object_ptr<MapView>`

### `LightViewPtr`

**Typedef:** `stdext::shared_object_ptr<LightView>`

### `TilePtr`

**Typedef:** `stdext::shared_object_ptr<Tile>`

### `ThingPtr`

**Typedef:** `stdext::shared_object_ptr<Thing>`

### `ItemPtr`

**Typedef:** `stdext::shared_object_ptr<Item>`

### `ContainerPtr`

**Typedef:** `stdext::shared_object_ptr<Container>`

### `CreaturePtr`

**Typedef:** `stdext::shared_object_ptr<Creature>`

### `MonsterPtr`

**Typedef:** `stdext::shared_object_ptr<Monster>`

### `NpcPtr`

**Typedef:** `stdext::shared_object_ptr<Npc>`

### `PlayerPtr`

**Typedef:** `stdext::shared_object_ptr<Player>`

### `LocalPlayerPtr`

**Typedef:** `stdext::shared_object_ptr<LocalPlayer>`

### `EffectPtr`

**Typedef:** `stdext::shared_object_ptr<Effect>`

### `MissilePtr`

**Typedef:** `stdext::shared_object_ptr<Missile>`

### `AnimatedTextPtr`

**Typedef:** `stdext::shared_object_ptr<AnimatedText>`

### `StaticTextPtr`

**Typedef:** `stdext::shared_object_ptr<StaticText>`

### `AnimatorPtr`

**Typedef:** `stdext::shared_object_ptr<Animator>`

### `ThingTypePtr`

**Typedef:** `stdext::shared_object_ptr<ThingType>`

### `ItemTypePtr`

**Typedef:** `stdext::shared_object_ptr<ItemType>`

### `HousePtr`

**Typedef:** `stdext::shared_object_ptr<House>`

### `TownPtr`

**Typedef:** `stdext::shared_object_ptr<Town>`

### `CreatureTypePtr`

**Typedef:** `stdext::shared_object_ptr<CreatureType>`

### `SpawnPtr`

**Typedef:** `stdext::shared_object_ptr<Spawn>`

### `ThingList`

**Typedef:** `std::vector<ThingPtr>`

### `ThingTypeList`

**Typedef:** `std::vector<ThingTypePtr>`

### `ItemTypeList`

**Typedef:** `std::vector<ItemTypePtr>`

### `HouseList`

**Typedef:** `std::list<HousePtr>`

### `TownList`

**Typedef:** `std::list<TownPtr>`

### `ItemList`

**Typedef:** `std::list<ItemPtr>`

### `TileList`

**Typedef:** `std::list<TilePtr>`

### `ItemVector`

**Typedef:** `std::vector<ItemPtr>`

### `TileMap`

**Typedef:** `std::unordered_map<Position, TilePtr, PositionHasher>`

### `CreatureMap`

**Typedef:** `std::unordered_map<Position, CreatureTypePtr, PositionHasher>`

### `SpawnMap`

**Typedef:** `std::unordered_map<Position, SpawnPtr, PositionHasher>`

### `ProtocolGamePtr`

**Typedef:** `stdext::shared_object_ptr<ProtocolGame>`

### `ProtocolLoginPtr`

**Typedef:** `stdext::shared_object_ptr<ProtocolLogin>`

### `UIItemPtr`

**Typedef:** `stdext::shared_object_ptr<UIItem>`

### `UICreaturePtr`

**Typedef:** `stdext::shared_object_ptr<UICreature>`

### `UIGraphPtr`

**Typedef:** `stdext::shared_object_ptr<UIGraph>`

### `UISpritePtr`

**Typedef:** `stdext::shared_object_ptr<UISprite>`

### `UIMapPtr`

**Typedef:** `stdext::shared_object_ptr<UIMap>`

### `UIMinimapPtr`

**Typedef:** `stdext::shared_object_ptr<UIMinimap>`

### `UIProgressRectPtr`

**Typedef:** `stdext::shared_object_ptr<UIProgressRect>`

### `UIMapAnchorLayoutPtr`

**Typedef:** `stdext::shared_object_ptr<UIMapAnchorLayout>`

### `UIPositionAnchorPtr`

**Typedef:** `stdext::shared_object_ptr<UIPositionAnchor>`

### `HealthBarPtr`

**Typedef:** `stdext::shared_object_ptr<HealthBar>`

## Class Diagram

Zobacz: [../diagrams/declarations.mmd](../diagrams/declarations.mmd)

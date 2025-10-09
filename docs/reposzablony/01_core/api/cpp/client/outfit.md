---
doc_id: "cpp-api-8458944b6b2a"
source_path: "client/outfit.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: outfit.h"
summary: "Dokumentacja API C++ dla client/outfit.h"
tags: ["cpp", "api", "otclient"]
---

# client/outfit.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu outfit.

## Classes/Structs

### Klasa: `Outfit`

| Member | Brief | Signature |
|--------|-------|-----------|
| `getColor` |  | `static Color getColor(int color)` |
| `draw` |  | `void draw(Point dest, Otc::Direction direction, uint walkAnimationPhase, bool animate = true, LightView* lightView = nullptr, bool ui = false)` |
| `draw` |  | `void draw(const Rect& dest, Otc::Direction direction, uint animationPhase, bool animate = true, bool ui = false, bool oldScaling = false)` |
| `setId` |  | `void setId(int id) { m_id = id; }` |
| `setAuxId` |  | `void setAuxId(int id) { m_auxId = id; }` |
| `setHead` |  | `void setHead(int head) { m_head = head; }` |
| `setBody` |  | `void setBody(int body) { m_body = body; }` |
| `setLegs` |  | `void setLegs(int legs) { m_legs = legs; }` |
| `setFeet` |  | `void setFeet(int feet) { m_feet = feet; }` |
| `setAddons` |  | `void setAddons(int addons) { m_addons = addons; }` |
| `setMount` |  | `void setMount(int mount) { m_mount = mount; }` |
| `setWings` |  | `void setWings(int wings) { m_wings = wings; }` |
| `setAura` |  | `void setAura(int aura) { m_aura = aura; }` |
| `setCategory` |  | `void setCategory(ThingCategory category) { m_category = category; }` |
| `setShader` |  | `void setShader(const std::string& shader) { m_shader = shader; }` |
| `setHealthBar` |  | `void setHealthBar(uint8 id) { m_healthBar = id; }` |
| `setManaBar` |  | `void setManaBar(uint8 id) { m_manaBar = id; }` |
| `setCenter` |  | `void setCenter(bool value) { m_center = value; }` |
| `resetClothes` |  | `void resetClothes()` |
| `resetShader` |  | `void resetShader() { m_shader = ""; }` |
| `getId` |  | `int getId() const { return m_id; }` |
| `getAuxId` |  | `int getAuxId() const { return m_auxId; }` |
| `getHead` |  | `int getHead() const { return m_head; }` |
| `getBody` |  | `int getBody() const { return m_body; }` |
| `getLegs` |  | `int getLegs() const { return m_legs; }` |
| `getFeet` |  | `int getFeet() const { return m_feet; }` |
| `getAddons` |  | `int getAddons() const { return m_addons; }` |
| `getMount` |  | `int getMount() const { return m_mount; }` |
| `getWings` |  | `int getWings() const { return m_wings; }` |
| `getAura` |  | `int getAura() const { return m_aura; }` |
| `getCategory` |  | `ThingCategory getCategory() const { return m_category; }` |
| `getShader` |  | `std::string getShader() const { return m_shader; }` |
| `getHealthBar` |  | `int getHealthBar() const { return m_healthBar; }` |
| `getManaBar` |  | `int getManaBar() const { return m_manaBar; }` |

### Struktura: `DrawQueueItemOutfit`

### Struktura: `DrawQueueItemOutfitWithShader`

## Functions

### `getColor`

**Sygnatura:** `static Color getColor(int color)`

### `draw`

**Sygnatura:** `void draw(Point dest, Otc::Direction direction, uint walkAnimationPhase, bool animate = true, LightView* lightView = nullptr, bool ui = false)`

### `draw`

**Sygnatura:** `void draw(const Rect& dest, Otc::Direction direction, uint animationPhase, bool animate = true, bool ui = false, bool oldScaling = false)`

### `setId`

**Sygnatura:** `void setId(int id) { m_id = id; }`

### `setAuxId`

**Sygnatura:** `void setAuxId(int id) { m_auxId = id; }`

### `setHead`

**Sygnatura:** `void setHead(int head) { m_head = head; }`

### `setBody`

**Sygnatura:** `void setBody(int body) { m_body = body; }`

### `setLegs`

**Sygnatura:** `void setLegs(int legs) { m_legs = legs; }`

### `setFeet`

**Sygnatura:** `void setFeet(int feet) { m_feet = feet; }`

### `setAddons`

**Sygnatura:** `void setAddons(int addons) { m_addons = addons; }`

### `setMount`

**Sygnatura:** `void setMount(int mount) { m_mount = mount; }`

### `setWings`

**Sygnatura:** `void setWings(int wings) { m_wings = wings; }`

### `setAura`

**Sygnatura:** `void setAura(int aura) { m_aura = aura; }`

### `setCategory`

**Sygnatura:** `void setCategory(ThingCategory category) { m_category = category; }`

### `setShader`

**Sygnatura:** `void setShader(const std::string& shader) { m_shader = shader; }`

### `setHealthBar`

**Sygnatura:** `void setHealthBar(uint8 id) { m_healthBar = id; }`

### `setManaBar`

**Sygnatura:** `void setManaBar(uint8 id) { m_manaBar = id; }`

### `setCenter`

**Sygnatura:** `void setCenter(bool value) { m_center = value; }`

### `resetClothes`

**Sygnatura:** `void resetClothes()`

### `resetShader`

**Sygnatura:** `void resetShader() { m_shader = ""; }`

### `getId`

**Sygnatura:** `int getId() const { return m_id; }`

### `getAuxId`

**Sygnatura:** `int getAuxId() const { return m_auxId; }`

### `getHead`

**Sygnatura:** `int getHead() const { return m_head; }`

### `getBody`

**Sygnatura:** `int getBody() const { return m_body; }`

### `getLegs`

**Sygnatura:** `int getLegs() const { return m_legs; }`

### `getFeet`

**Sygnatura:** `int getFeet() const { return m_feet; }`

### `getAddons`

**Sygnatura:** `int getAddons() const { return m_addons; }`

### `getMount`

**Sygnatura:** `int getMount() const { return m_mount; }`

### `getWings`

**Sygnatura:** `int getWings() const { return m_wings; }`

### `getAura`

**Sygnatura:** `int getAura() const { return m_aura; }`

### `getCategory`

**Sygnatura:** `ThingCategory getCategory() const { return m_category; }`

### `getShader`

**Sygnatura:** `std::string getShader() const { return m_shader; }`

### `getHealthBar`

**Sygnatura:** `int getHealthBar() const { return m_healthBar; }`

### `getManaBar`

**Sygnatura:** `int getManaBar() const { return m_manaBar; }`

### `draw`

**Sygnatura:** `void draw() override`

### `draw`

**Sygnatura:** `void draw(const Point& pos) override`

### `cache`

**Sygnatura:** `bool cache() override`

### `draw`

**Sygnatura:** `void draw() override`

### `draw`

**Sygnatura:** `void draw(const Point& pos) override`

### `cache`

**Sygnatura:** `bool cache() override`

## Class Diagram

Zobacz: [../diagrams/outfit.mmd](../diagrams/outfit.mmd)

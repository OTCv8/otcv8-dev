---
doc_id: "cpp-api-879efdcc4d35"
source_path: "client/uicreature.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: uicreature.h"
summary: "Dokumentacja API C++ dla client/uicreature.h"
tags: ["cpp", "api", "otclient"]
---

# client/uicreature.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu uicreature.

## Classes/Structs

### Klasa: `UICreature`

| Member | Brief | Signature |
|--------|-------|-----------|
| `drawSelf` |  | `void drawSelf(Fw::DrawPane drawPane)` |
| `setCreature` |  | `void setCreature(const CreaturePtr& creature) { m_creature = creature; }` |
| `setFixedCreatureSize` |  | `void setFixedCreatureSize(bool fixed) { m_scale = fixed ? 1.0 : 0; }` |
| `setOutfit` |  | `void setOutfit(const Outfit& outfit)` |
| `getCreature` |  | `CreaturePtr getCreature() { return m_creature; }` |
| `getOutfit` |  | `Outfit getOutfit() { return m_creature ? m_creature->getOutfit() : Outfit(); }` |
| `isFixedCreatureSize` |  | `bool isFixedCreatureSize() { return m_scale > 0; }` |
| `setAutoRotating` |  | `void setAutoRotating(bool value) { m_autoRotating = value; }` |
| `setDirection` |  | `void setDirection(Otc::Direction direction) { m_direction = direction; }` |
| `getDirection` |  | `Otc::Direction getDirection() { return m_direction; }` |
| `setScale` |  | `void setScale(float scale) { m_scale = scale; }` |
| `getScale` |  | `float getScale() { return m_scale; }` |
| `setAnimate` |  | `void setAnimate(bool value) { m_animate = value; }` |
| `isAnimating` |  | `bool isAnimating() { return m_animate; }` |
| `setCenter` |  | `void setCenter(bool value)` |
| `setOldScaling` |  | `void setOldScaling(bool value) { m_oldScaling = value; }` |
| `onStyleApply` |  | `void onStyleApply(const std::string& styleName, const OTMLNodePtr& styleNode)` |
| `onGeometryChange` |  | `void onGeometryChange(const Rect& oldRect, const Rect& newRect) override` |
| `m_creature` |  | `CreaturePtr m_creature` |
| `m_autoRotating` |  | `stdext::boolean<false> m_autoRotating` |
| `m_animate` |  | `stdext::boolean<false> m_animate` |
| `m_oldScaling` |  | `stdext::boolean<false> m_oldScaling` |
| `m_direction` |  | `Otc::Direction m_direction = Otc::South` |
| `m_scale` |  | `float m_scale = 1.0` |

## Functions

### `drawSelf`

**Sygnatura:** `void drawSelf(Fw::DrawPane drawPane)`

### `setCreature`

**Sygnatura:** `void setCreature(const CreaturePtr& creature) { m_creature = creature; }`

### `setFixedCreatureSize`

**Sygnatura:** `void setFixedCreatureSize(bool fixed) { m_scale = fixed ? 1.0 : 0; }`

### `setOutfit`

**Sygnatura:** `void setOutfit(const Outfit& outfit)`

### `getCreature`

**Sygnatura:** `CreaturePtr getCreature() { return m_creature; }`

### `getOutfit`

**Sygnatura:** `Outfit getOutfit() { return m_creature ? m_creature->getOutfit() : Outfit(); }`

### `isFixedCreatureSize`

**Sygnatura:** `bool isFixedCreatureSize() { return m_scale > 0; }`

### `setAutoRotating`

**Sygnatura:** `void setAutoRotating(bool value) { m_autoRotating = value; }`

### `setDirection`

**Sygnatura:** `void setDirection(Otc::Direction direction) { m_direction = direction; }`

### `getDirection`

**Sygnatura:** `Otc::Direction getDirection() { return m_direction; }`

### `setScale`

**Sygnatura:** `void setScale(float scale) { m_scale = scale; }`

### `getScale`

**Sygnatura:** `float getScale() { return m_scale; }`

### `setAnimate`

**Sygnatura:** `void setAnimate(bool value) { m_animate = value; }`

### `isAnimating`

**Sygnatura:** `bool isAnimating() { return m_animate; }`

### `setCenter`

**Sygnatura:** `void setCenter(bool value)`

### `setOldScaling`

**Sygnatura:** `void setOldScaling(bool value) { m_oldScaling = value; }`

### `onStyleApply`

**Sygnatura:** `void onStyleApply(const std::string& styleName, const OTMLNodePtr& styleNode)`

### `onGeometryChange`

**Sygnatura:** `void onGeometryChange(const Rect& oldRect, const Rect& newRect) override`

## Class Diagram

Zobacz: [../diagrams/uicreature.mmd](../diagrams/uicreature.mmd)

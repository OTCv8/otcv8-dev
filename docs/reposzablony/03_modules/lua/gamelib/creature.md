---
doc_id: "lua-spec-6cdeac8e8562"
source_path: "gamelib/creature.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:06Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: creature.lua"
summary: "Dokumentacja modułu Lua dla gamelib/creature.lua"
tags: ["lua", "module", "otclient"]
---

# gamelib/creature.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla creature.

## Functions

### `getNextSkullId(skullId)`

@}

**Parametry:**

- `skullId`

### `getSkullImagePath(skullId)`

**Parametry:**

- `skullId`

### `getShieldImagePathAndBlink(shieldId)`

**Parametry:**

- `shieldId`

### `getEmblemImagePath(emblemId)`

**Parametry:**

- `emblemId`

### `getTypeImagePath(creatureType)`

**Parametry:**

- `creatureType`

### `getIconImagePath(iconId)`

**Parametry:**

- `iconId`

## Events/Callbacks

### `ImagePath`

**Wywołanie:** `function getIconImagePath(iconId)`

### `SkullChange`

**Wywołanie:** `function Creature:onSkullChange(skullId)`

### `ShieldChange`

**Wywołanie:** `function Creature:onShieldChange(shieldId)`

### `EmblemChange`

**Wywołanie:** `function Creature:onEmblemChange(emblemId)`

### `TypeChange`

**Wywołanie:** `function Creature:onTypeChange(typeId)`

### `IconChange`

**Wywołanie:** `function Creature:onIconChange(iconId)`

### `ImagePath`

**Wywołanie:** `local imagePath = getIconImagePath(iconId)`

### `Texture`

**Wywołanie:** `self:setIconTexture(imagePath)`

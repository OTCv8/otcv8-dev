---
doc_id: "lua-spec-78ae99c54d0c"
source_path: "game_bot/functions/player_conditions.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: player_conditions.lua"
summary: "Dokumentacja modułu Lua dla game_bot/functions/player_conditions.lua"
tags: ["lua", "module", "otclient"]
---

# game_bot/functions/player_conditions.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla player_conditions.

## Functions

### `context.hasCondition(condition)`

**Parametry:**

- `condition`

### `context.isPoisioned()`

### `context.isBurning()`

### `context.isEnergized()`

### `context.isDrunk()`

### `context.hasManaShield()`

### `context.isParalyzed()`

### `context.hasHaste()`

### `context.hasSwords()`

### `context.isInFight()`

### `context.canLogout()`

### `context.isDrowning()`

### `context.isFreezing()`

### `context.isDazzled()`

### `context.isCursed()`

### `context.hasPartyBuff()`

### `context.hasPzLock()`

### `context.hasPzBlock()`

### `context.isPzLocked()`

### `context.isPzBlocked()`

### `context.isInProtectionZone()`

### `context.hasPz()`

### `context.isInPz()`

### `context.isBleeding()`

### `context.isHungry()`

## Events/Callbacks

### `dition`

**Wywołanie:** `context.isPoisioned = function() return context.hasCondition(PlayerStates.Poison) end`

### `dition`

**Wywołanie:** `context.isBurning = function() return context.hasCondition(PlayerStates.Burn) end`

### `dition`

**Wywołanie:** `context.isEnergized = function() return context.hasCondition(PlayerStates.Energy) end`

### `dition`

**Wywołanie:** `context.isDrunk = function() return context.hasCondition(PlayerStates.Drunk) end`

### `dition`

**Wywołanie:** `context.hasManaShield = function() return context.hasCondition(PlayerStates.ManaShield) end`

### `dition`

**Wywołanie:** `context.isParalyzed = function() return context.hasCondition(PlayerStates.Paralyze) end`

### `dition`

**Wywołanie:** `context.hasHaste = function() return context.hasCondition(PlayerStates.Haste) end`

### `dition`

**Wywołanie:** `context.hasSwords = function() return context.hasCondition(PlayerStates.Swords) end`

### `dition`

**Wywołanie:** `context.isInFight = function() return context.hasCondition(PlayerStates.Swords) end`

### `dition`

**Wywołanie:** `context.canLogout = function() return not context.hasCondition(PlayerStates.Swords) end`

### `dition`

**Wywołanie:** `context.isDrowning = function() return context.hasCondition(PlayerStates.Drowning) end`

### `dition`

**Wywołanie:** `context.isFreezing = function() return context.hasCondition(PlayerStates.Freezing) end`

### `dition`

**Wywołanie:** `context.isDazzled = function() return context.hasCondition(PlayerStates.Dazzled) end`

### `dition`

**Wywołanie:** `context.isCursed = function() return context.hasCondition(PlayerStates.Cursed) end`

### `dition`

**Wywołanie:** `context.hasPartyBuff = function() return context.hasCondition(PlayerStates.PartyBuff) end`

### `dition`

**Wywołanie:** `context.hasPzLock = function() return context.hasCondition(PlayerStates.PzBlock) end`

### `dition`

**Wywołanie:** `context.hasPzBlock = function() return context.hasCondition(PlayerStates.PzBlock) end`

### `dition`

**Wywołanie:** `context.isPzLocked = function() return context.hasCondition(PlayerStates.PzBlock) end`

### `dition`

**Wywołanie:** `context.isPzBlocked = function() return context.hasCondition(PlayerStates.PzBlock) end`

### `dition`

**Wywołanie:** `context.isInProtectionZone = function() return context.hasCondition(PlayerStates.Pz) end`

### `dition`

**Wywołanie:** `context.hasPz = function() return context.hasCondition(PlayerStates.Pz) end`

### `dition`

**Wywołanie:** `context.isInPz = function() return context.hasCondition(PlayerStates.Pz) end`

### `dition`

**Wywołanie:** `context.isBleeding = function() return context.hasCondition(PlayerStates.Bleeding) end`

### `dition`

**Wywołanie:** `context.isHungry = function() return context.hasCondition(PlayerStates.Hungry) end`

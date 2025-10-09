---
doc_id: "lua-spec-cdf48bcdfe26"
source_path: "game_skills/skills.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:06Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: skills.lua"
summary: "Dokumentacja modułu Lua dla game_skills/skills.lua"
tags: ["lua", "module", "otclient"]
---

# game_skills/skills.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla skills.

## Functions

### `init()`

### `terminate()`

### `expForLevel(level)`

**Parametry:**

- `level`

### `expToAdvance(currentLevel, currentExp)`

**Parametry:**

- `currentLevel`
- `currentExp`

### `resetSkillColor(id)`

**Parametry:**

- `id`

### `toggleSkill(id, state)`

**Parametry:**

- `id`
- `state`

### `setSkillBase(id, value, baseValue)`

**Parametry:**

- `id`
- `value`
- `baseValue`

### `setSkillValue(id, value)`

**Parametry:**

- `id`
- `value`

### `setSkillColor(id, value)`

**Parametry:**

- `id`
- `value`

### `setSkillTooltip(id, value)`

**Parametry:**

- `id`
- `value`

### `setSkillPercent(id, percent, tooltip, color)`

**Parametry:**

- `id`
- `percent`
- `tooltip`
- `color`

### `checkAlert(id, value, maxValue, threshold, greaterThan)`

**Parametry:**

- `id`
- `value`
- `maxValue`
- `threshold`
- `greaterThan`

### `update()`

### `refresh()`

### `offline()`

### `toggle()`

### `checkExpSpeed()`

### `onMiniWindowClose()`

### `onSkillButtonClick(button)`

**Parametry:**

- `button`

### `onExperienceChange(localPlayer, value)`

**Parametry:**

- `localPlayer`
- `value`

### `onLevelChange(localPlayer, value, percent)`

**Parametry:**

- `localPlayer`
- `value`
- `percent`

### `onHealthChange(localPlayer, health, maxHealth)`

**Parametry:**

- `localPlayer`
- `health`
- `maxHealth`

### `onManaChange(localPlayer, mana, maxMana)`

**Parametry:**

- `localPlayer`
- `mana`
- `maxMana`

### `onSoulChange(localPlayer, soul)`

**Parametry:**

- `localPlayer`
- `soul`

### `onFreeCapacityChange(localPlayer, freeCapacity)`

**Parametry:**

- `localPlayer`
- `freeCapacity`

### `onTotalCapacityChange(localPlayer, totalCapacity)`

**Parametry:**

- `localPlayer`
- `totalCapacity`

### `onStaminaChange(localPlayer, stamina)`

**Parametry:**

- `localPlayer`
- `stamina`

### `onOfflineTrainingChange(localPlayer, offlineTrainingTime)`

**Parametry:**

- `localPlayer`
- `offlineTrainingTime`

### `onRegenerationChange(localPlayer, regenerationTime)`

**Parametry:**

- `localPlayer`
- `regenerationTime`

### `onSpeedChange(localPlayer, speed)`

**Parametry:**

- `localPlayer`
- `speed`

### `onBaseSpeedChange(localPlayer, baseSpeed)`

**Parametry:**

- `localPlayer`
- `baseSpeed`

### `onMagicLevelChange(localPlayer, magiclevel, percent)`

**Parametry:**

- `localPlayer`
- `magiclevel`
- `percent`

### `onBaseMagicLevelChange(localPlayer, baseMagicLevel)`

**Parametry:**

- `localPlayer`
- `baseMagicLevel`

### `onSkillChange(localPlayer, id, level, percent)`

**Parametry:**

- `localPlayer`
- `id`
- `level`
- `percent`

### `onBaseSkillChange(localPlayer, id, baseLevel)`

**Parametry:**

- `localPlayer`
- `id`
- `baseLevel`

## Events/Callbacks

### `LocalPlayer`

**Wywołanie:** `connect(LocalPlayer, {`

### `g_game`

**Wywołanie:** `connect(g_game, {`

### `loadUI`

**Wywołanie:** `skillsWindow = g_ui.loadUI('skills', modules.game_interface.getRightPanel())`

### `LocalPlayer`

**Wywołanie:** `disconnect(LocalPlayer, {`

### `g_game`

**Wywołanie:** `disconnect(g_game, {`

### `ExperienceChange`

**Wywołanie:** `onExperienceChange(player, player:getExperience())`

### `LevelChange`

**Wywołanie:** `onLevelChange(player, player:getLevel(), player:getLevelPercent())`

### `HealthChange`

**Wywołanie:** `onHealthChange(player, player:getHealth(), player:getMaxHealth())`

### `ManaChange`

**Wywołanie:** `onManaChange(player, player:getMana(), player:getMaxMana())`

### `SoulChange`

**Wywołanie:** `onSoulChange(player, player:getSoul())`

### `FreeCapacityChange`

**Wywołanie:** `onFreeCapacityChange(player, player:getFreeCapacity())`

### `StaminaChange`

**Wywołanie:** `onStaminaChange(player, player:getStamina())`

### `MagicLevelChange`

**Wywołanie:** `onMagicLevelChange(player, player:getMagicLevel(), player:getMagicLevelPercent())`

### `OfflineTrainingChange`

**Wywołanie:** `onOfflineTrainingChange(player, player:getOfflineTrainingTime())`

### `RegenerationChange`

**Wywołanie:** `onRegenerationChange(player, player:getRegenerationTime())`

### `SpeedChange`

**Wywołanie:** `onSpeedChange(player, player:getSpeed())`

### `SkillChange`

**Wywołanie:** `onSkillChange(player, i, player:getSkillLevel(i), player:getSkillLevelPercent(i))`

### `BaseSkillChange`

**Wywołanie:** `onBaseSkillChange(player, i, player:getSkillBaseLevel(i))`

### `tentMinimumHeight`

**Wywołanie:** `skillsWindow:setContentMinimumHeight(44)`

### `tentMaximumHeight`

**Wywołanie:** `skillsWindow:setContentMaximumHeight(480)`

### `tentMaximumHeight`

**Wywołanie:** `skillsWindow:setContentMaximumHeight(390)`

### `ds`

**Wywołanie:** `local currentTime = g_clock.seconds()`

### `LevelChange`

**Wywołanie:** `onLevelChange(player, player:getLevel(), player:getLevelPercent())`

### `MiniWindowClose`

**Wywołanie:** `function onMiniWindowClose()`

### `SkillButtonClick`

**Wywołanie:** `function onSkillButtonClick(button)`

### `ExperienceChange`

**Wywołanie:** `function onExperienceChange(localPlayer, value)`

### `LevelChange`

**Wywołanie:** `function onLevelChange(localPlayer, value, percent)`

### `HealthChange`

**Wywołanie:** `function onHealthChange(localPlayer, health, maxHealth)`

### `ManaChange`

**Wywołanie:** `function onManaChange(localPlayer, mana, maxMana)`

### `SoulChange`

**Wywołanie:** `function onSoulChange(localPlayer, soul)`

### `FreeCapacityChange`

**Wywołanie:** `function onFreeCapacityChange(localPlayer, freeCapacity)`

### `TotalCapacityChange`

**Wywołanie:** `function onTotalCapacityChange(localPlayer, totalCapacity)`

### `StaminaChange`

**Wywołanie:** `function onStaminaChange(localPlayer, stamina)`

### `OfflineTrainingChange`

**Wywołanie:** `function onOfflineTrainingChange(localPlayer, offlineTrainingTime)`

### `RegenerationChange`

**Wywołanie:** `function onRegenerationChange(localPlayer, regenerationTime)`

### `SpeedChange`

**Wywołanie:** `function onSpeedChange(localPlayer, speed)`

### `BaseSpeedChange`

**Wywołanie:** `onBaseSpeedChange(localPlayer, localPlayer:getBaseSpeed())`

### `BaseSpeedChange`

**Wywołanie:** `function onBaseSpeedChange(localPlayer, baseSpeed)`

### `MagicLevelChange`

**Wywołanie:** `function onMagicLevelChange(localPlayer, magiclevel, percent)`

### `BaseMagicLevelChange`

**Wywołanie:** `onBaseMagicLevelChange(localPlayer, localPlayer:getBaseMagicLevel())`

### `BaseMagicLevelChange`

**Wywołanie:** `function onBaseMagicLevelChange(localPlayer, baseMagicLevel)`

### `SkillChange`

**Wywołanie:** `function onSkillChange(localPlayer, id, level, percent)`

### `BaseSkillChange`

**Wywołanie:** `onBaseSkillChange(localPlayer, id, localPlayer:getSkillBaseLevel(id))`

### `BaseSkillChange`

**Wywołanie:** `function onBaseSkillChange(localPlayer, id, baseLevel)`

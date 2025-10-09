---
doc_id: "lua-spec-db4e93fc19cf"
source_path: "game_cooldown/cooldown.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: cooldown.lua"
summary: "Dokumentacja modułu Lua dla game_cooldown/cooldown.lua"
tags: ["lua", "module", "otclient"]
---

# game_cooldown/cooldown.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla cooldown.

## Globals/Exports

### `cooldown`

### `cooldowns`

### `groupCooldown`

### `cooldowns`

## Functions

### `init()`

### `terminate()`

### `loadIcon(iconId)`

**Parametry:**

- `iconId`

### `onMiniWindowClose()`

### `toggle()`

### `online()`

### `refresh()`

### `removeCooldown(progressRect)`

**Parametry:**

- `progressRect`

### `turnOffCooldown(progressRect)`

**Parametry:**

- `progressRect`

### `initCooldown(progressRect, updateCallback, finishCallback)`

**Parametry:**

- `progressRect`
- `updateCallback`
- `finishCallback`

### `updateCooldown(progressRect, duration)`

**Parametry:**

- `progressRect`
- `duration`

### `isGroupCooldownIconActive(groupId)`

**Parametry:**

- `groupId`

### `isCooldownIconActive(iconId)`

**Parametry:**

- `iconId`

### `onSpellCooldown(iconId, duration)`

**Parametry:**

- `iconId`
- `duration`

### `onSpellGroupCooldown(groupId, duration)`

**Parametry:**

- `groupId`
- `duration`

## Events/Callbacks

### `g_game`

**Wywołanie:** `connect(g_game, { onGameStart = online,`

### `loadUI`

**Wywołanie:** `cooldownWindow = g_ui.loadUI('cooldown', modules.game_interface.getRightPanel())`

### `line`

**Wywołanie:** `online()`

### `g_game`

**Wywołanie:** `disconnect(g_game, { onGameStart = online,`

### `createWidget`

**Wywołanie:** `icon = g_ui.createWidget('SpellIcon')`

### `MiniWindowClose`

**Wywołanie:** `function onMiniWindowClose()`

### `line`

**Wywołanie:** `function online()`

### `createWidget`

create particles

**Wywołanie:** `--[[local particle = g_ui.createWidget('GroupCooldownParticles', progressRect)`

### `Active`

**Wywołanie:** `function isGroupCooldownIconActive(groupId)`

### `Active`

**Wywołanie:** `function isCooldownIconActive(iconId)`

### `SpellCooldown`

**Wywołanie:** `function onSpellCooldown(iconId, duration)`

### `createWidget`

**Wywołanie:** `progressRect = g_ui.createWidget('SpellProgressRect', icon)`

### `SpellGroupCooldown`

**Wywołanie:** `function onSpellGroupCooldown(groupId, duration)`

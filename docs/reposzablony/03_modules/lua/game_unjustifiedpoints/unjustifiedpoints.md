---
doc_id: "lua-spec-6ed7cf4aeb36"
source_path: "game_unjustifiedpoints/unjustifiedpoints.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:06Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: unjustifiedpoints.lua"
summary: "Dokumentacja modułu Lua dla game_unjustifiedpoints/unjustifiedpoints.lua"
tags: ["lua", "module", "otclient"]
---

# game_unjustifiedpoints/unjustifiedpoints.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla unjustifiedpoints.

## Functions

### `init()`

### `terminate()`

### `onMiniWindowClose()`

### `toggle()`

### `online()`

### `refresh()`

### `onSkullChange(localPlayer, skull)`

**Parametry:**

- `localPlayer`
- `skull`

### `onOpenPvpSituationsChange(amount)`

**Parametry:**

- `amount`

### `getColorByKills(kills)`

**Parametry:**

- `kills`

### `onUnjustifiedPointsChange(unjustifiedPoints)`

**Parametry:**

- `unjustifiedPoints`

## Events/Callbacks

### `g_game`

**Wywołanie:** `connect(g_game, { onGameStart = online,`

### `LocalPlayer`

**Wywołanie:** `connect(LocalPlayer, { onSkullChange = onSkullChange } )`

### `loadUI`

**Wywołanie:** `unjustifiedPointsWindow = g_ui.loadUI('unjustifiedpoints', modules.game_interface.getRightPanel())`

### `line`

**Wywołanie:** `online()`

### `g_game`

**Wywołanie:** `disconnect(g_game, { onGameStart = online,`

### `LocalPlayer`

**Wywołanie:** `disconnect(LocalPlayer, { onSkullChange = onSkullChange } )`

### `MiniWindowClose`

**Wywołanie:** `function onMiniWindowClose()`

### `line`

**Wywołanie:** `function online()`

### `UnjustifiedPointsChange`

**Wywołanie:** `onUnjustifiedPointsChange(unjustifiedPoints)`

### `SkullChange`

**Wywołanie:** `onSkullChange(localPlayer, localPlayer:getSkull())`

### `OpenPvpSituationsChange`

**Wywołanie:** `onOpenPvpSituationsChange(g_game.getOpenPvpSituations())`

### `SkullChange`

**Wywołanie:** `function onSkullChange(localPlayer, skull)`

### `OpenPvpSituationsChange`

**Wywołanie:** `function onOpenPvpSituationsChange(amount)`

### `UnjustifiedPointsChange`

**Wywołanie:** `function onUnjustifiedPointsChange(unjustifiedPoints)`

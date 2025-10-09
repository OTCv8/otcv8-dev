---
doc_id: "lua-spec-159bf137b41e"
source_path: "game_bot/panels/war.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: war.lua"
summary: "Dokumentacja modułu Lua dla game_bot/panels/war.lua"
tags: ["lua", "module", "otclient"]
---

# game_bot/panels/war.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla war.

## Functions

### `Panels.AttackLeaderTarget(parent)`

**Parametry:**

- `parent`

### `Panels.LimitFloor(parent)`

**Parametry:**

- `parent`

### `Panels.AntiPush(parent)`

**Parametry:**

- `parent`

### `ui.title.onClick(widget)`

**Parametry:**

- `widget`

## Events/Callbacks

### `Missle`

**Wywołanie:** `context.onMissle(function(missle)`

### `PlayerPositionChange`

**Wywołanie:** `context.onPlayerPositionChange(function(pos)`

### `createWidget`

**Wywołanie:** `local ui = g_ui.createWidget("ItemsPanel", parent)`

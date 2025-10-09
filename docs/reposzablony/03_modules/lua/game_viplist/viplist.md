---
doc_id: "lua-spec-1b26b245195a"
source_path: "game_viplist/viplist.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:06Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: viplist.lua"
summary: "Dokumentacja modułu Lua dla game_viplist/viplist.lua"
tags: ["lua", "module", "otclient"]
---

# game_viplist/viplist.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla viplist.

## Globals/Exports

### `vipInfo`

### `vipInfo`

### `settings`

### `settings`

### `settings`

## Functions

### `init()`

### `terminate()`

### `loadVipInfo()`

### `saveVipInfo()`

### `refresh()`

### `clear()`

### `toggle()`

### `onMiniWindowClose()`

### `createAddWindow()`

### `createEditWindow(widget)`

**Parametry:**

- `widget`

### `destroyAddWindow()`

### `addVip()`

### `removeVip(widgetOrName)`

**Parametry:**

- `widgetOrName`

### `hideOffline(state)`

**Parametry:**

- `state`

### `isHiddingOffline()`

### `getSortedBy()`

### `sortBy(state)`

**Parametry:**

- `state`

### `onAddVip(id, name, state, description, iconId, notify)`

**Parametry:**

- `id`
- `name`
- `state`
- `description`
- `iconId`
- `notify`

### `onVipStateChange(id, state)`

**Parametry:**

- `id`
- `state`

### `onVipListMousePress(widget, mousePos, mouseButton)`

**Parametry:**

- `widget`
- `mousePos`
- `mouseButton`

### `onVipListLabelMousePress(widget, mousePos, mouseButton)`

**Parametry:**

- `widget`
- `mousePos`
- `mouseButton`

## Events/Callbacks

### `g_game`

**Wywołanie:** `connect(g_game, { onGameStart = refresh,`

### `loadUI`

**Wywołanie:** `vipWindow = g_ui.loadUI('viplist', modules.game_interface.getRightPanel())`

### `g_game`

**Wywołanie:** `disconnect(g_game, { onGameStart = refresh,`

### `AddVip`

**Wywołanie:** `onAddVip(id, unpack(vip))`

### `tentMinimumHeight`

**Wywołanie:** `vipWindow:setContentMinimumHeight(38)`

### `MiniWindowClose`

**Wywołanie:** `function onMiniWindowClose()`

### `displayUI`

**Wywołanie:** `addVipWindow = g_ui.displayUI('addvip')`

### `displayUI`

**Wywołanie:** `editVipWindow = g_ui.displayUI('editvip')`

### `umber`

**Wywołanie:** `local iconId = tonumber(iconRadioGroup:getSelectedWidget():getId():sub(5))`

### `AddVip`

**Wywołanie:** `onAddVip(id, name, state, description, iconId, notify)`

### `AddVip`

**Wywołanie:** `function onAddVip(id, name, state, description, iconId, notify)`

### `createWidget`

**Wywołanie:** `local label = g_ui.createWidget('VipListLabel')`

### `label`

**Wywołanie:** `connect(label, { onDoubleClick = function () g_game.openPrivateChannel(label:getText()) return true end } )`

### `VipStateChange`

**Wywołanie:** `function onVipStateChange(id, state)`

### `AddVip`

**Wywołanie:** `onAddVip(id, name, state, description, iconId, notify)`

### `VipListMousePress`

**Wywołanie:** `function onVipListMousePress(widget, mousePos, mouseButton)`

### `createWidget`

**Wywołanie:** `local menu = g_ui.createWidget('PopupMenu')`

### `VipListLabelMousePress`

**Wywołanie:** `function onVipListLabelMousePress(widget, mousePos, mouseButton)`

### `createWidget`

**Wywołanie:** `local menu = g_ui.createWidget('PopupMenu')`

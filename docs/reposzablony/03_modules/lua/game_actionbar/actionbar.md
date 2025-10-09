---
doc_id: "lua-spec-fc77058e086b"
source_path: "game_actionbar/actionbar.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: actionbar.lua"
summary: "Dokumentacja modułu Lua dla game_actionbar/actionbar.lua"
tags: ["lua", "module", "otclient"]
---

# game_actionbar/actionbar.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla actionbar.

## Globals/Exports

### `settings`

## Functions

### `translateVocation(id)`

servers may have different id's, change if not working properly (only for protocols 910+)

**Parametry:**

- `id`

### `isSpell(text)`

**Parametry:**

- `text`

### `init()`

### `terminate()`

### `createActionBars()`

### `offline()`

### `online()`

### `show()`

### `refresh()`

### `translateHotkeyDesc(text)`

**Parametry:**

- `text`

### `destroyAssignWindows()`

### `changeLockState(widget)`

**Parametry:**

- `widget`

### `moveActionButtons(widget)`

**Parametry:**

- `widget`

### `onDropActionButton(self, mousePosition, mouseButton)`

**Parametry:**

- `self`
- `mousePosition`
- `mouseButton`

### `setupActionBar(n)`

**Parametry:**

- `n`

### `setupButton(widget)`

**Parametry:**

- `widget`

### `widget.item.onDragEnter(self)`

**Parametry:**

- `self`

### `widget.onMouseRelease(widget, mousePos, mouseButton)`

popupmenu & execute action

**Parametry:**

- `widget`
- `mousePos`
- `mouseButton`

### `widget.item.onItemChange(widget)`

**Parametry:**

- `widget`

### `resetSlot(widget)`

**Parametry:**

- `widget`

### `assignItem(widget)`

**Parametry:**

- `widget`

### `window.select.onClick()`

select item

### `window.item.onItemChange(widget)`

**Parametry:**

- `widget`

### `window.buttonOk.onClick()`

callbacks

### `window.onEnter()`

### `window.buttonApply.onClick()`

### `assignText(widget)`

**Parametry:**

- `widget`

### `window.text.onTextChange(self, text)`

**Parametry:**

- `self`
- `text`

### `window.buttonOk.onClick()`

buttons

### `window.buttonApply.onClick()`

### `window.onEnter()`

### `assignSpell(widget)`

**Parametry:**

- `widget`

### `filterByVocation(a, filter)`

**Parametry:**

- `a`
- `filter`

### `radio.onSelectionChange(widget, selected)`

callback

**Parametry:**

- `widget`
- `selected`

### `window.buttonOk.onClick()`

### `window.buttonApply.onClick()`

### `window.onEnter()`

### `assignHotkey(widget)`

**Parametry:**

- `widget`

### `window.onKeyDown(window, keyCode, keyboardModifiers)`

**Parametry:**

- `window`
- `keyCode`
- `keyboardModifiers`

### `setupAction(widget)`

**Parametry:**

- `widget`

### `widget.callback()`

### `widget.callback()`

### `widget.callback()`

### `onSpellCooldown(iconId, duration)`

**Parametry:**

- `iconId`
- `duration`

### `onSpellGroupCooldown(groupId, duration)`

**Parametry:**

- `groupId`
- `duration`

### `startCooldown(action, duration)`

**Parametry:**

- `action`
- `duration`

### `updateCooldown(action)`

**Parametry:**

- `action`

### `save()`

### `load()`

## Events/Callbacks

### `g_game`

**Wywołanie:** `connect(g_game, {`

### `line`

**Wywołanie:** `online()`

### `createWidget`

taken from game_hotkeys

**Wywołanie:** `mouseGrabberWidget = g_ui.createWidget('UIWidget')`

### `g_game`

**Wywołanie:** `disconnect(g_game, {`

### `Bars`

**Wywołanie:** `function createActionBars()`

### `Panel`

**Wywołanie:** `local bottomPanel = modules.game_interface.getBottomActionPanel()`

### `Panel`

**Wywołanie:** `local leftPanel = modules.game_interface.getLeftActionPanel()`

### `Panel`

**Wywołanie:** `local rightPanel = modules.game_interface.getRightActionPanel()`

### `loadUI`

**Wywołanie:** `actionBars[i] = g_ui.loadUI(layout, parent)`

### `line`

**Wywołanie:** `function online()`

### `Bars`

create actionbars

**Wywołanie:** `createActionBars()`

### `Bar`

**Wywołanie:** `setupActionBar(i)`

### `getRootWidget`

**Wywołanie:** `local rootWidget = g_ui.getRootWidget()`

### `Buttons`

**Wywołanie:** `function moveActionButtons(widget)`

### `DropActionButton`

**Wywołanie:** `function onDropActionButton(self, mousePosition, mouseButton)`

### `isMouseGrabbed`

**Wywołanie:** `if not g_ui.isMouseGrabbed() then return end`

### `Bar`

**Wywołanie:** `function setupActionBar(n)`

### `createWidget`

**Wywołanie:** `local widget = g_ui.createWidget(layout, actionbar.tabBar)`

### `isMouseGrabbed`

**Wywołanie:** `if g_ui.isMouseGrabbed() or actionbar.locked then return end`

### `createWidget`

**Wywołanie:** `local menu = g_ui.createWidget('PopupMenu')`

### `loadUI`

create window

**Wywołanie:** `window = g_ui.loadUI('object', g_ui.getRootWidget())`

### `loadUI`

create window

**Wywołanie:** `window = g_ui.loadUI('text', g_ui.getRootWidget())`

### `loadUI`

create window

**Wywołanie:** `window = g_ui.loadUI('spell', g_ui.getRootWidget())`

### `createWidget`

**Wywołanie:** `local widget = g_ui.createWidget('SpellPreview', window.spellList)`

### `loadUI`

create window

**Wywołanie:** `window = g_ui.loadUI('hotkey', g_ui.getRootWidget())`

### `SpellCooldown`

**Wywołanie:** `function onSpellCooldown(iconId, duration)`

### `SpellGroupCooldown`

**Wywołanie:** `function onSpellGroupCooldown(groupId, duration)`

### `tents`

**Wywołanie:** `g_resources.writeFileContents(settingsFile, result)`

### `tents`

**Wywołanie:** `return json.decode(g_resources.readFileContents(settingsFile))`

---
doc_id: "lua-spec-df5b8efae21d"
source_path: "corelib/ui/uipopupmenu.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: uipopupmenu.lua"
summary: "Dokumentacja modułu Lua dla corelib/ui/uipopupmenu.lua"
tags: ["lua", "module", "otclient"]
---

# corelib/ui/uipopupmenu.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla uipopupmenu.

## Functions

### `UIPopupMenu.create()`

### `optionWidget.onClick(widget)`

**Parametry:**

- `widget`

### `onRootGeometryUpdate()`

close all menus when the window is resized

### `onGameEnd()`

## Events/Callbacks

### `isMouseGrabbed`

**Wywołanie:** `if g_ui.isMouseGrabbed() then`

### `GeometryChange`

**Wywołanie:** `function UIPopupMenu:onGeometryChange(oldRect, newRect)`

### `createWidget`

**Wywołanie:** `local optionWidget = g_ui.createWidget(self:getStyleName() .. 'Button', self)`

### `Callback`

**Wywołanie:** `optionCallback()`

### `createWidget`

**Wywołanie:** `local shortcutLabel = g_ui.createWidget(self:getStyleName() .. 'ShortcutLabel', optionWidget)`

### `createWidget`

**Wywołanie:** `g_ui.createWidget(self:getStyleName() .. 'Separator', self)`

### `Destroy`

**Wywołanie:** `function UIPopupMenu:onDestroy()`

### `MousePress`

**Wywołanie:** `function UIPopupMenu:onMousePress(mousePos, mouseButton)`

### `tainsPoint`

clicks outside menu area destroys the menu

**Wywołanie:** `if not self:containsPoint(mousePos) then`

### `KeyPress`

**Wywołanie:** `function UIPopupMenu:onKeyPress(keyCode, keyboardModifiers)`

### `RootGeometryUpdate`

close all menus when the window is resized

**Wywołanie:** `local function onRootGeometryUpdate()`

### `GameEnd`

**Wywołanie:** `local function onGameEnd()`

### `rootWidget`

**Wywołanie:** `connect(rootWidget, { onGeometryChange = onRootGeometryUpdate })`

### `g_game`

**Wywołanie:** `connect(g_game, { onGameEnd = onGameEnd } )`

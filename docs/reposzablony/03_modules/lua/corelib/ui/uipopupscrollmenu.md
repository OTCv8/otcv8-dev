---
doc_id: "lua-spec-c7fc65588046"
source_path: "corelib/ui/uipopupscrollmenu.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: uipopupscrollmenu.lua"
summary: "Dokumentacja modułu Lua dla corelib/ui/uipopupscrollmenu.lua"
tags: ["lua", "module", "otclient"]
---

# corelib/ui/uipopupscrollmenu.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla uipopupscrollmenu.

## Functions

### `UIPopupScrollMenu.create()`

### `optionWidget.onClick(widget)`

**Parametry:**

- `widget`

### `onRootGeometryUpdate()`

close all menus when the window is resized

## Events/Callbacks

### `createWidget`

**Wywołanie:** `local scrollArea = g_ui.createWidget('UIScrollArea', menu)`

### `createWidget`

**Wywołanie:** `local scrollBar = g_ui.createWidget('VerticalScrollBar', menu)`

### `isMouseGrabbed`

**Wywołanie:** `if g_ui.isMouseGrabbed() then`

### `GeometryChange`

**Wywołanie:** `function UIPopupScrollMenu:onGeometryChange(oldRect, newRect)`

### `createWidget`

**Wywołanie:** `local optionWidget = g_ui.createWidget(self:getStyleName() .. 'Button', self.scrollArea)`

### `Callback`

**Wywołanie:** `optionCallback()`

### `createWidget`

**Wywołanie:** `local shortcutLabel = g_ui.createWidget(self:getStyleName() .. 'ShortcutLabel', optionWidget)`

### `createWidget`

**Wywołanie:** `g_ui.createWidget(self:getStyleName() .. 'Separator', self.scrollArea)`

### `Destroy`

**Wywołanie:** `function UIPopupScrollMenu:onDestroy()`

### `MousePress`

**Wywołanie:** `function UIPopupScrollMenu:onMousePress(mousePos, mouseButton)`

### `tainsPoint`

clicks outside menu area destroys the menu

**Wywołanie:** `if not self:containsPoint(mousePos) then`

### `KeyPress`

**Wywołanie:** `function UIPopupScrollMenu:onKeyPress(keyCode, keyboardModifiers)`

### `RootGeometryUpdate`

close all menus when the window is resized

**Wywołanie:** `local function onRootGeometryUpdate()`

### `rootWidget`

**Wywołanie:** `connect(rootWidget, { onGeometryChange = onRootGeometryUpdate} )`
